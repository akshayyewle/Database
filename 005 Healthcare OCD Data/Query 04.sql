-- Query 04
-- What is the most common obsession type ?
-- What is their respective average obsession score

select
	`Obsession Type`,
    count(`Patient ID`) as patient_count,
	round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_score 
from ocd_data
group by `Obsession Type`
order by patient_count