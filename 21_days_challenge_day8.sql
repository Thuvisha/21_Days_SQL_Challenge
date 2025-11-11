/*Daily Challenge - Day 8
Practice Question
Question 1): Convert all patient names to uppercase. */

SELECT UPPER(name) AS Patient_name FROM test.patients LIMIT 10;

-- Question 2): Find the length of each staff member's name.

SELECT staff_name AS STAFF_NAME , LENGTH(staff_name) AS STAFF_NAME_LENGTH FROM test.staff LIMIT 10;

-- Question 3): Concatenate staff_id and staff_name with a hyphen separator.

SELECT CONCAT(staff_id ,' - ', staff_name) AS STAFF FROM test.staff LIMIT 10;
/*Daily Challenge - Task
Question: Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, 
age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. 
Only show patients whose name length is greater than 10 characters.*/

SELECT patient_id AS Patient_id, UPPER(name) AS Patient_name, LOWER(service) AS service,
CASE 
  WHEN age >= 65
	THEN 'Senior'
  WHEN age >= 18
     THEN 'Adult'
  ELSE
     'Minor'
 END AS age_category
 FROM test.patients
 WHERE LENGTH(name) > 10;




















