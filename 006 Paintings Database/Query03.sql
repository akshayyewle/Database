-- Query 03
-- How many paintings have an asking price of more than their regular price?
SELECT COUNT(work_id)
FROM product_size
WHERE sale_price > regular_price