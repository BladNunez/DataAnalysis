use Titanic;
# 1.Count the number of passengers in each passenger class (Pclass).
select Pclass as Class, count(PassengerID) as Num_of_passengers from passengers group by Pclass order by Pclass asc;

# 2.Retrieve the names of passengers who paid more than 100 units as fare.
select Name from passengers where Fare > 100;

# 3.Find the average age of passengers on board.
select round(avg(Age),2) as Avg_Age from passengers; 

# 4.Determine the number of passengers who survived vs. those who didn't.
select Survived, count(PassengerID) as num_of_passengers from survival group by Survived order by count(PassengerID) desc;

# 5.List the names of passengers who were in third class (Pclass=3) and survived.
select passengers.Name, survival.Survived as Survived from passengers left join survival
on passengers.PassengerID = survival.PassengerID where Pclass = 3 and Survived = 1;

# 6.Calculate the average fare paid by passengers in each passenger class.
select Pclass as Class, round(avg(Fare),2) as Avg_Fare from passengers group by Pclass order by avg(Fare) desc;

# 7.Retrieve the names of passengers who were between 20 and 30 years old and did not survive.
select passengers.name , survival.Survived from passengers left join survival on 
passengers.PassengerID = survival.PassengerID where Age between 20 and 30 and Survived = 0;

# 8.Find out how many passengers traveled alone (i.e., they didn’t have any siblings or spouse onboard).
select count(PassengerID) as Passengers_traveled_alone from passengers where SibSp = 0;

# 9.Identify the top 5 oldest passengers on board.
Select Name as Oldest_Passengers, Age from passengers order by AGE desc limit 5;


