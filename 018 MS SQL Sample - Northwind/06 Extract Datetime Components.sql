-- Extract Datetime Components
SELECT o.OrderID,
        o.OrderDate,
        DATEPART("YEAR",o.OrderDate) AS Order_Year,
        DATEPART("Month",o.OrderDate) AS Order_Month,
        DATEPART("wk",o.OrderDate) AS Order_Week,
        DATEPART("dw",o.OrderDate) AS Order_DOW,
        DATEPART("Day",o.OrderDate) AS Order_Day,
        DATEPART("hh",o.OrderDate) AS Order_Hour,
        DATEPART("Minute",o.OrderDate) AS Order_Minute,
        DATEPART("second",o.OrderDate) AS Order_Second
FROM Orders AS o 
JOIN [Order Details] AS od ON od.OrderID = o.OrderID

-- Documentation
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver16