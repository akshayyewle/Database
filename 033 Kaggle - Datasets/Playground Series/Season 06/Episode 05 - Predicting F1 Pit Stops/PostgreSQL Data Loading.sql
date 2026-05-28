
-- Connect to the Database using PSQL
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 

-- Create New Schema
-- CREATE SCHEMA IF NOT EXISTS kaggle_playground;

-- Create New Table
CREATE TABLE IF NOT EXISTS kaggle_playground.s6e5_predictingf1pitstops(
    id SERIAL PRIMARY KEY, 
    driver VARCHAR(50), 
    compound VARCHAR(30), 
    race VARCHAR(50), 
    year INT, 
    pitstop INT, 
    lapnumber INT,
    stint INT, 
    tyrelife FLOAT, 
    position INT, 
    laptime_s FLOAT, 
    laptime_delta FLOAT,
    cumulative_degradation FLOAT, 
    raceprogress FLOAT, 
    position_change FLOAT,
    pitnextlap FLOAT
);

-- Alter Table Schema
ALTER TABLE kaggle_playground.s6e5_predictingf1pitstops
ALTER COLUMN tyrelife TYPE FLOAT,
ALTER COLUMN position_change TYPE FLOAT,
ALTER COLUMN pitnextlap TYPE FLOAT;
;

-- Rename Table
ALTER TABLE kaggle_playground.s6e5_predictingf1pitstops
RENAME TO s6e5_pred_f1pitstops;

-- Insert Sample Data
\copy kaggle_playground.s6e5_pred_f1pitstops(id, driver, compound, race, year, pitstop, lapnumber, stint, tyrelife, position, laptime_s, laptime_delta, cumulative_degradation, raceprogress, position_change, pitnextlap) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\033 Kaggle - Datasets\\Playground Series\\Season 06\\Episode 05 - Predicting F1 Pit Stops\\train.csv' DELIMITER ',' CSV HEADER;

-- DROP Table
-- DROP TABLE IF EXISTS kaggle_playground.s6e5_pred_f1pitstops;
-- DROP SCHEMA IF EXISTS kaggle_playground;

-- Create User
CREATE USER IF NOT EXISTS my_user WITH PASSWORD 'StrongPassword123';

-- Create Role
CREATE ROLE IF NOT EXISTS my_user LOGIN PASSWORD 'StrongPassword123';

-- Grant Permissions
GRANT USAGE ON SCHEMA my_schema TO my_user;
GRANT CREATE ON SCHEMA my_schema TO my_user;

-- Create User
CREATE USER IF NOT EXISTS my_user WITH PASSWORD 'StrongPassword123';

-- Create Role
CREATE ROLE IF NOT EXISTS my_user LOGIN PASSWORD 'StrongPassword123';

-- Grant Permissions
GRANT USAGE ON SCHEMA my_schema TO my_user;
GRANT CREATE ON SCHEMA my_schema TO my_user;