use LaLiga;

alter table liga modify column Goals int;
alter table liga modify column Age int;
alter table liga modify column Assist int;
alter table liga modify column YC int;
alter table liga modify column RC int;
alter table liga modify column SPG float;
alter table liga modify column `PS%` float;
alter table liga modify column AW float;
alter table liga modify column MOTM int;
alter table liga modify column Rating float;
alter table liga modify column MinP int;

# 1. What is the average age of players in the dataset?
select round(avg(Age)) as AVG_AGE from liga;

# 2. Which player scored the highest number of goals?
select Player_Name, Goals from liga order by Goals Desc limit 1;

# 3. Which player has the highest number of assists?
select Player_Name, Assist as most_assists from liga where Assist = (select max(Assist) from liga);

# 4. What is the average number of appearances (App) per player?
select Player_Name, avg(App) from liga group by Player_Name order by avg(App) desc;

# 5. Which player has the highest pass success percentage (PS%)?
select Player_Name, `PS%` as highest_pass_success from liga where `PS%` = (select max(`PS%`) from liga);

# 6. Teams that received the most yellow cards (YC) and red cards (RC)?
select Team_Name, max(YC) as max_yellowc, max(RC) as max_redc from liga group by Team_Name order by max(YC);

# 7. Which player has the highest shots per game (SPG) average?
select Player_Name, SPG from liga where SPG = (select max(SPG) from liga);

# 8. What is the average number of aerial duels won per game (AW) across all players?
select round(avg(AW),2) as avg_aerial_duel_wins from liga;

# 9. 'Man of the Match' (MOTM) top 5 most awarded players?
select Player_Name, max(MOTM) from liga group by Player_Name order by max(MOTM) desc limit 5;

# 10. Top 5 players who played the most minutes
select Team_Name, Player_Name, MinP from liga order by MinP desc limit 5;

