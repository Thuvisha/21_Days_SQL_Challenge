/*Daily Challenge - Day 14
Right Join and Left Join - Both Are common , can be done by swapping the tables*/

-- Practice Question

-- Show all staff members and their schedule information (including those with no schedule entries).

SELECT s.staff_id AS employee_id, s.staff_name AS employee_name, s.role AS Employee_role, s.service AS Employee_service,
COALESCE(s_s.week,'no schedule') AS schedule_information
FROM test.staff AS s LEFT JOIN test.staff_schedule AS s_s 
ON s.staff_id = s_s.staff_id;

-- List all services from services_weekly and their corresponding staff (show services even if no staff assigned).

SELECT s_w.service,s_w.available_beds,s_w.patients_request,s_w.patients_admitted FROM test.staff AS s
RIGHT JOIN test.services_weekly AS s_w ON s_w.service = s.service; 

-- Display all patients and their service's weekly statistics (if available).

SELECT p.patient_id,p.name,p.age,p.arrival_date,p.departure_date,p.service,
DATEDIFF(p.departure_date,p.arrival_date) AS Patient_stay,
CASE WHEN s_w.patient_satisfaction >= p.satisfaction THEN 'Good'
ELSE 'Need Improvement' END AS patient_rating 
FROM test.patients AS p
RIGHT JOIN test.services_weekly AS s_w
ON p.service = s_w.service;

-- Daily Challenge - Task

/*Question: Create a staff utilisation report showing all staff members 
(staff_id, staff_name, role, service) and the count of weeks they were present (from staff_schedule). 
Include staff members even if they have no schedule records. 
Order by weeks present descending. */

SELECT s.staff_id,s.staff_name,s.role,s.service,COUNT(s_s.week) AS week_present FROM test.staff AS s LEFT JOIN test.staff_schedule AS s_s ON s.staff_id = s_s.staff_id AND s_s.present = 1
GROUP BY s.staff_id,s.staff_name,s.role,s.service,s_s.present ORDER BY week_present DESC;


































