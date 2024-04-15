USE TSQLV6;

-- Using offset fetch
SELECT orderid
    , orderdate
    , custid
    , empid
FROM Sales.Orders
ORDER BY orderdate, orderid
OFFSET 50 ROWS FETCH NEXT 25 ROWS ONLY;

-- Window functions quick look
SELECT orderid
    , custid
    , val
    , ROW_NUMBER() OVER (
        PARTITION BY custid
        ORDER BY val
    ) AS rownum
FROM Sales.OrderValues
ORDER BY custid, val;