-- DROP TABLES if exist
DROP TABLE IF EXISTS employees, keycard_logs, calls, alibis, evidence;

-- Employees Table
CREATE TABLE murdermystery.employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    role VARCHAR(50)
);
INSERT INTO murdermystery.employees VALUES
(1, 'Alice Johnson', 'Engineering', 'Software Engineer'),
(2, 'Bob Smith', 'HR', 'HR Manager'),
(3, 'Clara Lee', 'Finance', 'Accountant'),
(4, 'David Kumar', 'Engineering', 'DevOps Engineer'),
(5, 'Eva Brown', 'Marketing', 'Marketing Lead'),
(6, 'Frank Li', 'Engineering', 'QA Engineer'),
(7, 'Grace Tan', 'Finance', 'CFO'),
(8, 'Henry Wu', 'Engineering', 'CTO'),
(9, 'Isla Patel', 'Support', 'Customer Support'),
(10, 'Jack Chen', 'HR', 'Recruiter');



-- Keycard Logs Table
CREATE TABLE murdermystery.keycard_logs (
    log_id INT PRIMARY KEY,
    employee_id INT,
    room VARCHAR(50),
    entry_time TIMESTAMP,
    exit_time TIMESTAMP
);

INSERT INTO murdermystery.keycard_logs VALUES
(1, 1, 'Office', '2025-10-15 08:00', '2025-10-15 12:00'),
(2, 2, 'HR Office', '2025-10-15 08:30', '2025-10-15 17:00'),
(3, 3, 'Finance Office', '2025-10-15 08:45', '2025-10-15 12:30'),
(4, 4, 'Server Room', '2025-10-15 08:50', '2025-10-15 09:10'),
(5, 5, 'Marketing Office', '2025-10-15 09:00', '2025-10-15 17:30'),
(6, 6, 'Office', '2025-10-15 08:30', '2025-10-15 12:30'),
(7, 7, 'Finance Office', '2025-10-15 08:00', '2025-10-15 18:00'),
(8, 8, 'Server Room', '2025-10-15 08:40', '2025-10-15 09:05'),
(9, 9, 'Support Office', '2025-10-15 08:30', '2025-10-15 16:30'),
(10, 10, 'HR Office', '2025-10-15 09:00', '2025-10-15 17:00'),
(11, 4, 'CEO Office', '2025-10-15 20:50', '2025-10-15 21:00');



-- Calls Table
CREATE TABLE murdermystery.calls (
    call_id INT PRIMARY KEY,
    caller_id INT,
    receiver_id INT,
    call_time TIMESTAMP,
    duration_sec INT
);

INSERT INTO murdermystery.calls VALUES
(1, 4, 1, '2025-10-15 20:55', 45),
(2, 5, 1, '2025-10-15 19:30', 120),
(3, 3, 7, '2025-10-15 14:00', 60),
(4, 2, 10, '2025-10-15 16:30', 30),
(5, 4, 7, '2025-10-15 20:40', 90);



-- Alibis Table
CREATE TABLE murdermystery.alibis (
    alibi_id INT PRIMARY KEY,
    employee_id INT,
    claimed_location VARCHAR(50),
    claim_time TIMESTAMP
);

INSERT INTO murdermystery.alibis VALUES
(1, 1, 'Office', '2025-10-15 20:50'),
(2, 4, 'Server Room', '2025-10-15 20:50'),
(3, 5, 'Marketing Office', '2025-10-15 20:50'),
(4, 6, 'Office', '2025-10-15 20:50');



-- Evidence Table
CREATE TABLE murdermystery.evidence (
    evidence_id INT PRIMARY KEY,
    room VARCHAR(50),
    description VARCHAR(255),
    found_time TIMESTAMP
);

INSERT INTO murdermystery.evidence VALUES
(1, 'CEO Office', 'Fingerprint on desk', '2025-10-15 21:05'),
(2, 'CEO Office', 'Keycard swipe logs mismatch', '2025-10-15 21:10'),
(3, 'Server Room', 'Unusual access pattern', '2025-10-15 21:15');



select * from murdermystery.employees; -- employee_id , name, department,role

select * from murdermystery.alibis; -- alibi_id ,employee_id ,  claimed_location , claim_time

select * from murdermystery.calls; -- call_id ,caller_id , receiver_id , call_time , duration_sec 

select * from murdermystery.evidence; -- evidence_id, room,description,found_time

select * from murdermystery.keycard_logs ; -- log_id, employee_id, room, entry_time,exit_time


-- 1. Identify where and when the crime happened October 15, 2025, at 9:00 PM

select * from murdermystery.keycard_logs where entry_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00';

select  *  from murdermystery.alibis a join murdermystery.keycard_logs kl on a.employee_id = kl.employee_id 
where  a.claim_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00'
 and kl.entry_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00';

-- Investigate suspicious calls made around the time
select * from murdermystery.calls where call_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00';

select  * from murdermystery.calls c join murdermystery.keycard_logs kl on kl.employee_id = c.caller_id 
where c.call_time 
Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00' and kl.entry_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00';

select * from murdermystery.evidence where room In (select  a.claimed_location  from murdermystery.alibis a join murdermystery.keycard_logs kl on a.employee_id = kl.employee_id 
where  a.claim_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00');

select e.name from murdermystery.employees e join murdermystery.keycard_logs kl on e.employee_id = kl.employee_id
 join murdermystery.alibis a
on a.employee_id = e.employee_id where kl.entry_time Between '2025-10-15 20:00:00' and'2025-10-15 21:00:00'









