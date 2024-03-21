-- Query 02 
-- Count & Average Obsession Score By Ethnicity
select Ethnicity, count('Patient ID') as patient_count, round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
from ocd_data
group by Ethnicity
order by patient_count