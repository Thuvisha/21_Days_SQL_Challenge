/*Daily Challenge - Day 20
Windou Function
Practice Question*/

-- Calculate running total of patients admitted by week for each service.

select week,service,sum(patients_admitted) over (partition by service order by week) as total_of_patients from test.services_weekly;

-- Find the moving average of patient satisfaction over 4-week periods.

select week,service, avg(patient_satisfaction) over(partition by service order by week rows between 3 preceding and current row) as moving_average_of_patient from
test.services_weekly;

-- Show cumulative patient refusals by week across all services.

select week,service,sum(patients_refused) as total_patient_refused , 
sum(sum(patients_refused)) over(partition by service order by week ) as cumulative_patient_refusal from test.services_weekly
group by week,service;

select service,avg(patients_admitted) over(partition by service) from test.services_weekly;

/*Question: Create a trend analysis showing for each service and week: 
week number, patients_admitted, running total of patients admitted (cumulative), 
3-week moving average of patient satisfaction (current week and 2 prior weeks), 
and the difference between current week admissions and the service average. 
Filter for weeks 10-20 only.*/

select week,patients_admitted,
sum(patients_admitted) over(partition by service order by week ) as total_patient,
avg(patient_satisfaction) over(partition by service order by week rows between 2 preceding and current row) as moving_average_of_patient,
abs(patients_admitted - round(avg(patients_admitted) over(partition by service))) as diff_admission_and_service_avg
from test.services_weekly where week between 10 and 20;














