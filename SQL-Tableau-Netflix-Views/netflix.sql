use NetflixEngagment;

# 1.Find titles of shows that were released between January 1, 2023, and June 30, 2023.
select Title from netflix where ReleaseDate between '2023-01-01' and '2023-06-30';

# 2.List genres with the total hours viewed in descending order.
select Genre, sum(HoursViewed) as Total_Hours from netflix group by Genre order by sum(HoursViewed) desc; 

# 3.Retrieve titles with a rating above 4.5 and more than 10,000 ratings.
select Title, Rating from netflix where Rating > 4.5 and NumberofRatings > 10000;

# 4.Find the average rating for each genre.
select Genre, round(avg(Rating),2) as Avg_Rating from netflix group by Genre;

# 5.List shows where the description contains the word 'drama'.
select Title, Description from netflix where Description like '%drama%';

# 6.Retrieve titles that are available globally and have been viewed for more than 100 hours.
select Title from netflix where AvailableGlobally = 'YES' and HoursViewed > 100;

# 7.Find the genre with the highest number of ratings.
select Genre, NumberofRatings as Most_Ratings  from netflix 
where NumberofRatings = (select max(NumberofRatings) from netflix);

# 8.Find the total number of ratings and hours viewed for each genre.
select Genre , count(Rating) as Total_Ratings, sum(HoursViewed) as Total_Hours 
from netflix group by Genre order by count(Rating) desc; 

# 9.Retrieve shows released in 2023 with a rating below 3.0.
select Title, ReleaseDate, Rating, case when Rating = '' then 'No Rating' end as If_Rating
from netflix where Rating < 3 and ReleaseDate between '2023-01-01' and '2023-12-31'
order by ReleaseDate;

# 10.List titles where keywords contain 'action' and 'adventure'.
select Title, KeyWords from netflix where KeyWords like '%action%' and KeyWords like '%adventure%';
 

