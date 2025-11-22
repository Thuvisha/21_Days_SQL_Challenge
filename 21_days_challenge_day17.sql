/*Daily Challenge - Day 17
Sub queries with select and from*/
-- practice question

-- Show each patient with their service's average satisfaction as an additional column.

select p.patient_id,p.name,p.age,p.service,
(select avg(patient_satisfaction) from test.services_weekly s_w where s_w.service= p.service  group by service) 
as services_average_satisfaction from test.patients p;

-- Create a derived table of service statistics and query from it.

select service,
case when satisfaction_rating >= 90 Then CONCAT('Excellent service on',' ',service)
when satisfaction_rating >= 80 Then CONCAT('Good service on',' ',service)
when satisfaction_rating >= 70 Then CONCAT('Average service on',' ',service)
else CONCAT('Need improvement on',' ',service)
END as performance, satisfaction_rating,
 beds_available, patient_admitted as patienet_conversion_rate,
beds_available - patient_admitted as bed_availability_rate,
case when patient_admitted < beds_available Then 'available' else 'not available' end as bed_availability from(
select service, sum(available_beds) as beds_available, sum(patients_request) as patient_request , 
sum(patients_admitted) as patient_admitted, sum(patients_refused) as patient_refused , 
round(avg(patient_satisfaction)) as satisfaction_rating from test.services_weekly group by service) as service_stats;


-- Display staff with their service's total patient count as a calculated field.

select staff_id,staff_name,role, service,
(select count(patient_id) from test.patients p  where week(p.arrival_date) = s.week) as service_total_patient  
from test.staff_schedule s;
/* Question: Create a report showing each service with: 
service name, total patients admitted, the difference between their total admissions and the average admissions across all services, 
and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending. */

select service,total_patient_admitted, ROUND(ABS(total_patient_admitted - a_t_d)) as difference,
case when total_patient_admitted > a_t_d Then 'Above Average' Else 'Below Average' END AS rank_indicator from(
select service,sum(patients_admitted) as total_patient_admitted,(
select avg(total_admitted) from (
select  sum(patients_admitted) as total_admitted from test.services_weekly group by service) as avg_admitted) as a_t_d from test.services_weekly
 group by service) as r_i_t order by total_patient_admitted DESC;






















































