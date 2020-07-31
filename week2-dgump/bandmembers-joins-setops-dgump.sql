-- Using the band_members database

----------------------------------
-- JOINs -------------------------
----------------------------------

-- Explore the 2 tables in the band_members database.
-- How can we combine the information from these tables?
SELECT * FROM band_instruments;

SELECT * FROM band_members;


-- Use an join the 2 tables and only keep records
-- where the key was found in both tables
SELECT *
FROM band_members
JOIN band_instruments
ON band_members.name = band_instruments.name;


-- SELECT * brings back our key column twice!
-- Be explicit to avoid confusing field naming.
SELECT band_members.name, band, plays
FROM band_members
JOIN band_instruments
ON band_members.name = band_instruments.name;


-- Make it more readable with aliasing
SELECT bm.name, band, plays
FROM band_members AS bm
JOIN band_instruments AS bi
ON bm.name = bi.name;


-- Note, we don't *need* the AS keyword
-- Some RDBMSes actually won't let you use AS to alias tables
SELECT bm.name, band, plays
FROM band_members bm
JOIN band_instruments bi
ON bm.name = bi.name;


-- We need to reference what table our name column is coming from
-- since it's in both tables SQL will complain about ambiguity
SELECT bm.name, bm.band, bi.plays
FROM band_members AS bm
JOIN band_instruments AS bi
ON bm.name = bi.name;


-- Conversely we could prefix every column if we wanted
-- This isn't needed since band & plays aren't ambiguous

SELECT bm.name, bm.band, bi.plays
FROM band_members AS bm
JOIN band_instruments AS bi
ON bm.name = bi.name;

-- -- We've used an INNER JOIN. What about other JOINS?
-- -- INNER is implied when just using JOIN,



-- A FULL OUTER JOIN grabs every row from both tables
-- You'll sometimes see OUTER dropped from this type of JOIN

SELECT bm.name as bm_name,
	   bi.name as bi_name,
	   band,
	   plays
FROM band_members bm
FULL OUTER JOIN band_instruments bi
ON bm.name = bi.name;

-- LEFT OUTER JOIN (think venn diagram)
-- you'll often see people drop the OUTER from this 
-- type of JOIN
SELECT *
FROM band_members bm LEFT JOIN band_instruments bi
on bm.name = bi.name;


-- RIGHT JOINs work very similarly to LEFT JOINs

SELECT *
FROM band_members bm RIGHT JOIN band_instruments bi
on bm.name = bi.name;

----------------------------------
-- Set operations ----------------
----------------------------------

-- Joins will combine tables horizontally,
-- sometimes we have a usecase for combining
-- tables vertically.  For this, we can use UNION.
-- Using UNION will only grab unique records
-- This can be thought of as set addition.
-- What are some potential use cases of UNION?
SELECT *
FROM band_members
UNION
SELECT * 
FROM band_instruments;

-- data type alignment
SELECT CAST(1 AS CHAR) ones, band
FROM band_members bm
UNION
SELECT *
FROM band_instruments bm;

-- UNION ALL will not filter out duplicates
SELECT *
FROM band_members
UNION
SELECT * 
FROM band_instruments;



-- Using INTERSECT will stack tables similarly
-- to UNION.  The difference is that INTERSECT
-- only keeps rows common to both tables.
-- What are some potential use cases of INTERSECT?
SELECT *
FROM band_members
INTERSECT
SELECT * 
FROM band_instruments
WHERE NAME = 'John';


-- The last set operator we're going to look at is
-- EXCEPT.  This can be thought of as set subtraction.
-- EXCEPT will give us all rows from the first table
-- that are not present in the second.

SELECT *
FROM band_members
EXCEPT
SELECT * 
FROM band_members
WHERE NAME = 'John';
