/*Daily Challenge - Day 12
Practice Question*/
-- Find all weeks in services_weekly where no special event occurred.
SELECT week,event  FROM test.services_weekly WHERE event IS NULL OR LOWER(event) = 'none';

-- Count how many records have null or empty event values
SELECT COUNT(*) FROM test.services_weekly WHERE event IS NULL OR LOWER(event) = 'none';

-- List all services that had at least one week with a special event.
SELECT service,week,event FROM test.services_weekly WHERE event IS NOT NULL AND LOWER(event) != 'none';

/*Daily Challenge - Task 
Question: Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. 
Order by average patient satisfaction descending.*/

SELECT 
   CASE WHEN event IS NULL OR LOWER(event) = 'none' THEN 'No Event'
   ELSE 'With Event'
   END AS event_status,
   COUNT(DISTINCT week) AS count_of_weeks, /*To reduce duplicate values (same week and event for more than one patient)*/
   AVG(patient_satisfaction) AS average_patient_satisfaction,
   AVG(staff_morale) AS average_staff_morale
   FROM test.services_weekly GROUP BY event_status ORDER BY AVG(patient_satisfaction) DESC ;






















