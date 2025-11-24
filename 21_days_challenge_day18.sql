/*Daily Challenge - Day 18
 UNION, UNION ALL, combining result sets
 Practice Question*/
 
 --  Combine patient names and staff names into a single list.
 
 select name as NameList from test.patients 
 UNION ALL
 select staff_name as StaffName from test.staff;
 
 -- Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
 
 select satisfaction, 
 case when satisfaction > 90 Then 'high satisfaction patients' END as satisfaction_rating
 from  test.patients 
 UNION ALL
  select satisfaction, 
 case when satisfaction < 50 Then 'low satisfaction patients' END as satisfaction_rating
 from  test.patients ;
 
 -- List all unique names from both patients and staff tables.
  select name as NameList from test.patients 
 UNION 
 select staff_name as StaffName from test.staff;
 
 
 
 
 
/*Question: Create a comprehensive personnel and patient list showing: 
identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. 
Include only those in 'surgery' or 'emergency' services.
 Order by type, then service, then name.*/
 
 
 select patient_id as identifier,name as full_name,"patient" as type , service as associated_service from test.patients 
 UNION 
 select staff_id as StaffId, staff_name as full_name,"Staff" as type, service as associated_service from test.staff 
 where  service IN('surgery','emergency') order by type,associated_service,full_name;
 
 