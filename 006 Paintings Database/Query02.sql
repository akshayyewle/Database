-- Query 02
-- Are there museums without any paintings?
SELECT * 
FROM museum AS m
WHERE NOT EXISTS (SELECT museum_id
				  FROM work AS w 
				  WHERE w.museum_id = m.museum_id)