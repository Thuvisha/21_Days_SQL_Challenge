/*Daily Challenge - Day 10 
Practice Question
Casw Statement*/

-- Question 1): Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.

SELECT patient_id, name, service,satisfaction,
CASE WHEN satisfaction >=90 THEN 'High'
WHEN satisfaction >=80 THEN 'Medium'
ELSE 'Low'
   END  AS rating
FROM test.patients;

-- Question 2): Label staff roles as 'Medical' or 'Support' based on role type.

SELECT staff_id , staff_name,role,
CASE WHEN role IN ('doctor','nurse') THEN 'Medical'
ELSE 'Support'
END AS Staff_role
FROM test.staff;

-- Question 3): Create age groups for patients (0-18, 19-40, 41-65, 65+).

SELECT patient_id,name,age,
CASE WHEN age BETWEEN 0 AND 18 THEN 'Teens'
WHEN age BETWEEN 19 AND 40 THEN 'Adult'
WHEN age BETWEEN 41 AND 65 THEN 'Senior Adult'
ELSE 'Elderly | Senior Citizen '
END AS age_group
FROM test.patients;

/*Daily Challenge - Task
Question: Create a service performance report showing service name, total patients admitted, and a performance category based on the following: 
'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.*/

SELECT service, SUM(patients_admitted) AS total_patients_admitted,
AVG(patient_satisfaction) AS Patient_rating,
CASE 
   WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
   WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
   WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
ELSE 'Needs Improvement' 
END AS performance_category 
FROM test.services_weekly 
GROUP BY service
ORDER BY AVG(patient_satisfaction) DESC;















































