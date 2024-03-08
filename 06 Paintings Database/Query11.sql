-- Query 11
-- How many museums are open every single day?
SELECT COUNT(1)
FROM (
	SELECT m.museum_id, m.name, COUNT(m.name)
	FROM museum AS m, museum_hours AS mh
	WHERE m.museum_id = mh.museum_id
	GROUP BY m.museum_id, m.name
	-- HAVING COUNT(m.name) = 7
		)
WHERE COUNT = 7
