USE TSQLV6;

-- Using IN keyword
SELECT orderid
    , empid
    , orderdate
FROM Sales.Orders
WHERE orderid IN (
    10248
    , 10249
    , 10250
);

-- Using BETWEEEN keyword
SELECT orderid
    , empid
    , orderdate
FROM Sales.Orders
WHERE orderid BETWEEN 10300 and 10310;

-- Using LIKE keyword
SELECT empid
    , firstname
    , lastname
FROM HR.Employees
WHERE lastname LIKE N'%D%';

-- Using comparison operators
SELECT orderid
    , empid
    , orderdate
FROM Sales.Orders
WHERE orderdate >= '20220101';

-- Using logical operators
SELECT orderid
    , empid
    , orderdate
FROM Sales.Orders
WHERE orderdate >= '20220101'
    AND empid NOT IN(1, 3, 5);

-- Using arithmetic operators
SELECT orderid
    , productid
    , qty
    , unitprice
    , discount
    , qty * unitprice * (1 - discount) AS val
FROM Sales.OrderDetails;