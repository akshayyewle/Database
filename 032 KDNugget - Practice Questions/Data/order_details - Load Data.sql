
-- **Connect to the Database using PSQL**
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 
-- psql "postgresql://neondb_owner:<password>@<server_name>/neondb?sslmode=require"
psql "postgresql://neondb_owner@<server_name>/neondb?sslmode=require" 

-- **Create New Schema**
CREATE SCHEMA kdnuggets;

-- **Create New Table**
CREATE TABLE kdnuggets.order_details (
    id TEXT NOT NULL,
    customer_id INT NOT NULL,
    merchant_id INT NOT NULL,
    order_timestamp TIMESTAMP NOT NULL,
    n_items INT NOT NULL,
    total_amount_earned FLOAT NOT NULL
);

-- **Insert Sample Data**
\copy kdnuggets.order_details(id, customer_id, merchant_id, order_timestamp, n_items, total_amount_earned) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\032 KDNugget Practice Questions\\Data\\order_details.csv' DELIMITER ',' CSV HEADER;

-- **DROP Table**
DROP TABLE IF EXISTS kdnuggets.order_details;
DROP SCHEMA IF EXISTS kdnuggets;