use LAPay;

# 1.Payroll Overview:
	#What is the total payroll expense for each year available in the dataset?
     select pay_year, sum(total_pay) as Total_Pay from payroll group by pay_year;
     
    #What is the distribution of total pay look across different employment types?
    select employees.employment_type, sum(payroll.total_pay) as TotalPayments
    from employees inner join payroll on 
    employees.record_nbr = payroll.record_nbr group by employment_type; 
    
    
# 2.MOU (Memorandum of Understanding) Analysis:
	# How many unique MOUs (MOU) are represented in the dataset?
    select distinct mou from mou order by mou;
    
# 3.Gender and Ethnicity:
	# What is the average total pay for male vs. female employees?
    select employees.gender, round(avg(payroll.total_pay),2) AVG_PAY from employees 
    inner join payroll on employees.record_nbr = payroll.record_nbr
    group by employees.gender order by round(avg(payroll.total_pay),2) desc;
    
# 4.Benefits and Contributions:
	# What is the average benefit pay (BENEFIT_PAY) across all employees?
    select round(avg(benefit_pay),2) as AVG_PAY from payroll; 
    
# 5.Overtime Analysis:
	# Which job title have the highest average overtime pay (OVERTIME_PAY)?
    select employees.job_title, round(avg(payroll.overtime_pay)) highestAvg_Overtimepay
    from employees inner join payroll on employees.record_nbr = payroll.record_nbr 
    group by employees.job_title order by round(avg(payroll.overtime_pay)) desc limit 1; 
    
# 6.Employment Status:
	# How many employees are in each job status (JOB_STATUS) category?
    select job_status , count(record_nbr) amountOfEmployees from employees group by job_status;
    
	# What is the average total pay for full-time vs. part-time employees?
    select employees.employment_type, round(avg(payroll.total_pay)) AvgTotalPay from 
    employees inner join payroll on employees.record_nbr = payroll.record_nbr group by employees.employment_type;
    
# 7.Employee Details:
	# Who are the top 10 highest-paid employees based on total pay?
    select distinct concat(employees.first_name, " " , employees.last_name) Name, payroll.total_pay,
    payroll.pay_year from employees inner join payroll on employees.record_nbr = payroll.record_nbr
    order by payroll.total_pay desc limit 10;
    
	# How many employees belong to each ETHNICITY category?
    select ethnicity, count(record_nbr) amountOfEmployees from employees group by ethnicity
    order by count(record_nbr) desc;
    
      
      
      
      
