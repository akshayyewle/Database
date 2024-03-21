-- Query 04
-- Identify the paintings whose asking price is less than 50% of its regular price
SELECT * 
FROM product_size
WHERE sale_price < (0.5*regular_price)