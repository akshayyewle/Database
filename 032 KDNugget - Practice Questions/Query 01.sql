
/*
https://www.kdnuggets.com/sql-window-functions-beyond-basics-solving-real-business-problems

                    RUNNING TOTALS & AVERAGES PROBLEM

Recruiters: Amazon

Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. 
Do not include returns which are represented by negative purchase values. 
Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.

A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and
previous two months. The first two months will not be a true 3-month rolling average since we are not given data from last year. 
Assume each month has at least one purchase.

*/

WITH 

t1 AS (
    SELECT 
        TO_CHAR(created_at, 'YYYY-MM') AS "month",
        SUM(purchase_amt) AS "monthly_revenue"
    FROM kdnuggets.amazon_purchases
    WHERE purchase_amt > 0 
    GROUP BY TO_CHAR(created_at, 'YYYY-MM')
    ORDER BY TO_CHAR(created_at, 'YYYY-MM')
)

-- Cumulative Revenue
SELECT 
    t1.month,
    t1.monthly_revenue,
    SUM(t1.monthly_revenue) OVER (ORDER BY t1.month) AS "cumulative_revenue",

    -- 3-month rolling average
    AVG(t1.monthly_revenue) OVER(ORDER BY t1.month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS "3_month_rolling_avg"
FROM t1
ORDER BY t1.month;