
-- **Connect to the Database using PSQL**
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 
-- psql "postgresql://neondb_owner:<password>@<server_name>/neondb?sslmode=require"
psql "postgresql://neondb_owner@<server_name>/neondb?sslmode=require" 

-- **Create New Schema**
CREATE SCHEMA kdnuggets;

-- **Create New Table**
CREATE TABLE kdnuggets.user_streaks (
    user_id TEXT NOT NULL,
    date_visited DATE
);

-- **Insert Sample Data**
\copy kdnuggets.user_streaks(user_id, date_visited) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\032 KDNugget Practice Questions\\Data\\user_streaks.csv' DELIMITER ',' CSV HEADER;

-- **DROP Table**
DROP TABLE IF EXISTS kdnuggets.user_streaks;
DROP SCHEMA IF EXISTS kdnuggets;