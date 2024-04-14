USE TSQLV6;

SELECT empid
    , YEAR(orderdate) AS orderyear
    , COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
ORDER BY empid, orderyear;

-- FROM
SELECT orderid
    , empid
    , orderdate
    , freight
FROM Sales.Orders;

-- WHERE
SELECT orderid
    , empid
    , orderdate
    , freight
FROM Sales.Orders
WHERE custid = 71;

-- GROUP BY

-- FROM Sales.Orders
-- WHERE custid = 71
-- GROUP BY empid, YEAR(orderdate)

SELECT empid
    , YEAR(orderdate) AS orderyear
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate);

SELECT empid
    , YEAR(orderdate) AS orderyear
    , SUM(freight) AS totalfreight
    , COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate);

-- A failing query
SELECT empid
    , YEAR(orderdate) AS orderyear
    , freight
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)

-- Using distinct
SELECT empid
    , YEAR(orderdate) AS orderyear
    , COUNT(DISTINCT custid) AS numcusts
FROM Sales.Orders
GROUP BY empid, YEAR(orderdate);

-- HAVING
SELECT empid
    , YEAR(orderdate) AS orderyear
    , COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1;

-- SELECT

-- Select statement that uses `orderdate` as an alias
-- instead of as a column name because of missing comma
SELECT orderid orderdate
FROM Sales.Orders;

-- `SELECT` is the last thing to be executed
-- The following does not work:
-- SELECT orderid,
--     YEAR(orderdate) AS orderyear
-- FROM Sales.Orders
-- WHERE orderyear > 2021;

-- The solution is repeating `YEAR(orderdate)`):
SELECT orderid,
    YEAR(orderdate) AS orderyear
FROM Sales.Orders
WHERE YEAR(orderdate) > 2021;

-- This also does not work:
-- SELECT empid
--     , YEAR(orderdate) AS orderyear
--     , COUNT(*) AS numorders
-- FROM Sales.Orders
-- WHERE custid = 71
-- GROUP BY empid, YEAR(orderdate)
-- HAVING numorders > 1;

-- The solution is again repeating `COUNT(*)`
SELECT empid
    , YEAR(orderdate) AS orderyear
    , COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1;

-- Referring to column aliases created in the SELECT clause
-- in other expressions with the same SELECT clause is
-- NOT allowed
-- SELECT orderid
--     , YEAR(orderdate) AS orderyear
--     , orderyear + 1 AS nextyear
-- FROM Sales.Orders;

-- Do this instead
SELECT orderid
    , YEAR(orderdate) AS orderyear
    , YEAR(orderdate) + 1 aS nextyear
FROM Sales.Orders;

-- ORDER BY
SELECT empid
    , YEAR(orderdate) AS orderyear
    , COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
ORDER BY empid, orderyear;