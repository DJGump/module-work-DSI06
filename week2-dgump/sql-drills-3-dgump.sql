-- Dillan Gump
-- DSI06
-- SQL Drills 3

-- 1. See schema in Google Drive

--2. Write a query that returns the namefirst and namelast fields of 
-- the people table, along with the inducted field from the hof_inducted 
-- table. All rows from the people table should be returned, and NULL 
-- values for the fields from hof_inducted should be returned when there 
-- is no match found.
SELECT namefirst
	  ,namelast
	  ,inducted
FROM people
	LEFT JOIN hof_inducted
	ON people.playerid = hof_inducted.playerid
	
-- 3. In 2006, a special Baseball Hall of Fame induction was conducted for players 
-- from the negro baseball leagues of the 20th century. In that induction, 17 players 
-- were posthumously inducted into the Baseball Hall of Fame. Write a query that returns 
-- the first and last names, birth and death dates, and birth countries for these players. 
-- Note that the year of induction was 2006, and the value for votedby will be “Negro League.”
SELECT namefirst, namelast, birthyear, deathyear, hof.yearid, birthcountry
FROM people p
JOIN hof_inducted hof
ON p.playerid = hof.playerid
WHERE hof.votedby = 'Negro League'
	  AND hof.yearid = 2006;
	  
-- 4. Write a query that returns the yearid, playerid, teamid, and salary fields from the salaries 
-- table, along with the category field from the hof_inducted table. Keep only the records that are 
-- in both salaries and hof_inducted. Hint: While a field named yearid is found in both tables, don’t 
-- JOIN by it. You must, however, explicitly name which field to include.
SELECT s.yearid, s.playerid, s.teamid, s.salary, hof.category
FROM salaries s
JOIN hof_inducted hof
ON s.playerid = hof.playerid;

-- 5. Write a query that returns the playerid, yearid, teamid, lgid, and salary fields from the salaries 
-- table and the inducted field from the hof_inducted table. Keep all records from both tables.
SELECT s.playerid, s.yearid, s.teamid, s.lgid, s.salary, hof.inducted
FROM salaries s
FULL OUTER JOIN hof_inducted hof
ON s.playerid = hof.playerid

-- ***6. There are 2 tables, hof_inducted and hof_not_inducted, indicating successful 
-- and unsuccessful inductions into the Baseball Hall of Fame, respectively.
-- 6.1 Combine these 2 tables by all fields. Keep all records.
SELECT *
FROM hof_inducted hof
FULL OUTER JOIN hof_not_inducted nof
ON hof.* = nof.*

-- Get a distinct list of all player IDs for players who have been put up for HOF induction.
WITH all_hof AS (
SELECT hof.playerid in_id, nof.playerid not_id, hof.inducted, nof.inducted not_ind
FROM hof_inducted hof
FULL OUTER JOIN hof_not_inducted nof
ON hof.playerid = nof.playerid)

-- SELECT DISTINCT playerid
-- FROM all_hof

SELECT DISTINCT playerid	 
FROM all_hof


-- 7. Write a query that returns the last name, first name 
-- (see people table), and total recorded salaries for all 
-- players found in the salaries table.
SELECT p.namefirst || ' ' || p.namelast AS person
	   ,SUM(s.salary)
FROM people p
JOIN salaries s
ON p.playerid = s.playerid
GROUP BY person
-- SELECT
-- 	namelast,
-- 	namefirst,
-- 	SUM(salary) AS total_salary
-- FROM salaries AS s
-- INNER JOIN people AS p
-- ON s.playerid = p.playerid
-- GROUP BY p.playerid, namelast, namefirst;

-- 8. Write a query that returns all records from the 
-- hof_inducted and hof_not_inducted tables that include 
-- playerid, yearid, namefirst, and namelast. 
-- Hint: Each FROM statement will include a LEFT OUTER JOIN!
SELECT hof.playerid, yearid, namefirst, namelast
FROM hof_inducted hof
LEFT OUTER JOIN people p
ON p.playerid = hof.playerid
UNION ALL
SELECT nof.playerid, yearid, namefirst, namelast
FROM hof_not_inducted nof
LEFT OUTER JOIN people p
ON p.playerid = nof.playerid

-- 9. Return a table including all records from both 
-- hof_inducted and hof_not_inducted, and include a 
-- new field, namefull, which is formatted as namelast,
-- namefirst (in other words, the last name, followed by a comma, then a space, 
-- then the first name). The query should also return the yearid and 
-- inducted fields. Include only records since 1980 from both tables.
-- Sort the resulting table by yearid, then inducted so that Y comes before N. 
-- Finally, sort by the namefull field, A to Z.
SELECT concat(namelast,', ', namefirst) AS namefull,
	   yearid, 
	   inducted
FROM hof_inducted hof
LEFT OUTER JOIN people p
ON p.playerid = hof.playerid
WHERE yearid >= 1980
UNION ALL
SELECT concat(namelast,', ', namefirst) AS namefull,
	   yearid,
	   inducted
FROM hof_not_inducted nof
LEFT OUTER JOIN people p
ON p.playerid = nof.playerid
WHERE yearid >= 1980

ORDER BY yearid, inducted DESC, namefull

-- 10. Write a query that returns each year's highest annual salary for 
-- each teamid, ranked from high to low, along with the corresponding 
-- playerid. Bonus! Return namelast and namefirst in the resulting 
-- table. (You can find these in the people table.)
WITH max AS (
	SELECT MAX(salary)max_sal, teamid, yearid
	FROM salaries
	GROUP BY teamid, yearid
	ORDER BY teamid, yearid)


SELECT s.yearid, s.teamid, playerid, m.max_sal
FROM max m
LEFT OUTER JOIN salaries s
ON s.teamid = m.teamid AND s.yearid = m.yearid AND s.salary = m.max_sal
ORDER BY m.max_sal DESC

-- 11. Select birthyear, deathyear, namefirst, and namelast of all the players 
-- born since the birth year of Babe Ruth (playerid = ruthba01). Sort the results 
-- by birth year from low to high.
SELECT birthyear, deathyear, namefirst, namelast
FROM people
WHERE birthyear > ANY
	(SELECT	birthyear
	FROM people
	WHERE playerid = 'ruthba01')
ORDER BY birthyear;

-- 12. Using the people table, write a query that returns namefirst, namelast, 
-- and a field called usaborn. The usaborn field should show the following: if 
-- the player's birthcountry is the USA, then the record is 'USA.' Otherwise, 
-- it's 'non-USA.' Order the results by 'non-USA' records first.
SELECT namefirst, namelast, 
	CASE
		WHEN birthcountry = 'USA' THEN 'USA'
		ELSE 'non-USA'
	END AS usaborn
FROM people
ORDER BY usaborn ASC;

-- 13. Calculate the average height for players throwing with their right hand 
-- versus their left hand. Name these fields right_height and left_height, respectively.
SELECT
AVG(CASE WHEN throws = 'R' THEN height END) AS right_height,
AVG(CASE WHEN throws = 'L' THEN height END) AS left_height
FROM people;

-- 14. Get the average of each team's maximum player salary since 2010. 
-- Hint: WHERE will go outside your CTE.
WITH max_sal_by_team_by_year AS
(
SELECT teamid, yearid, MAX(salary) AS max_sal
FROM salaries
GROUP BY teamid, yearid
)
SELECT teamid, AVG(max_sal) AS avg_max_sal_since_2010
FROM max_sal_by_team_by_year
WHERE yearid >= 2010
GROUP BY teamid;



