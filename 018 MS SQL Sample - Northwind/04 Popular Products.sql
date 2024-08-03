-- Popular Products
SELECT p.ProductName, COUNT(*) AS Sales_Count
FROM Orders AS o
    JOIN [Order Details] AS od ON o.OrderID = od.OrderID 
    JOIN Products AS p ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Sales_Count DESC