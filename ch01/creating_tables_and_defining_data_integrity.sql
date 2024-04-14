-- Creating tables

USE TSQLV6;

DROP TABLE IF EXISTS dbo.Employees;

CREATE TABLE dbo.Employees
(
    empid     INT         NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname  VARCHAR(30) NOT NULL,
    hiredate  DATE        NOT NULL,
    mgrid     INT         NOT NULL,
    ssn       VARCHAR(20) NOT NULL,
    salary    MONEY       NOT NULL
);

-- Defining data integrity

-- Primary key constraints

ALTER TABLE dbo.Employees
    ADD CONSTRAINT PK_Employees
    PRIMARY KEY(empid);

-- Uniqueness constraints
ALTER TABLE dbo.Employees
    ADD CONSTRAINT UNQ_Employees_ssn
    UNIQUE(ssn);

-- "Uniqueness constraint" for non-null values only
CREATE UNIQUE INDEX idx_ssn_notnull ON dbo.Employees(ssn) WHERE ssn IS NOT NULL;

-- Foreign key constraints

DROP TABLE IF EXISTS dbo.Orders;

CREATE TABLE dbo.Orders
(
    orderid    INT         NOT NULL,
    empid      INT         NOT NULL,
    custid     VARCHAR(10) NOT NULL
    orderts    DATETIME2   NOT NULL,
    qty        INT         NOT NULL,
    CONSTRAINT PK_Orders
        PRIMARY KEY(orderid)
);

ALTER TABLE dbo.Orders
    ADD CONSTRAINT FK_Orders_Employees
    FOREIGN KEY(empid)
    REFERENCES dbo.Employees(empid);

-- Check contraints

ALTER TABLE dbo.Employees
    ADD CONSTRAINT CHK_Employees_salary
    CHECK(salary > 0.00);

-- Default constraints

ALTER TABLE dbo.Orders
    ADD CONSTRAINT DFT_Orders_orders
    DEFAULT(SYSDATETIME()) FOR ORDERS;
