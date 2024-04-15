CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
)

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
    (1, 'avanthika', 'bhatia', '2003-08-04', 'avanthikaa@gmail.com','7569148986'),
    (2, 'aslam', 'khan', '2001-12-09', 'aslamkhan@gmail.com', '9876543210'),
    (3, 'shivudu', 'jr', '2001-05-10', 'shivudu@gmail.com', '9551234567'),
    (4, 'kumar', 'varma', '2002-12-25', 'kumarvarma@gmail.com', '9998887776'),
    (5, 'ballala', 'deva', '2001-09-30', 'ballaladeva@gmail.com', '9112223334'),
    (6, 'Deva', 'sena', '2002-04-05', 'devasena@gmail.com', '9445556667'),
    (7, 'siva', 'Gami', '2001-03-18', 'sivagami@gmail.com', '9778889991'),
    (8, 'amarendra', 'bahubali', '2001-11-20', 'amarendrabahubali@gmail.com', '9332221110'),
    (9, 'bijjla', 'deva', '2001-06-14', 'bijjaladeva@gmail.com', '9667778883'),
    (10, 'kattappa', 'mama', '2001-02-09', 'kattappamama@example.com', '9889990002');

	CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
drop table Courses
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (1, 'Mathematics', 3, 101),
    (2, 'English Literature', 4, 102),
    (3, 'Physics', 3, 103),
    (4, 'History', 4, 104),
    (5, 'Computer Science', 3, 105),
    (6, 'Chemistry', 4, 106),
    (7, 'Biology', 3, 107),
    (8, 'Art', 2, 108),
    (9, 'Music', 2, 109),
    (10, 'Physical Education', 1, 110)

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (101, 'Michael', 'Johnson', 'michael.johnson@example.com'),
    (102, 'Emily', 'Davis', 'emily.davis@example.com'),
    (103, 'Christopher', 'Wilson', 'christopher.wilson@example.com'),
    (104, 'Sarah', 'Martinez', 'sarah.martinez@example.com'),
    (105, 'David', 'Brown', 'david.brown@example.com'),
    (106, 'Jessica', 'Garcia', 'jessica.garcia@example.com'),
    (107, 'Andrew', 'Lopez', 'andrew.lopez@example.com'),
    (108, 'Lauren', 'Hernandez', 'lauren.hernandez@example.com'),
    (109, 'Daniel', 'Young', 'daniel.young@example.com'),
    (110, 'Olivia', 'Miller', 'olivia.miller@example.com')


	CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 1, '2024-04-01'),
    (2, 2, 2, '2024-04-02'),
    (3, 3, 3, '2024-04-03'),
    (4, 4, 4, '2024-04-04'),
    (5, 5, 5, '2024-04-05'),
    (6, 6, 6, '2024-04-06'),
    (7, 7, 7, '2024-04-07'),
    (8, 8, 8, '2024-04-08'),
    (9, 9, 9, '2024-04-09'),
    (10, 10, 10, '2024-04-10')

	CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
)
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 500.00, '2024-04-01'),
    (2, 2, 600.00, '2024-04-02'),
    (3, 3, 700.00, '2024-04-03'),
    (4, 4, 800.00, '2024-04-04'),
    (5, 5, 900.00, '2024-04-05'),
    (6, 6, 1000.00, '2024-04-06'),
    (7, 7, 1100.00, '2024-04-07'),
    (8, 8, 1200.00, '2024-04-08'),
    (9, 9, 1300.00, '2024-04-09'),
    (10, 10, 1400.00, '2024-04-10')

	////////////task2////////
