-- Write a query that returns:
-- The date the purchase was made (created_at field)
-- Add 30 days to the purchase date.
-- Subtract 90 days from the purchase date.
-- Convert the purchase date to a date string using the formatting of your choice.
-- Truncate the purchase date to the hour.
-- Extract from the purchase date the year, month, day, weekday name, and week number

SELECT created_at
	   ,created_at + INTERVAL '30 days' AS created_plus_30
	   ,created_at - INTERVAL '90 days' AS created_min_90
	   ,TO_CHAR(created_at, 'YYYY-MM-DD') AS date_form
	   ,DATE_TRUNC('hour', created_at) AS date_to_hour
	   ,TO_CHAR(created_at, 'YYYY') AS year
	   ,TO_CHAR(created_at, 'MM') AS month
	   ,TO_CHAR(created_at, 'DD') AS day_month
	   ,TO_CHAR(created_at, 'Day') AS day_name
	   ,TO_CHAR(created_at, 'WW') AS week_of_year
FROM purchases;