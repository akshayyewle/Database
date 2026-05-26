
-- **Connect to the Database using PSQL**
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 
-- psql "postgresql://neondb_owner:<password>@<server_name>/neondb?sslmode=require"
psql "postgresql://neondb_owner@<server_name>/neondb?sslmode=require" 

-- **Create New Schema**
CREATE SCHEMA kdnuggets;

-- **Create New Table**
CREATE TABLE kdnuggets.merchant_details (
    id INT NOT NULL,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    zipcode TEXT NOT NULL
);

-- **Insert Sample Data**
\copy kdnuggets.merchant_details (id, name, category, zipcode) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\032 KDNugget Practice Questions\\Data\\merchant_details.csv' DELIMITER ',' CSV HEADER;

-- **DROP Table**
DROP TABLE IF EXISTS kdnuggets.merchant_details ;
DROP SCHEMA IF EXISTS kdnuggets;