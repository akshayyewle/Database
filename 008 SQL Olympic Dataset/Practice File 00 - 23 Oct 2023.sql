-- 00 Check Table Columns
SELECT * FROM olympic_history
SELECT * FROM noc_regions

-- 01 How many olympics games have been held?
SELECT COUNT(DISTINCT(Games))
FROM olympic_history

-- 02 List down all Olympics games held so far.
SELECT DISTINCT(Games), Season, City
FROM olympic_history
ORDER BY Games ASC

-- 03 Mention the total no of nations who participated in each olympics game?
SELECT DISTINCT(Games),COUNT(DISTINCT(region))
FROM olympic_history, noc_regions
WHERE olympic_history.noc = noc_regions.noc
GROUP BY Games 
ORDER BY Games

-- 04 Which year saw the highest and lowest no of countries participating in olympics ?
SELECT DISTINCT(Games),COUNT(DISTINCT(region))
FROM olympic_history, noc_regions
WHERE olympic_history.noc = noc_regions.noc
GROUP BY Games 
ORDER BY Games ASC
LIMIT 01

SELECT DISTINCT(Games),COUNT(DISTINCT(region))
FROM olympic_history, noc_regions
WHERE olympic_history.noc = noc_regions.noc
GROUP BY Games 
ORDER BY Games DESC
LIMIT 01

-- 05 Which nation has participated in all of the olympic games ?
SELECT DISTINCT(region), COUNT(DISTINCT(games)) as c
FROM olympic_history, noc_regions
WHERE olympic_history.noc = noc_regions.noc
GROUP BY region
HAVING c = (SELECT COUNT(DISTINCT(Games))
            FROM olympic_history)

-- 06 Identify the sport which was played in all summer olympics ?
SELECT DISTINCT(Sport), COUNT(DISTINCT(Games)) as c
FROM olympic_history
WHERE olympic_history.Season = 'Summer'
GROUP BY Sport
HAVING c = (SELECT COUNT(DISTINCT(Games))
            FROM olympic_history
            WHERE Season = 'Summer')

-- 07 Which Sports were just played only once in the olympics ?
SELECT DISTINCT(Sport), count(DISTINCT(Games)) AS c, Games
FROM olympic_history
GROUP BY Sport
HAVING c = 1

-- 08 Fetch the total no of sports played in each olympic games
SELECT DISTINCT(Games), count(DISTINCT(Sport)) AS c
FROM olympic_history
GROUP BY Games
ORDER BY c DESC

-- 09 Fetch oldest athletes to win a gold medal
SELECT Name, Medal, Age
FROM olympic_history
WHERE Medal = 'Gold' AND
        Age = (SELECT Max(Age)
                FROM olympic_history
                WHERE olympic_history.Medal = 'Gold' AND olympic_history.Age != 'NA')

-- 10 Find the Ratio of male and female athletes participated in all olympic games
SELECT Male_Count,Female_Count,
    ROUND(Male_Count/Female_Count,3) AS Sex_Ratio
FROM (
    SELECT
        SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) AS Male_Count,
        SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS Female_Count
    FROM olympic_history)

-- 10 Sex Ratio For Each Game Individually
SELECT Games, Male_Count, Female_Count, 
    ROUND(Male_Count / Female_Count,2) AS Gender_Ratio
FROM (
    SELECT DISTINCT(Games),
        SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) AS Male_Count,
        SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS Female_Count
    FROM olympic_history
    GROUP BY Games)  

-- 11 Fetch the top 5 athletes who have won the most gold medals
SELECT DISTINCT(Name), Sex, Team, COUNT(Medal) AS c
FROM olympic_history
WHERE Medal = 'Gold'
GROUP BY Name
ORDER BY c DESC
LIMIT 5

-- 12 Fetch the top 5 athletes who have won the most medals (gold/silver/bronze)
SELECT DISTINCT(Name), Sex, Team, Count(Medal) AS c
FROM olympic_history
WHERE Medal != 'NA'
GROUP BY Name
ORDER BY c DESC
LIMIT 5

-- 13 Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
SELECT DISTINCT(region), COUNT(Medal) AS c
FROM olympic_history, noc_regions
WHERE olympic_history.NOC = noc_regions.NOC
        AND Medal != 'NA'
