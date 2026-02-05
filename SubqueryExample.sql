CREATE DATABASE subquery;
USE subquery;
CREATE TABLE employees_payroll (
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees_payroll VALUES
(1, 'Amit',  'IT',      90000),
(2, 'Neha',  'IT',      75000),
(3, 'Rohit', 'HR',      60000),
(4, 'Priya', 'HR',      82000),
(5, 'Karan', 'Finance', 95000),
(6, 'Sneha', 'Finance', 70000),
(7, 'Vikas', 'Sales',   50000),
(8, 'Anita', 'Sales',   65000);
SELECT * FROM employees_payroll;

-- Employees earning more than average salary
SELECT emp_name, salary
FROM employees_payroll
WHERE salary > (
    SELECT AVG(salary)
    FROM employees_payroll
);

-- Employees working in departments with average salary > 75000
SELECT emp_name, department
FROM employees_payroll
WHERE department IN (
    SELECT department
    FROM employees_payroll
    GROUP BY department
    HAVING AVG(salary) > 75000
);

-- Show employee salary and company average
SELECT 
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees_payroll) AS avg_salary
FROM employees_payroll;

