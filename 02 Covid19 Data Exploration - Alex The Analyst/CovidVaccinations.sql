-- Drop Table If Already Exists
DROP TABLE IF EXISTS covidvaccinations;

-- Create Table
CREATE TABLE IF NOT EXISTS covidvaccinations(
	iso_code varchar(10),
	continent varchar(20),
	locations varchar(50),
	infodate date,
	new_tests int,
	total_tests_per_thousand numeric,
	new_tests_per_thousand numeric,
	new_tests_smoothed int,
	new_tests_smoothed_per_thousand numeric,
	positive_rate numeric,
	tests_per_case numeric,
	tests_units text,
	total_vaccinations numeric,
	people_vaccinated bigint,
	people_fully_vaccinated bigint,
	total_boosters bigint,
	new_vaccinations bigint,
	new_vaccinations_smoothed int,
	total_vaccinations_per_hundred numeric,
	people_vaccinated_per_hundred numeric,
	people_fully_vaccinated_per_hundred numeric,
	total_boosters_per_hundred numeric,
	new_vaccinations_smoothed_per_million int,
	new_people_vaccinated_smoothed int,
	new_people_vaccinated_smoothed_per_hundred numeric,
	stringency_index float,
	population_density float,
	median_age float,
	aged_65_older float,
	aged_70_older float,
	gdp_per_capita float,
	extreme_poverty float,
	cardiovasc_death_rate float,
	diabetes_prevalence float,
	female_smokers float,
	male_smokers float,
	handwashing_facilities float,
	hospital_beds_per_thousand float,
	life_expectancy numeric,
	human_development_index float,
	population bigint,
	excess_mortality_cumulative_absolute float,
	excess_mortality_cumulative float,
	excess_mortality float,
	excess_mortality_cumulative_per_million numeric
);

-- View Sample
SELECT * FROM covidvaccinations;

-- Import Data From CSV
COPY Public.covidvaccinations
FROM 'C:\Users\aksha\OneDrive\06 Data Science & Analytics\Github\Database\02 COVID19 Data Exploration - Alex The Analyst\CovidVaccination.csv'
DELIMITER ','
CSV HEADER;

-- View Sample
SELECT * FROM covidvaccinations