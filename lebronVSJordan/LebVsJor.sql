use JordanLebron;
SET SQL_SAFE_UPDATES = 0;

########################## Data Cleaning #############################
-- Remove Uneeded Information in all tables, Replace values with modified values for readability
UPDATE jordan_career SET age = SUBSTRING_INDEX(age,'-',1);
UPDATE jordan_career SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE jordan_career SET fgp = ROUND(fgp,2);
UPDATE jordan_career SET threep = 0 WHERE threeatt = 0;
UPDATE jordan_career SET ftp = ROUND(ftp,2);
UPDATE jordan_career SET threep = ROUND(threep,2);
UPDATE jordan_career
SET result = CASE
    WHEN TRIM(result) = 'W' THEN 'won'
    WHEN TRIM(result) = 'L' THEN 'lost'
    ELSE result  
END;

UPDATE jordan_playoffs SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE jordan_playoffs SET fgp = ROUND(fgp,2);
UPDATE jordan_playoffs SET ftp = ROUND(ftp,2);
UPDATE jordan_playoffs SET threep = 0 WHERE threeatt = 0;
UPDATE jordan_playoffs SET threep = ROUND(threep,2);
UPDATE jordan_playoffs
SET result = CASE
    WHEN TRIM(result) = 'W' THEN 'won'
    WHEN TRIM(result) = 'L' THEN 'lost'
    ELSE result  
END;

UPDATE lebron_career SET age = SUBSTRING_INDEX(age,'-',1);
UPDATE lebron_career SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE lebron_career SET fgp = ROUND(fgp,2);
UPDATE lebron_career SET ftp = ROUND(ftp,2);
UPDATE lebron_career SET threep = ROUND(threep,2);
UPDATE lebron_career
SET result = CASE
    WHEN TRIM(result) = 'W' THEN 'won'
    WHEN TRIM(result) = 'L' THEN 'lost'
    ELSE result 
END;

UPDATE lebron_playoffs SET result = SUBSTRING_INDEX(result, '(',1);
UPDATE lebron_playoffs SET fgp = ROUND(fgp,2);
UPDATE lebron_playoffs SET ftp = ROUND(ftp,2);
UPDATE lebron_playoffs SET threep = ROUND(threep,2);
UPDATE lebron_playoffs
SET result = CASE
    WHEN TRIM(result) = 'W' THEN 'won'
    WHEN TRIM(result) = 'L' THEN 'lost'
    ELSE result  
END;

############################### Feature Engineering ##############################

-- Add new column name to distinct each player in future queries if tables joined
ALTER TABLE jordan_career
ADD COLUMN player_name varchar(20);

ALTER TABLE jordan_playoffs
ADD COLUMN player_name varchar(20);

ALTER TABLE lebron_career
ADD COLUMN player_name varchar(20);

ALTER TABLE lebron_playoffs
ADD COLUMN player_name varchar(20);

UPDATE jordan_career
SET player_name = 'Micheal Jordan';

UPDATE jordan_playoffs
SET player_name = 'Micheal Jordan';

UPDATE lebron_career
SET player_name = 'Lebron James';

UPDATE lebron_playoffs
SET player_name = 'Lebron James';

-- Add new column season to segment each season in regular season for Jordan & Lebron
ALTER TABLE jordan_career
ADD COLUMN season int;

ALTER TABLE lebron_career
ADD COLUMN season int;

-- Add season for Jordans regular season
UPDATE jordan_career
SET season = 
CASE 
WHEN date BETWEEN '1984-10-26' AND '1985-04-13' THEN 1 
WHEN date BETWEEN '1985-10-25' AND '1986-04-13' THEN 2
WHEN date BETWEEN '1986-11-01' AND '1987-04-17' THEN 3
WHEN date BETWEEN '1987-11-07' AND '1988-04-24' THEN 4
WHEN date BETWEEN '1988-11-04' AND '1989-04-23' THEN 5
WHEN date BETWEEN '1989-11-03' AND '1990-04-22' THEN 6
WHEN date BETWEEN '1990-11-02' AND '1991-04-21' THEN 7
WHEN date BETWEEN '1991-11-01' AND '1992-04-19' THEN 8
WHEN date BETWEEN '1992-11-06' AND '1993-04-25' THEN 9
WHEN date BETWEEN '1995-03-19' AND '1995-04-23' THEN 10
WHEN date BETWEEN '1995-11-03' AND '1996-04-21' THEN 11
WHEN date BETWEEN '1996-11-01' AND '1997-04-19' THEN 12
WHEN date BETWEEN '1997-10-31' AND '1998-04-18' THEN 13
WHEN date BETWEEN '2001-10-30' AND '2002-03-31' THEN 14
WHEN date BETWEEN '2002-10-30' AND '2003-04-16' THEN 15
END;

