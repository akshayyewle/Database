-- Query 05
-- What is the most common compulsion type ?
-- What are their respective Avg Compulsion Score

select 
	`Compulsion Type`,
    count(`Patient ID`) as patient_count,
    round(avg(`Y-BOCS Score (Compulsions)`),2) as avg_score
from ocd_data
group by `Compulsion Type`
order by patient_count