/*1*/
INSERT INTO Students 
VALUES (11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890')
/*2*/
DECLARE @student_id INT = 1
DECLARE @course_id INT = 1
DECLARE @enrollment_date DATE = GETDATE()
INSERT INTO Enrollments 
VALUES (11,1, 1, '04-08-2003')

/*3*/
UPDATE Teacher
SET email = 'newemail@example.com'
WHERE teacher_id = 101;
/*4*/
DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 1;

/*5*/
UPDATE Courses
SET teacher_id = 102
WHERE course_id = 2;

/*6*/
DELETE FROM Enrollments WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 1;

/*7*/
UPDATE Payments
SET amount = 700.00
WHERE payment_id = 1;



select * from student
/////////task-3/////////
/*1*/
SELECT s.student_id,s.first_name,s.last_name,sum(p.amount) as total_payment
FROM Payments p
JOIN Students s ON p.student_id=s.student_id
WHERE s.student_id=4
GROUP BY s.student_id,s.first_name,s.last_name

/*2*/
SELECT c.course_id,count(e.student_id) as no_of_Students
FROM Courses c
JOIN Enrollments e ON e.course_id=c.course_id
GROUP BY c.course_id

/*3 not working*/
SELECT s.first_name FROM Students s
JOIN Enrollments e on s.student_id=e.student_id
WHERE s.student_id IS NULL

/*4*/
SELECT s.first_name,s.last_name,c.course_name
FROM Students s
JOIN Enrollments e on e.student_id=s.student_id
JOIN Courses c on c.course_id=e.course_id

/*5*/
SELECT t.first_name,c.course_name
FROM Teacher t
JOIN Courses c on c.teacher_id=t.teacher_id

/*6*/
SELECT s.first_name,e.enrollment_date
FROM Students s
JOIN Enrollments e on e.student_id=s.student_id
JOIN Courses c on c.course_id=e.course_id
WHERE c.course_name='JAVA'

/*7*/
SELECT s.first_name
FROM Students s
LEFT JOIN Payments p ON p.student_id=s.student_id
WHERE p.student_id IS NULL

/*8*/
SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON e.course_id=c.course_id
WHERE e.course_id IS NULL

/*9*/
SELECT e.student_id,count(DISTINCT e.course_id) as noof_enrollments
FROM Enrollments e
JOIN Enrollments e1 ON e1.student_id=e.student_id
GROUP BY e.student_id
HAVING count(DISTINCT e.course_id)>1

/*10*/
SELECT t.first_name
FROM Teacher t
LEFT JOIN Courses c ON c.teacher_id=t.teacher_id
WHERE c.teacher_id IS NULL






/*1*/
select course_id, avg(Enrollmentcount) as avgenrollment
from (select course_id, count(student_id) as enrollmentcount
from Enrollments 
group by course_id
) as totenrollment
group by course_id

/*2*/
select student_id, amount from payments
where amount=(select max(amount) from payments)

/*3*/
SELECT course_id, course_name, 
    (SELECT COUNT(*) FROM Enrollments WHERE Enrollments.course_id = Courses.course_id) AS enrollment_count
FROM Courses
ORDER BY enrollment_count DESC
/*4*/
select teacher_id, sum(payment) as totpayments
from(select c.teacher_id, p.amount as payment
from courses c
join enrollments e on c.course_id = e.course_id
join payments p on e.student_id = p.student_id
) as payments
group by teacher_id

/*5*/
select student_id from enrollments
group by student_id
having count(distinct course_id)=(
select count(distinct course_id) from courses)

/*6*/
select first_name
from teacher
where teacher_id not in(
select distinct teacher_id from courses)

/*7*/
SELECT AVG(student_age) AS average_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS student_age
    FROM Students
) AS student_ages;
/*8*/
select course_name from courses
where course_id not in (
select distinct course_id from enrollments)

/*9*/
select e.student_id,sum(amount) as totalpayments
from payments p
join enrollments e on p.student_id = e.student_id
group by e.student_id

/*10*/
select s.student_id, payment_count.totpayments
from students s
join (select p.student_id, count(p.payment_id) as totpayments
from payments p
group by p.student_id
having count(p.payment_id) > 1
)as payment_count on s.student_id = payment_count.student_id

/*11*/
select s.student_id,s.first_name, sum(p.amount) as totpayment
from students s
join payments p on s.student_id = p.student_id
group by s.student_id, s.first_name

/*12*/
select c.course_name, count(e.student_id) as noofstudents
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_name

/*13*/
select s.first_name, avg(p.amount) as avgpayment
from students s
join payments p on s.student_id = p.student_id
group by s.first_name