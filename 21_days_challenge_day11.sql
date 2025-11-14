/*Daily Challenge - Day 11 - 
Practice Question - DISTINCT*/

-- List all unique services in the patients table.
SELECT DISTINCT service FROM test.patients;

-- Find all unique staff roles in the hospital.
SELECT DISTINCT role FROM test.staff;

-- Get distinct months from the services_weekly table.
SELECT DISTINCT month FROM test.services_weekly;

/*Daily Challenge - Task
Question: Find all unique combinations of service and event type from the services_weekly table where events are not null or none, 
along with the count of occurrences for each combination. 
Order by count descending.*/

SELECT service,event, COUNT(event) as combination_count FROM test.services_weekly 
WHERE event IS NOT NULL AND LOWER(event) <> 'none' GROUP BY service,event ORDER BY combination_count DESC;













































