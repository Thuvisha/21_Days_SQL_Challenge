create database test;

create table test.demo(sno int);

insert into test.demo(sno) values (1);

/*Practice Questions - Day 1*/
select * from test.patients limit 10;

select * from test.services_weekly limit 10;

select * from test.staff limit 10;

select distinct role from test.staff;

select role from test.staff;

select * from test.staff_schedule limit 10;


select patient_id as id, name as patient_name,age as Patient_age from test.patients limit 10;

/* Daily Challenge - Day 1 - SELECT Stament and Distnict 
Question : List all unique hospital services available in the hospital.*/

select distinct service as unique_hospital_services from test.services_weekly;


/* Daily Challenge - Day 2 
Practice Questions - Day2
Where Clause
Operators
*/
/* Question : 1) Find all patients who are older than 60 years.*/

/*Table Name: patients */

SELECT * FROM  test.patients  WHERE age > 60;

/* Question : 2)  Retrieve all staff members who work in the 'Emergency' service.*/

/*Table Name : staff */

SELECT * From test.staff limit 10; /*use limit to explore staff table*/

SELECT * FROM test.staff WHERE service = 'emergency';





/* Question : 3) List all weeks where more than 100 patients requested admission in any service.*/

/*Finding the right table */
SELECT * FROM test.services_weekly limit 10;

SELECT * FROM test.patients limit 10;

SELECT * FROM test.staff  limit 10;

SELECT * FROM test.staff_schedule  limit 10;

/*Table Name : services_weekly */

SELECT * FROM test.services_weekly WHERE patients_request > 100;



/* Daily Challenge - Day 2 
Question: Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.
*/

SELECT  patient_id as Patient_id, name as Patient_name, age as Patient_age, 
satisfaction as Patient_rating FROM test.patients where satisfaction < 70 
AND service = 'surgery';









