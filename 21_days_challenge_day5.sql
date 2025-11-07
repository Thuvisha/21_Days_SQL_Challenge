/*Daily Challenge - Day 5
Topic : Aggregate Functions
Practice Question*/

/* Question 1): Count the total number of patients in the hospital.*/

 SELECT COUNT(*) AS TOTAL_PATIENTS FROM test.patients;

/* Question 2):Calculate the average satisfaction score of all patients. */

SELECT AVG(satisfaction) AS SCORE FROM test.patients;

/*  Question 3): Find the minimum and maximum age of patients.*/

-- min : 
SELECT MIN(age) AS MINIMUM_AGE FROM test.patients;
-- max:
SELECT MAX(age) AS MAXIMUM_AGE FROM test.patients;

/*Daily Challenge - Task
Question: Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks. 
Round the average satisfaction to 2 decimal places.*/
select * from test.services_weekly limit 10;

SELECT 
SUM(patients_admitted) AS total_number_of_patients_admitted,
SUM(patients_refused) AS total_number_of_patients_refused,
ROUND(AVG(patient_satisfaction),2)AS average_patient_satisfaction
FROM test.services_weekly;
























