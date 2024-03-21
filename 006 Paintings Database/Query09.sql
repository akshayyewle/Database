-- Query 09
-- Fetch the top 10 most famous painting subject
SELECT s.subject,COUNT(s.subject) 
FROM work AS w, subject AS s
WHERE w.work_id = s.work_id
GROUP BY s.subject
ORDER BY COUNT(s.subject) DESC
LIMIT 10