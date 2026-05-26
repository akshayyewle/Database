
-- Connect to the Database using PSQL
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 

-- Create New Schema
-- CREATE SCHEMA kdnuggets;

-- Create New Table
-- CREATE TABLE kdnuggets.amazon_purchases (
--     user_id BIGINT PRIMARY KEY,
--     created_at DATE,
--     purchase_amt bigint
-- );

-- Insert Sample Data
-- \copy kdnuggets.amazon_purchases(user_id, created_at, purchase_amt) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\032 KDNugget Practice Questions\\amazon_purchases.csv' DELIMITER ',' CSV HEADER;

-- DROP Table
-- DROP TABLE IF EXISTS kdnuggets.amazon_purchases;
-- DROP SCHEMA IF EXISTS kdnuggets;