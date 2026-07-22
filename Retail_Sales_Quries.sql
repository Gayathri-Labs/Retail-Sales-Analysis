/*
==========================================
Retail Sales Analysis
SQL Business Questions
Database: Retail_sales_DB
==========================================
*/

-----------------------------------------------------------------------------------------------
1. What is the total sales and total number of orders?

SELECT
    SUM(sales) AS total_sales,
    COUNT(order_number) AS total_orders
FROM sales;

-----------------------------------------------------------------------------------------------

2. Which product line has the highest sales, and which has the lowest?

(
SELECT
    product_line,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 1
)

UNION ALL

(
SELECT
    product_line,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue ASC
LIMIT 1
);

-----------------------------------------------------------------------------------------------

3. Which country has the highest total sales?

SELECT
    country,
    SUM(sales) AS total_sales
FROM sales
GROUP BY country
ORDER BY total_sales DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------

 4. Which city has the highest total sales?

SELECT
    city,
    SUM(sales) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------

5. Who are the top 10 customers based on total sales?

SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-----------------------------------------------------------------------------------------------

6. Which customer has not placed an order for the longest time?

SELECT
    customer_name,
    days_since_last_order
FROM sales
ORDER BY days_since_last_order DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------


7. Which product line has the highest order quantity, and which has the highest sales?

(
SELECT
    product_line,
    SUM(quantity_ordered) AS total_quantity
FROM sales
GROUP BY product_line
ORDER BY total_quantity DESC
LIMIT 1
)

UNION ALL

(
SELECT
    product_line,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 1
);

-----------------------------------------------------------------------------------------------

8. Which product line has the highest price, and which has the lowest price?

(
SELECT
    product_line,
    MAX(price_each) AS high_price,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY high_price DESC
LIMIT 1
)

UNION ALL

(
SELECT
    product_line,
    SUM(sales) AS total_revenue,
    MIN(price_each) AS low_price
FROM sales
GROUP BY product_line
ORDER BY low_price ASC
LIMIT 1
);

-----------------------------------------------------------------------------------------------

9. How many orders are there in each order status?

SELECT
    status,
    COUNT(DISTINCT ordernumber) AS total_orders
FROM sales
GROUP BY status
ORDER BY total_orders DESC;

-----------------------------------------------------------------------------------------------

10. Which deal size has the highest total sales?

SELECT
    deal_size,
    SUM(sales) AS total_sales
FROM sales
GROUP BY deal_size
ORDER BY total_sales DESC;

-----------------------------------------------------------------------------------------------

11. How do sales change month by month?

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

-----------------------------------------------------------------------------------------------

12. Which month has the highest total sales?

SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY total_sales DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------

13. Which product line has the highest sales in each country?

SELECT
    product_line,
    country,
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_line, country
ORDER BY total_sales DESC
LIMIT 1;

-----------------------------------------------------------------------------------------------

14. Which product line has the highest sales and which has the lowest sales based on quantity ordered?

(
SELECT
    product_line,
    SUM(quantity_ordered) AS total_quantity,
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_line
ORDER BY total_sales DESC
LIMIT 1
)

UNION ALL

(
SELECT
    product_line,
    SUM(quantity_ordered) AS total_quantity,
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_line
ORDER BY total_sales ASC
LIMIT 1
);

-----------------------------------------------------------------------------------------------

15. Which customers, countries, product lines, and deal sizes generate the highest sales?
SELECT
    country,
    product_line,
    deal_size,
    customer_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY
    country,
    product_line,
    deal_size,
    customer_name
ORDER BY total_sales DESC;

-----------------------------------------------------------------------------------------------
