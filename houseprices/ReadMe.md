# Washington 2014 Housing Analysis


## Project Overview
   I was curious about the housing market in Washington so I came across a dataset that was from 2014. This dataset contains listings of homes in diffrent    cities across the state of Washington. In this project I was able to find insights such as how the pricing of homes differed due to what it contained      such as amount of rooms or if the home was renovated, would that make a home more expensive? All questions and visuals are below

   Github Code: https://github.com/BladNunez/DataAnalysis/tree/main/houseprices
   
   Tableau Dashboard: 


## Exploratory Data Analysis (EDA)
   1. What is the distribution of home prices in Washington?

   2. How does the number of bedrooms correlate with home prices?

   3. What is the average square footage of living space in homes?

   4. Is there a correlation between the number of bathrooms and home prices?

   5. How does the condition of homes vary across different cities in Washington?

   6. Are renovated homes priced higher than non-renovated ones?

   7. What is the distribution of home sizes (sqft_living) across different floors?

   8. Is there a difference in prices between waterfront and non-waterfront properties?

   9. How has the average home price changed over the months?

   10. What cities have the highest average home prices?


## Data Sources
   I obtained this washington housing dataset from https://github.com/MainakRepositor/Datasets/blob/master/house%20price.csv.
   This Github contains 200+ datasets that can be used to practice and build skills in data analysis. Thank you to the author	 for putting it together.  

## Tools
   Excel: Data Cleaning/Preparation
   
   SQL: Analysis
   
   Tableau: Data Visualization

## Data Cleaning/Preparation
   I used Microsoft Excel for the cleaning and preparation of my dataset.

   1. Remove Duplicates and handle missing values
      
   2. Change data types of numeric data into integers (Numbers)
      
   3. Split data into new columns for readability
      
   4. Remove extra wording from columns 

## Feature Engineering
   As I started to clean my dataset I had a date column that was in the format of "m/d/yyyy 00:00:00 AM". 
   I removed the timestamp from the date column and then split the date into seperate month, day, year columns.
   I dealt with another column that contained zip code and state name together so I split those up into there own
   columns for readability. 

## Data Analysis
   select round(avg(price),2) as avg_renovated_home_price, (select round(avg(price),2) from homes
   where yr_renovated = 0) as avg_non_renovated_home_price from homes where yr_renovated != 0;


