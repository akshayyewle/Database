
/*
https://www.kdnuggets.com/sql-window-functions-beyond-basics-solving-real-business-problems
https://platform.stratascratch.com/coding/2093-first-time-orders 

            COHORT ANALYSIS

Recruiters: DoorDash

The company you work with wants to find out what merchants are most popular for new customers. You have been asked to find 
how many orders and first-time orders each merchant has had. First-time orders are meant from the perspective of a customer, 
and are the first order that a customer ever made. In order words, for how many customers was this the first-ever merchant 
they ordered with?

Note: 
Recently, new restaurants have been registered on the system; however, because they may not have received any orders yet, 
your answer should exclude restaurants that have not received any orders.

Your output should contain the name of the merchant, the total number of their orders, and the number of these orders that 
were first-time orders.

*/

WITH 

customer_first_order AS (
    SELECT DISTINCT
        customer_id,
        FIRST_VALUE(merchant_id) OVER(PARTITION BY customer_id ORDER BY order_timestamp ASC) AS "first_merchant"
    FROM kdnuggets.order_details
    -- ORDER BY customer_id ASC  
),

first_order_count_merchant_wise AS (
    SELECT 
        first_merchant
        , COUNT(customer_id) OVER(PARTITION BY first_merchant) AS "merchant_first_order_count"
    FROM customer_first_order
    GROUP BY first_merchant, customer_id
)

SELECT
    t1.merchant_id, 
    t2.name AS merchant_name,
    COUNT(DISTINCT t1.customer_id) AS "total_customer_count",
    COUNT(DISTINCT t1.id) AS "total_order_count"
    ,t3.merchant_first_order_count AS "first_order_count"
FROM kdnuggets.order_details AS t1
    LEFT JOIN kdnuggets.merchant_details AS t2 ON t1.merchant_id = t2.id
    LEFT JOIN first_order_count_merchant_wise AS t3 ON t1.merchant_id = t3.first_merchant
GROUP BY t1.merchant_id, t2.name, t3.merchant_first_order_count