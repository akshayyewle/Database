-- Query 12
-- Which are the top 5 most popular museum?
-- Popularity is defined based on most no of paintings in a museum
SELECT m.museum_id,m.name,x.Painting_Count,m.city,m.country
FROM (
	SELECT w.museum_id, COUNT(w.museum_id) AS Painting_Count
	FROM museum AS m, work AS w
	WHERE m.museum_id = w.museum_id
	GROUP BY w.museum_id
	ORDER BY Painting_Count DESC
	) AS x, museum AS m
WHERE x.museum_id = m.museum_id
