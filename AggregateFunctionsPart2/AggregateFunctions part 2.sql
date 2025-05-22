
Create Database  GTR;

USE GTR

 --Employee table 

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    department VARCHAR(50),
    salary INT
);
-- Insert data into Employee table
INSERT INTO Employee VALUES
(1, 'Aarav', 'Male', 'IT', 50000),
(2, 'Divya', 'Female', 'HR', 45000),
(3, 'Gaurav', 'Male', 'IT', 55000),
(4, 'Aarav', 'Male', 'Finance', 60000),
(5, 'Divya', 'Female', 'HR', 48000),
(6, 'Priya', 'Female', 'Finance', 52000),
(7, 'Rahul', 'Male', 'IT', NULL);

select * From Employee

-- Create Student table

CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    year INT,
    grade CHAR(1)
);
-- Insert data into Student table

INSERT INTO Student VALUES
(1, 'John', 'Mathematics', 1, 'A'),
(2, 'Emily', 'Science', 3, 'B'),
(3, 'Michael', 'English', 2, 'A'),
(4, 'Jessica', 'Mathematics', 1, 'B'),
(5, 'David', 'Science', 3, 'C'),
(6, 'Sarah', 'English', 2, 'A'),
(7, 'Robert', 'Mathematics', 2, 'B');


select * From Student
---------------------------------
--========1. Count the Total Number of Employees===

SELECT COUNT (*) AS TotalNumber From Employee

--========2. Calculate the Total Salary (ignoring NULL values)======

select SUM(salary) AS TotalSalary 

From Employee

--=======3. Find the Average Salary======
SELECT AVG(salary) AS AverageSalary 

From Employee

--======4. Find the Highest and Lowest Salary====
SELECT MAX(salary) AS HighestSalary 

FROM  Employee

SELECT MIN(salary) AS LowestSalary 

FROM  Employee
--=============================GROUP BY ===============
--=======Example 1: Group By Single Column (Employee name with total salary)=====

SELECT name , SUM(salary)

FROM  Employee

GROUP BY name 

--=======Example 2: Group By Multiple Columns (Student subject and year)======

SELECT subject, year , COUNT(*)

FROM  Student

GROUP BY subject ,year

---============================HAVING==========================
--======Example 1: Departments with total salary ≥ 100,000======

SELECT department ,SUM(salary) AS salary

FROM  Employee

GROUP BY department

HAVING SUM(salary) >=100.000;

--=======Example 2: Subjects with more than 1 student in any year========

SELECT  COUNT(*) AS number_of_student, subject, year 

FROM  Student

GROUP BY subject ,year     

HAVING  COUNT(*)>1 