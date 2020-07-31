-- Create a permanent table called normal that contains 
-- all property sales where the sale condition was Normal.
CREATE TABLE IF NOT EXISTS normal AS
	SELECT * 
	FROM houseprices
	WHERE houseprices.salecondition = 'Normal';
	
SELECT DISTINCT salecondition
FROM houseprices;

SELECT DISTINCT salecondition
FROM normal;
-- Drop the normal table you just created and then recreate 
-- it again using the name normal_sales.
DROP TABLE IF EXISTS normal;
SELECT * FROM normal;

CREATE TABLE IF NOT EXISTS normal_sales AS
	SELECT * 
	FROM houseprices
	WHERE houseprices.salecondition = 'Normal';
SELECT * FROM normal_sales;

-- From the newly-created normal_sales table, delete all the 
-- records where the neighborhood is Veenker.
DELETE FROM normal_sales
WHERE neighborhood = 'Veenker'

SELECT DISTINCT neighborhood FROM normal_sales
ORDER BY neighborhood DESC;

-- Re-insert the Veenker neighborhood normal sale condition records.
INSERT INTO normal_sales
SELECT * 
FROM houseprices
WHERE houseprices.salecondition = 'Normal'
	  AND neighborhood = 'Veenker'

SELECT DISTINCT neighborhood, salecondition FROM normal_sales
ORDER BY neighborhood DESC;

-- For all properties where the sale price was greater than $300,000, 
-- update the overall condition to be equal to the overall quality.
UPDATE normal_sales
SET overallcond = overallqual
WHERE saleprice > 300000;

SELECT DISTINCT overallcond
		       ,overallqual
FROM normal_sales
WHERE saleprice > 300000;

-- SELECT saleprice FROM normal_sales LIMIT 1

-- Using your choice of subquery, temp table, or CTE, 
-- calculate average sale prices by neighborhood and 
-- then compute what percentage more or less every property 
-- sold for compared to the average for their neighborhood.


-- calculate average sale prices by neighborhood
SELECT neighborhood
	   ,ROUND(AVG(saleprice),2) avg_sale_price
FROM normal_sales
GROUP BY neighborhood;

-- compute what percentage more or less every property 
-- sold for compared to the average for their neighborhood
WITH neigh_sale_avg AS (
SELECT neighborhood nbh
	   ,ROUND(AVG(saleprice),2) avg_sale_price
FROM normal_sales
GROUP BY neighborhood)

SELECT normal_sales.id,
	   normal_sales.saleprice,
	   neigh_sale_avg.avg_sale_price,
	   normal_sales.neighborhood,
	   neigh_sale_avg.nbh,
	   ROUND((saleprice / avg_sale_price), 2) percent_avg_price	 
FROM normal_sales
JOIN neigh_sale_avg ON normal_sales.neighborhood = neigh_sale_avg.nbh


-- SELECT neighborhood, saleprice FROM normal_sales LIMIT 10







