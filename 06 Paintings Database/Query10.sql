SELECT m.name,m.city
FROM museum AS m, museum_hours AS mh1
WHERE m.museum_id = mh1.museum_id
	AND mh1.day = 'Sunday'
	AND EXISTS (SELECT * FROM museum_hours AS mh2
				WHERE mh1.museum_id = mh2.museum_id
				AND mh2.day = 'Monday')