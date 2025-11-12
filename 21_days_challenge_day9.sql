/*Daily Challenge - Day 9
Practice Question 
Question 1): Extract the year from all patient arrival dates.*/

SELECT arrival_date,YEAR(arrival_date) AS year_Arrived FROM test.patients;

-- Calculate the length of stay for each patient (departure_date - arrival_date).

SELECT arrival_date, departure_date,DATEDIFF(departure_date,arrival_date) AS length_of_stay FROM test.patients;

-- Find all patients who arrived in a specific month.

SELECT * FROM test.patients WHERE MONTH(arrival_date) = 11;
/*Daily Challenge - Task
Question: Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending.*/

SELECT COUNT(*) AS Count_of_patients,service,AVG(DATEDIFF(departure_date,arrival_date)) AS average_stay FROM test.patients 
GROUP BY service 
HAVING average_stay > 7 
ORDER BY average_stay DESC ;






















