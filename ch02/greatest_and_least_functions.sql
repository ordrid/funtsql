USE TSQLV6;

-- Using GREATEST AND LEAST
SELECT orderid
    , requireddate
    , shippeddate
    , GREATEST(requireddate, shippeddate) AS latestdate
    , LEAST(requireddate, shippeddate) AS earliestdate
FROM Sales.Orders
WHERE custid = 8;

-- Without GREATEST AND LEAST
SELECT orderid
    , requireddate
    , shippeddate
    , CASE
        WHEN requireddate > shippeddate OR shippeddate IS NULL THEN requireddate
        ELSE shippeddate
    END AS latestdate
    , CASE
        WHEN requireddate < shippeddate OR shippeddate IS NULL THEN requireddate
        ELSE shippeddate
    END AS earliestdate
FROM Sales.Orders
WHERE custid = 8;