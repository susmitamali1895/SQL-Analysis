CREATE DATABASE amazon_sales;
USE amazon_sales;

show tables;
-- amazon_clean

-- View all data
SELECT * FROM amazon_clean;

-- Total revenue generated
SELECT SUM(total_sales) AS total_revenue FROM amazon_clean;

-- Revenue by category
SELECT category , SUM(total_sales) AS revenue 
FROM amazon_clean
group by category;

-- Best-selling products (by quantity)
SELECT product, SUM(quantity) AS total_quantity
FROM amazon_clean 
GROUP BY product
ORDER BY total_quantity DESC;

-- Top 5 highest revenue products
SELECT product, SUM(total_sales) AS revenue
FROM amazon_clean
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;

-- Average order value
SELECT AVG(total_sales) AS avg_order_value FROM amazon_clean;

-- Orders per customer
SELECT customer_name, COUNT(order_id) AS total_orders
FROM amazon_clean
GROUP BY customer_name
ORDER BY total_orders DESC;

-- Revenue by location (city)
SELECT customer_location, SUM(total_sales) AS revenue
FROM amazon_clean
GROUP BY customer_location
ORDER BY revenue DESC;

-- Most used payment method
SELECT payment_method, COUNT(order_id) AS usage_count
FROM amazon_clean
GROUP BY payment_method
ORDER BY usage_count DESC;

-- Count orders by status
SELECT status, COUNT(order_id) AS total_orders
FROM amazon_clean
GROUP BY status;

-- Total quantity sold per category


-- Find cancelled orders
SELECT * FROM amazon_clean WHERE status = 'Cancelled';

-- Highest priced products
SELECT product, MAX(price) AS max_price
FROM amazon_clean
group by product
ORDER BY max_price DESC;

--  Total quantity sold per category
SELECT category, SUM(quantity) AS total_sold
FROM amazon_clean
GROUP BY category
ORDER BY total_sold DESC;

-- Count of unique customers
SELECT COUNT(DISTINCT customer_name) AS unique_name
FROM amazon_clean;

-- Average price per category
SELECT category, AVG(price) AS avg_price
FROM amazon_clean 
GROUP BY category
ORDER BY avg_price DESC;

-- Show delivered orders only
SELECT * FROM amazon_clean WHERE status = 'Completed';

-- Find orders not delivered
SELECT * FROM amazon_clean WHERE status = 'Pending';

-- Display all records from the sales table.
SELECT * FROM amazon_clean;

-- Show only the first 10 rows of the dataset.
SELECT * FROM amazon_clean LIMIT 10; 

-- Find the total number of records in the table.
SELECT COUNT(*) FROM amazon_clean;

-- List all unique product categories available.
SELECT DISTINCT category FROM amazon_clean;

 -- Find the total sales amount for all orders.
SELECT SUM(total_sales) FROM amazon_clean;

-- Find the average order value.
SELECT AVG(total_sales) AS avg_value FROM amazon_clean;

-- Display all orders where the sales amount is greater than 1000.
SELECT * FROM amazon_clean WHERE total_sales > 1000;

-- Count how many orders were placed for each product category.
SELECT category , COUNT(*) FROM amazon_clean
GROUP BY category;

-- Find the maximum and minimum sales amount.
SELECT MAX(total_sales) AS maximum_amt, 
MIN(total_sales) AS minimum_amt 
FROM amazon_clean;

-- Show all orders placed in the year 2025.
SELECT * FROM amazon_clean 
WHERE date BETWEEN '01-01-2025' AND '31-12-2025';

-- Find the total sales for each region.
SELECT customer_location , SUM(total_sales)
FROM amazon_clean
GROUP BY customer_location;

-- List customers who have placed more than one order.
SELECT customer_name, COUNT(order_id) AS total_orders
FROM amazon_clean
GROUP BY customer_name
HAVING COUNT(order_id) > 1;

-- Sort the orders by sales amount in descending order.
SELECT * FROM amazon_clean
ORDER BY total_sales DESC;

-- Find the total quantity sold for each product.
SELECT product, SUM(quantity) AS total_quantity
FROM amazon_clean
GROUP BY product;

-- Display all orders where the payment mode is Debit Card
SELECT * FROM amazon_clean
WHERE payment_method = 'Debit Card'; 