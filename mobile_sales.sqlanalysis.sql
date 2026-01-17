CREATE DATABASE Mobile_Sales;
USE Mobile_Sales;

SHOW TABLES;

SELECT * FROM mobile_sales_data;

-- 1.	Retrieve all sales records where the Region is 'Central'.
SELECT * FROM mobile_sales_data WHERE Region = 'Central';

-- 2.	List each Brand with the total quantity of products sold.
SELECT Brand, SUM(Quantity Sold) AS total_quantity_sold 
FROM mobile_sales_data GROUP BY Brand 
ORDER BY total_quantity_sold DESC;

-- 3.	Calculate the total sales amount (Price * Quantity Sold) for each Region, and sort the results from highest to lowest.
SELECT Region, SUM(Price * Quantity Sold) AS total_sales_amount
FROM mobile_sales_data GROUP BY Region
ORDER BY total_sales_amount DESC;

-- 4.	Find the average price of products for each Product Type (e.g., Mobile Phone, Laptop).
SELECT Product AS product_type, AVG(Price) AS avg_price 
FROM mobile_sales_data GROUP BY Product
ORDER BY avg_price DESC;

-- 5.  Retrieve the top 3 customers who spent the most overall (SUM(Price * Quantity Sold)), along with their total spending
SELECT CustomerName, SUM(Price * Quantity Sold) AS total_spent 
FROM mobiles_sales_data
GROUP BY Customer Name
Order by total_spent DESC 
LIMIT 3;