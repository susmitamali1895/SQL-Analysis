CREATE DATABASE windowfunction;
USE windowfunction;

-- Create table
CREATE TABLE windowsales (
    sale_id INT,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- Insert data
INSERT INTO windowsales VALUES
(1, 'Alice', 'Laptop', '2023-01-10', 1000),
(2, 'Bob', 'Laptop', '2023-01-12', 1200),
(3, 'Alice', 'Phone', '2023-01-15', 800),
(4, 'Charlie', 'Laptop', '2023-01-20', 1100),
(5, 'Bob', 'Phone', '2023-01-22', 700),
(6, 'Alice', 'Laptop', '2023-01-25', 1300),
(7, 'Charlie', 'Phone', '2023-01-28', 650);

SELECT * FROM windowsales;

-- a) ROW_NUMBER() → Give each row a unique number within each customer
-- Explanation: For each customer_name, rows are ordered by sale_date, and a row number is assigned (1, 2, 3)
SELECT 
    customer_name,
    product,
    amount,
    ROW_NUMBER() OVER(PARTITION BY customer_name ORDER BY sale_date) AS row_num
FROM windowsales;

-- b) RANK() → Rank sales by amount (with ties)
-- Explanation: Within each customer’s sales, the highest amount gets rank 1. If two sales have the same amount, they get the same rank.
SELECT 
    customer_name,
    amount,
    RANK() OVER(PARTITION BY customer_name ORDER BY amount DESC) AS rank_in_customer
FROM windowsales;

-- c) LAG() → Compare current sale with previous sale
-- Explanation: For each row, LAG gets the previous sale’s amount for the same customer. Useful for trends. 
SELECT 
    customer_name,
    sale_date,
    amount,
    LAG(amount) OVER(PARTITION BY customer_name ORDER BY sale_date) AS prev_sale
FROM windowsales;

-- d) Running total (SUM() OVER)
-- Explanation: Shows a cumulative sum of sales for each customer, ordered by date
SELECT 
    customer_name,
    sale_date,
    amount,
    SUM(amount) OVER(PARTITION BY customer_name ORDER BY sale_date) AS running_total
FROM windowsales;

-- e) AVG() with a window
-- Explanation: Shows the average sale amount for each product, but keeps individual rows
SELECT 
    product,
    amount,
    AVG(amount) OVER(PARTITION BY product) AS avg_product_sales
FROM windowsales;



-- Note 
-- ✅ Key Difference from GROUP BY:
-- GROUP BY collapses rows → one result per group.
-- Window functions keep rows → you can see both detail + aggregated values together.
