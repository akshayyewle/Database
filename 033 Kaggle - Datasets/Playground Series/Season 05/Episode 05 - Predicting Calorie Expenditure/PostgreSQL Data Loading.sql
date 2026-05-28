
-- Connect to the Database using PSQL
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 

-- Create New Schema
-- CREATE SCHEMA IF NOT EXISTS kaggle_playground;

-- Create New Table
CREATE TABLE IF NOT EXISTS kaggle_playground.s5e5_pred_calorieexpenditure(
    id SERIAL PRIMARY KEY, 
    sex VARCHAR(10), 
    age INT, 
    height FLOAT, 
    weight FLOAT, 
    duration FLOAT, 
    heart_rate FLOAT,
    body_temp FLOAT, 
    calories FLOAT
);

-- Alter Table Schema
ALTER TABLE kaggle_playground.s5e5_pred_calorieexpenditure
ALTER COLUMN tyrelife TYPE FLOAT,
ALTER COLUMN position_change TYPE FLOAT,
ALTER COLUMN pitnextlap TYPE FLOAT;
;

-- Rename Table
ALTER TABLE kaggle_playground.s5e5_pred_calorieexpenditure
RENAME TO kaggle_playground.s5e5_pred_calorieexpenditure;

-- Insert Sample Data
\copy kaggle_playground.s5e5_pred_calorieexpenditure(id, sex, age, height, weight, duration, heart_rate, body_temp, calories) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\033 Kaggle - Datasets\\Playground Series\\Season 05\\Episode 05 - Predicting Calorie Expenditure\\train.csv' DELIMITER ',' CSV HEADER;

-- DROP Table
-- DROP TABLE IF EXISTS kaggle_playground.s5e5_pred_calorieexpenditure;
-- DROP SCHEMA IF EXISTS kaggle_playground;

-- Create User
CREATE USER IF NOT EXISTS my_user WITH PASSWORD 'StrongPassword123';

-- Create Role
CREATE ROLE IF NOT EXISTS my_user LOGIN PASSWORD 'StrongPassword123';

-- Grant Permissions
GRANT USAGE ON SCHEMA my_schema TO my_user;
GRANT CREATE ON SCHEMA my_schema TO my_user;
