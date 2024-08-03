-- Today's Date & Date Difference
SELECT o.OrderID, c.ContactName,c.City,
    o.OrderDate, GETDATE() AS TodayDate,
    DATEDIFF(DAY,o.OrderDate,GETDATE()) AS DurationDays,
    DATEDIFF(YEAR,o.OrderDate,GETDATE()) AS DurationYears 
FROM Orders AS o
JOIN Customers AS c ON o.CustomerID = c.CustomerID