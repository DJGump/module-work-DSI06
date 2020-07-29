SELECT 
	ROUND(fixed_acidity + volatile_acidity + citric_acid, 3),
	ROUND((total_sulfur_dioxide - free_sulfur_dioxide) / total_sulfur_dioxide, 3),
	ROUND(log(((residual_sugar * alcohol) ^ 4.0)), 4),
	ROUND((ROUND(chlorides::DECIMAL, 2) * total_sulfur_dioxide) ^ (1.0/3.0), 2)
FROM winequality_red;

-- SELECT
-- 	(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3)) - MIN((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3)))
-- 	/ (MAX(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3))) -
-- 	MIN(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3))))
-- FROM winequality_red
-- GROUP BY quality;


	

--
-- SELECT 
-- 	((alcohol - MIN(alcohol)) / (NULLIF(MAX(alcohol), 1) - NULLIF(MIN(alcohol), 0))) AS diff
-- FROM winequality_red;

--
SELECT alcohol,
	(SELECT MAX(alcohol) AS max_al
			   FROM winequality_red),
	(SELECT MAX(quality) AS max_qual
	 		   FROM winequality_red),
	(SELECT MAX(residual_sugar) as max_sugar
	 		   FROM winequality_red),
	(SELECT MIN(alcohol) AS min_al
			   FROM winequality_red),
	(SELECT MIN(quality) AS min_qual
	 		   FROM winequality_red),
	(SELECT MIN(residual_sugar) as min_sugar
	 		   FROM winequality_red),
	(alcohol - (SELECT MIN(alcohol) AS min_al
			   FROM winequality_red))  AS norm_al
		

FROM winequality_red;

SELECT *
FROM winequality_red;