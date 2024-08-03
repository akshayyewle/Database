-- Convert Datetime to Date
SELECT GETDATE(),
        CAST(GETDATE() AS date), -- Date Component
        CAST(GETDATE() AS time), -- Time Component
        FORMAT(GETDATE(),'yyyy:mm:dd HH:mm') -- Formatted Time Component