SELECT *
FROM ksprojects;

SELECT COUNT(DISTINCT(country))
FROM ksprojects;

SELECT main_category, ROUND(AVG(backers)) AS avg_backers
FROM ksprojects
GROUP BY main_category
ORDER BY avg_backers DESC;

SELECT category, COUNT(state) AS count_success, AVG(goal - usd_pledged) AS avg_surplus
FROM ksprojects
WHERE state = 'successful'
GROUP BY category
ORDER BY avg_surplus DESC;

SELECT main_category, COUNT(*)
FROM ksprojects
WHERE backers BETWEEN 5 AND 10
	AND state = 'successful'
GROUP BY main_category;

SELECT main_category, SUM(backers) as total_backers
FROM ksprojects
WHERE state = 'successful' AND
	  backers > 100000 AND
	  main_category NOT IN ('Games', 'Technology')
GROUP BY main_category;	  
	  