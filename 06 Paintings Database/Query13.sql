-- Query 13
-- Who are the top 5 most popular artist?
-- Popularity is defined based on most no of paintings done by an artist)
SELECT a.artist_id,a.full_name, x.Painting_Count,a.nationality
FROM (
	SELECT a.artist_id,COUNT(a.artist_id) AS Painting_Count
	FROM work AS w, artist AS a
	WHERE w.artist_id = a.artist_id
	GROUP BY a.artist_id
	ORDER BY Painting_Count DESC
	) AS x, artist AS a
WHERE a.artist_id = x.artist_id
ORDER BY x.Painting_Count DESC
LIMIT 5