CREATE DATABASE windowfunctionchallenge;

USE windowfunctionchallenge;
CREATE TABLE employee_salary(
emp_id INT AUTO_INCREMENT PRIMARY KEY, 
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT, 
salary_month DATE 
);

INSERT INTO employee_salary (emp_name, department, salary, salary_month) VALUES 
-- IT dept
('Amit', 'IT', 50000, '2024-01-01'),
('Amit', 'IT', 55000, '2024-02-01'),
('Amit', 'IT', 60000, '2024-03-01'),

('Ravi', 'IT', 60000, '2024-01-01'),
('Ravi', 'IT', 60000, '2024-02-01'),
('Ravi', 'IT', 65000, '2024-03-01'),

-- HR dept
('Neha', 'HR', 40000, '2024-01-01'),
('Neha', 'HR', 42000, '2024-02-01'),
('pooja', 'HR', 42000, '2024-01-01'),
('pooja', 'HR', 45000, '2024-02-01'),

-- Finance dept
('Suresh', 'Finance', 70000, '2024-01-01'),
('Suresh', 'Finance', 75000, '2024-02-01'),
('karan', 'Finance', 75000, '2024-01-01');

-- Row_Number() Ranking without gaps
SELECT emp_id, emp_name, department, salary, 
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC ) AS row_num
FROM employee_salary;

-- DENSE_RANK() - Ranking without gaps
SELECT emp_id, emp_name, department , salary , 
DENSE_RANK() OVER  (PARTITION BY department ORDER BY salary DESC ) AS dense_row_num
FROM employee_salary;

-- Department wise Analytics
SELECT emp_name, department, salary ,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_pos, 
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC ) AS dense_rank_pos
FROM employee_salary;

-- Prevoius month salary 
SELECT emp_name, salary_month ,salary,
LAG(salary) OVER (
	PARTITION BY emp_name 
	ORDER BY salary_month 
) AS previous_salary
FROM employee_salary;

-- Next month salary 
SELECT emp_name, salary_month ,salary,
LEAD(salary) OVER (
	PARTITION BY emp_name 
	ORDER BY salary_month 
) AS next_salary
FROM employee_salary;

-- salary growth 
SELECT emp_name, salary_month ,salary,
salary - LAG(salary) OVER (
	PARTITION BY emp_name 
	ORDER BY salary_month 
) AS salary_growth
FROM employee_salary;

-- Running total Employee wise salary growth 
SELECT emp_name, salary_month ,salary,
AVG(salary) OVER (
	PARTITION BY emp_name 
	ORDER BY salary_month 
    ROWS BETWEEN 1 PRECEDING AND CURRENT ROW 
    ) AS moving_avg_2_months
    FROM employee_salary;
    
-- Department wise analytics
SELECT emp_name, department, salary ,
-- Ranking
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_pos, 
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC ) AS dense_rank_pos,
-- Department wise 
SUM(salary) OVER (PARTITION BY department) AS dept_total_salary,
AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary,
COUNT(*) OVER (PARTITION BY department) AS dept_employee_count

 FROM employee_salary;












