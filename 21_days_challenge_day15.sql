/*Daily Challenge - Day 15
Multiple joins and Complex Realtionship*/

-- Practice Question
-- join patients, staff, and staff_schedule to show patient service and staff availability.

SELECT   p.patient_id,p.name,p.service,s.staff_id,s.staff_name,
CASE WHEN s_s.present = 1 THEN 'YES' ELSE 'NO' END AS staff_availbility,
s_s.present AS staff_availbility,
s.role AS Role
FROM  test.staff s JOIN  test.staff_schedule s_s ON s.staff_id = s_s.staff_id AND s_s.present = 1 JOIN test.patients p ON p.service = s.service
GROUP BY p.patient_id,p.name,p.service,s.staff_id,s.staff_name,s_s.present,s.role;

-- Combine services_weekly with staff and staff_schedule for comprehensive service analysis.

SELECT s.staff_id AS StaffId,s.staff_name AS staffName,s.role AS Role,s_s.present AS availabilty, s_w.month AS Month,s_w.service AS service_taken,
CASE WHEN s_w.patient_satisfaction >= 90 THEN 'Excellent service'
WHEN s_w.patient_satisfaction >=80 Then 'Good'
WHEN  s_w.patient_satisfaction >=70 Then 'Average'
ELSE 'need improvement' END AS Service_rating
FROM test.staff s  LEFT JOIN test.staff_schedule s_s ON s.staff_id = s_s.staff_id JOIN test.services_weekly s_w ON s_w. service = s.service
GROUP BY s_w.month,s_w.service,s_w.patient_satisfaction,s.staff_id,s.staff_name,s.service,s.role,s_s.present;


-- Create a multi-table report showing patient admissions with staff information.

SELECT DISTINCT s_s.staff_id AS staffId,s_s.staff_name AS staffName, s_s.role AS Role,p.name AS Patient_name,
CASE WHEN s_s.present = 1 THEN 'Ateended'
END AS Consult_Info,
DATE_FORMAT(p.arrival_date,'%W,%M,%d,%Y') AS Consult_date,
DATEDIFF(p.departure_date,p.arrival_date) AS Patient_stayed,
p.service AS AdmittedIn,
s_w.event AS Cause_Of_Treatment
FROM test.staff_schedule s_s LEFT JOIN  test.services_weekly  s_w ON  s_w.week = s_s.week AND s_s.present = 1 
JOIN test.patients p ON p.service = s_s.service WHERE s_w.event <> 'none';
-- Daily Challenge - Task
/*Question: Create a comprehensive service analysis report for week 20 showing: 
service name, total patients admitted that week, total patients refused, 
average patient satisfaction, count of staff assigned to service, and count of staff present that week. 
Order by patients admitted descending.*/

SELECT s_w.service, SUM(s_w.patients_admitted) AS total_patients_admitted, SUM(s_w.patients_refused), ROUND(AVG(patient_satisfaction)) AS average_patient_satisfaction,
COUNT(CASE WHEN s_s.service = s_w.service THEN 1 END) AS staff_assigned , COUNT(CASE WHEN s_s.present = 1 THEN 1  END) AS staff_present ,s_w.week
FROM test.services_weekly s_w JOIN test.staff_schedule s_s ON  s_w.service = s_s.service AND s_w.week = 20 AND s_s.week =20
GROUP BY s_w.service,s_w.week , s_s.week
ORDER BY total_patients_admitted DESC;


































test.patients
test.staff_schedule
test.services_weekly 





