-- Add season for Lebrons regular season games
UPDATE lebron_career
SET season = 
CASE 
WHEN date BETWEEN '2003-10-29' AND '2004-04-14' THEN 1 
WHEN date BETWEEN '2004-11-03' AND '2005-04-20' THEN 2
WHEN date BETWEEN '2005-11-02' AND '2006-04-12' THEN 3
WHEN date BETWEEN '2006-11-01' AND '2007-04-18' THEN 4
WHEN date BETWEEN '2007-10-31' AND '2008-04-14' THEN 5
WHEN date BETWEEN '2008-10-28' AND '2009-04-13' THEN 6
WHEN date BETWEEN '2009-10-27' AND '2010-04-06' THEN 7
WHEN date BETWEEN '2010-10-26' AND '2011-04-11' THEN 8
WHEN date BETWEEN '2011-12-30' AND '2012-04-22' THEN 9
WHEN date BETWEEN '2012-10-30' AND '2013-04-14' THEN 10
WHEN date BETWEEN '2013-10-29' AND '2014-04-12' THEN 11
WHEN date BETWEEN '2014-10-30' AND '2015-04-13' THEN 12
WHEN date BETWEEN '2015-10-27' AND '2016-04-11' THEN 13
WHEN date BETWEEN '2016-10-25' AND '2017-04-09' THEN 14
WHEN date BETWEEN '2017-10-17' AND '2018-04-11' THEN 15
WHEN date BETWEEN '2018-10-18' AND '2019-03-29' THEN 16
WHEN date BETWEEN '2019-10-22' AND '2020-08-13' THEN 17
END;

############# Data Analysis ###################
-- 1. How do their regular season per game and total stats compare? What about their playoff stats?
SELECT 'Lebron James Regular Season Stats' AS Player, 
ROUND(AVG(pts),2) AS avg_points, 
ROUND(AVG(three),2) AS avg_threes, 
ROUND(AVG(trb),2) AS avg_total_rebounds, 
ROUND(AVG(ast),2) AS avg_assists, 
ROUND(AVG(stl),2) AS avg_steals, 
ROUND(AVG(blk),2) AS avg_blocks
FROM lebron_career
UNION
SELECT 'Lebron James Playoffs Stats' AS Player, 
ROUND(AVG(pts),2) AS avg_points, 
ROUND(AVG(three),2) AS avg_threes, 
ROUND(AVG(trb),2) AS avg_total_rebounds, 
ROUND(AVG(ast),2) AS avg_assists, 
ROUND(AVG(stl),2) AS avg_steals, 
ROUND(AVG(blk),2) AS avg_blocks
FROM lebron_playoffs
UNION
SELECT 'Micheal Jordan Regular Season Stats' AS Player, 
ROUND(AVG(pts),2) AS avg_points, 
ROUND(AVG(three),2) AS avg_threes, 
ROUND(AVG(trb),2) AS avg_total_rebounds, 
ROUND(AVG(ast),2) AS avg_assists, 
ROUND(AVG(stl),2) AS avg_steals, 
ROUND(AVG(blk),2) AS avg_blocks
FROM jordan_career
UNION
SELECT 'Micheal Playoffs Stats' AS Player, 
ROUND(AVG(pts),2) AS avg_points, 
ROUND(AVG(three),2) AS avg_threes, 
ROUND(AVG(trb),2) AS avg_total_rebounds, 
ROUND(AVG(ast),2) AS avg_assists, 
ROUND(AVG(stl),2) AS avg_steals, 
ROUND(AVG(blk),2) AS avg_blocks
FROM jordan_playoffs;

-- -- -- -- -- -- - ------------------------------------------------------------------------------------- 
-- 2. At what age did each player have their highest scoring season?

-- Jordan
SELECT 'Micheal Jordan' AS Player,season, age, SUM(pts) AS Sum_Points_In_Season
FROM jordan_career 
GROUP BY season,age ORDER BY SUM(pts) DESC LIMIT 1;

-- Lebron
SELECT 'Lebron James' AS Player,season, age, SUM(pts) AS Sum_Points_In_Season
FROM lebron_career 
GROUP BY season,age ORDER BY SUM(pts) DESC LIMIT 1;

-- -- -- -- -- -- -- -- -- -------------------------------------------------------------------------------- 
-- 3. How have their win percentages trended by season? Who has a better win percentage in the playoffs?

-- Jordan 
SELECT season, (ROUND(SUM(CASE WHEN result = 'won' THEN 1 ELSE 0 END) / COUNT(*) * 100,2)) AS wins_percentage
FROM jordan_career
GROUP BY season; 

-- Jordan Playoffs
SELECT (ROUND(SUM(CASE WHEN result = 'won' THEN 1 ELSE 0 END) / COUNT(*) * 100,2)) AS wins_percentage
FROM jordan_playoffs;

-- Lebron
SELECT season, (ROUND(SUM(CASE WHEN result = 'won' THEN 1 ELSE 0 END) / COUNT(*) * 100,2)) AS wins_percentage
FROM lebron_career
GROUP BY season; 

-- Lebron Playoffs
SELECT (ROUND(SUM(CASE WHEN result = 'won' THEN 1 ELSE 0 END) / COUNT(*) * 100,2)) AS wins_percentage
FROM lebron_playoffs;

-- -- -- -- -- -- -- -- -- -------------------------------------------------------------------------------- 
