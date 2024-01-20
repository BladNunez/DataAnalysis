# La Liga Player Analysis

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
   

## Data Analysis

   select Player_Name, max(MOTM) from liga group by Player_Name order by max(MOTM) desc limit 5;

## Results/Findings
From Exploratory data analysis:

     1. Average age is 27.
     2. Player with most goals is Alexander Sorloth at 9 goals.
     3. Player with most assists is Antoine Griexmann at 8 assists.
     4. Aleix Garcia and others have the most appearences at 25 while Alvaro Gimenez and others have 0.
     5. Rober has the highest pass success at 95.8%.
     6. Teams that received most yellow and red cards
     
		      Max YC   Max RC
	Barcelona	5.0	1.0
	Athletic Bilbao	5.0	1.0
	Celta Vigo	6.0	1.0
	Almeria		6.0	1.0
	Real Betis	6.0	3.0
	Atletico	7.0	2.0
	Girona		7.0	1.0
	Sevilla		7.0	1.0
	Cadiz		7.0	3.0
	Real Madrid	8.0	1.0
	Real Sociedad	8.0	1.0
	Getafe		8.0	1.0
	Valencia	8.0	1.0
	Rayo Vallecano	8.0	1.0
	Mallorca	8.0	1.0
	Osasuna		8.0	1.0
	Espanyol	9.0	2.0
	Real Valladolid	9.0	1.0
	Villarreal	9.0	1.0
	Elche		9.0	2.0


     7. Player with the highest shots per game is Karim Benzema at 4.7%.
     8. Average aerial duels won per game across all players is 0.75%.
     
     9. Top 5 players with most man of match awards
     
	Robert Lewandowski	7.0
	Mikel Merino		5.0
	Antoine Griezmann	5.0
	Javi Galán		5.0
	David Soria		5.0


## Conclusion/Insights

From my findings about this dataset I find that even if a player has the highest attempts on the net they wont score the most goals. I also find that the average age in La Liga is relativley young at the age of 27. This would mean that most players here will be playing for another decade. During the 2022-2023 season there were 4 teams that were penalized the most and that was  Espanyol, Real Valladolid ,Villarreal and Elche. I also found that there were many players who did not play this season but due to the average age of players in the league being young I predict they will see playing time in the following seasons. 
