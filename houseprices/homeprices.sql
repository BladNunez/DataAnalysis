use Housing;

alter table homes rename column `condition` to home_condition;
alter table homes rename column `Month` to month_date;

# Analysis Questions 

# 1. What is the distribution of home prices in Washington?
select min(price) as lowest_price_home, max(price) as highest_price_home from homes where price > 0;

# 2. How does the number of bedrooms correlate with home prices?
select city, price, bedrooms from homes group by city order by price desc; 

# 3. What is the average square footage of living space in homes?
select round(avg(sqft_living),2) as average_sqft_living from homes; 

# 4. Is there a correlation between the number of bathrooms and home prices?
select city, price, bathrooms from homes group by city order by price desc;

# 5. How does the condition of homes vary across different cities in Washington?
select city, home_condition from homes group by city order by home_condition desc;

# 6.Are renovated homes priced higher than non-renovated ones?
select round(avg(price),2) as avg_renovated_home_price, (select round(avg(price),2) from homes
where yr_renovated = 0) as avg_non_renovated_home_price from homes where yr_renovated != 0;

# 7. What is the distribution of home sizes (sqft_living) across different floors?
select floors , sqft_living from homes group by floors order by sqft_living; 

# 8. Is there a difference in prices between waterfront and non-waterfront properties?
select max(price) as waterfront_home_price, (select max(price) from homes where waterfront = "No" and price > 0) 
as non_waterfront_home_price from homes where waterfront = "Yes" and price > 0;

# 9. How has the average home price changed over the months?
select month_date, round(avg(price),2) as avg_home_price from homes group by month_date order by avg(price);

# 10.What cities have the highest average home prices?
select city, round(avg(price),2) as avg_home_price from homes group by city order by avg(price) desc;


