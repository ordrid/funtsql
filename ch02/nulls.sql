USE TSQLV6;

DECLARE @region VARCHAR(256);

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region = N'WA';

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region IS NOT DISTINCT FROM N'WA';

-- Using NOT DISTINCT
SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region = @region
    OR (region IS NULL AND @region IS NULL);

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region IS NOT DISTINCT FROM @region;

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region <> N'WA';

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region = NULL;

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region IS NULL;

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region <> N'WA'
    OR region IS NULL;

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region IS DISTINCT FROM N'WA';

SELECT custid
    , country
    , region
    , city
FROM Sales.Customers
WHERE region IS DISTINCT FROM @region>;