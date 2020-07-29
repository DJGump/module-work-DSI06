-- Count the number of records in the vehicles table.
SELECT COUNT(*)
FROM vehicles; 

-- Count the number of distinct values there are in the make field.
SELECT COUNT(DISTINCT make)
FROM vehicles;

-- Obtain the averages of the hwy and cty fields.
SELECT ROUND(AVG(hwy),2) as hwy_avg,
	   ROUND(AVG(cty),2) as cty_avg
FROM vehicles;

-- Group by make and model, obtain the averages of the hwy and cty fields.
SELECT ROUND(AVG(hwy),2) as hwy_avg,
	   ROUND(AVG(cty),2) as cty_avg
FROM vehicles

-- Group the data by make, average the hwy and cty columns into a combined_mpg 
-- field, calculate the average of that field, and then sort descending by the 
-- combined_mpg field.
SELECT AVG((hwy + cty) / 2) AS comb_mpg
	   ,make
FROM vehicles
GROUP BY make
ORDER BY comb_mpg DESC;

-- 
SELECT COUNT(*)
	   ,AVG(cty)
	   ,trans
	   ,drive
FROM vehicles
WHERE cyl > 4 AND displ > 2.5
GROUP BY TRANS, DRIVE
HAVING AVG(cty) > 18;


