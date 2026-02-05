CREATE DATABASE practices1;
USE practices1;
CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
salary DECIMAL(10,2),
dept_id INT,
manager_id INT,
join_date DATE, 
FOREIGN KEY (dept_id)REFERENCES departments(dept_id),
FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO departments VALUES 
(1, 'HR'),
(2, 'Finanace'),
(3, 'IT');

INSERT INTO employees VALUES 
(101, 'Alice', 60000, 1,NULL, '2021-01-10'),
(102, 'Bob', 50000, 1, 101, '2021-02-15'),
(103, 'Charlie', 55000, 2, 101, '2021-03-20'),
(104, 'David', 70000, 3, NULL, '2021-04-01'),
(105, 'Eve', 65000, 3,104, '2021-05-10');


SELECT * FROM departments;
SELECT * FROM employees;

-- self join 
SELECT E.emp_name AS Employee, 
M.emp_name AS Manager
From employees E;

SELECT E.emp_name AS Employee, 
M.emp_name AS Manager
FROM employees E 
LEFT JOIN employees M ON 
E.manager_id = M.emp_id;

SELECT emp_name, dept_id, 
RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS SalaryRank FROM employees;

WITH DeptMax AS (
	SELECT dept_id, MAX(salary) AS max_salary
	FROM employees 
	GROUP BY dept_id
)
SELECT e.emp_name, e.salary,
d.dept_name
FROM employees e
JOIN DeptMax dm ON e.salary= dm.max_salary AND e.dept_id = dm.dept_id
JOIN departments d ON e.dept_id = d.dept_id;






