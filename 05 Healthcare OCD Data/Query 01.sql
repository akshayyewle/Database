-- Query 01: 

-- Count Of Male & Female that have OCD 
-- Average Obsession Score By Gender
select gender, count('Patient ID') as patient_count, round(avg(`Y-BOCS Score (Obsessions)`),2)
From ocd_data
group by 1
order by 2
 
-- Count & Percentage Of Male & Female that have OCD 
-- Average Obsession Score By Gender
with gender_data as 
(select gender, count('Patient ID') as patient_count, round(avg(`Y-BOCS Score (Obsessions)`),2)
From ocd_data
group by 1
order by 2)

select 
sum(case when Gender=='Female' then patient_count else 0 end) as count_female,
sum(case when Gender=='Male' then patient_count else 0 end) as count_male

round(sum(case when Gender=='Female' then patient_count else 0 end) /
(sum(case when Gender=='Female' then patient_count else 0 end) + sum(case when Gender=='Male' then patient_count else 0 end))* 100,2)
as pct_female

round(sum(case when Gender=='Male' then patient_count else 0 end) /
(sum(case when Gender=='Female' then patient_count else 0 end) + sum(case when Gender=='Male' then patient_count else 0 end))* 100,2)
as pct_female

from gender_data