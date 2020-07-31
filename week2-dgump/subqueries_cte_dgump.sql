-- Using the fueleconomy database

-- Subqueries!!
-- Find the average highway mileage for all records of 
-- whatever make produces the model 'A4'.
SELECT * FROM vehicles LIMIT 5
-- Part 1 of answering this question: 
-- Who makes 'A4'?
SELECT DISTINCT make, model
FROM vehicles
WHERE model LIKE '%A4%'

-- Part 2: filter


-- A subquery can allow us to do both of this parts
-- at once.



-- Subqueries are not limited to the WHERE clause
-- Say we want to compare each car to the average 
-- hwy mpg. Write a query to grab the model, hwy, 
-- and a column showing how far above/below the car's
-- hwy is from average.



-- Perform the same task as above, but instead
-- of comparing to the overall average hwy, compare
-- to the average for the current records make.
-- (i.e. a bmw row in the output should be compared to
-- to the average bmw hwy mpg)



-- Write a query to only select records with 
-- above average hwy.


			 
-- Let's switch focus to makes.  Show the average
-- hwy mpg by make, but only show makes who have
-- average hwy mpg greater than the average hwy
-- mpg in the vehicles table.

 -- rewrite as cte
 WITH avg_hwy AS (
 	SELECT ROUND(AVG(hwy),2)
	 FROM vehicles
)



-- Using SQL and the vehicles table from the fueleconomy database, do the following:
-- Find the average of minimum highway mileages for records when grouped by make.
-- what... lets unpack it
-- Find the min hwy mileage per make and then take the average of it

-- Let's use a CTE for this
WITH min_make_hwy AS (
	 SELECT make,
			MIN(hwy) as min_hwy
		FROM vehicles
		GROUP BY make)
SELECT ROUND(AVG(min_hwy),2)
FROM min_make_hwy
