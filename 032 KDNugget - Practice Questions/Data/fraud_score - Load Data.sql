
-- **Connect to the Database using PSQL**
-- psql "postgresql://<username>:<password>@<server_name>/neondb?sslmode=require" 
-- psql "postgresql://neondb_owner:<password>@<server_name>/neondb?sslmode=require"
psql "postgresql://neondb_owner@<server_name>/neondb?sslmode=require" 

-- **Create New Schema**
CREATE SCHEMA kdnuggets;

-- **Create New Table**
CREATE TABLE kdnuggets.fraud_score (
    policy_num TEXT NOT NULL,
    state TEXT NOT NULL,
    claim_cost INT NOT NULL,
    fraud_score FLOAT NOT NULL
);

-- **Insert Sample Data**
\copy kdnuggets.fraud_score (policy_num, state, claim_cost, fraud_score) FROM 'C:\\Users\\aksha\\OneDrive\\06 Data Science & Analytics\\Github\\Database\\032 KDNugget Practice Questions\\Data\\fraud_score.csv' DELIMITER ',' CSV HEADER;

-- **DROP Table**
DROP TABLE IF EXISTS kdnuggets.fraud_score ;
DROP SCHEMA IF EXISTS kdnuggets;