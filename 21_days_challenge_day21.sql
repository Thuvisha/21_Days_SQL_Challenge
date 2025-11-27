/*Daily Challenge - Day21 
Common Table Expression
*/
-- Practice Question
-- Create a CTE to calculate service statistics, then query from it.

with service_stas as(
select service, sum(available_beds) as total_bed_inservice ,
sum(patients_request) as total_patient_request,
sum(patients_admitted) as total_patient_admitted,
sum(patients_refused) as total_patient_refused,
avg(patient_satisfaction) as avg_patient_satisfaction
from test.services_weekly
group by service)

select *from service_stas where avg_patient_satisfaction > 70;









-- Use multiple CTEs to break down a complex query into logical steps.

with service_stas as(
select service, sum(available_beds) as total_bed_inservice ,
sum(patients_request) as total_patient_request,
sum(patients_admitted) as total_patient_admitted,
sum(patients_refused) as total_patient_refused,
avg(patient_satisfaction) as avg_patient_satisfaction
from test.services_weekly
group by service),

 patient_metrics as(
select count(distinct patient_id) as patient_count,
service from test.patients group by service
),

staff_metrics as(
select count(distinct s_s.staff_id) as staff_count, s.service from test.staff s
join test.staff_schedule s_s on s.staff_id = s_s.staff_id
and s_s.present = 1 group by service
)

select s_s.service, s_s.total_bed_inservice,
s_s.total_patient_request,
s_s.avg_patient_satisfaction,
case when s_s.avg_patient_satisfaction >= 90 Then 'excellent service'
when s_s.avg_patient_satisfaction >= 80 Then 'good service'
when s_s.avg_patient_satisfaction >= 70 Then 'average service'
else 'need improvement' end as review,
p_m.patient_count, s_m.staff_count
from service_stas s_s left join patient_metrics p_m on p_m. service = s_s.service
left join staff_metrics s_m on s_m.service = s_s.service;









-- Build a CTE for staff utilization and join it with patient data

with staff_utilization as(
select s_s.staff_id, s_s.staff_name,s_s.role, s_s.service from test.staff_schedule s_s
join test.staff s on s.staff_id = s_s.staff_id
and s_s.present = 1
)


select distinct patient_id,name,age,arrival_date,departure_date,datediff(departure_date , arrival_date) as days_stayed,
s_u.staff_id,s_u.staff_name,s_u.service 
 from test.patients p Join staff_utilization s_u on p.service = s_u.service;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /* Task : Question: Create a comprehensive hospital performance dashboard using CTEs. 
 Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
 2) Staff metrics per service (total staff, avg weeks present), 
 3) Patient demographics per service (avg age, count). 
 Then combine all three CTEs to create a final report showing service name, 
 all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). 
 Order by performance score descending.
 */
 
 with service_stas as(
select service, sum(available_beds) as total_bed_inservice ,
sum(patients_request) as total_patient_request,
sum(patients_admitted) as total_patient_admitted,
sum(patients_refused) as total_patient_refused,
avg(patient_satisfaction) as avg_patient_satisfaction,
(sum(patients_admitted) * 100)/sum(patients_refused) as performance_score
from test.services_weekly
group by service),
staff_metrics as(
select count(distinct s_s.staff_id) as staff_count, s.service,avg(s_s.week) as avg_week_present from test.staff s
join test.staff_schedule s_s on s.staff_id = s_s.staff_id
and s_s.present = 1 group by service
),
 patient_demographics as(
select count(distinct patient_id) as patient_count,
service ,avg(age) as avg_age from test.patients group by service
)

select s_s.service,s_s.total_bed_inservice,s_s.total_patient_request,s_s.total_patient_admitted,s_s.total_patient_refused,
s_s.avg_patient_satisfaction,s_s.performance_score, p_d.patient_count,s_m.staff_count from service_stas s_s 
join staff_metrics s_m on s_s.service = s_m.service 
left join  patient_demographics p_d on p_d.service = s_m.service
order by s_s.performance_score desc;




 
 
 
 
 
 
 
 
 
 
 
 
 
