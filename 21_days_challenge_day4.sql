/*Daily Challenge - Day 4
Practice Questions:
Topic: LIMIT, OFFSET*/

/* Question 1): Display the first 5 patients from the patients table.*/

SELECT * FROM test.patients LIMIT 5;

/* Question 2) Show patients 11-20 using OFFSET.*/

SELECT * FROM test.patients LIMIT 10 OFFSET 10;

/* Question 3) Get the 10 most recent patient admissions based on arrival_date.*/

SELECT * FROM test.patients order by arrival_date DESC LIMIT 10;













































/*Daily CHallenge - Task 
Question : Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. 
Display only these 5 records.
*/

SELECT patient_id as PATIENT_ID, name AS PATIENT_NAME, 
service AS PATIENT_SERVICE,satisfaction AS PATIENT_SCORE
FROM test.patients
order by satisfaction DESC LIMIT 5 OFFSET 2;






















