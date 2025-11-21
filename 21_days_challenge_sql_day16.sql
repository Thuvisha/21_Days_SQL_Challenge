/*Daily Challenge - Day 16
Subqueries*/

-- Practice Question
-- Find patients who are in services with above-average staff count.
select patient_id,name,service from test.patients where service IN ((select service from test.staff group by service 
having count(distinct staff_id) > 
(select avg(Staff_count) from (select service, count(staff_id) AS Staff_count from test.staff group by service) AS staff_count)));

-- List staff who work in services that had any week with patient satisfaction below 70.
select DISTINCT staff_id,staff_name,role,service from test.staff_schedule where 
service in (select DISTINCT service from test.services_weekly where patient_satisfaction < 70);

-- Show patients from services where total admitted patients exceed 1000.

select * from test.patients where service In 
(select service from test.services_weekly  group by service having SUM(patients_admitted) > 1000);









/* Question: Find all patients who were admitted to services that had at least one week where patients were refused AND 
the average patient satisfaction for that service was below the overall hospital average satisfaction. 
Show patient_id, name, service, and their personal satisfaction score.*/

select patient_id,name,service,satisfaction from test.patients where service In 
(select DISTINCT service from test.services_weekly where patients_refused > 0 ) and service 
IN (select  service from test.services_weekly group by service 
having avg(patient_satisfaction) < (select avg(patient_satisfaction) from test.services_weekly));






