SELECT *
FROM ksprojects;

-- How many distinct values are there in the "country" field?
SELECT COUNT(DISTINCT(country))
FROM ksprojects;

-- Write a query that returns the average number of backers per main_category, 
-- rounded to the nearest whole number and sorted from high to low. What is 
-- the numerical value of the first row in the returned dataset?
SELECT main_category, ROUND(AVG(backers)) AS avg_backers
FROM ksprojects
GROUP BY main_category
ORDER BY avg_backers DESC;

-- Write a query that shows, for each category, how many campaigns were 
-- successful and the average difference per project between dollars pledged 
-- and the goal for successful campaigns in that category. Which category 
-- raised the most (pledged) above and beyond its goal amount?

SELECT category, COUNT(*) AS count_success, AVG(usd_pledged - goal) AS avg_surplus
FROM ksprojects
WHERE state = 'successful'
GROUP BY category
ORDER BY avg_surplus DESC;


-- Write a query that shows, for each main_category, how many successful projects 
-- had between 5 and 10 backers. How many "Publishing" projects meet this criteria? 
SELECT main_category, COUNT(*)
FROM ksprojects
WHERE backers BETWEEN 5 AND 10
	AND state = 'successful'
GROUP BY main_category;

-- Excluding Games and Technology records in the main_category field, 
-- return the total of all backers for successful projects by main_category 
-- where the total number of backers was over 100,000.  Sort by main_category 
-- from A-Z. How many backers does the first record have?
SELECT main_category, SUM(backers) as total_backers
FROM ksprojects
WHERE state = 'successful' AND
	  main_category NOT IN ('Games', 'Technology')
GROUP BY main_category
HAVING SUM(backers) > 100000;	  
	  