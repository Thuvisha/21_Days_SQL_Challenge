/*Daily Challenge - Day 3
Practice Question - OrderBy*/

/* Question 1): List all patients sorted by age in descending order.*/

SELECT * FROM test.patients Order by age DESC;

/* Question 2): Show all services_weekly data sorted by week number ascending and patients_request descending.*/

SELECT * FROM test.services_weekly order by week ASC , patients_request DESC;

/*Question 3): Display staff members sorted alphabetically by their names.*/

SELECT * FROM test.staff order by staff_name ASC;

/*Task: 
Question: Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request.
 Sort by patients_refused in descending order.*/
 
 SELECT week as WEEKS, service as Patient_service,patients_refused as refused,
 patients_request as admission_request FROM test.services_weekly Order by patients_refused DESC
 limit 5;