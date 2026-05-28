
-- Connect to the Database using PSQL
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 

-- Create New Schema
-- CREATE SCHEMA IF NOT EXISTS kaggle_playground;

-- Create New Table
CREATE TABLE IF NOT EXISTS kaggle_playground.s6e3_predictingcustomerchurn(
    id SERIAL PRIMARY KEY,
    gender VARCHAR(10), 
    seniorcitizen INT, 
    partner VARCHAR(10), 
    dependents VARCHAR(10), 
    tenure INT,
    phoneservice VARCHAR(10), 
    multiplelines VARCHAR(10), 
    internetservice VARCHAR(30), 
    onlinesecurity VARCHAR(50),
    onlinebackup VARCHAR(50), 
    deviceprotection VARCHAR(10), 
    techsupport VARCHAR(50), 
    streamingtv VARCHAR(50),
    streamingmovies VARCHAR(50), 
    contract VARCHAR(50), 
    paperlessbilling VARCHAR(10), 
    paymentmethod VARCHAR(50),
    monthlycharges FLOAT, 
    totalcharges FLOAT, 
    churn VARCHAR(10)
);

-- Alter Table Schema
ALTER TABLE kaggle_playground.s6e3_pred_customerchurn
ALTER COLUMN paymentmethod TYPE VARCHAR(50),
ALTER COLUMN internetservice TYPE VARCHAR(30),
ALTER COLUMN contract TYPE VARCHAR(50),
ALTER COLUMN onlinesecurity TYPE VARCHAR(50),
ALTER COLUMN onlinebackup TYPE VARCHAR(50),
ALTER COLUMN deviceprotection TYPE VARCHAR(50),
ALTER COLUMN techsupport TYPE VARCHAR(50),
ALTER COLUMN streamingtv TYPE VARCHAR(50),
ALTER COLUMN streamingmovies TYPE VARCHAR(50),
ALTER COLUMN multiplelines TYPE VARCHAR(50),
ALTER COLUMN phoneservice TYPE VARCHAR(50);

-- Rename Table
ALTER TABLE kaggle_playground.s6e3_predictingcustomerchurn
RENAME TO s6e3_pred_customerchurn;

-- Insert Sample Data
\copy kaggle_playground.s6e3_pred_customerchurn(id, gender, seniorcitizen, partner, dependents, tenure, phoneservice, multiplelines, internetservice, onlinesecurity, onlinebackup, deviceprotection, techsupport, streamingtv, streamingmovies, contract, paperlessbilling, paymentmethod, monthlycharges, totalcharges, churn) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\033 Kaggle - Datasets\\Playground Series\\Season 06\\Episode 03 - Predicting Customer Churn\\train.csv' DELIMITER ',' CSV HEADER;

-- DROP Table
-- DROP TABLE IF EXISTS kaggle_playground.s6e3_pred_customerchurn;
-- DROP SCHEMA IF EXISTS kaggle_playground;

-- Create User
CREATE USER IF NOT EXISTS my_user WITH PASSWORD 'StrongPassword123';

-- Create Role
CREATE ROLE IF NOT EXISTS my_user LOGIN PASSWORD 'StrongPassword123';

-- Grant Permissions
GRANT USAGE ON SCHEMA my_schema TO my_user;
GRANT CREATE ON SCHEMA my_schema TO my_user;