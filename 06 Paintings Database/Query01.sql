-- Query 01
-- Fetch all the paintings which are not displayed on any museums?
SELECT work_id,name, museum_id
FROM work AS w
WHERE w.museum_id IS NULL