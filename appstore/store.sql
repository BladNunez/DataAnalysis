use applestore;

########## Data Cleaning ############

SET SQL_SAFE_UPDATES = 0;
SET SESSION sql_mode = 'ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET GLOBAL sql_mode = 'ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

# Remove Quotation marks around column names
SET @sql = NULL;
SELECT GROUP_CONCAT(CONCAT('CHANGE COLUMN `', column_name, '` `', REPLACE(column_name, '"', ''), '` ', data_type, ' ', IF(is_nullable = 'YES', 'NULL', 'NOT NULL'))) INTO @sql
FROM information_schema.columns
WHERE table_name = 'store'
AND table_schema = 'applestore';

SET @sql = CONCAT('ALTER TABLE store ', @sql);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

# Change names of columns
alter table store rename column `sup_devices.num` to sup_devices_num;
alter table store rename column `ipadSc_urls.num` to ipadSc_urls_num;
alter table store rename column `lang.num` to lang_sum;

# Change number columns into int or double
alter table store modify column price double;
alter table store modify column size_bytes bigint;
alter table store modify column rating_count_tot int;
alter table store modify column rating_count_ver int;
alter table store modify column user_rating double;
alter table store modify column user_rating_ver double;
alter table store modify column sup_devices_num int;
alter table store modify column lang_sum int;

# Drop columns not needed in analysis 
alter table store drop column ver;
alter table store drop column vpp_lic;
alter table store drop column cont_rating;
alter table store drop column ipadSc_urls_num;

# Clean the wording in track_name column

UPDATE store
SET track_name = SUBSTRING_INDEX(track_name, ' - ', 1);

UPDATE store
SET track_name = SUBSTRING_INDEX(track_name, ' : ', 1);

############################################################

####### Exploratory Data Analysis ########

# 1. What are the top-rated apps in terms of user ratings?
select track_name, user_rating from store order by user_rating desc limit 10;

# 2. How many apps are free vs. paid?
select count(price) as Paid_Apps, (select count(price) from store where price = 0) as Free_Apps
from store where price > 0;

# 3. What are the most popular app categories?
select prime_genre,rating_count_tot from store group by prime_genre order by rating_count_tot desc;

# 4. How does the average app rating vary across different categories?
select prime_genre, user_rating from store group by prime_genre order by user_rating desc;

# 5. What is the distribution of app sizes?
select min(size_bytes) as Smallest_App_Size, max(size_bytes) as Largest_App_Size from store; 

