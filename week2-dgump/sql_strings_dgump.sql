-- Concatenate the fuel and cyl fields together (with a space in between).
SELECT fuel || ' ' || cyl as fuel_cyl
FROM vehicles;

-- Replace any occurrences of the word “Small” in the class field with an empty string.
SELECT "class"
	REPLACE(class, 'Small', '')
FROM vehicles;

-- Create a field that parses out whether the vehicle is Automatic or 
-- Manual from the trans field (without the additional speed info).
SELECT *,
	CASE
		WHEN trans LIKE '%Auto%' THEN 'Automatic'
		WHEN trans LIKE '%Man%' THEN 'Manual'
	END transmission
FROM vehicles;

-- Filter for records where the drive train info (ex. 2WD, 4WD, AWD, etc.) is 
-- listed at the end of the model field.

SELECT make, model, drive
FROM vehicles
WHERE right(model, 3) ILIKE '_WD';
	
