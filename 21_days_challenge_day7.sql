/*Daily Challenge
Practice Questions - HAVING */
-- Find services that have admitted more than 500 patients in total

SELECT service FROM test.services_weekly GROUP BY service HAVING SUM(patients_admitted) > 500;

-- Show services where average patient satisfaction is below 75.

SELECT service FROM test.services_weekly GROUP BY service HAVING AVG(patient_satisfaction) < 75;

-- List weeks where total staff presence across all services was less than 50.

SELECT week,service,SUM(present) AS STAFF_PRESENCE FROM test.staff_schedule GROUP BY service, week  HAVING SUM(present) < 50;

/*Daily Challenge - Task*/

/*Question: Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80. 
Show service name, total refused, and average satisfaction.*/

SELECT service AS SERVICE_NAME , SUM(patients_refused) AS total_refused, AVG(patient_satisfaction) AS PATIENT_SATISFACTION FROM test.services_weekly
GROUP BY service HAVING SUM(patients_refused) > 100 AND AVG(patient_satisfaction) < 80;


















