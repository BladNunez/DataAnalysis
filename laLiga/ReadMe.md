# La Liga Player Analysis

![Dashboard 1](https://github.com/BladNunez/DataAnalysis/assets/76759742/c24476f7-7753-4972-b3f4-7b57100a0d3d)



Link to interactive dashboard: https://public.tableau.com/app/profile/bladimir.nunez/viz/LaLigaAnalysis_17058101723470/Dashboard1



## Project Overview
This project consists of La Liga player statistics for the 2022-2023 season. With this dataset I am able to gain insights on player performance during the 2022-2023 La Liga season such as who scored the most goals and obtained the most assists. In this project I was able to compare and analyze player performance across the
league.

## Data Sources
My dataset comes from the Kaggle website here: https://www.kaggle.com/datasets/rayhan32/la-liga-player-status-season-2022-2023 . The dataset was downloaded from here and is contained in the 'laliga.csv' file. This file contains all information about the players such as name, affiliated team, goals, assists, etc. 

## Tools
SQL - Data Analysis

Tableau - Dashboard Reports


## Data cleaning/Preparation
In the initial data preparation phase I performed the following tasks:

1. Data loading and inspection
2. Data already clean from source

## Exploratory Data Analysis
   1. What is the average age of players in the dataset?
   2. Which player scored the highest number of goals?
   3. Which player has the highest number of assists?
   4. What is the average number of appearances (App) per player?
   5. Which player has the highest pass success percentage (PS%)?
   6. Teams that received the most yellow cards (YC) and red cards (RC)?
   7. Which player has the highest shots per game (SPG) average?
   8. What is the average number of aerial duels won per game (AW) across all players?
   9. 'Man of the Match' (MOTM) top 5 most awarded players?
   10. Top 5 players who played the most minutes
   

## Data Analysis

   	select Player_Name, max(MOTM) from liga group by Player_Name order by max(MOTM) desc limit 5;

## Results/Findings
From Exploratory data analysis:

     1. Average age is 27.
     2. Player with most goals is Robert Lewandowski at 15 goals.
     3. Player with most assists is Antoine Griezmann at 8 assists.
     4. Aleix Garcia and others have the most appearences at 25 while Alvaro Gimenez and others have 0.
     5. There are 21 players with a pass success rate of 100. 

      	Umar Sadiq		100
	Álvaro Odriozola	100
	Malcom Adu		100
	Pierre-Emerick Aubameyang 100
	Sergio Arribas		100
	Carlos Martín		100
	Moi Parra		100
	Iker Muñoz		100
	Nabili Zoubdi Touaizi	100
	Javi Llabrés		100
	Fran Delgado		100
	Ángel Alarcón		100
	Pablo Muñoz		100
	Chadi Riad		100
	Pedro Ortiz		100
	Diego López		100
	Fernando Niño		100
	Alejandro Alfaro 	100
	Roger Martínez		100
	Carlos Álvarez		100
	Álvaro Giménez		100

     6. Teams that received most yellow and red cards
     
		      Max YC   Max RC
	Barcelona	5	1
	Athletic Bilbao	5	1
	Celta Vigo	6	1
	Almeria		6	1
	Real Betis	6	3
	Atletico	7	2
	Girona		7	1
	Sevilla		7	1
	Cadiz		7	3
	Real Madrid	8	1
	Real Sociedad	8	1
	Getafe		8	1
	Valencia	8	1
	Rayo Vallecano	8	1
	Mallorca	8	1
	Osasuna		8	1
	Espanyol	9	2
	Real Valladolid	9	1
	Elche		9	2
	Villarreal	10	1


     7. Player with the highest shots per game is Karim Benzema at 4.7%.
     8. Average aerial duels won per game across all players is 0.75%.
     
     9. Top 5 players with most man of match awards
     
	Robert Lewandowski	7.0
	Mikel Merino		5.0
	Antoine Griezmann	5.0
	Javi Galán		5.0
	David Soria		5.0

     10. Top 5 players who played most minutes 

	     Team            Player                  Mins Played 
     	Mallorca	Predrag Rajkovic	2250
	Barcelona	Marc-André ter Stegen	2250
	Cadiz		Jeremías Ledesma	2250
	Elche		Edgar Badia		2250
	Valencia	Giorgi Mamardashvili	2250


## Conclusion/Insights

Some insights I gained from this dataset is that even if players play the max amount of minutes every game that does not dictate weather they will have a lot of goals, assists or even man of the match awards. None of the players that had the most goals or man of the match awards played the most minutes. Another insight I gained was that even if a player such as Karim Benzema having the highest amount of shots on goal that does not guarantee that player will obtain the most goals. To win the man of the match award scoring goals and accumalating many assists help your chances to win the award tremoundously. For example Robert Lewandowski finished the season with 15 goals and he received 7 man of the match awards as well as the La Liga season leader in assists Antoine Griezmann having 8 assists. The more of these two factors players have the more man of the match awards they can receive.   
