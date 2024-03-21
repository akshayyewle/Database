-- Query 05
--  Which canva size costs the most?
SELECT ps.size_id, cs.width, cs.height, cs.label, ps.sale_price
FROM product_size AS ps, canvas_size as cs
-- ORDER BY ps.sale_price DESC
-- LIMIT 1

-- select ps.size_id,cs.width, cs.height ,cs.label as canva, ps.sale_price
-- from (select *
-- 	  , rank() over(order by sale_price desc) as rnk 
-- 	  from product_size) ps
-- join canvas_size cs on cs.size_id::text=ps.size_id
-- where ps.rnk=1;