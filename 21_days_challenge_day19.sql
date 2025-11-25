/*Daily Challenge - Day 19 
Window Functions - ROW_NUMBER(), RANK(), DENSE_RANK(), OVER clause
practice question 
 -- Rank patients by satisfaction score within each service.*/
 
 select name,service,satisfaction,dense_rank() over(partition by service order by satisfaction desc) as Patient_rank from test.patients;
 
 -- Assign row numbers to staff ordered by their name.
 
 select row_number() over (order by staff_name) as rownum,staff_id,staff_name,role,service from test.staff;
 -- partition by role
 select row_number() over (partition by role order by staff_name) as rownum,staff_id,staff_name,role,service from test.staff;
 -- partition by service
  select row_number() over (partition by service order by staff_name) as rownum,staff_id,staff_name,role,service from test.staff;
  
  -- Rank services by total patients admitted.
  select service,SUM(patients_admitted) as total_patient_admitted,dense_rank() over( order by SUM(patients_admitted) desc) as admission_rank 
  from test.services_weekly group by service;
  
  /*Daily Challenge - Task
  Question: For each service, rank the weeks by patient satisfaction score (highest first). 
  Show service, week, patient_satisfaction, patients_admitted, and the rank. 
  Include only the top 3 weeks per service.*/
  
  select * from(
  select service,week,patient_satisfaction,patients_admitted,
  dense_rank() over(partition by service order by patient_satisfaction desc) as patient_rank
  from test.services_weekly) as rank_table where patient_rank <=3 ;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  