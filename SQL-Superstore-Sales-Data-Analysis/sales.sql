use SalesData;

# List all orders that were shipped using the 'Same Day' ship mode.
select `Order ID` from orders where `Ship Mode` = 'Same Day';

# List all orders where the sales amount exceeded $1,000.
select `Order ID`, round(Sales,2) from orders where Sales > 1000; 

# Find the number of orders placed in each region.
select  customers.Region , count(orders.`Order ID`) as amount_of_orders from customers join orders on 
customers.`Customer ID` = orders.`Customer ID` group by customers.Region order by  count(orders.`Order ID`) desc;

# List all customers from the 'Corporate' segment located in the state of 'California'.
select `Customer ID`, `Customer Name` , Segment, State from customers where Segment = 'Corporate' and State = 'California';

# Retrieve the products that belong to the 'Technology' category but are not in the 'Accessories' sub-category.
select `Product Name`, Category, `Sub-Category` from products where Category = 'Technology' and not `Sub-Category` = 'Accessories';

# Calculate the average sales amount for orders shipped in each mode.
select `Ship Mode`, round(avg(Sales),2) as avg_sales from orders group by `Ship Mode` order by avg(Sales);