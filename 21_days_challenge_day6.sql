/*Daily Challenge - Day 6
Practice Question - group by
*/
/* Question 1): Count the number of patients by each service.*/

SELECT service AS service_opted , COUNT(*) AS number_of_patients FROM test.patients GROUP BY service;

/* Question 2): Calculate the average age of patients grouped by service.*/

SELECT service AS service_opted,AVG(age) AS average_age_of_patients FROM test.patients GROUP BY service;

/* Question 3): Find the total number of staff members per role.*/

SELECT role AS staff_role , COUNT(staff_name) AS staff_members_per_role FROM test.staff GROUP BY role;

/*Daily Challenge - Task*/
/*Question: For each hospital service, calculate the total number of patients admitted, total patients refused, 
and the admission rate (percentage of requests that were admitted). 
Order by admission rate descending.*/

SELECT service, SUM(patients_admitted) AS  total_number_of_patients_admitted, SUM(patients_refused) AS total_patients_refused,
ROUND((SUM(patients_admitted) * 100/ SUM(patients_request)),2) AS admission_rate FROM test.services_weekly  GROUP BY service ORDER BY admission_rate  DESC;

























