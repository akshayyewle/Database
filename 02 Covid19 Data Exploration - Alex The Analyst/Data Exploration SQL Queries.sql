-- 01 Basic
-- SELECT location,infodate,total_cases,total_deaths,population
SELECT * 
FROM coviddeaths
ORDER BY 1,2

-- 02 Death Probability In United States
SELECT location, infodate, total_cases, total_deaths, 
		ROUND( CAST(total_deaths AS numeric) / CAST(total_cases AS numeric)*100,2) AS Death_Rate
FROM coviddeaths
WHERE (location LIKE '%States%') AND (total_cases IS NOT NULL) AND (total_deaths IS NOT NULL)
ORDER BY 1,2 ASC

-- 03 Total Cases Vs Population
SELECT location, infodate, total_cases, population,
	ROUND(CAST(total_cases AS numeric)/population*100,4) AS infection_rate
FROM coviddeaths
WHERE (location LIKE '%States%') AND (total_cases IS NOT NULL)
ORDER BY 1,2

-- 04 Countries With Highest Infection Rate
SELECT location,
		MAX(total_cases) AS MaxInfectionCount,
		MAX(ROUND(CAST(total_cases AS numeric)/population*100,4)) AS MaxInfectionRate
FROM coviddeaths
WHERE (total_cases IS NOT Null) AND (population IS NOT Null)
GROUP BY location
ORDER BY MaxInfectionRate DESC

-- 05 Countries With Highest Death Rate
SELECT location,
		MAX(total_deaths) AS MaxDeathCount,
		MAX(ROUND(CAST(total_deaths AS numeric)/population*100,4)) AS MaxDeathRate
FROM coviddeaths
WHERE (total_deaths IS NOT Null) AND (population IS NOT Null)
GROUP BY location
ORDER BY MaxDeathRate DESC

-- 06 Death Counts By Continent
SELECT continent, SUM(total_deaths) AS DeathCount
FROM coviddeaths
WHERE (continent IS NOT Null)
GROUP BY continent
ORDER BY DeathCount DESC