SELECT 
	ROUND(fixed_acidity + volatile_acidity + citric_acid, 3),
	ROUND((total_sulfur_dioxide - free_sulfur_dioxide) / total_sulfur_dioxide, 3),
	ROUND(log(((residual_sugar * alcohol) ^ 4.0)), 4),
	ROUND((ROUND(chlorides::DECIMAL, 2) * total_sulfur_dioxide) ^ (1.0/3.0), 2)
FROM winequality_red;

-- SELECT
-- 	(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3)) - MIN((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3)))
-- 	/ (MAX(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3))) -
-- 	   MIN(((ROUND(alcohol, 2) * 0.4) +(ROUND(quality, 2)* 0.3) + (ROUND(residual_sugar, 2) * 0.3))))
-- FROM winequality_red;

SELECT
	alcohol / MIN(alcohol)
FROM winequality_red;
	
	
SELECT "pH"
FROM winequality_red;