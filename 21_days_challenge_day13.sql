/*Daily Challenge - Day 13
Practice Question
SQL Joins*/

-- Join patients and staff based on their common service field (show patient and staff who work in same service).

SELECT  staff_name, name AS patient_name FROM test.staff s INNER JOIN test.patients p ON s.service = p.service;

-- Join services_weekly with staff to show weekly service data with staff information.

SELECT s_w.week,s_w.month,s.service,s.staff_id,s.staff_name FROM test.services_weekly s_w INNER JOIN test.staff s ON s_w.service = s.service;

-- Create a report showing patient information along with staff assigned to their service.

SELECT * FROM test.patients p INNER JOIN test.staff s ON p.service = s.service; 

/*Daily Challenge - Task
Question: Create a comprehensive report showing patient_id, patient name, age, service, and the total number of staff members available in their service. 
Only include patients from services that have more than 5 staff members. Order by number of staff descending, then by patient name.*/

SELECT service,COUNT(DISTINCT staff_id) from test.staff GROUP BY service HAVING COUNT(staff_id)> 5;


SELECT p.patient_id,p.name,p.age,p.service,s.total_staff_memebers FROM test.patients p INNER JOIN 
(SELECT service,COUNT(DISTINCT staff_id) AS total_staff_memebers from test.staff GROUP BY service HAVING COUNT(staff_id)> 5 ) AS s
ON p.service = s.service
ORDER BY s.total_staff_memebers DESC, p.name;























