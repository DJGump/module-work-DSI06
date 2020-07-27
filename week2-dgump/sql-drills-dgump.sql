SELECT * FROM vehicles;

SELECT COUNT(*) FROM vehicles
WHERE year BETWEEN 2010 AND 2015;

SELECT COUNT(*) FROM vehicles
WHERE (year BETWEEN 1987 AND 2005)
	AND year != 1990
	AND year != 2000;
	
SELECT make, model, (hwy + cty) / 2 as average_mpg
FROM vehicles;

SELECT year, make, model, CONCAT(hwy, ' highway; ', cty, ' city.') AS mpg_info
FROM vehicles;

SELECT year, make, model, hwy || ' highway; ' || cty || ' city.' AS mpg_info
FROM vehicles;

-- SELECT year, make, model, hwy & ' highway; ' & cty & ' city.' AS mpg_info
-- FROM vehicles;

SELECT year, make, model, JOIN(hwy, ' highway; ', cty, ' city.') AS mpg_info
FROM vehicles;

SELECT COUNT(*) 
FROM vehicles
WHERE (make ILIKE 'ford' or make ILIKE 'Chevrolet')
	AND (class ILIKE 'compact cars' or class ILIKE 'Two Seaters');
	
SELECT *
FROM vehicles
WHERE model LIKE 'X%'
ORDER BY make ASC;

SELECT *
FROM vehicles
WHERE model LIKE '__X%';
	