GROUP BY region
ORDER BY c DESC
LIMIT 5
-- How To Add New Rank Column while displaying the results

-- 00 List The Countries That Have The Lowest Medal Count 
SELECT DISTINCT(region), COUNT(Medal) AS Total_Medal_Count
FROM olympic_history, noc_regions
WHERE olympic_history.NOC = noc_regions.NOC
GROUP BY region
ORDER BY Total_Medal_Count ASC 
LIMIT 5

-- 14 List down total gold, silver and bronze medals won by each country
SELECT 
    DISTINCT(region),
    sum(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) as Gold,
    sum(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) as Silver,
    sum(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) as Bronze
FROM olympic_history, noc_regions
WHERE olympic_history.NOC = noc_regions.NOC
GROUP BY region
ORDER BY Gold DESC

-- 15 List down total gold, silver and bronze medals won by each country corresponding to each olympic games.
SELECT 
    Games, region,
    sum(CASE WHEN Medal='Gold' THEN 1 ELSE 0 END) as Gold,
    sum(CASE WHEN Medal='Silver' THEN 1 ELSE 0 END) as Silver,
    sum(CASE WHEN Medal='Bronze' THEN 1 ELSE 0 END) as Bronze
FROM olympic_history, noc_regions
WHERE olympic_history.NOC = noc_regions.NOC
GROUP BY Games, region

-- 16  Identify which country won the most gold, most silver and most bronze medals in each olympic games.
-- Troubleshoot
SELECT Games, region, Gold, Silver, Bronze,
    (SELECT region IF 
FROM
    (SELECT Games, region,
        SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
        SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
        SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
    FROM olympic_history, noc_regions
    WHERE olympic_history.NOC = noc_regions.NOC
    GROUP BY Games,region
    ORDER BY Games,Gold DESC) AS Medal_Count

-- Trial Code
SELECT Games,
    (SELECT region FROM Medal_Count WHERE Games = Medal_Count.Games ORDER BY Gold DESC LIMIT 1) AS Country_With_Most_Gold,
    (SELECT region FROM Medal_Count WHERE Games = Medal_Count.Games ORDER BY Silver DESC LIMIT 1) AS Country_With_Most_Silver,
    (SELECT region FROM Medal_Count WHERE Games = Medal_Count.Games ORDER BY Bronze DESC LIMIT 1) AS Country_With_Most_Bronze
FROM
    (SELECT Games, region,
        SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
        SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
        SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
    FROM olympic_history, noc_regions
    WHERE olympic_history.NOC = noc_regions.NOC
    GROUP BY Games,region) AS Medal_Count
GROUP BY Games

-- 17 Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
-- Similiar To Query 16

-- 18 Which countries have never won gold medal but have won silver/bronze medals?
SELECT region,Gold_Medal,Silver_Medal,Bronze_Medal
FROM (
    SELECT region,
        SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Medal,
        SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Medal,
        SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Medal
    FROM olympic_history, noc_regions 
    WHERE olympic_history.NOC = noc_regions.NOC
        AND Medal != 'NA'
    GROUP BY region
    ORDER BY Gold_Medal,Silver_Medal,Bronze_Medal DESC
    ) AS Medal_Count_Tally
WHERE Gold_Medal = 0
GROUP BY region
ORDER BY Gold_Medal,Silver_Medal,Bronze_Medal DESC

-- 19 In which Sport/event, India has won highest medals ?
SELECT region, Sport, COUNT(Medal) as c
FROM olympic_history, noc_regions
WHERE olympic_history.NOC = noc_regions.NOC
    AND region = 'India'
    AND Medal != 'NA'
GROUP BY Sport
ORDER BY c DESC

-- 20 Break down all olympic games where India won medal for Hockey and how many medals in each olympic games
SELECT region, Sport,Games, COUNT(Medal)
FROM olympic_history, noc_regions 
WHERE olympic_history.NOC = noc_regions.NOC
    AND Sport = 'Hockey'
    AND region = 'India'
    AND Medal != 'NA'
GROUP BY Games
ORDER BY COUNT(Medal) DESC