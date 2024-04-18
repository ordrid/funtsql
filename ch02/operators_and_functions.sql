USE TSQLV6;

-- String concatenation using +
SELECT empid
    ,firstname + N' ' + lastname AS fullname
FROM HR.Employees;

-- String concatenation with NULL results with NULL by default
SELECT custid
    ,country
    ,region
    ,city
    ,country + N',' + region + N',' + city AS Location
FROM Sales.Customers;

-- To treat NULL as an empty string in concatenation use COALESCE
SELECT custid
    ,country
    ,region
    ,city
    ,country + COALESCE(N',' + region, N'') + N',' + city AS location
FROM Sales.Customers;

-- CONCAT substitutes an empty string for NULL
SELECT custid
    ,country
    ,region
    ,city
    ,CONCAT(country, N',' + region, N',' + city) AS location
FROM Sales.Customers;

-- CONCAT_WS accept a separator as first parameter
SELECT custid
    ,country
    ,region
    ,city
    ,CONCAT_WS(N',', country, region, city) AS location
FROM Sales.Customers;

-- SUBSTRING
SELECT SUBSTRING('abcde', 1, 3);

-- LEFT and RIGHT
SELECT LEFT('abcde', 3)
SELECT RIGHT('abcde', 3)

-- LEN and DATALENGTH
SELECT LEN(N'abcde')
SELECT DATALENGTH(N'abcde')

-- CHARINDEX
SELECT CHARINDEX(' ', 'Itzik Ben-Gan');

-- PATINDEX
SELECT PATINDEX('%[0-9]%', 'abcd123efgh');

-- REPLACE
SELECT REPLACE('1-a 2-b', '-', ':');

SELECT empid
    ,lastname
    ,LEN(lastname) - LEN(REPLACE(lastname, 'e', '')) AS numoccur
FROM HR.Employees;

-- TRANSLATE

SELECT REPLACE(REPLACE('123.456.789,00', '.', ','), ',', '.');
SELECT REPLACE(REPLACE(REPLACE('123.456.789,00', '.', '~'), ',', '.'), '~', ',');
SELECT TRANSLATE('123.456.789,00', '.,', ',.');

-- REPLICATE
SELECT REPLICATE('abc', 3);

SELECT supplierid
    ,RIGHT(REPLICATE('0', 9) + CAST(supplierid AS VARCHAR(10)), 10) AS strsupplierid
FROM Production.Suppliers;

-- STUFF
SELECT STUFF('xyz', 2, 1, 'abc');
SELECT STUFF('xyz', 2, 0, 'abc');
SELECT STUFF('xyz', 2, 1, NULL);

-- UPPER and LOWER
SELECT UPPER('Itzik Ben-Gan');
SELECT LOWER('Itzik Ben-Gan');

-- RTRIM, LTRIM, TRIM
SELECT RTRIM(LTRIM('   abc   '));
SELECT TRIM('  abc   ');

-- FORMAT
SELECT FORMAT(1759, '000000000000');

-- COMPRESS and DECOMPRESS
SELECT COMPRESS(N'This is my cv, Imagine it was much longer.');

-- INSERT INTO dbo.EmployeeCVs(empid, cv) VALUES (@empid, COMPRESS(@cv));

-- returns binary value.
SELECT DECOMPRESS(COMPRESS(N'This is my cv, Imagine it was much longer.'));

-- need to cast to get a string
SELECT(
    CAST(
        DECOMPRESS(COMPRESS(N'This is my cv, Imagine it was much longer.'))
            AS NVARCHAR(MAX)));

-- STRING_SPLIT
SELECT CAST(value AS INT) as myvalue
FROM STRING_SPLIT('10248,10249,10250', ',') AS S;

-- String split with ordinal flag enabled
SELECT CAST(value AS INT) AS myvalue
    , ordinal
FROM STRING_SPLIT('10248,10249,10250', ',', 1) AS S;

-- STRING_AGG
SELECT custid
    ,STRING_AGG(CAST(orderid AS VARCHAR(10)), ',')
        WITHIN GROUP(ORDER BY orderdate DESC, orderid DESC) AS custorders
FROM Sales.Orders
GROUP BY custid;