--------------------------------
-- INTRO QUERIES ---------------
--------------------------------

-- SELECT * (pronounced 'select star')
-- is a 'wildcard' character meaning 'i want all the columns'

-- query translation: 
-- "give me all the columns from the houseprices table"
SELECT ____
FROM ____;


-- Sometimes you might see the schema name before the table name
-- Think of how we call functions from pandas like pd.read_csv().
-- This is unneeded in this case but sometimes you might have multiple
-- schemas and this can allow you to reference 2 different tables with the same
-- name in different schemas (i.e. schema1.prices & schema2.prices)

-- query translation: 
-- "give me all the columns from the houseprices table
-- located in the public schema"
SELECT *
FROM ____.houseprices;


-- Sometimes you might see the database before the schema.
-- This is the same as specifying the schema.  Not all RDBMSs
-- allow you to query tables from multiple databases at once.
-- Postgres does not allow querying multiple DBs in the same query by default.
-- MS SQL Server is an example of an RDBMS that allows this.

-- query translation: 
-- "give me all the columns from the houseprices table 
-- located in the public schema of the houseprices database"
____ *
FROM ____;


-- If you want to be more specific, instead of using *, we
-- can ask for fields by name.  The general SQL syntax is
-- SELECT column1, column2
-- FROM table

-- query translation: 
-- "give me the yearbuilt and saleprice columns from the houseprices table"

-- pandas equivalent:
-- houseprices[['yearbuilt', 'saleprice']]
SELECT ____
FROM houseprices;


--------------------------------
-- EXPLORING A NEW TABLE -------
--------------------------------

-- When you first get your hands on a table, you'll want to explore.
-- Ways to explore:
--   * A schema diagram might be provided
--   * Use a GUI (like pgAdmin) to click around and view fields/tables/schemas/DBs
--   * Use the `information_schema`

-- We'll talk more about all the parts of this query in a bit.
-- For now, you might just keep a tab on this.

-- query translation: 
-- "give me the column names and datatypes for the houseprices table"
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'houseprices';


-- query translation: 
-- "give me the column names and datatypes for the transactions table"
SELECT column_name, data_type 
FROM information_schema.columns
WHERE ____;


--------------------------------
-- FILTERING WITH WHERE --------
--------------------------------

-- Very commonly, we want only a subset of records based on a 
-- condition.  For this, we'll use the WHERE clause.  Our new
-- template for including this will be:
-- SELECT column(s)
-- FROM table
-- WHERE condition(s)

-- pandas equivalent:
-- houseprices.loc[houseprices['yearbuilt'] > 1984, ['yearbuilt', 'saleprice']]
SELECT saleprice, yearbuilt
FROM houseprices
____;


-- For equality checks, SQL uses single `=` not `==` like in python

-- pandas equivalent:
-- houseprices.loc[houseprices['yearbuilt'] == 1984, ['yearbuilt', 'saleprice']]
____ saleprice, yearbuilt
____ houseprices
____;


-- In postgreSQL both `<>` and `!=` work for not equal

-- pandas equivalent:
-- houseprices.loc[houseprices['yearbuilt'] != 1984, ['yearbuilt', 'saleprice']]
SELECT saleprice, yearbuilt
FROM houseprices
WHERE yearbuilt <> 1984;

SELECT saleprice, yearbuilt
FROM houseprices
WHERE yearbuilt != 1984;


-- Logical operators
-- AND/OR/NOT like you'd expect with a pythonic mindset

-- pandas equivalent:
-- houseprices.loc[
--     (houseprices["yearbuilt"] > 1984) & (houseprices["saleprice"] > 300000),
--     ["yearbuilt", "saleprice"],
-- ]
SELECT saleprice, yearbuilt
FROM houseprices
WHERE ____;

-- pandas equivalent:
-- houseprices.loc[
--     (houseprices["yearbuilt"] > 1984) | (houseprices["saleprice"] > 300000),
--     ["yearbuilt", "saleprice"],
-- ]
SELECT saleprice, yearbuilt
FROM houseprices
WHERE ____;


-- IN also works similarly to in python

-- pandas equivalent (base python would use `in`, pandas uses `.isin()`):
-- houseprices.loc[
--     houseprices["yearbuilt"].isin([1985, 1995, 2005]), 
--     ["yearbuilt", "saleprice"]
-- ]
SELECT saleprice, yearbuilt
FROM houseprices
WHERE ____;


-- BETWEEN can be useful to filter to a range (inclusive)

-- pandas equivalent:
-- houseprices.loc[
--     houseprices["yearbuilt"].between(1984, 1985), 
--     ["yearbuilt", "saleprice"]
-- ]
SELECT saleprice, yearbuilt
FROM houseprices
WHERE ____;

-- Equivalent written out with traditional comparison operators
____
____
____;


--------------------------------
-- CASE STATEMENTS -------------
--------------------------------

-- We might want to create a field in our output based on some conditions
-- For example, maybe we want to label home prices as above or below a value.
-- According to zillow (as of 2020-07-27): 
-- "The median home value in the United States is $248,857."
-- We can use the same conditional logic as in the WHERE statement to create
-- a label column.

-- pandas equivalent:
-- df = houseprices.loc[:, ["saleprice", "yearbuilt"]]
-- df["case"] = "Below Median"
-- df.loc[df["saleprice"] > 248857, "case"] = "Above Median"
-- df.loc[df["saleprice"] == 248857, "case"] = "Median"
SELECT saleprice, yearbuilt,
       ____ 
	     ____ saleprice > 248857 ____ 'Above Median'
		 ____ saleprice = 248857 ____ 'Median'
	     ____ 'Below Median'
	   ____
FROM houseprices;


--------------------------------
-- ALIASING COLUMNS ------------
--------------------------------

-- Sometimes we want to rename a column in our output
-- This does not change the field name in the database, just in our output

-- pandas equivalent:
-- df = houseprices.loc[:, ["saleprice", "yearbuilt"]]
-- df = df.rename(columns={"yearbuilt": "yb"})
SELECT saleprice, yearbuilt ____
FROM houseprices;

-- Note that we cannot use this alias in the WHERE statement
-- We'll use aliasing more in the future and experiment with
-- where we can/can't use these aliases.
SELECT saleprice, yearbuilt AS yb
FROM houseprices
WHERE yb > 1990;


--------------------------------
-- LIMITING QUERY SIZE ---------
--------------------------------

-- LIMIT works like `pandas.DataFrame.head()`
-- It allows you to SELECT the top n rows FROM a table
-- As we'll see, this pairs well with sorting to be able
-- to query for the top n based on some field.

-- pandas equivalent:
-- houseprices[['saleprice', 'yearbuilt']].head(2)
SELECT saleprice, yearbuilt
FROM houseprices
____;


--------------------------------
-- QUERY STRUCTURE SO FAR ------
--------------------------------

-- SELECT column(s)
-- FROM table
-- WHERE condition(s)
-- LIMIT row_count;
