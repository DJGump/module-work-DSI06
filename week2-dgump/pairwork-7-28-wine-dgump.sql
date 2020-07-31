SELECT 
	ROUND(fixed_acidity + volatile_acidity + citric_acid, 3),
	ROUND((total_sulfur_dioxide - free_sulfur_dioxide) / total_sulfur_dioxide, 3),
	ROUND(log(((residual_sugar * alcohol) ^ 4.0)), 4),
	ROUND((ROUND(chlorides::DECIMAL, 2) * total_sulfur_dioxide) ^ (1.0/3.0), 2)
FROM winequality_red;

-- this is not so simple:
-- SELECT
-- 	(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3)) - MIN((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3)))
-- 	/ (MAX(
((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3))) -
-- 	MIN(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3))))
-- FROM winequality_red
-- GROUP BY quality;
-- -----------------
-- min and max aggregate, but if you use them in a subquery, that single number is cast for fields in the main query (casting may not be the right word.)
-- therefore, to make a new column with a formula using min and max values, you will have to put the subqueries into the math expressions
-- Formatting is questionable. 


-- (x - xmin) / (xmax - xmin)
-- x = ((alcohol*0.4 + quality*0.3 + residual_sugar*0.3) / 3) 
-- xmin = ((MINalcohol*0.4 + MINquality*0.3 + MINresidual_sugar*0.3) / 3)
-- xmax = ((MAXalcohol*0.4 + MAXquality*0.3 + MAXresidual_sugar*0.3) / 3)

-- (((alcohol*0.4 + quality*0.3 + residual_sugar*0.3) / 3)  -  (((SELECT MIN(alcohol) AS min_alC FROM winequality_red)*0.4 + (SELECT MIN(quality) AS min_qual FROM winequality_red)*0.3 + (SELECT MIN(residual_sugar) AS min_sug FROM winequality_red)*0.3) / 3)) 
-- 	/ ( (((SELECT MAX(alcohol) AS max_alC FROM winequality_red)*0.4 + (SELECT MAX(quality) AS max_qual FROM winequality_red)*0.3 + (SELECT MAX(residual_sugar) AS max_sug FROM winequality_red)*0.3) / 3) - (((SELECT MIN(alcohol) AS min_alC FROM winequality_red)*0.4 + (SELECT MIN(quality) AS min_qual FROM winequality_red)*0.3 + (SELECT MIN(residual_sugar) AS min_sug FROM winequality_red)*0.3) / 3) )    
-- SELECT quality
	   


-- the nessecary sub queries 
-- 	(SELECT MAX(alcohol) AS max_al
-- 			   FROM winequality_red),
-- 	(SELECT MAX(quality) AS max_qual
-- 	 		   FROM winequality_red),
-- 	(SELECT MAX(residual_sugar) as max_sugar
-- 	 		   FROM winequality_red),
-- 	(SELECT MIN(alcohol) AS min_al
-- 			   FROM winequality_red),
-- 	(SELECT MIN(quality) AS min_qual
-- 	 		   FROM winequality_red),
-- 	(SELECT MIN(residual_sugar) as min_sugar
-- 	 		   FROM winequality_red),
-- 	(alcohol - (SELECT MIN(alcohol) AS min_al
-- 			   FROM winequality_red))  AS norm_al

-- importaant note: this created metric is a normalized weighted average, multiplied by ten. the weighted average isn't really menaingful, as the units 
-- of the three features are all different. This was more of an aggregation and subquery solution than math operations practice. oh well. it works. 

SELECT quality, alcohol, residual_sugar,
	10 * ((((alcohol*0.4 + quality*0.3 + residual_sugar*0.3) / 3)  -  (((SELECT MIN(alcohol) AS min_alC FROM winequality_red)*0.4 + (SELECT MIN(quality) AS min_qual FROM winequality_red)*0.3 + (SELECT MIN(residual_sugar) AS min_sug FROM winequality_red)*0.3) / 3)) 
	/ ( (((SELECT MAX(alcohol) AS max_alC FROM winequality_red)*0.4 + (SELECT MAX(quality) AS max_qual FROM winequality_red)*0.3 + (SELECT MAX(residual_sugar) AS max_sug FROM winequality_red)*0.3) / 3) - (((SELECT MIN(alcohol) AS min_alC FROM winequality_red)*0.4 + (SELECT MIN(quality) AS min_qual FROM winequality_red)*0.3 + (SELECT MIN(residual_sugar) AS min_sug FROM winequality_red)*0.3) / 3) ))
	AS metric
FROM winequality_red
ORDER BY metric ASC;

SELECT *
FROM winequality_red;