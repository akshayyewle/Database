-- Query 18 
-- Display the country and the city with most no of museums.
-- Output 2 seperate columns to mention the city and country.
-- If there are multiple value, seperate them with comma.
SELECT city, COUNT(city)
FROM museum AS m
GROUP BY city
ORDER BY COUNT(city) DESC