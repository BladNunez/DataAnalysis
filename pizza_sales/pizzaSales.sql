use Pizza_Sales;
SET SQL_SAFE_UPDATES = 0;

-- Change size column to full names in pizzas table
UPDATE pizzas
SET size = 'Small' 
WHERE size = 'S';

UPDATE pizzas
SET size = 'Medium'
WHERE size = 'M';

UPDATE pizzas
SET size = 'Large'
WHERE size = 'L';

-- Data Analyis

-- 1. How many customers do we have each day? Are there any peak hours?
SELECT date, COUNT(*) AS amount_of_customers FROM orders GROUP BY date;

-- Peak hours throughout the year
SELECT HOUR(time) AS hour, COUNT(*) AS amount_of_customers FROM orders GROUP BY HOUR(time); 

-- 2. How many pizzas are typically in an order? Do we have any bestsellers?
SELECT AVG(quantity) AS avg_pizzas_per_order FROM order_details;

-- 3. How much money did we make this year? Can we indentify any seasonality in the sales?
SELECT ROUND(SUM(o.quantity * p.price),2) AS Revenue
FROM order_details o INNER JOIN pizzas p ON o.pizza_id = p.pizza_id;

-- Monthly Sales Trend
SELECT MONTH(orders.date) AS month,ROUND(SUM(o.quantity * p.price),2) AS Revenue
FROM order_details o INNER JOIN pizzas p ON o.pizza_id = p.pizza_id
INNER JOIN orders ON orders.order_id = o.order_id GROUP BY MONTH(orders.date);

-- 4. Are there any pizzas we should take off the menu, or any promotions we could leverage?
SELECT pt.name, ROUND(SUM(o.quantity * p.price),2) AS Revenue
FROM order_details o INNER JOIN pizzas p ON o.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.name ORDER BY Revenue DESC;


