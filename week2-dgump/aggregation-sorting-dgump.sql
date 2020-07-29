-- Using table: fueleconomy.public.vehicles
-- No context for these prompts :(  Straight to business.

-- How many records are in the vehicles table?

SELECT *
FROM vehicles;

-- How many records are there that use Diesel fuel?



-- How many non-NULL records are there in the cyl column?

SELECT COUNT(cyl)
FROM vehicles
WHERE cyl IS NOT Null;

-- Can you explain why the cyl column has NULLs?
SELECT *	
FROM vehicles
WHERE cyl IS null;


-- List the unique fuel types when cyl is NULL
SELECT DISTINCT fuel
FROM vehicles
WHERE cyl IS null;


-- Count the unique number of makes when cyl is NULL
SELECT COUNT(DISTINCT make)
FROM vehicles
WHERE cyl IS null;

-- What is the average hwy mpg? cty mpg?
SELECT ROUND(AVG(hwy),2), ROUND(AVG(cty),2)
FROM vehicles;


-- What brands make the most fuel efficient cars?
-- Include a count of the number of records for each make to get
-- additional perspective?

SELECT make
	   ,ROUND(AVG(hwy),2) AS avg_hwy
	   ,ROUND(AVG(cty),2) AS avg_cty
	   ,COUNT(*)
FROM vehicles
GROUP BY make
HAVING COUNT(*) > 1000
ORDER BY avg_hwy DESC, avg_cty DESC;

-- Redo the last analysis but with a minimum number of records for
-- a make to be elligible.  Let's say 1000 to be considered.
SELECT make
	   ,ROUND(AVG(hwy),2) AS avg_hwy
	   ,ROUND(AVG(cty),2) AS avg_cty
	   ,COUNT(*)
FROM vehicles
GROUP BY make
HAVING COUNT(*) > 1000
ORDER BY avg_hwy DESC, avg_cty DESC;


-- Redo the last analysis but only consider Regular fuel.
-- So our question were answering now.  Which large* makes produce
-- the most fuel efficient cars (where large is >1000 records)?

SELECT make
	   ,ROUND(AVG(hwy),2) AS avg_hwy
	   ,ROUND(AVG(cty),2) AS avg_cty
	   ,COUNT(*)
FROM vehicles
WHERE fuel = 'Regular'
GROUP BY make
HAVING COUNT(*) > 1000
ORDER BY avg_hwy DESC, avg_cty DESC;


-- What are the top 5 most fuel efficient cars that
-- have any type of four-wheel or all-wheel drive
SELECT model
	   ,make
	   ,year
	   ,ROUND(AVG(hwy),2) AS avg_hwy
	   ,ROUND(AVG(cty),2) AS avg_cty
	   ,COUNT(*)
FROM vehicles
WHERE fuel = 'Regular'
	  AND (drive LIKE '%4%' OR drive LIKE '%all%')
GROUP BY year, make, model
ORDER BY avg_hwy DESC, avg_cty DESC;

SELECT DISTINCT drive
FROM vehicles;

-- Create a report that shows the worst & best hwy mpg before 1990
-- and after 1990
SELECT
	 CASE
	 	WHEN year > 1990 THEN 'After 1990'
		WHEN year < 1990 THEN 'Before 1990'
		ELSE '1990'
	 END as year_label
	 ,MIN(hwy) AS worst_hwy
	 ,MAX(hwy) AS best_hwy
FROM vehicles
WHERE fuel != '%'
GROUP BY year_label;

