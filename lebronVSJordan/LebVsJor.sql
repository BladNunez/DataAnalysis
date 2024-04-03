use JordanLebron;
SET SQL_SAFE_UPDATES = 0;

############ Data Cleaning ###############
-- Jordan Career Table
UPDATE jordan_career SET age = SUBSTRING_INDEX(age,'-',1);
UPDATE jordan_career SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE jordan_career SET fgp = ROUND(fgp,2);
UPDATE jordan_career SET threep = 0 WHERE threeatt = 0;
UPDATE jordan_career SET ftp = ROUND(ftp,2);
UPDATE jordan_career SET threep = ROUND(threep,2);

-- jordan playoffs table
UPDATE jordan_playoffs SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE jordan_playoffs SET fgp = ROUND(fgp,2);
UPDATE jordan_playoffs SET ftp = ROUND(ftp,2);
UPDATE jordan_playoffs SET threep = 0 WHERE threeatt = 0;
UPDATE jordan_playoffs SET threep = ROUND(threep,2);

-- lebron career table
UPDATE lebron_career SET age = SUBSTRING_INDEX(age,'-',1);
UPDATE lebron_career SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE lebron_career SET fgp = ROUND(fgp,2);
UPDATE lebron_career SET ftp = ROUND(ftp,2);
UPDATE lebron_career SET threep = ROUND(threep,2);

-- lebron playoffs table
UPDATE lebron_playoffs SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE lebron_playoffs SET fgp = ROUND(fgp,2);
UPDATE lebron_playoffs SET ftp = ROUND(ftp,2);
UPDATE lebron_playoffs SET threep = ROUND(threep,2);

############# Data Analysis ###################

-- 1. How do their regular season per game and total stats compare? What about their playoff stats?

-- 2. At what age did each player have their highest scoring season?

-- 3. How does their distribution of points scored per game compare?

-- 4.  How have their win percentages trended by season? Who has a better win percentage in the playoffs?

-- 5. How does the average game_score of LeBron James compare to that of Michael Jordan in the regular season and playoffs?

-- 6. What is the average plus_minus for LeBron James compared to Michael Jordan in the regular season and playoffs? 
