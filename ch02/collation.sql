USE TSQLV6;

SELECT empid
    ,firstname
    ,lastname
FROM HR.Employees
WHERE lastname = N'davis';

SELECT empid
    ,firstname
    ,lastname
FROM HR.Employees
WHERE lastname COLLATE Latin1_General_CS_AS = N'davis';