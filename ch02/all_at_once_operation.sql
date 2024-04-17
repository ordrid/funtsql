USE TSQLV6;

-- This does not work
-- SELECT orderid
--     , YEAR(orderdate) AS orderyear
--     , orderyear + 1 AS nextyear
-- FROM Sales.Orders;

-- SQL is free to evaluate the WHERE clause in any order so it might evalue
-- col2/col1 first which could result in division by zero.
-- SELECT col1
--     , col2
-- FROM dbo.T1
-- WHERE col1 <> 0 AND col2/col1 > 2;

-- Workaround
-- SELECT col1
--     , col2
-- FROM dbo.T1
-- WHERE
--     CASE
--         WHEN col1 = 0 THEN 'no' -- or 'yes' if row should be returned
--         WHEN col2/col1 > 2 THEN 'yes'
--         ELSE 'no'
--     END = 'yes';

-- A more mathematical workaround
-- SELECT col1, col2
-- FROM dbo.T1
-- WHERE (col1 >0 AND col2 > 2*col1) OR (col1 < 0 AND col2 < 2*col1);
