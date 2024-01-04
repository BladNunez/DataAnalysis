# Los Angeles City Payroll Analysis

## Project Overview
This data analysis project aims to provide insights into city employees salary in the city of Los Angeles from the years 2017-2023. These city employees are workers such as police officers, sanitary workers and the mayor of the city. We seek to identify trends in payroll from year to year , how many employees are active in the city as this would determine employment numbers to be positive or negative and we also want to gain deeper understanding of pay between diffrent professions to see what is a lucrative job in the city of Los Angeles. 

## Data Sources
Los Angeles City Payroll Data: The primary datset used for this analysis is the"City_Employee_PayRoll_.CSV" file, containing detailed information about all job titles and what department they are from, how much they get paid such as regular pay, overtime, any other pay and total amount. Their names, gender , race and the pay year that employee was paid is contained in this file.
Dataset from: https://www.kaggle.com/datasets/manjitbaishya001/los-angeles-city-payroll-dataset

## Tools
SQL - Data Analysis
Tableau - Creating Dashboard Reports

## Data Cleaning/Preparation
In the initial data preparation phase I performed the following tasks:

   1. Data loading and inspection
   2. Data has already been cleaned and formatted on initial loading phase from source

## Exploratory Data Analysis
EDA involved exploring the Payroll data to answer key questions such as:

    1. What is the total payroll expense for each year available in the dataset?
    2. What is the average total pay for male vs. female employees?
    3. How many employees are in each job status category?
    4. How many unique MOUs are represented in the data set
    5. What is the average benefit pay across all employees
    6. Which job title have the highest average overtime pay
    7. Who are the top 10 highest-paid employees based on total pay
    8. What is the average total pay for full-time and part-time employees
    
## Data Analysis
Here include some interesting code/ features worked with

## Results/Findings
From Exploratory data analysis section:

     1.
     2.
     3.
     4.
     5.
     6.
     7.
     8.

## Recommendations
Based on analysis we recommend the following actions:




## Limitations
I used MySQL workbench for my SQL analysis of this LA pay roll dataset. One limitation I faced was due to my CSV file containing 500,000 rows of data, MYSQL workbench was not able to import all 500,000 rows. I had to create a schema from scratch with new tables and a temporary table that contained the whole CSV file. This was done in the MySQL command line interface. I imported the CSV into my temp table with the load local infile command and then created my new tables from this temp table with the necassary columns needed for each table. From here I was able to conduct my SQL analysis in MySQL workbench with all rows of data imported into my schema. 



