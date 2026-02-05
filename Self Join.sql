CREATE DATABASE selfjoin;
USE selfjoin;
-- Used when a table relates to itself. 
CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT
);
INSERT INTO employees (emp_id, emp_name, manager_id) VALUES 
(1, 'Amit', NULL),
(2, 'Rohit', 1),
(3, 'Neha', 1),
(4, 'Priya', 2),
(5, 'Karan', 2),
(6, 'Sneha', 3);

SELECT * FROM employees;

-- SELF JOIN (Employee- Manager)
SELECT 
	e.emp_name AS Employee,
	m.emp_name AS Manager
FROM employees e 
LEFT JOIN employees m
ON e.manager_id = m.emp_id; 

-- Employees with their Manager ID & Name 
SELECT 
	e.emp_id,
    e.emp_name,
    e.manager_id,
    m.emp_name AS manager_name 
FROM employees e 
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Find Managers only
SELECT DISTINCT m.emp_name AS Manager 
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;

-- Employees Reporting to Amit 
SELECT e.emp_name 
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Amit';



