-- To answer these use the table:
-- bitcoinhistoricaldata.public.coinbase

-- Request from business client: 
--   Show me the days that had gaps greater than 85 between high & low.
--   Info wanted for these days:
--     * What were the dates?
--     * How large are these gaps?
--     * What is the largest gap?
--     * What were the high/low values?
SELECT timestamp, (high * 1.0 - low) AS gap, high, low
FROM coinbase
WHERE ABS(high * 1.0 - low) > 85
ORDER BY gap DESC;


-- Request from business client: 
--   I'm a superstitious trader and I'd only like to trade on days where the open
--   value is a multiple of 5.  Are there days in the table where I'd be 
--   able to trade?  Can you please send me a csv of the records where my
--   superstition would allow me to trade?

SELECT *

-- The `volume_btc` field is fairly postively skewed.
-- That is most values are low but some are very high (see btc_skew.ipynb for more).
-- One way of dealing with this skew in machine learning
-- is by using transformations.  Some possible transformations
-- are log, square root, and cube root.  Write a query to return:
--   * every field in the table and 
--   * a field for each of these transformations



-- Request from business client:
--   I want an instability metric thats a single value to show how volatile
--   the market was on a given day.  I'd like this metric to be the weighted 
--   average between:
--     * The size of the gap between high/low   (40% weight)
--     * The size of the gap between open/close (60% weight)
--   I'd like this number to be rounded to only show one decimal.
--   Only show me the numbers where the open is different than the close.
--   If you think of a better metric, let me know, but please deliver on this
--   request before suggesting alternatives.


