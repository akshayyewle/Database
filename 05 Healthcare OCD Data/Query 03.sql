-- Query 03
-- Number of Patients Diagnosed With OCD Month-On-Month

-- alter table ocd_data 
-- modify `OCD Diagnosis Date` date;

select 
	-- concat(year(`OCD Diagnosis Date`),'-',month(`OCD Diagnosis Date`)) as dignosis_month
    date_format(`OCD Diagnosis Date`,'%Y-%m') as dignosis_month,
    count('Patient ID') as patient_count
from ocd_data
group by dignosis_month
order by dignosis_month