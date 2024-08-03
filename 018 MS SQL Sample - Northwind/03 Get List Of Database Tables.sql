-- Get List Of Database Tables
SELECT * 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_CATALOG = 'northwind-pubs'
    -- AND TABLE_TYPE = 'BASE TABLE' --For Tables
    AND TABLE_TYPE = 'VIEW' --For Views;`