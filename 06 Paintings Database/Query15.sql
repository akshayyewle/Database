-- Which museum is open for the longest during a day ?
-- Dispay museum name, state and hours open and which day?

-- Option 01
SELECT m.museum_id,name,state,open,
	to_timestamp(open,'HH:MI AM') AS open_time,
	to_timestamp(close,'HH:MI AM') AS close_time,
	to_timestamp(close,'HH:MI AM') - to_timestamp(open,'HH:MI AM') AS duration
FROM museum AS m, museum_hours AS mh
WHERE m.museum_id = mh.museum_id
ORDER BY duration DESC
LIMIT 1

-- Option 02
SELECT * 
FROM (SELECT m.museum_id,name,state,open,
		to_timestamp(open,'HH:MI AM') AS open_time,
		to_timestamp(close,'HH:MI AM') AS close_time,
		to_timestamp(close,'HH:MI AM') - to_timestamp(open,'HH:MI AM') AS duration,
		RANK() OVER(ORDER BY (to_timestamp(close,'HH:MI AM') - to_timestamp(open,'HH:MI AM')) DESC) AS rnk
	FROM museum AS m, museum_hours AS mh
	WHERE m.museum_id = mh.museum_id
	ORDER BY duration DESC) AS x
WHERE x.rnk=1