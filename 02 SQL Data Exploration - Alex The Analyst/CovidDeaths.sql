-- Create New Database
-- CREATE DATABASE covid19

-- Drop Table If Already Exists
DROP TABLE IF EXISTS coviddeaths;

CREATE TABLE coviddeaths(
	iso_code VARCHAR(10),
	continent VARCHAR(20),
	location VARCHAR(50),
	infodate date,
	population bigint,
	new_cases int,
	new_cases_smoothed numeric,
	total_deaths int,
	new_deaths int,
	new_deaths_smoothed numeric,
	total_cases_per_million numeric,
	new_cases_per_million numeric,
	new_cases_smoothed_per_million numeric,
	total_deaths_per_million numeric,
	new_deaths_per_million numeric,
	new_deaths_smoothed_per_million numeric,
	reproduction_rate numeric,
	icu_patients int,
	icu_patients_per_million numeric,
	hosp_patients int,
	hosp_patients_per_million numeric,
	weekly_icu_admissions int,
	weekly_icu_admissions_per_million numeric,
	weekly_hosp_admissions int,
	weekly_hosp_admissions_per_million numeric,
	total_tests bigint
);

-- View Table
SELECT * FROM coviddeaths;

COPY Public."coviddeaths"
FROM 'C:\Users\aksha\OneDrive\06 Data Science & Analytics\Github\Database\02 COVID19 Data Exploration - Alex The Analyst\CovidDeaths.csv'
DELIMITER ','
CSV HEADER; 

-- View Table
SELECT * FROM coviddeaths;