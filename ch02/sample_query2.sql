USE TSQLV6;

SELECT TOP (5) orderid
    , orderdate
    , custid
    , empid
FROM Sales.Orders
ORDER BY orderdate DESC;

-- Using percent
SELECT TOP (1) PERCENT
    orderid
    , orderdate
    , custid
    , empid
FROM Sales.Orders
ORDER BY orderdate DESC;

-- Using tie breaker to achieve total ordering
SELECT TOP (5)
    orderid
    , orderdate
    , custid
    , empid
FROM Sales.Orders
ORDER BY orderdate DESC, orderid DESC;

-- Returning all ties
SELECT TOP (5) WITH TIES orderid
    , orderdate
    , custid
    , empid
FROM Sales.Orders
ORDER BY orderdate DESC;