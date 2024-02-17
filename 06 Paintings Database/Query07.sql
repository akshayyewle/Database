-- Query 07
-- Identify the museums with invalid city information in the given dataset
SELECT * 
FROM museum AS m
WHERE city ~ '^[0-9]'
-- WHERE city LIKE ''