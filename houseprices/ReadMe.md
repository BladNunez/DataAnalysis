# Washington 2014 Housing Analysis
<img width="1000" height="500" alt="Dashboard1" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/377e406b-d172-427e-b51a-55fb54bf9b05">
<br><br>
<img width="1000" height="500" alt="Dashboard2" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/a94215bf-046e-4385-ba9d-301903e79f3e">

## Project Overview
I was curious about the housing market in Washington so I came across a dataset that was from 2014. This dataset contains listings of homes in diffrent      cities across the state of Washington. In this project I was able to find insights such as how the pricing of homes differed due to what it contained such as    amount of rooms or if the home was renovated, would that make a home more expensive? All questions and visuals are below

Github Code: https://github.com/BladNunez/DataAnalysis/tree/main/houseprices
   
Tableau Dashboard 1:

https://public.tableau.com/app/profile/bladimir.nunez/viz/WashingtonHomeDashboard_17083170020200/Dashboard1?publish=yes

Tableau Dashboard 2: 

https://public.tableau.com/app/profile/bladimir.nunez/viz/WashingtonHomeDashboard2/Dashboard2?publish=yes

## Exploratory Data Analysis (EDA)
   1. What is the distribution of home prices in Washington?

<img width="500" height="400" alt="One" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/adffe7a9-02d7-4541-85ab-cae4a69423b6">


   2. How does the number of bedrooms correlate with home prices?

      <img width="619" height="500" alt="Two" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/33cf923e-47bf-49b6-8580-0e61509131f3">


   3. What is the average square footage of living space in homes?

      <img width="298" alt="Three" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/b7b32983-e98c-4f40-a1eb-c1980c921f1b">


   4. Is there a correlation between the number of bathrooms and home prices?

      
<img width="586" alt="Four" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/76af6366-c4b2-44be-909a-09e988011879">

   5. How does the condition of homes vary across different cities in Washington?
      
      <img width="987" alt="Five" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/f1abe401-d2d1-475c-aafd-deab86e2eab2">


   6. Are renovated homes priced higher than non-renovated ones?
      
<img width="487" alt="Six" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/f93f5087-3cfb-4c59-b129-eb554eaeffc4">

   7. Is there a difference in prices between waterfront and non-waterfront properties?
      
<img width="509" alt="Eight" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/7ff7c1ba-bf99-4552-a2cc-ca03060ded27">

   8. How has the average home price changed over the months?
       
<img width="1031" alt="Nine" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/74b761fa-79a7-40d7-92be-be2c6e561cde">

   9. What cities have the highest average home prices?
       
<img width="535" alt="Ten" src="https://github.com/BladNunez/DataAnalysis/assets/76759742/a7735ad2-695c-4ef8-b8bf-d0b8cf2c3e00">


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
   `select round(avg(price),2) as renovated_home, (select round(avg(price),2) from homes where yr_renovated = 0) as
   non_renovated_home from homes where yr_renovated != 0;`


## Challenges

   One challenge I faced during the cleaning process was with the 'yr_renovated' column. Rows had the year that
   the home was renovated but also it contained zeroes and that indicated that the home was not renovated. For
   readability I wanted to change those zeroes to NULL to indicate to the users that the home was not renovated.
   I struggled to change those zeroes to the NULL value in excel during the cleaning process. I believe more
   studying into excel will help me find the answer.

   As for a solution during analysis with SQL and visualization with Tableau I filter out the the zeroes from the
   'yr_renovated' column when I am working with it so it is not interpreted that the home was renovated at year 0
   nor it impacts the analysis by distorting the results. 

