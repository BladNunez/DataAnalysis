use Housing;

alter table homes rename column `condition` to home_condition;
alter table homes rename column `Month` to month_date;

# Analysis Questions 

# 1. What is the distribution of home prices in Washington?
select price from homes where price > 0;

# 2. How does the number of bedrooms correlate with home prices?
select bedrooms, price from homes where bedrooms > 0 group by bedrooms order by price; 

# 3. What is the average square footage of living space in homes?
select round(avg(sqft_living),0) as average_sqft_living from homes; 

# 4. Is there a correlation between the number of bathrooms and home prices?
select bathrooms, round(avg(price),2) as avg_price from homes where bathrooms > 0 group by bathrooms order by avg(price);

# 5. How does the condition of homes vary across different cities in Washington?
select city, round(avg(home_condition),2) from homes group by city order by avg(home_condition);

# 6.Are renovated homes priced higher than non-renovated ones?
select round(avg(price),2) as renovated_home, (select round(avg(price),2) from homes where yr_renovated = 0) as
non_renovated_home from homes where yr_renovated != 0;

# 7. What is the distribution of home sizes (sqft_living) across different floors?
select floors , sqft_living from homes group by floors; 

# 8. Is there a difference in prices between waterfront and non-waterfront properties?
SELECT waterfront, round(AVG(price),2) AS avg_price FROM homes GROUP BY waterfront order by avg(price);

# 9. How has the average home price changed over the months?
select month_date, round(avg(price),2) as avg_home_price from homes group by month_date order by avg(price);

# 10.What cities have the highest average home prices?
select city, round(avg(price),2) as avg_home_price from homes group by city order by avg(price) desc limit 5;


