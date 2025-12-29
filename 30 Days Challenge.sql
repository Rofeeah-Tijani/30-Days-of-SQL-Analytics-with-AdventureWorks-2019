----Day 1 – SELECT & WHERE
• SELECT basics
• Filtering with WHERE
• Comparison operators (=, <, >, <=, >=, <>)

SELECT * FROM Production.Product

SELECT TOP 10 * FROM Sales.Customer

SELECT name,ListPrice FROM Production.Product

SELECT * FROM HumanResources.Employee
WHERE YEAR(HireDate) > 2015

SELECT ProductID,ProductNumber FROM Production.Product
SELECT SalesOrderID FROM Sales.SalesOrderHeader

SELECT DISTINCT JobTitle FROM HumanResources.Employee

SELECT * FROM Person.Person
SELECT TOP 20 FirstName,LastName FROM Person.Person
SELECT ProductCategoryID FROM Production.ProductCategory

SELECT TOP 5 ListPrice,Name
FROM Production.Product
GROUP BY ListPrice,Name
ORDER BY ListPrice DESC

SELECT TOP 5 ListPrice,Name
FROM Production.Product
GROUP BY ListPrice,Name
ORDER BY ListPrice ASC

SELECT * FROM Sales.SalesOrderHeader
WHERE TerritoryID IS NULL

SELECT ProductNumber,Name
FROM Production.Product
WHERE StandardCost > 1000

SELECT NationalIDNumber,BusinessEntityID,JobTitle
FROM HumanResources.Employee
WHERE VacationHours BETWEEN 10 AND 50

SELECT ProductNumber,Name
FROM Production.Product
WHERE Color IS NOT NULL

SELECT * FROM HumanResources.Employee
ORDER BY HireDate ASC

SELECT Name,ProductNumber
FROM Production.Product
ORDER BY ListPrice DESC

SELECT * FROM Sales.Customer
WHERE CustomerID IN (1,2,3,4,5)

SELECT * FROM Production.Product
WHERE Color IN ('Red','Black')

SELECT Name, ListPrice FROM Production.Product
WHERE  ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)

SELECT NationalIDNumber FROM HumanResources.Employee
WHERE YEAR(HireDate) = 2012

SELECT TOP 10 NationalIDNumber,JobTitle, DATENAME(MONTH,HireDate) AS Month,YEAR(HireDate) AS Year
FROM HumanResources.Employee
ORDER BY HireDate DESC

SELECT TOP 10 NationalIDNumber,JobTitle, DATENAME(MONTH,HireDate) AS Month,YEAR(HireDate) AS Year
FROM HumanResources.Employee
ORDER BY HireDate ASC

SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager%'

SELECT * FROM Production.Product
WHERE ProductNumber LIKE 'AR%'

SELECT * FROM Production.Product
WHERE Name LIKE '%Mountain%'

SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Engineer'

SELECT TOP 20 Name FROM Production.Product

SELECT Name,ListPrice, ListPrice + 100 AS AdjustedPrice
FROM Production.Product

SELECT *  FROM HumanResources.Employee
WHERE  YEAR(HireDate) = 2011

SELECT * FROM Production.Product

---Day 2 – DISTINCT, NULL, Aliases
• DISTINCT keyword
• IS NULL / IS NOT NULL
• Aliases (AS)
SELECT DISTINCT Color FROM Production.Product

SELECT DISTINCT TerritoryID FROM Sales.Customer

SELECT * FROM Production.Product 
WHERE Color IS  NULL

SELECT * FROM Person.Person
WHERE MiddleName IS NULL

SELECT * FROM Person.Person
WHERE MiddleName IS  NOT NULL

SELECT Name AS ProductName 
FROM Production.Product

SELECT FirstName AS FName,LastName AS LName
FROM Person.Person

SELECT TOP 20 ProductID,Name
FROM Production.Product

SELECT DISTINCT OrderDate FROM Sales.SalesOrderHeader

SELECT DISTINCT ProductSubCategoryID 
FROM Production.Product

SELECT DISTINCT COUNT(Color) 
FROM Production.Product

SELECT MiddleName,COUNT(*) AS MdNull
FROM Person.Person
WHERE MiddleName  IS NULL
GROUP BY MiddleName

SELECT TerritoryID,COUNT(*) AS TDNull
FROM Sales.Customer
WHERE TerritoryID IS NULL
GROUP BY TerritoryID

SELECT * FROM HumanResources.Employee
WHERE SickLeaveHours IS NULL OR  SickLeaveHours = 0

SELECT * FROM Sales.Customer
WHERE PersonID IS NOT NULL

SELECT DISTINCT Color, Size
FROM Production.Product

SELECT DISTINCT YEAR(OrderDate) AS Year_of_orderdate, Month(OrderDate) AS Month_of_order_date
FROM Sales.SalesOrderHeader

SELECT DISTINCT COUNT(JobTitle) AS Distinct_JobTitle
FROM HumanResources.Employee

SELECT * FROM Production.Product
WHERE Color IS NULL
AND Size IS NOT NULL

SELECT ProductSubCategoryID FROM Production.Product
WHERE  Name >= 10

SELECT * FROM Person.Person
WHERE MiddleName IS NULL AND
Suffix IS NOT NULL

SELECT * FROM HumanResources.Employee
WHERE SickLeaveHours IS NULL
AND VacationHours IS NULL

SELECT Weight AS Unknown_Weight
FROM Production.Product
WHERE Weight IS NULL

SELECT *  FROM Production.Product
WHERE Weight IS NULL 

SELECT Name AS AvailableColor FROM Production.Product
WHERE Color IS NOT NULL

SELECT DISTINCT COUNT(ProductID) AS distinct_product
FROM Sales.SalesOrderDetail

--Day3 – INSERT, UPDATE, DELETE
• INSERT INTO
• UPDATE with WHERE
• DELETE with WHERE
INSERT INTO Production.Product
(
    Name,
    ProductNumber,
    MakeFlag,
    FinishedGoodsFlag,
    Color,
    SafetyStockLevel,
    ReorderPoint,
    StandardCost,
    ListPrice,
    Size,
    SizeUnitMeasureCode,
    WeightUnitMeasureCode,
    Weight,
    DaysToManufacture,
    ProductLine,
    Class,
    Style,
    ProductSubcategoryID,
    ProductModelID,
    SellStartDate,
    SellEndDate,
    DiscontinuedDate,
    rowguid,
    ModifiedDate
)
VALUES
(
    'Dummy Product',
    'DUM-0001',
    0,
    0,
    'N/A',
    1,
    1,
    0.00,
    0.00,
    'N/A',
    NULL,
    NULL,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '1900-01-01 00:00:00.000',
    NULL,
    NULL,
    NEWID(),  
    GETDATE() 
);

   INSERT INTO HumanResources.Employee
        (BusinessEntityID,
        NationalIDNumber,
        LoginID,                         
        JobTitle,
        BirthDate,
        MaritalStatus,
        Gender,
        HireDate,
        SalariedFlag,
        VacationHours,
        SickLeaveHours,
        CurrentFlag,
        rowguid,
            ModifiedDate)
        VALUES(
        291,
        '2',
        'Dummy',
        'Baker',
        '1990-05-09',
        'M',
        'F',
        '2018-02-05',
        1,
        50,
        60,
        0,
        NEWID(),
        '2025-05-06 00:00:00.000'
        )

INSERT INTO Sales.Customer( 
                           rowguid,
                           ModifiedDate
                           )
    VALUES (
                NEWID(),
                GETDATE()
                )

INSERT INTO Production.ProductCategory(
                                        Name,
                                        rowguid,
                                        ModifiedDate)
                    VALUES(
                            'Sharas',
                            NEWID(),
                            GETDATE()
                            )

UPDATE  Production.Product
SET Color = 'Red'
WHERE ProductID = 1

UPDATE  Production.Product
SET ListPrice = 2000.00
WHERE ProductID = 2

UPDATE HumanResources.Employee
SET VacationHours = 50
WHERE BusinessEntityID = 1

DELETE Production.ProductCategory
WHERE ProductCategoryID = 5

DELETE Production.Product
WHERE Color IS NULL

INSERT INTO Person.BusinessEntity (rowguid, ModifiedDate)
VALUES (NEWID(), GETDATE())
SELECT SCOPE_IDENTITY() AS NewBusinessEntityID;

INSERT INTO Person.Person (BusinessEntityID,
                               PersonType,
                               NameStyle,
                               Title,
                               FirstName,
                               MiddleName,
                               LastName,
                               Suffix,
                               EmailPromotion,
                               AdditionalContactInfo,
                               Demographics,
                               rowguid,
                               ModifiedDate)
                    VALUES(20778,
                            'EM',
                            1,
                            Null,
                            'Zebra',
                            Null,
                            'Cat',
                            Null,
                            0,
                            Null,
                            Null,
                            NEWID(),
                            GETDATE()
                            )

UPDATE Production.Product
SET ListPrice = 0
WHERE ListPrice IS NULL

UPDATE HumanResources.Employee
SET VacationHours = 10
WHERE VacationHours < 10

DELETE Sales.SalesOrderHeader
WHERE TerritoryID IS NULL

INSERT INTO Production.Product
                                (Name,
                                StandardCost)
    VALUES('Test Product',
            100)

UPDATE HumanResources.Employee
SET SickLeaveHours = 100
WHERE SickLeaveHours < 100

DELETE Production.Product
WHERE SafetyStockLevel < 5

DELETE Sales.SalesOrderHeader
WHERE SalesOrderID = 50000

INSERT INTO Production.Product(Name)
SELECT 'Bearing Ball'
UNION ALL
SELECT 'BB Ball Bearings'
UNION ALL
SELECT 'Headset Ball Bearings'
UNION ALL 
SELECT 'Blade'
UNION ALL
SELECT 'LL Crankam'

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1

UPDATE HumanResources.Employee
SET CurrentFlag = 0
WHERE YEAR(HireDate) < 2000

INSERT INTO Production.ProductCategory(Name,rowguid, ModifiedDate)
VALUES (NEWID(), GETDATE())
SELECT SCOPE_IDENTITY() AS NewBusinessEntityID;

INSERT INTO Production.ProductSubcategory(ProductCategoryID,Name,rowguid,ModifiedDate)
VALUES(1,'Bakery',NEWID(),GETDATE()),
       (2,'Samsung', NEWID(),GETDATE()),
       (3,'Adiddas',NEWID(),GETDATE())

DELETE Sales.SalesOrderHeader
WHERE YEAR(OrderDate) > 2005

UPDATE Production.Product
SET Weight = (SELECT AVG(Weight)
                FROM Production .product
                WHERE Weight IS NOT NULL)
WHERE Weight IS NULL

SELECT * FROM Person.Person

SELECT * FROM Production.ProductSubcategory

SELECT * FROM HumanResources.Employee

SELECT * FROM Person.BusinessEntity

SELECT * FROM Sales.SalesOrderDetail

---Day 4 – Data Types & Functions
• Numbers (ROUND, CEILING, FLOOR)
• Strings (LEN, LEFT, RIGHT, UPPER, LOWER)
• Dates (YEAR, MONTH, GETDATE)

SELECT BirthDate FROM HumanResources.Employee

SELECT YEAR(HireDate) AS Hire_Year FROM HumanResources.Employee

SELECT DATENAME(MONTH,HireDate) AS Hire_Month, DATENAME(WEEKDAY,HireDate) AS Hire_Day
FROM HumanResources.Employee

 SELECT GETDATE() AS Todays_Date

 SELECT TOP 10  * FROM Production.Product

 SELECT *,CONVERT(VARCHAR,HireDate, 103) FROM HumanResources.Employee

 SELECT Name, LEN(Name) AS Name_Length FROM Production.Product

SELECT ListPrice, ROUND(ListPrice,2) AS Round_LP FROM Production.Product

SELECT *, ABS(StandardCost) AS ABV_SC FROM Production.Product

SELECT  Name,POWER(StandardCost,2) AS P_SC FROM Production.Product

SELECT OrderDate,ShipDate, DATEDIFF(Day,OrderDate,ShipDate)  AS waiting_day FROM Sales.SalesOrderHeader

SELECT * FROM Sales.SalesOrderHeader

UPDATE Sales.SalesOrderHeader
SET OrderDate = DATEADD(DAY,10,OrderDate) 

UPDATE Sales.SalesOrderHeader
SET OrderDate = DATEADD(YEAR,10,OrderDate) 

SELECT * FROM HumanResources.Employee
WHERE YEAR(HireDate) = 2010

SELECT ROUND(AVG(ListPrice),1) AS Average_ListPrice FROM Production.Product

UPDATE Production.Product
SET Name = UPPER(Name)

UPDATE Production.Product
SET Name = lower(Name)

UPDATE Production.Product
SET Name = REPLACE(Name,'Mountain','Hill')
WHERE Name LIKE '%Mountain%'

SELECT FirstName,LastName, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Person.Person

SELECT * FROM HumanResources.Employee
WHERE YEAR(HireDate) = YEAR(BirthDate)

SELECT *, DATEDIFF(YEAR,HireDate,GETDATE()) AS Year_Diff
FROM HumanResources.Employee

SELECT ListPrice,CONVERT(int,ListPrice) AS INT_ListPrice FROM Production.Product

SELECT *,DATENAME(MONTH,BirthDate) AS Month_BirthDate FROM HumanResources.Employee

SELECT *, CONVERT(VARCHAR,OrderDate,103) FROM Sales.SalesOrderHeader

SELECT *, DATEPART(QUARTER,HireDate) AS Quarter_HireDate FROM HumanResources.Employee

SELECT * FROM HumanResources.Employee 
WHERE DATENAME(MONTH,BirthDate) = 'December'

SELECT *,DATEDIFF(YEAR,BirthDate,GETDATE()) AS Employees_age FROM HumanResources.Employee

---Day5 – Filtering Advanced
• LIKE (%, _)
• BETWEEN
• IN / NOT IN

SELECT * FROM Production.product
WHERE Name LIKE '%Mountain'

SELECT * FROM Production.Product
WHERE Name LIKE 'Helmet%'

SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager%'

SELECT * FROM HumanResources.Employee
WHERE YEAR(HireDate) BETWEEN 2010 AND 2015

SELECT * FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 500

SELECT * FROM Production.Product
WHERE Color IN ('Red','Black','Blue')

SELECT * FROM Production.Product
WHERE Color NOT IN ('Yellow','White')

SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-01-01' AND '2011-12-31'

SELECT * FROM Sales.Customer
WHERE PersonID IN (1,2,3,4,5)

SELECT * FROM HumanResources.Employee
WHERE JobTitle NOT LIKE '%Engineer%'

SELECT * FROM Production.Product
WHERE ProductNumber LIKE 'AR%'

SELECT * FROM Production.ProductCategory
WHERE Name LIKE 'A%'

SELECT * FROM Production.ProductCategory
WHERE Name LIKE '%Bike%'

SELECT * FROM Production.Product
WHERE Size IN ('M','L')

SELECT * FROM Sales.SalesOrderHeader
WHERE ShipMethodID NOT IN (1,2)

SELECT * FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate) BETWEEN  3 AND 6 AND YEAR(OrderDate) = 2012

SELECT * FROM HumanResources.Employee
WHERE NationalIDNumber LIKE '%7'

SELECT * FROM Production.Product
WHERE Name LIKE '%Mountain%' AND  Name LIKE '%Frame%'

SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) BETWEEN 2010 AND 2013 AND Status = 5

SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Engineer%' AND JobTitle NOT LIKE 'Senior'

SELECT * FROM Production.Product
WHERE Name LIKE '%HL' AND Name LIKE 'Seat%'

SELECT * FROM HumanResources.Employee
WHERE YEAR(HireDate) BETWEEN 1990 AND 2000 
AND YEAR(HireDate) <>  1995

SELECT * FROM Production.Product
WHERE Color IN ('Red','Blue')
AND Size NOT IN ('S','XS')

SELECT * FROM Sales.SalesOrderHeader
WHERE DATENAME(WEEKDAY,OrderDate) IN ('Saturday','Sunday')

SELECT * FROM HumanResources.Employee
WHERE LoginID LIKE '%adventure-works%'

SELECT * FROM Production.Product
WHERE Name LIKE '%Road%' AND ListPrice BETWEEN 500 AND 2000

SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager%' OR JobTitle LIKE  '%Supervisor%'

SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) BETWEEN 2010 AND 2012 AND ShipDate IS NULL


---Day 6 – Sorting & Limiting
• ORDER BY ASC/DESC
• TOP / OFFSET-FETCH

SELECT TOP 10  *  FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 5 * FROM HumanResources.Employee
ORDER BY YEAR(HireDate) DESC

SELECT TOP 20 * FROM Sales.SalesOrderHeader
ORDER BY OrderDate DESC

SELECT * FROM Production.Product
ORDER BY Name ASC

SELECT * FROM HumanResources.Employee
order by VacationHours DESC

SELECT TOP 10 * FROM Production.Product
Order BY ListPrice ASC

SELECT TOP 10 * FROM Production.Product
Order BY ListPrice DESC

SELECT TOP 15 * FROM HumanResources.Employee
ORDER  BY SickLeaveHours DESC

SELECT TOP 5 Name,LEN(Name) AS total_length FROM Production.Product
ORDER BY Name DESC

SELECT TOP 5 * FROM HumanResources.Employee
ORDER BY HireDate ASC

SELECT TOP 10 * FROM HumanResources.Employee
ORDER BY HireDate DESC

SELECT * FROM Sales.SalesOrderHeader
ORDER BY OrderDate DESC

SELECT TOP 10 * FROM Sales.SalesOrderHeader
ORDER BY TotalDue

SELECT TOP 10 * FROM Sales.Customer
ORDER BY CustomerID

SELECT  TOP 20 * FROM Production.Product
ORDER BY Weight DESC

SELECT  TOP 10 * FROM Production.Product
ORDER BY Weight ASC

SELECT TOP 5 *  FROM HumanResources.Employee
ORDER BY NEWID()

SELECT TOP 5 * FROM Production.Product
ORDER BY NEWID()

SELECT TOP 10 COUNT(SalesOrderID)  FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)

SELECT TOP 3 NationalIDNumber,Name 
FROM HumanResources.Employee AS HRE
INNER JOIN HumanResources.Department AS HRD
ON HRE.BusinessEntityID = HRD.DepartmentID

SELECT TOP 5 P.Name AS Product_Name, PC.Name AS Category_Name
FROM Production.Product AS P
INNER JOIN Production.ProductCategory AS PC
ON P.ProductID = PC.ProductCategoryID
ORDER BY ListPrice DESC

SELECT TOP 5 P.Name AS Product_Name, PC.Name AS Category_Name
FROM Production.Product AS P
INNER JOIN Production.ProductCategory AS PC
ON P.ProductID = PC.ProductCategoryID
ORDER BY ListPrice ASC

SELECT TOP 3 P.Name AS Product_Name, PPS.Name AS Suncategory_Name
FROM Production.Product AS P
INNER JOIN Production.ProductSubcategory AS PPS
ON P.ProductID = PPS.ProductSubcategoryID

SELECT * FROM HumanResources.Employee
ORDER BY JobTitle,HireDate

SELECT * FROM Production.Product
ORDER BY Color, ListPrice


---Day 7 (Functions, Arithmetic, String, Date)

SELECT Name, ListPrice FROM Production.Product
UPDATE Production.Product
SET ListPrice = ListPrice + 100

SELECT Name, ListPrice AS PriceWithTax FROM Production.Product
UPDATE Production.Product
SET ListPrice = ListPrice * 1.1 

SELECT Name, LEN(Name) AS Length_of_product_Name FROM Production.Product

SELECT Name,UPPER(Name) as upper_case FROM Production.Product

SELECT Name,LOWER(Name) as upper_case FROM Production.Product

SELECT Name FROM Production.Product
UPDATE Production.Product
SET Name = REPLACE(Name,'Street','Road')
WHERE Name LIKE '%Street%'

SELECT FirstName, LastName, CONCAT(FirstName,' ',LastName) AS Full_Name
FROM Person.Person

SELECT Name, LEFT(Name,5) AS First_five  FROM Production.Product

SELECT GETDATE() AS Todays_date

SELECT YEAR(HireDate) AS Year_of_Hiredate FROM HumanResources.Employee

SELECT *, DATEDIFF(YEAR,BirthDate, GETDATE()) AS Age 
FROM HumanResources.Employee

SELECT *, DATENAME(MONTH,BirthDate) AS Month_of_Birth
FROM HumanResources.Employee

SELECT * FROM Production.Product
WHERE LEN(Name) > 15

SELECT * FROM Person.Person
WHERE FirstName LIKE 'A%'

SELECT FirstName, ASCII(LEFT(FirstName,1)) AS ASCII_Number 
FROM Person.Person

SELECT Name, REPLACE(Name,' ','' ) FROM Production.Product

SELECT *, ROUND(ListPrice,0) AS Rounded_ListPrice FROM Production.Product

SELECT *, SQRT(StandardCost) AS Sqrt_SC FROM Production.Product

SELECT NationalIDNumber,HireDate,CONVERT(NVARCHAR,HireDate,'dd-MMM-yyyy') 
AS date_format FROM HumanResources.Employee

SELECT*, CONVERT(varchar,HireDate,106) AS Conversion_date
FROM HumanResources.Employee

SELECT *, DATEDIFF(WEEKDAY,OrderDate,ShipDate) AS Waiting_day 
FROM Sales.SalesOrderHeader

SELECT  FLOOR(DATEDIFF(YEAR,BirthDate,GETDATE())/10.0) * 10 AS Exact_age,
COUNT(*)  AS Number_of_Employee FROM HumanResources.Employee 
GROUP BY FLOOR(DATEDIFF(YEAR,BirthDate,GETDATE())/10.0) * 10 

SELECT FLOOR(ListPrice) AS Rounded_ListPrice FROM Production.Product

SELECT CEILING(ListPrice) AS Down_ListPrice FROM Production.Product

SELECT *, POWER(SafetyStockLevel,2)  AS Power_SafetyStockLevel FROM Production.Product

SELECT DATEDIFF(MONTH,OrderDate, GETDATE()) FROM Sales.SalesOrderHeader

SELECT Name, REVERSE(Name) AS Reversed_Name FROM Production.Product

SELECT *, REPLACE(LoginID,'\',' ')  AS Seperated_Name FROM HumanResources.Employee

SELECT * FROM HumanResources.Employee
WHERE MONTH(BirthDate)  =  MONTH(GETDATE()) 
 AND DAY(BirthDate) =  DAY(GETDATE())


 ---Day 8 – Joins (INNER, LEFT)
• INNER JOIN basics
• LEFT JOIN with missing rows

SELECT * FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PSC
ON PP.ProductID = PSC.ProductSubcategoryID

SELECT * FROM Sales.SalesOrderDetail AS SOD
LEFT JOIN Production.Product AS PP
ON SOD.SalesOrderID = PP.ProductID

SELECT * FROM Sales.SalesOrderHeader AS SOD
INNER JOIN Sales.Customer AS SC
ON SOD.SalesOrderID = SC.CustomerID

SELECT * FROM Person.Person AS PP
LEFT JOIN HumanResources.Employee AS HRE
ON PP.BusinessEntityID = HRE.BusinessEntityID

SELECT * FROM Production.Product AS PP
INNER JOIN Production.ProductCategory AS PPC
ON PP.ProductID = PPC.ProductCategoryID

SELECT * FROM Sales.SalesOrderHeader  AS SOH
LEFT JOIN Sales.SalesTerritory AS SST
ON SOH.SalesOrderID = SST.TerritoryID

SELECT * FROM Production.Product AS PP
INNER JOIN Production.ProductModel AS PPM
ON PP.ProductID = PPM.ProductModelID

SELECT * FROM Sales.Customer AS SC
LEFT JOIN Person.Person AS PP
ON SC.PersonID = PP.BusinessEntityID

SELECT * FROM Production.Product AS PP
LEFT JOIN Sales.SalesOrderHeader AS SSH
ON PP.ProductID = SSH.SalesOrderID

SELECT * FROM Sales.Customer AS SC
LEFT JOIN Sales.SalesOrderHeader AS SSH
ON SC.CustomerID = SSH.SalesOrderID

SELECT * FROM Sales.SalesOrderDetail  AS SSD
INNER JOIN Production.Product AS PP
ON SSD.SalesOrderDetailID = PP.ProductID
INNER JOIN Production.ProductCategory AS PPC
ON SSD.SalesOrderDetailID = PPC.ProductCategoryID

SELECT M.BusinessEntityID AS EmployeeID,
HRE.BusinessEntityID AS ManagerID,
M.JobTitle AS EmployeeJobTitle,
HRE.JobTitle AS ManagerJobTitle
FROM HumanResources.Employee AS HRE
LEFT JOIN HumanResources.Employee AS M
ON M.BusinessEntityID  = HRE.BusinessEntityID

SELECT SalesOrderID,BusinessEntityID
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesPerson AS SSP
ON SOH.SalesOrderID = SSP.BusinessEntityID

SELECT * FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.CurrencyRate AS SCR
ON SOH.SalesOrderID = SCR.CurrencyRateID

SELECT PP.Name,PPS.Name,PPC.Name 
FROM Production.Product AS PP
LEFT JOIN Production.ProductSubcategory AS PPS
ON PP.ProductID = PPS.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS PPC
ON PP.ProductID = PPC.ProductCategoryID

SELECT SST.TerritoryID,COUNT(CustomerID) 
FROM Sales.Customer AS SC
LEFT JOIN Sales.SalesTerritory AS SST
ON SC.CustomerID = SST.TerritoryID
GROUP BY SST.TerritoryID
ORDER BY SST.TerritoryID

SELECT * FROM Production.Product AS PP
LEFT JOIN Production.BillOfMaterials AS PB
ON PP.ProductID = PB.BillOfMaterialsID

SELECT PP.Name, PPS.Name FROM Production.Product AS PP
LEFT JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
WHERE PPS.ProductSubcategoryID IS NULL

SELECT * FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID

SELECT PP.Name AS Product_Name, PPS.Name AS SubcategoryName, PPC.Name AS CtegoryName
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PPC
ON PPC.ProductCategoryID = PPS.ProductCategoryID

SELECT PP.Name AS Product_Name, PPM.Name AS Model_Name FROM Production.Product PP
INNER JOIN Production.ProductModel AS PPM
ON PP.ProductModelID = PPM.ProductModelID

SELECT * FROM Production.Product AS PP
LEFT JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID

SELECT * FROM Sales.Customer AS SC
LEFT JOIN Sales.SalesOrderHeader AS SSH
ON SC.CustomerID = SSH.CustomerID

SELECT * FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Production.Product AS PP
ON SOD.ProductID = PP.ProductID
INNER JOIN Production.ProductSubcategory AS PPSC
ON PP.ProductSubcategoryID = PPSC.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PPC
ON PPSC.ProductCategoryID = PPC.ProductCategoryID

SELECT * FROM Sales.SalesPerson AS SSP
INNER JOIN Person.BusinessEntity AS PBE
ON SSP.BusinessEntityID = PBE.BusinessEntityID

SELECT * FROM Sales.Customer AS SC
INNER JOIN Sales.SalesTerritory AS SST
ON SC.TerritoryID = SST.TerritoryID

SELECT * FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Purchasing.ShipMethod AS PSM
ON SOH.ShipMethodID = PSM.ShipMethodID

SELECT  * FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.CreditCard AS SCC
ON SOH.CreditCardID = SCC.CreditCardID


---Day 9 – Joins (RIGHT, FULL, CROSS
          • RIGHT JOIN vs LEFT JOIN
          • FULL OUTER JOIN for unmatched
          • CROSS JOIN = Cartesian product

SELECT * FROM Sales.Customer AS SC
RIGHT JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT * FROM Production.Product AS PP
RIGHT JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID

SELECT * FROM Production.Product AS PP
CROSS JOIN Production.ProductSubcategory  AS PPS

SELECT * FROM Production.Product AS PP
FULL JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID

SELECT * FROM Sales.Customer AS SC
FULL JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT * FROM Sales.SalesTerritory 
CROSS JOIN Sales.CurrencyRate

SELECT SC.CustomerID, SalesOrderID
FROM Sales.Customer AS SC
RIGHT JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT SC.CustomerID, SalesOrderID
FROM Sales.Customer AS SC
FULL JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT PPS.Name AS Product_Name, PPS.Name  AS Category_Name
FROM Production.Product AS PP
FULL JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID

SELECT * FROM Sales.Customer AS SC
CROSS JOIN HumanResources.Employee

SELECT SC.CustomerID,SalesOrderID FROM Sales.Customer AS SC
FULL JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID 
WHERE SalesOrderID IS NULL

SELECT * FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT * FROM Sales.Customer AS SC
FULL JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT P.Name, C.Color FROM Production.Product AS P
CROSS JOIN (SELECT DISTINCT Color FROM Production.Product 
WHERE Color IS NOT NULL) AS C

SELECT SC.CustomerID,ST.TerritoryID FROM Sales.Customer AS SC
CROSS JOIN (SELECT DISTINCT TerritoryID FROM Sales.Customer WHERE TerritoryID IS NOT NULL) AS ST

SELECT PP.Name,PPS.Name FROM Production.Product AS PP
FULL JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
WHERE PPS.Name IS NOT NULL

SELECT PP.Name,PPS.Name FROM Production.Product AS PP
FULL JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
WHERE PPS.Name IS  NULL

SELECT HRE.BusinessEntityID,Name FROM HumanResources.Department AS HRD
LEFT JOIN HumanResources.EmployeeDepartmentHistory  AS HRED
ON HRD.DepartmentID = HRED.DepartmentID
LEFT JOIN HumanResources.Employee AS HRE
ON HRE.BusinessEntityID = HRED.BusinessEntityID

SELECT * FROM Purchasing.ShipMethod
CROSS JOIN Sales.SalesTerritory

SELECT Name,P.Size FROM Production.Product AS P
CROSS JOIN (SELECT DISTINCT Size FROM Production.Product) AS size

---Day 10 – Joins (SELF, Multi-table)
• Self-join (employee-manager)
• 3+ table joins

SELECT p1.BusinessEntityID AS Person1ID, 
p1.FirstName AS Person1FirstName,
p1.LastName AS LastName, p2.BusinessEntityID AS Person2ID, 
p2.FirstName AS Person2FirstName 
FROM Person.Person AS p1 
JOIN Person.Person AS p2 
ON p1.LastName = p2.LastName 
AND p1.BusinessEntityID < p2.BusinessEntityID 

SELECT SalesOrderID,PP.Name,PPC.Name FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Production.Product AS PP
ON SOD.ProductID = PP.ProductID
INNER JOIN Production.ProductSubcategory AS PPSC
ON PP.ProductSubcategoryID = PPSC.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PPC
ON PPSC.ProductCategoryID = PPC.ProductCategoryID

SELECT * FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Production.Product AS PP
ON PP.ProductID = SOD.ProductID

SELECT PP.Name AS ProductName, PPC.Name AS CategoryName, PPS.Name AS SubcategoryName
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PPC
ON PPS.ProductCategoryID  = PPC.ProductCategoryID

SELECT PP.BusinessEntityID, FirstName,LastName,HRD.Name AS DepartmentName FROM HumanResources.Employee AS HRE
INNER JOIN Person.Person AS PP
ON HRE.BusinessEntityID = PP.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HRH
ON PP.BusinessEntityID = HRH.BusinessEntityID
INNER JOIN HumanResources.Department AS HRD
ON HRH.DepartmentID = HRD.DepartmentID

SELECT CustomerID,FirstName,LastName,Name AS Territory FROM Sales.Customer AS SC
INNER JOIN Sales.SalesTerritory AS SST
ON SC.TerritoryID = SST.TerritoryID
INNER JOIN Sales.SalesPerson AS SSP
ON SST.TerritoryID = SSP.TerritoryID
INNER JOIN Person.Person AS PP
ON PP.BusinessEntityID = SSP.BusinessEntityID

SELECT SalesOrderID,BusinessEntityID,Name AS Territory FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesTerritory AS SST 
ON SOH.TerritoryID = SST.TerritoryID
INNER JOIN Sales.SalesPerson AS SSP
ON SST.TerritoryID = SSP.TerritoryID

SELECT SalesOrderID,BillOfMaterialsID, ProductAssemblyID FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Production.Product AS PP
ON SOD.ProductID = PP.ProductID
INNER JOIN Production.BillOfMaterials AS PB
ON PP.ProductID = PB.ProductAssemblyID

SELECT SSR.SalesOrderID,SR.SalesReasonID,Name FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderHeaderSalesReason AS SSR
ON SOH.SalesOrderID = SSR.SalesOrderID
INNER JOIN Sales.SalesReason AS SR
ON SSR.SalesReasonID = SR.SalesReasonID

SELECT E.BusinessEntityID,M.BusinessEntityID,E.JobTitle FROM HumanResources.Employee AS E
JOIN HumanResources.Employee AS M
ON E.BusinessEntityID = M.BusinessEntityID
WHERE E.OrganizationNode = M.BusinessEntityID

SELECT E.BusinessEntityID AS EmployeeID, M.BusinessEntityID AS ManagerID,
E.JobTitle AS EmployeeJob, M.JobTitle AS ManagerJob FROM
HumanResources.Employee AS E
JOIN HumanResources.Employee AS M
ON E.OrganizationNode.IsDescendantOf(M.OrganizationNode) = 1
AND e.BusinessEntityID <> m.BusinessEntityID;


---Day 11 – GROUP BY
• GROUP BY single column
• GROUP BY multiple columns

SELECT  COUNT(Name) AS Total_product FROM Production.Product

SELECT COUNT(CustomerID) AS Total_Customer FROM Sales.Customer

SELECT COUNT(BusinessEntityID) AS Total_Employee FROM HumanResources.Employee

SELECT AVG(ListPrice) AS Avg_Listprice FROM Production.Product

SELECT AVG(StandardCost) AS Avg_Standardcost FROM Production.Product

SELECT SUM(ListPrice) AS Total_Listprice FROM Production.Product

SELECT SUM(TotalDue) AS Totaldue FROM Sales.SalesOrderHeader

SELECT COUNT(SalesOrderID) AS Total_order FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2012

SELECT COUNT (DISTINCT Color) AS Distinct_Color FROM Production.Product

SELECT COUNT(DepartmentID)  AS Sales_department FROM HumanResources.Department
WHERE Name = 'Sales'

SELECT YEAR(SellStartDate) AS Yearly_Revenue, SUM(ListPrice) AS Total_revenue FROM Production.Product
GROUP BY YEAR(SellStartDate)

SELECT SUM(ListPrice),SST.Name FROM Production.Product AS PP
INNER JOIN Sales.SalesTerritoryHistory  AS ST
ON PP.ProductID = ST.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS SST
ON ST.TerritoryID = SST.TerritoryID
GROUP BY SST.Name

SELECT SUM(OrderQty * UnitPrice) AS Total_revenue FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID

SELECT AVG(OrderQty * UnitPrice) AS Avg_revenue FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID

SELECT AVG(ListPrice),PC.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PPS
ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PPS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name

SELECT SUM(ListPrice), Name FROM Production.Product
GROUP BY Name

SELECT SUM(VacationHours) AS Total_Vacation, HRD.Name
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDE
ON HE.BusinessEntityID = HDE.BusinessEntityID
INNER JOIN HumanResources.Department AS HRD
ON HDE.DepartmentID = HRD.DepartmentID
GROUP BY HRD.Name

SELECT AVG(SickLeaveHours) AS Total_Vacation, HRD.Name
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDE
ON HE.BusinessEntityID = HDE.BusinessEntityID
INNER JOIN HumanResources.Department AS HRD
ON HDE.DepartmentID = HRD.DepartmentID
GROUP BY HRD.Name

SELECT AVG(OrderQty),Name FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID 
GROUP BY Name

SELECT  TOP 5 CustomerID, SUM(OrderQty * UnitPrice) AS Total_Revenue
FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY CustomerID
ORDER BY Total_Revenue DESC

SELECT TOP 5 Name, SUM(OrderQty * UnitPrice) AS Total_Revenue
FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Production.Product AS PP
ON SOD.ProductID = PP.ProductID
GROUP BY Name
ORDER BY Total_Revenue DESC

SELECT SOH.CustomerID,AVG(SOD.OrderQty * SOD.UnitPrice) AS Avg_Revenue
FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY CustomerID
HAVING AVG(SOD.OrderQty * SOD.UnitPrice) > (SELECT AVG(OrderQty * UnitPrice) FROM Sales.SalesOrderDetail)

SELECT BusinessEntityID,JobTitle,VacationHours 
FROM HumanResources.Employee 
WHERE VacationHours > (SELECT AVG(VacationHours) FROM HumanResources.Employee)

SELECT PS.Name, AVG(PP.ListPrice) FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PC
ON PP.ProductSubcategoryID = PC.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PS
ON PC.ProductCategoryID = PS.ProductCategoryID 
GROUP BY PS.Name
HAVING AVG(PP.ListPrice)  > (SELECT AVG(ListPrice) AS Overall_average FROM  Production.Product)

SELECT Name,SUM(SOD.OrderQty * SOD.UnitPrice) AS Total_Revenue FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SOH.TerritoryID = ST.TerritoryID
GROUP BY Name
HAVING SUM(OrderQty * UnitPrice) > (SELECT AVG(OrderQty * UnitPrice) AS Average 
FROM Sales.SalesOrderDetail)

SELECT 
        MONTH(OrderDate), YEAR(OrderDate),
        SUM(OrderQty * UnitPrice)  AS Revenue FROM Sales.SalesOrderHeader AS SOH
        INNER JOIN Sales.SalesOrderDetail AS SOD
        ON SOH.SalesOrderID = SOD.SalesOrderID
        GROUP BY MONTH(OrderDate), Year(OrderDate)
        HAVING SUM(OrderQty * UnitPrice)  > 
        (SELECT AVG(MonthlyRevenue)
        FROM(
        SELECT YEAR(OrderDate),
        MONTH(OrderDate),
        SUM(OrderQty * UnitPrice) AS MonthlyRevenue 
        FROM Sales.SalesOrderHeader AS SOH2
        INNER JOIN  Sales.SalesOrderDetail AS SOD
        ON SOH2.SalesOrderID = SOD.SalesOrderID
        GROUP BY MONTH(OrderDate), YEAR(OrderDate)
         ) AS MonthlySummary
         )

SELECT 
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
    ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING SUM(OrderQty * UnitPrice) > (
    SELECT AVG(MonthlyRevenue)
    FROM (
        SELECT YEAR(OrderDate) AS SalesYear,
               MONTH(OrderDate) AS SalesMonth,
               SUM(OrderQty * UnitPrice) AS MonthlyRevenue
        FROM Sales.SalesOrderHeader AS SOH2
        INNER JOIN Sales.SalesOrderDetail AS SOD2
            ON SOH2.SalesOrderID = SOD2.SalesOrderID
        GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ) AS MonthlySummary
);
SELECT AVG(ListPrice) FROM Production.Product
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM HumanResources.Department
SELECT * FROM Sales.Customer
SELECT * FROM Production.Product
SELECT DISTINCT YEAR(SellStartDate) FROM Production.Product
SELECT * FROM HumanResources.Employee

SELECT CustomerID, SUM(OrderQty * UnitPrice) AS Revenue FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY CustomerID
HAVING SUM(OrderQty * UnitPrice) > 10000

SELECT BusinessEntityID, SalesYTD FROM Sales.SalesPerson
GROUP BY BusinessEntityID,SalesYTD
HAVING  SalesYTD > 1000000


---DAY 12 : Aggregation – MIN, MAX, GROUP BY

SELECT MIN(ListPrice)  AS Minimum_Price FROM Production.Product

SELECT MAX(ListPrice)  AS Minimum_Price FROM Production.Product

SELECT HireDate FROM HumanResources.Employee
ORDER BY HireDate ASC

SELECT HireDate FROM HumanResources.Employee
ORDER BY HireDate DESC

SELECT OrderDate FROM Sales.SalesOrderHeader
ORDER BY OrderDate ASC

SELECT OrderDate FROM Sales.SalesOrderHeader
ORDER BY OrderDate DESC

SELECT Name, MIN(UnitPrice) AS Minimum_Price FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
GROUP BY Name

SELECT Name, MAX(UnitPrice) AS Minimum_Price FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
GROUP BY Name

SELECT  TOP 1 BusinessEntityID, MIN(VacationHours) AS Min_VacationHrs FROM HumanResources.Employee
GROUP BY BusinessEntityID,VacationHours
ORDER BY VacationHours ASC

SELECT  TOP 1 BusinessEntityID, MIN(VacationHours) AS Min_VacationHrs FROM HumanResources.Employee
GROUP BY BusinessEntityID,VacationHours
ORDER BY VacationHours DESC

SELECT  TOP 1 BusinessEntityID, MIN(VacationHours) AS Min_VacationHrs FROM HumanResources.Employee
GROUP BY BusinessEntityID,VacationHours
ORDER BY VacationHours DESC

SELECT  TOP 1 BusinessEntityID, MAX(SickLeaveHours) AS Min_SickLeaveHrs FROM HumanResources.Employee
GROUP BY BusinessEntityID,SickLeaveHours
ORDER BY SickLeaveHours DESC


SELECT Name, MIN(UnitPrice) AS Minimum_Price, MAX(UnitPrice) AS Max_Price FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
GROUP BY Name

SELECT TOP 1 MIN(HE.HireDate) AS Min_Hiredate, MAX(HE.HireDate) AS Max_HireDate, HD.Name FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
ON HE.BusinessEntityID = HDH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HDH.DepartmentID = HD.DepartmentID
WHERE EndDate IS NULL
GROUP BY HD.Name
Order BY Min_Hiredate  ASC, Max_HireDate DESC

SELECT HD.Name, HE.BusinessEntityID, HE.HireDate, HDH.StartDate, HDH.EndDate
FROM HumanResources.Employee HE
JOIN HumanResources.EmployeeDepartmentHistory HDH
  ON HE.BusinessEntityID = HDH.BusinessEntityID
JOIN HumanResources.Department HD
  ON HDH.DepartmentID = HD.DepartmentID
WHERE HDH.EndDate IS NOT NULL
ORDER BY HD.Name, HE.HireDate;

SELECT PS.Name,MIN(UnitPrice) AS Min_Unitprice,MAX(UnitPrice) AS Max_UnitPrice FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
GROUP BY PS.Name
ORDER BY Min_Unitprice ASC,Max_UnitPrice DESC

SELECT SC.CustomerID,MIN(OrderDate) AS Early, MAX(OrderDate) AS Late
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID
GROUP BY SC.CustomerID
ORDER BY Early ASC, Late DESC

SELECT Name, MIN(SickLeaveHours) AS Min_Sickleave, MAX(SickLeaveHours) 
AS Max_SickLeave FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.Department AS HD
ON HE.BusinessEntityID = HD.DepartmentID
GROUP BY Name
ORDER BY Min_Sickleave ASC, Max_SickLeave DESC

SELECT Name, MIN(OrderDate) AS Min_OrderDate, MAX(OrderDate) AS Max_OrderDate
FROM Sales.SalesOrderHeader AS SC
INNER JOIN Sales.SalesTerritory AS ST
ON SC.TerritoryID = ST.TerritoryID 
GROUP BY Name
ORDER BY Min_OrderDate ASC, Max_OrderDate DESC

SELECT TOP 1 COUNT(SalesOrderID) Total_Order,Name FROM Production.Product AS PP
INNER JOIN SALES.SalesOrderDetail AS SOD
ON PP.ProductID  = SOD.ProductID
GROUP BY Name
ORDER BY Total_Order DESC

SELECT TOP 1 BusinessEntityID, SalesYTD
FROM Sales.SalesPerson AS SP
ORDER BY SalesYTD ASC

SELECT TOP 1 BusinessEntityID, SalesYTD
FROM Sales.SalesPerson AS SP
ORDER BY SalesYTD DESC

SELECT TOP 1 Weight , PS.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
ORDER BY Weight DESC 

SELECT TOP 1 Weight , PS.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
ORDER BY Weight ASC

SELECT  TOP 1 SalesOrderID,OrderDate,Name FROM Sales.SalesOrderHeader AS SH
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID 
ORDER BY OrderDate ASC

SELECT  TOP 1 SalesOrderID,OrderDate,Name FROM Sales.SalesOrderHeader AS SH
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID 
ORDER BY OrderDate DESC

SELECT CustomerID,  DATEDIFF(DAY,MIN(OrderDate),MAX(OrderDate)) AS Active_Order
FROM Sales.SalesOrderHeader
HAVING DATEDIFF(DAY,MIN(OrderDate),MAX(OrderDate)) > (SELECT MAX(DATEDIFF(DAY, MIN(OrderDate), MAX(OrderDate))) 
 FROM Sales.SalesOrderHeader 
 GROUP BY CustomerID)

SELECT TOP 1 BusinessEntityID,DATEDIFF(MONTH,StartDate,EndDate) AS Min_tenure
FROM HumanResources.EmployeeDepartmentHistory
WHERE EndDate IS NOT NULL
ORDER BY Min_tenure ASC

SELECT TOP 1 BusinessEntityID,DATEDIFF(MONTH,StartDate,EndDate) AS Min_tenure
FROM HumanResources.EmployeeDepartmentHistory
WHERE EndDate IS NOT NULL
ORDER BY Min_tenure DESC

SELECT TOP 1 Name, ListPrice-StandardCost AS Margin
FROM Production.Product 
ORDER BY Margin DESC

SELECT TOP 1 PC.Name,Weight FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PC
ON PP.ProductSubcategoryID = PC.ProductSubcategoryID
ORDER BY Weight DESC

SELECT HE.BusinessEntityID AS EmployeeID, MD.BusinessEntityID AS ManagerID ,CONCAT(FirstName, ' ', LasTName) AS Employee_Name,
HE.OrganizationNode.ToString() AS EmployeeNode, md.OrganizationNode.GetAncestor(1).ToString() AS ManagerNode
FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
INNER JOIN HumanResources.Employee AS MD
ON MD.BusinessEntityID = HE.BusinessEntityID
WHERE HE.OrganizationNode IS NOT NULL

SELECT HE.BusinessEntityID AS EmployeeID, MD.BusinessEntityID AS ManagerID ,CONCAT(FirstName, ' ', LasTName) AS Employee_Name,
HE.OrganizationNode.ToString() AS EmployeeNode, md.OrganizationNode.GetAncestor(2).ToString() AS ManagerNode
FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
INNER JOIN HumanResources.Employee AS MD
ON MD.BusinessEntityID = HE.BusinessEntityID
WHERE HE.OrganizationNode IS NOT NULL

SELECT HE.BusinessEntityID AS EmployeeID, MD.BusinessEntityID AS ManagerID,
HE.OrganizationNode.ToString() AS EmployeeNode
FROM HumanResources.Employee AS HE
JOIN HumanResources.Employee AS MD
ON MD.OrganizationNode = HE.OrganizationNode
WHERE HE.OrganizationNode.IsDescendantOf(MD.OrganizationNode) = 1

SELECT HE.BusinessEntityID AS EmployeeID, MD.BusinessEntityID AS ManagerID ,CONCAT(FirstName, ' ', LasTName) AS Employee_Name,
HE.OrganizationNode.ToString() AS EmployeeNode, md.OrganizationNode.GetAncestor(1).ToString() AS ManagerNode
FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
INNER JOIN HumanResources.Employee AS MD
ON MD.BusinessEntityID = HE.BusinessEntityID
WHERE HE.OrganizationNode IS NOT NULL
GROUP BY HE.BusinessEntityID

---Day 13 Aggregation – HAVING

SELECT PC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PC.Name
HAVING COUNT(PP.Name) > 10

SELECT PS.Name AS SubCategoryName FROM Production.ProductSubcategory AS PS
INNER JOIN Production.Product AS PP
ON PS.ProductSubcategoryID = PP.ProductSubcategoryID
GROUP BY PS.Name
HAVING COUNT(PP.Name) > 5

SELECT Name FROM HumanResources.Department AS HD
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH
ON HD.DepartmentID = HH.DepartmentID
WHERE EndDate IS NOT NULL
GROUP BY Name
HAVING COUNT(BusinessEntityID) > 50

SELECT Name FROM SaleS.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SD
ON ST.TerritoryID = SD.TerritoryID
GROUP BY Name
HAVING COUNT(SalesOrderID) > 100

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN SALES.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
GROUP BY SC.CustomerID
HAVING COUNT(OrderDate) > 1

SELECT BusinessEntityID FROM Sales.SalesPerson AS SP
INNER JOIN Sales.SalesOrderHeader AS SH
ON SP.BusinessEntityID = SH.SalesPersonID
GROUP BY BusinessEntityID
HAVING COUNT(*) > 50

SELECT PC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PC.Name
HAVING AVG(ListPrice) > 1000

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN SALES.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID
HAVING SUM(OrderQty * UnitPrice) > 5000

SELECT Name FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID
GROUP BY Name
HAVING SUM(OrderQty * UnitPrice) > 100

SELECT CONCAT(FirstName, ' ', LastName)  AS EmployeeName FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
GROUP BY CONCAT(FirstName, ' ', LastName) 
HAVING SUM(SickLeaveHours) > 100

SELECT Name FROM SaleS.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SH
ON ST.TerritoryID = SH.TerritoryID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.TerritoryID = ST.TerritoryID
GROUP BY Name
HAVING SUM(OrderQty * UnitPrice) > 1000000

SELECT Name FROM HumanResources.Department AS HD
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HED
ON HD.DepartmentID = HED.DepartmentID
INNER JOIN HumanResources.Employee AS HE
ON HED.BusinessEntityID  = HE.BusinessEntityID
GROUP BY Name
HAVING AVG(VacationHours) > 50

SELECT PC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PC.Name 
HAVING MIN(ListPrice) > 500

SELECT PsC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PSC.Name 
HAVING MAx(ListPrice) > 2000

SELECT BusinessEntityID FROM Sales.SalesPerson 
GROUP BY BusinessEntityID
HAVING SUM(SalesYTD)  > (SELECT AVG(SalesYTD) FROM Sales.SalesPerson)

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN SALES.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID
HAVING AVG(OrderQty * UnitPrice) > 1000

SELECT PC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PC.Name
HAVING COUNT(PSC.Name) > 3

SELECT HE.BusinessEntityID FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
ON HE.BusinessEntityID = HDH.BusinessEntityID
GROUP BY HE.BusinessEntityID
HAVING MAX(DATEDIFF(YEAR,StartDate,EndDate))  > 20

SELECT PC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PC.Name
HAVING SUM(ListPrice) > (SELECT AVG(ListPrice) FROM Production.Product)

SELECT PSC.Name AS CategoryName FROM Production.ProductCategory AS PC
INNER JOIN Production.ProductSubcategory AS PSC
ON PC.ProductCategoryID = PSC.ProductCategoryID
INNER JOIN Production.Product AS PP
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID 
GROUP BY PSC.Name
HAVING AVG(ListPrice) > (SELECT AVG(PP2.ListPrice)
    FROM Production.ProductSubcategory AS PSC2
    INNER JOIN Production.Product AS PP2
        ON PP2.ProductSubcategoryID = PSC2.ProductSubcategoryID
    WHERE PSC2.ProductCategoryID = PSC.ProductCategoryID
)

SELECT CONCAT(FirstName,' ' ,LastName) AS EmployeeName
FROM Person.Person AS PE
INNER JOIN HumanResources.Employee AS HE
ON PE.BusinessEntityID = HE.BusinessEntityID
GROUP BY CONCAT(FirstName,' ' ,LastName) 
HAVING MAX(SickLeaveHours) > (SELECT AVG(SickLeaveHours) FROM HumanResources.Employee)

SELECT SC.CustomerID FROM SALES.Customer AS SC
INNER JOIN Sales.SalesTerritory AS ST
ON SC.TerritoryID = ST.TerritoryID
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail SOD
ON SH.SalesOrderID = SOD.SalesOrderID
GROUP  BY SC.CustomerID,ST.TerritoryID
HAVING SUM(OrderQty * UnitPrice) > (SELECT AVG(Revenue)
                                    FROM( SELECT ST2.Name,
                        SUM(OrderQty * UnitPrice) AS Revenue
                                FROM Sales.SalesOrderDetail AS SD2
                                INNER JOIN Sales.SalesOrderHeader AS SOH
                                ON SD2.SalesOrderID = SOH.SalesOrderID
                                INNER JOIN Sales.Customer AS SC2
                                ON SOH.CustomerID = SC2.CustomerID
                                INNER JOIN SALES.SalesTerritory AS ST2
                                ON SC2.TerritoryID = ST2.TerritoryID
                                AND ST2.TerritoryID = ST.TerritoryID
                                WHERE ST2.TerritoryID = ST.TerritoryID
                                GROUP BY ST2.Name) AS Territory)

SELECT PP.Name, SUM(OrderQty * UnitPrice) AS Revenue FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD 
ON PP.ProductID = SOD.ProductID
INNER JOIN Production.ProductSubcategory AS PSC2
ON PP.ProductSubcategoryID = PSC2.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC2
ON PSC2.ProductCategoryID = PC2.ProductCategoryID
GROUP BY PP.Name,PC2.ProductCategoryID
HAVING SUM(OrderQty * UnitPrice)  > (
                                        SELECT AVG(ProductRevenue)
                        FROM(
                        SELECT PP2.ProductID,SUM(SD2.OrderQty * SD2.UnitPrice) AS ProductRevenue
                FROM Production.Product AS PP2
                INNER JOIN Sales.SalesOrderDetail AS SD2
                ON PP2.ProductID = SD2.ProductID
                INNER JOIN Production.ProductSubcategory AS PSC
                ON PP2.ProductSubcategoryID = PSC.ProductSubcategoryID
                INNER JOIN Production.ProductCategory AS PC
                ON PSC.ProductCategoryID = PC.ProductCategoryID
                WHERE PC.ProductCategoryID = PC2.ProductCategoryID 
                GROUP BY PP2.ProductID) AS CategoryProducts)

SELECT HD.Name FROM HumanResources.Department AS HD
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
ON HD.DepartmentID = HDH.DepartmentID
INNER JOIN HumanResources.Employee AS HE
ON  HE.BusinessEntityID = HDH.BusinessEntityID
GROUP BY HD.Name
HAVING SUM(VacationHours) > (SELECT AvgVacation
                            FROM
                            (SELECT AVG(VacationHours) AS AvgVacation
                            FROM HumanResources.Department AS HD2
                            INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH2
                            ON HD2.DepartmentID = HDH2.DepartmentID
                            INNER JOIN HumanResources.Employee AS HE2
                            ON  HE2.BusinessEntityID = HDH2.BusinessEntityID
                            WHERE HD.Name = HD2.Name
                            GROUP BY Name) AS Department)


 ---Day 14 : Mini-project – Customer & Product Analysis

SELECT COUNT(*) FROM Sales.Customer

SELECT COUNT(*) FROM Sales.SalesOrderHeader

SELECT COUNT(*) FROM Production.Product

SELECT COUNT(*) FROM HumanResources.Employee

SELECT SC.CustomerID, SalesOrderID FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID

SELECT PP.Name, PSC.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PSC
ON PP.ProductSubcategoryID = PSC.ProductSubcategoryID

SELECT HD.Name,HE.BusinessEntityID FROM HumanResources.Department AS HD
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
ON HD.DepartmentID = HDH.DepartmentID
INNER JOIN HumanResources.Employee AS HE
ON HE.BusinessEntityID = HDH.BusinessEntityID 

SELECT CustomerID, Name FROM Sales.Customer AS SC
INNER JOIN Sales.SalesTerritory AS ST
ON SC.TerritoryID = ST.TerritoryID

SELECT SalesOrderID, BusinessEntityID FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesPerson AS SP
ON SOH.SalesPersonID = S

SELECT SalesOrderID, Name FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Purchasing.ShipMethod AS SM
ON SOH.ShipMethodID = SM.ShipMethodID

SELECT SC.CustomerID,SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.Customer AS SC
ON SOH.CustomerID = SC.CustomerID 
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SC.CustomerID

SELECT Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
GROUP BY Name

SELECT Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesTerritory AS ST
INNER JOIN SALES.SalesOrderHeader AS SOH
ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN SALES.SalesOrderDetail AS SD
ON SOH.SalesOrderID = SD.SalesOrderID
GROUP BY Name

SELECT SUM(OrderQty * UnitPrice) AS Revenue, YEAR(OrderDate) 
FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID 
GROUP BY YEAR(OrderDate)

SELECT SC.CustomerID,AVG(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.Customer AS SC
ON SOH.CustomerID = SC.CustomerID 
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SC.CustomerID

SELECT BusinessEntityID,AVG(SalesYTD) AS Avg_Revenue FROM Sales.SalesPerson AS SP
GROUP BY BusinessEntityID

SELECT TOP 5 SC.CustomerID,SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.Customer AS SC
ON SOH.CustomerID = SC.CustomerID 
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SC.CustomerID
ORDER BY Revenue DESC

SELECT  TOP 5 Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
GROUP BY Name
ORDER BY Revenue DESC

SELECT TOP 5 BusinessEntityID,SUM(SalesYTD) AS Avg_Revenue FROM Sales.SalesPerson AS SP
GROUP BY BusinessEntityID
ORDER BY Avg_Revenue DESC

SELECT TOP 5  Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesTerritory AS ST
INNER JOIN SALES.SalesOrderHeader AS SOH
ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN SALES.SalesOrderDetail AS SD
ON SOH.SalesOrderID = SD.SalesOrderID
GROUP BY Name
ORDER BY Revenue DESC

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID 
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SD.SalesOrderID = SOH.SalesOrderID 
INNER JOIN Sales.SalesTerritory AS ST
ON SOH.TerritoryID = ST.TerritoryID
GROUP BY PP.Name 
HAVING COUNT(DISTINCT ST.TerritoryID) > 3

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SOD
ON SC.CustomerID = SOD.CustomerID 
WHERE YEAR(OrderDate) >= 2010
GROUP BY SC.CustomerID
HAVING COUNT(DISTINCT YEAR(OrderDate)) = (
    SELECT COUNT(DISTINCT YEAR(OrderDate))
    FROM Sales.SalesOrderHeader
    WHERE YEAR(OrderDate) >= 2010
)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SOD
ON PP.ProductID = SOD.ProductID
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
WHERE YEAR(OrderDate) >= 2010
GROUP BY PP.Name 
HAVING COUNT(DISTINCT YEAR(OrderDate)) = (
                                            SELECT COUNT(DISTINCT YEAR(OrderDate))
                                            FROM Sales.SalesOrderHeader
                                            WHERE YEAR(OrderDate) >= 2010
                                            )


SELECT 
    cur.SalesPersonID,
    cur.OrderYear,
    cur.Revenue,
    prev.Revenue AS PrevRevenue
    FROM(SELECT SalesPersonID, YEAR(OrderDate) AS OrderYear,SUM(OrderQty * UnitPrice)  AS Revenue FROM Sales.SalesPerson AS SP
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SP.BusinessEntityID = SOH.SalesPersonID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID, YEAR(OrderDate)) cur
JOIN(
         SELECT 
                   SalesPersonID, YEAR(OrderDate) AS OrderYear,SUM(OrderQty * UnitPrice) AS Revenue FROM Sales.SalesPerson AS SP
                    INNER JOIN Sales.SalesOrderHeader AS SOH
                    ON SP.BusinessEntityID = SOH.SalesPersonID
                     INNER JOIN Sales.SalesOrderDetail AS SOD
                    ON SOH.SalesOrderID = SOD.SalesOrderID
                    WHERE SalesPersonID IS NOT NULL
                    GROUP BY SalesPersonID, YEAR(OrderDate)) prev      
                    ON cur.SalesPersonID = prev.SalesPersonID
                    AND cur.OrderYear = prev.OrderYear + 1
                    WHERE cur.Revenue >=2 * prev.Revenue

SELECT curr.Name,
        curr.OrderYear,
        curr.Revenue,
        previous.Revenue AS PrevRevenue
FROM(
SELECT Name, YEAR(OrderDate) AS OrderYear, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesTerritory AS ST
ON SOH.TerritoryID = ST.TerritoryID 
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY Name, YEAR(OrderDate)) curr
JOIN(
            SELECT Name, YEAR(OrderDate) AS OrderYear, SUM(OrderQty * UnitPrice) AS Revenue
            FROM Sales.SalesOrderHeader AS SOH
            INNER JOIN Sales.SalesTerritory AS ST
            ON SOH.TerritoryID = ST.TerritoryID 
            INNER JOIN Sales.SalesOrderDetail AS SOD
            ON SOH.SalesOrderID = SOD.SalesOrderID
            GROUP BY Name, YEAR(OrderDate)) previous
            ON curr.Name = previous.Name
            AND curr.OrderYear = previous.OrderYear + 1


---Day 15 :Subqueries – Simple

SELECT Name FROM Production.Product AS PP
GROUP BY Name
HAVING SUM(ListPrice) > (SELECT AVG(ListPrice) FROM Production.Product AS PP)

SELECT BusinessEntityID FROM HumanResources.Employee
GROUP BY BusinessEntityID
HAVING SUM(DATEDIFF(YEAR,BirthDate,GETDATE())) > (SELECT AVG(DATEDIFF(YEAR,BirthDate,GETDATE()))
FROM HumanResources.Employee)

SELECT Name FROM Production.Product
GROUP BY Name
HAVING SUM(StandardCost) > (SELECT AVG(StandardCost) FROM Production.Product)

SELECT BusinessEntityID FROM HumanResources.Employee 
GROUP BY BusinessEntityID
HAVING SUM(VacationHours) > (SELECT AVG(VacationHours) FROM HumanResources.Employee)

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID 
INNER JOIN Sales.SalesOrderDetail AS SD
ON SD.SalesOrderID = SH.SalesOrderID 
GROUP BY SC.CustomerID
HAVING SUM(OrderQty * UnitPrice) > (SELECT AVG(OrderQty * UnitPrice) FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID 
INNER JOIN Sales.SalesOrderDetail AS SD
ON SD.SalesOrderID = SH.SalesOrderID )

SELECT Name FROM Production.Product
GROUP BY Name
HAVING SUM(Weight) > (SELECT AVG(Weight) FROM Production.Product)

SELECT BusinessEntityID FROM HumanResources.Employee 
GROUP BY BusinessEntityID
HAVING SUM(SickLeaveHours) > (SELECT AVG(SickLeaveHours) FROM HumanResources.Employee)

SELECT SalesOrderID FROM Sales.SalesOrderHeader
GROUP BY SalesOrderID
HAVING SUM(TotalDue) > (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader)

SELECT CustomerID FROM Sales.Customer AS SC
INNER JOIN Sales.SalesTerritory AS ST
ON SC.TerritoryID = ST.TerritoryID
GROUP BY CustomerID
HAVING COUNT(DISTINCT Name) > (SELECT AVG(Dst) FROM
                    (SELECT COUNT(DISTINCT Name) AS Dst FROM 
                    Sales.Customer AS SC
                    INNER JOIN Sales.SalesTerritory AS ST
                     ON SC.TerritoryID = ST.TerritoryID) AS Dst)

SELECT CONCAT(FirstName,' ',LastName) AS EmployeeName FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
WHERE  HireDate > (SELECT MIN(HireDate) FROM HumanResources.Employee)

SELECT Name, ListPrice FROM Production.Product 
WHERE ListPrice > ANY(SELECT ListPrice
                    FROM Production.Product
                    WHERE ProductSubcategoryID = 5)

SELECT Name FROM Production.Product
WHERE ListPrice > (SELECT MAX(ListPrice) FROM Production.Product
WHERE ProductSubcategoryID = 10)

SELECT SC.CustomerID FROM sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SC.CustomerID
HAVING SUM(OrderQty * UnitPrice) > ANY(SELECT SUM(OrderQty * UnitPrice)
FROM Sales.SalesOrderDetail AS SD
    INNER JOIN Sales.SalesOrderHeader AS SOH2
        ON SD.SalesOrderID = SOH2.SalesOrderID
WHERE SOH2.TerritoryID = 1
GROUP BY SOH2.SalesOrderID)

SELECT CONCAT(FirstName,' ',LastName) AS EmployeeName FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
WHERE VacationHours >  ANY (SELECT VacationHours FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH 
ON HE.BusinessEntityID = HDH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HDH.DepartmentID = HD.DepartmentID
WHERE HD.Name = 'Sales')

SELECT Name FROM Production.Product 
WHERE StandardCost > ANY(SELECT StandardCost FROM Production.Product
WHERE ProductSubcategoryID = 20)

SELECT SC.CustomerID FROM Sales.Customer SC
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SC.CustomerID
HAVING COUNT(OrderQty) > ANY(SELECT COUNT(OrderQty) FROM Sales.Customer SC
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SC.CustomerID = SOH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE SC.TerritoryID = 5)

SELECT SOD.SalesOrderID FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.Customer AS SC
ON SOH.CustomerID = SC.CustomerID
GROUP BY SOD.SalesOrderID
HAVING SUM(OrderQty * UnitPrice) > (SELECT Revenue
FROM( SELECT SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderDetail AS SOD2
INNER JOIN Sales.SalesOrderHeader AS SOH2
ON SOD2.SalesOrderID = SOH2.SalesOrderID
INNER JOIN Sales.Customer AS SC2
ON SOH2.CustomerID = SC2.CustomerID
WHERE SC2.CustomerID = 11000
GROUP BY SC2.CustomerID) AS Revenue)

SELECT Name FROM Production.Product AS P
WHERE ListPrice
> (SELECT MIN(ListPrice)
    FROM Production.Product AS P2
    WHERE P2.ProductSubcategoryID = P.ProductSubcategoryID
)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.ListPrice  = (SELECT MAX(PP2.ListPrice)
                    FROM Production.Product AS PP2
INNER JOIN Production.ProductSubcategory AS PS2
ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC2
ON PS2.ProductCategoryID = PC2.ProductCategoryID
WHERE  PC.ProductCategoryID = PC2.ProductCategoryID)

SELECT SC.CustomerID,
       SC.TerritoryID,
       COUNT(SH.SalesOrderID) AS OrderCount
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
    ON SC.CustomerID = SH.CustomerID
GROUP BY SC.CustomerID, SC.TerritoryID
HAVING COUNT(SH.SalesOrderID) = (
    SELECT MAX(CustomerOrders)
    FROM (
        SELECT COUNT(SH2.SalesOrderID) AS CustomerOrders
        FROM Sales.Customer AS SC2
        INNER JOIN Sales.SalesOrderHeader AS SH2
            ON SC2.CustomerID = SH2.CustomerID
        WHERE SC2.TerritoryID = SC.TerritoryID
        GROUP BY SC2.CustomerID
    ) AS Sub
)

SELECT HE.BusinessEntityID, DP.Name FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HD
ON HE.BusinessEntityID = HD.BusinessEntityID
INNER JOIN HumanResources.Department AS DP
ON HD.DepartmentID = DP.DepartmentID
WHERE HE.VacationHours
 = (SELECT MAX(HE2.VacationHours) FROM HumanResources.Employee AS HE2
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HD2
ON HE2.BusinessEntityID = HD2.BusinessEntityID
INNER JOIN HumanResources.Department AS DP2
ON HD2.DepartmentID = DP2.DepartmentID
WHERE DP.Name = DP2.Name)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.ListPrice  = (SELECT MIN(PP2.ListPrice)
                    FROM Production.Product AS PP2
INNER JOIN Production.ProductSubcategory AS PS2
ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC2
ON PS2.ProductCategoryID = PC2.ProductCategoryID
WHERE  PC.ProductCategoryID = PC2.ProductCategoryID)

SELECT HE.BusinessEntityID, HireDate FROM  HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HD
ON HE.BusinessEntityID = HD.BusinessEntityID
INNER JOIN HumanResources.Department AS DP
ON HD.DepartmentID = DP.DepartmentID
WHERE  HE.HireDate = (SELECT MIN(HE.HireDate)  FROM  HumanResources.Employee AS HE2
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HD2
ON HE2.BusinessEntityID = HD2.BusinessEntityID
INNER JOIN HumanResources.Department AS DP2
ON HD2.DepartmentID = DP2.DepartmentID
WHERE HE.HireDate = HE2.HireDate)


---Day 16 : Subqueries – Correlated

SELECT PP.Name FROM Production.Product  AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product AS PP2
                    WHERE  PP2.ProductSubcategoryID = PP.ProductSubcategoryID)

SELECT HE.BusinessEntityID FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
ON HE.BusinessEntityID = HDH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HDH.DepartmentID = HD.DepartmentID
WHERE VacationHours > (SELECT AVG(VacationHours) FROM HumanResources.Employee AS HE2
                        INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH2
                        ON HE2.BusinessEntityID = HDH2.BusinessEntityID
                        INNER JOIN HumanResources.Department AS HD2
                          ON HDH2.DepartmentID = HD2.DepartmentID
                          WHERE HDH2.DepartmentID = HD2.DepartmentID)

SELECT SC.CustomerID  FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SOD
ON SH.SalesOrderID = SOD.SalesOrderID
GROUP BY SC.CustomerID, SH.TerritoryID
HAVING SUM(SOD.OrderQty) > (SELECT AVG(Quantity)  FROM (
                            SELECT SUM(OrderQty) AS Quantity
                            FROM Sales.Customer AS SC2
                            INNER JOIN Sales.SalesOrderHeader AS SH2
                            ON SC2.CustomerID = SH2.CustomerID
                            INNER JOIN Sales.SalesOrderDetail AS SOD2
                            ON SH2.SalesOrderID = SOD2.SalesOrderID
                            WHERE SH.TerritoryID = SH2.TerritoryID
                            GROUP BY SC2.CustomerID) AS T_Amount)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE StandardCost > (SELECT AVG(Standardcost) FROM Production.Product AS PP2
                        INNER JOIN Production.ProductSubcategory AS PS2
                        ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID
                        INNER JOIN Production.ProductCategory AS PC2
                        ON PS2.ProductCategoryID = PC2.ProductCategoryID
                        WHERE PC.ProductCategoryID = PC2.ProductCategoryID)

SELECT HE.BusinessEntityID from HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH
ON HE.BusinessEntityID = HH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HH.DepartmentID = HD.DepartmentID
GROUP BY HE.BusinessEntityID,HH.DepartmentID,HE.BirthDate
HAVING DATEDIFF(YEAR, BirthDate,GETDATE()) > (SELECT AVG(Yr) FROM(
SELECT DATEDIFF(YEAR,BirthDate,GETDATE()) AS Yr
FROM HumanResources.Employee AS HE2
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH2
ON HE2.BusinessEntityID = HH2.BusinessEntityID
INNER JOIN HumanResources.Department AS HD2
ON HH2.DepartmentID = HD2.DepartmentID
WHERE HH.DepartmentID = HH2.DepartmentID) AS Department)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.Weight > (SELECT AVG(Weight) FROM Production.Product AS PP2
INNER JOIN Production.ProductSubcategory AS PS2
ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC2
ON PS2.ProductCategoryID = PC2.ProductCategoryID
WHERE PP.ProductSubcategoryID = PP2.ProductSubcategoryID)

SELECT HE.BusinessEntityID  from HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH
ON HE.BusinessEntityID = HH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HH.DepartmentID = HD.DepartmentID
WHERE SickLeaveHours > (SELECT AVG(SickLeaveHours) FROM HumanResources.Employee AS HE2
                        INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH2
                        ON HE2.BusinessEntityID = HH2.BusinessEntityID
                        INNER JOIN HumanResources.Department AS HD2
                         ON HH2.DepartmentID = HD2.DepartmentID
                            WHERE HD.DepartmentID = HD2.DepartmentID)

SELECT PP.Name  AS ProductName, PP.ListPrice AS ListPrice, PS.Name AS SubcategoryName FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.ListPrice = (SELECT MAX(ListPrice) FROM Production.Product AS PP2
                    WHERE PP.ProductSubcategoryID = PP2.ProductSubcategoryID)

SELECT HE.BusinessEntityID from HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH
ON HE.BusinessEntityID = HH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HH.DepartmentID = HD.DepartmentID
GROUP BY HE.BusinessEntityID, HH.DepartmentID,HE.BirthDate
HAVING DATEDIFF(YEAR,BirthDate,GETDATE()) = (SELECT MAX(Age) FROM(
SELECT DATEDIFF(YEAR,BirthDate,GETDATE())  AS Age FROM HumanResources.Employee AS HE2
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH2
ON HE2.BusinessEntityID = HH2.BusinessEntityID
WHERE HH.DepartmentID = HH2.DepartmentID) AS Employee)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.ListPrice = (SELECT MIN(ListPrice) FROM Production.Product AS PP2
                        INNER JOIN Production.ProductSubcategory AS PS2
                        ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID 
                        INNER JOIN Production.ProductCategory AS PC2
                        ON PS2.ProductCategoryID = PC2.ProductCategoryID
                        WHERE PC.ProductCategoryID = PC2.ProductCategoryID)

SELECT HE.BusinessEntityID, HD.DepartmentID,
       DATEDIFF(YEAR, ED.StartDate, GETDATE()) AS Tenure
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
    ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
    ON ED.DepartmentID = HD.DepartmentID
WHERE ED.EndDate IS NULL
GROUP BY HE.BusinessEntityID, HD.DepartmentID, ED.StartDate
HAVING DATEDIFF(YEAR, ED.StartDate, GETDATE()) = 
(
    SELECT MAX(DATEDIFF(YEAR, ED2.StartDate, GETDATE()))
    FROM HumanResources.EmployeeDepartmentHistory AS ED2
    WHERE ED2.DepartmentID = HD.DepartmentID
      AND ED2.EndDate IS NULL
)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.StandardCost = (SELECT MIN(StandardCost) FROM Production.Product AS PP2
                         WHERE PP.ProductSubcategoryID = PP2.ProductSubcategoryID)
                           
SELECT HE.BusinessEntityID FROM  HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH
ON HE.BusinessEntityID = HH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HH.DepartmentID = HD.DepartmentID
WHERE VacationHours = (SELECT MIN(VacationHours) FROM HumanResources.Employee AS HE2
                        INNER JOIN HumanResources.EmployeeDepartmentHistory AS HH2
                        ON HE2.BusinessEntityID = HH2.BusinessEntityID
                        INNER JOIN HumanResources.Department AS HD2
                        ON HH2.DepartmentID = HD2.DepartmentID
                        WHERE HD.DepartmentID = HD2.DepartmentID)

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY SC.CustomerID, ST.TerritoryID, OrderDate
HAVING DATEDIFF(YEAR,OrderDate,GETDATE()) = (SELECT MIN(DATEDIFF(YEAR,OrderDate,GETDATE())) FROM 
                                              Sales.Customer AS SC2
                                              INNER JOIN Sales.SalesOrderHeader AS SH2
                                               ON SC2.CustomerID = SH2.CustomerID
                                                INNER JOIN Sales.SalesTerritory AS ST2
                                                ON SH2.TerritoryID = ST2.TerritoryID
                                                WHERE ST.TerritoryID = ST2.TerritoryID)


SELECT SOD.SalesOrderID FROM Sales.SalesOrderDetail AS SOD
INNER JOIN Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
GROUP BY SOD.SalesOrderID,MONTH(OrderDate) 
HAVING MONTH(OrderDate) = (SELECT MAX(MONTH(OrderDate)) AS Maximum 
                            FROM Sales.SalesOrderDetail AS SOD2
                            INNER JOIN Sales.SalesOrderHeader AS SOH2
                            ON SOD2.SalesOrderID = SOH2.SalesOrderID
                            WHERE SOD.SalesOrderID = SOD2.SalesOrderID)

SELECT PP.Name FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID 
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE ListPrice = (SELECT MAX(ListPrice) FROM Production.Product AS PP2
                    INNER JOIN Production.ProductSubcategory AS PS2
                    ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID 
                    INNER JOIN Production.ProductCategory AS PC2
                    ON PS2.ProductCategoryID = PC2.ProductCategoryID
                    WHERE PS.ProductSubcategoryID = PS2.ProductSubcategoryID)

SELECT HE.BusinessEntityID FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
ON HE.BusinessEntityID = HDH.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON HDH.DepartmentID = HD.DepartmentID
WHERE HE.SickLeaveHours = (SELECT MAX(SickLeaveHours) FROM HumanResources.Employee AS HE2
                            INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH2
                            ON HE2.BusinessEntityID = HDH2.BusinessEntityID
                            INNER JOIN HumanResources.Department AS HD2
                            ON HDH2.DepartmentID = HD2.DepartmentID
                            WHERE HD.DepartmentID = HD2.DepartmentID)

SELECT SC.CustomerID FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY SC.CustomerID, ST.TerritoryID, SD.OrderQty
HAVING SD.OrderQty = (SELECT MAX(SD.OrderQty) FROM SALES.SalesOrderDetail AS SD2
                     INNER JOIN Sales.SalesOrderHeader AS SH2
                      ON SD2.SalesOrderID = SH2.SalesOrderID
                      INNER JOIN Sales.SalesTerritory AS ST2
                      ON SH2.TerritoryID = ST2.TerritoryID
                      WHERE ST.TerritoryID = ST2.TerritoryID)

SELECT PP.Name AS ProductName,PC.Name AS CategoryName FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PP.Weight = (SELECT MAX(Weight) FROM Production.Product AS PP2
                    INNER JOIN Production.ProductSubcategory AS PS2
                    ON PP2.ProductSubcategoryID = PS2.ProductSubcategoryID
                    INNER JOIN Production.ProductCategory AS PC2
                    ON PS2.ProductCategoryID = PC2.ProductCategoryID
                    WHERE PC.ProductCategoryID = PC2.ProductCategoryID)
        
SELECT HE.BusinessEntityID FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID  = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID 
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) = (SELECT MIN(Duration) FROM (
                                                   SELECT DATEDIFF(YEAR,HireDate,GETDATE()) AS Duration FROM
                                                   HumanResources.Employee AS HE2
                                                    INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED2
                                                    ON HE2.BusinessEntityID  = ED2.BusinessEntityID
                                                    INNER JOIN HumanResources.Department AS HD2
                                                    ON ED2.DepartmentID = HD2   .DepartmentID 
                                                    WHERE HD.DepartmentID = HD2.DepartmentID) AS Tenure)

SELECT HE.BusinessEntityID FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID  = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
WHERE ED.EndDate IS NULL
AND DATEDIFF(YEAR, HireDate, GETDATE()) = (SELECT MAX(Duration) FROM (
                                                   SELECT DATEDIFF(YEAR,HireDate,GETDATE()) AS Duration FROM
                                                   HumanResources.Employee AS HE2
                                                    INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED2
                                                    ON HE2.BusinessEntityID  = ED2.BusinessEntityID
                                                    INNER JOIN HumanResources.Department AS HD2
                                                    ON ED2.DepartmentID = HD2   .DepartmentID 
                                                    WHERE HD.DepartmentID = HD2.DepartmentID) AS Tenure)
                                                    
SELECT HE.BusinessEntityID FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID  = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
WHERE ED.EndDate IS NULL
AND DATEDIFF(YEAR, HireDate, GETDATE()) = (SELECT MIN(Duration) FROM (
                                                   SELECT DATEDIFF(YEAR,HireDate,GETDATE()) AS Duration FROM
                                                   HumanResources.Employee AS HE2
                                                    INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED2
                                                    ON HE2.BusinessEntityID  = ED2.BusinessEntityID
                                                    INNER JOIN HumanResources.Department AS HD2
                                                    ON ED2.DepartmentID = HD2   .DepartmentID 
                                                    WHERE HD.DepartmentID = HD2.DepartmentID) AS Tenure)


 ---Day 17 : CTEs (WITH clause)

 WITH ExpensiveProducts AS (
                                SELECT Name, 
                                ProductID,
                                ListPrice,
                                ROW_NUMBER() OVER(ORDER BY ListPrice DESC) AS RowNum
                                FROM Production.Product)
                                SELECT Name,ProductID,ListPrice FROM ExpensiveProducts
                                WHERE RowNum <= 10

WITH Top_Products AS ( SELECT TOP 10 Name, ProductID,ListPrice
                      FROM Production.Product 
                      ORDER BY ListPrice DESC)
                      SELECT * FROM Top_Products

WITH E_Duration AS (SELECT HireDate, DATEDIFF(YEAR,HireDate,GETDATE()) AS Tenure, CONCAT(FirstName, ' ',LastName) AS EmployeeName 
                        FROM Person.Person AS PP
                        INNER JOIN HumanResources.Employee AS HE
                        ON PP.BusinessEntityID = HE.BusinessEntityID)
                        SELECT * FROM E_Duration
                        WHERE Tenure  > 20

WITH Customers AS (SELECT SC.CustomerID , OrderQty FROM Sales.Customer AS SC
                    INNER JOIN Sales.SalesOrderHeader AS SH
                    ON SC.CustomerID = SH.CustomerID 
                    INNER JOIN Sales.SalesOrderDetail AS SD
                    ON SH.SalesOrderID = SD.SalesOrderID)
                    SELECT CustomerID,SUM(OrderQty) FROM Customers
                    GROUP BY CustomerID 
                    HAVING SUM(OrderQty) > 5

WITH Orders AS  ( SELECT SalesOrderID, OrderDate 
                    FROM Sales.SalesOrderHeader)
                    SELECT * FROM Orders
                    WHERE YEAR(OrderDate) = 2013

WITH AvgPrice AS ( SELECT AVG(ListPrice) AS Avg_Price
                    FROM Production.Product ),
     Products AS ( SELECT Name, ListPrice 
                   FROM Production.Product)
    SELECT Name, ListPrice, Avg_Price FROM
    Products AS P
    CROSS JOIN AvgPrice  AS A
    WHERE ListPrice > Avg_Price

WITH Vacation AS ( SELECT BusinessEntityID , VacationHours 
                    FROM HumanResources.Employee)
                    SELECT BusinessEntityID, VacationHours
                    FROM Vacation 
                    WHERE VacationHours > 100

WITH ExpCustomer  AS ( SELECT SC.CustomerID
                        FROM Sales.Customer AS SC),
      Above AS ( SELECT SUM(OrderQty * UnitPrice) AS Revenue FROM
                         Sales.SalesOrderDetail )
                SELECT CustomerID FROM ExpCustomer 
                CROSS JOIN Above
                WHERE Revenue > 5000

WITH NullWeights AS ( SELECT Name,Weight FROM Production.Product)
                        SELECT * FROM NullWeights
                        WHERE Weight IS NULL

WITH HDEmployee AS ( SELECT BusinessEntityID, HireDate 
                    FROM HumanResources.Employee)
                    SELECT * FROM HDEmployee 
                    WHERE YEAR(HireDate)  = 2010


WITH Ranking AS ( SELECT Name, ListPrice,
                    ROW_NUMBER() OVER(ORDER BY ListPrice DESC) AS RN
                    FROM Production.Product )
                    SELECT * FROM Ranking
                   
With RN AS ( SELECT BusinessEntityID, HireDate ,
                    ROW_NUMBER() OVER(ORDER BY HireDate DESC) AS HD
                    FROM HumanResources.Employee )
                    SELECT * FROM RN
  
WITH M_Revenue AS (SELECT MONTH(OrderDate) AS OrderMonth, SUM(OrderQty * UnitPrice) AS Revenue
                        FROM Sales.SalesOrderDetail AS  SD
                        INNER JOIN Sales.SalesOrderHeader AS SH
                        ON SD.SalesOrderID = SH.SalesOrderID
                        GROUP BY MONTH(OrderDate))
                        SELECT * FROM M_Revenue

WITH Y_Revenue AS (SELECT YEAR(OrderDate) AS OrderYear,  SUM(OrderQty * UnitPrice) AS Revenue
                        FROM Sales.SalesOrderDetail AS  SD
                        INNER JOIN Sales.SalesOrderHeader AS SH
                        ON SD.SalesOrderID = SH.SalesOrderID
                        GROUP BY YEAR(OrderDate))
                        SELECT * FROM Y_Revenue

WITH ProductRevenue AS ( SELECT Name, SUM(OrderQty * UnitPrice) AS Revenue 
                            FROM Production.Product AS PP
                            INNER JOIN Sales.SalesOrderDetail AS SD
                            ON PP.ProductID = SD.ProductID
                            GROUP BY Name)
                            SELECT * FROM ProductRevenue

WITH DptCount AS (SELECT HD.Name, COUNT(HE.BusinessEntityID) AS TotalEmployee
                   FROM HumanResources.Employee AS HE
                   INNER JOIN HumanResources.EmployeeDepartmentHistory AS HDH
                   ON HE.BusinessEntityID = HDH.BusinessEntityID
                   INNER JOIN HumanResources.Department AS HD
                   ON HDH.DepartmentID = HD.DepartmentID
                   GROUP BY HD.Name)
                   SELECT * FROM DptCount

WITH ProductCategory AS (SELECT PC.Name AS Category, COUNT(PP.Name) AS Product 
                            FROM Production.Product AS PP
                            INNER JOIN Production.ProductSubcategory AS PS
                            ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
                            INNER JOIN Production.ProductCategory AS PC
                            ON PS.ProductCategoryID = PC.ProductCategoryID
                            GROUP BY PC.Name)
                            SELECT * FROM ProductCategory

WITH AvgSickLeave AS (SELECT AVG(SickLeaveHours) AS Avg_Leave
                        FROM HumanResources.Employee)
                        SELECT * FROM AvgSickLeave

WITH EmployeeHierarchy AS (
    SELECT 
        BusinessEntityID,
        OrganizationNode,
        0 AS Level
    FROM HumanResources.Employee
    WHERE OrganizationNode.GetLevel() = 0

    UNION ALL

    SELECT 
        e.BusinessEntityID,
        e.OrganizationNode,
        eh.Level + 1
    FROM HumanResources.Employee e
    INNER JOIN EmployeeHierarchy eh
        ON e.OrganizationNode.GetAncestor(1) = eh.OrganizationNode
)
SELECT 
    BusinessEntityID,
    OrganizationNode.ToString() AS OrgNodePath,
    Level
FROM EmployeeHierarchy
ORDER BY OrgNodePath;

WITH MonthlyRevenue AS ( SELECT YEAR(OrderDate) AS OrderYear,
                            MONTH(OrderDate) AS OrderMonth,
                            SUM(OrderQty * UnitPrice) AS Revenue
                            FROM Sales.SalesOrderDetail AS SD
                            INNER JOIN Sales.SalesOrderHeader AS SH
                            ON SD.SalesOrderID = SH.SalesOrderID
                            GROUP BY YEAR(OrderDate), MONTH(OrderDate))
                            SELECT OrderYear, OrderMonth,Revenue,SUM(Revenue)
                            OVER ( ORDER BY OrderYear,OrderMonth
                            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                            ) AS RunningTotal
                            FROM MonthlyRevenue

WITH MonthlyRevenue AS ( SELECT YEAR(OrderDate) AS OrderYear,
                            MONTH(OrderDate) AS OrderMonth,
                            SUM(OrderQty * UnitPrice) AS Revenue
                            FROM Sales.SalesOrderDetail AS SD
                            INNER JOIN Sales.SalesOrderHeader AS SH
                            ON SD.SalesOrderID = SH.SalesOrderID
                            GROUP BY YEAR(OrderDate), MONTH(OrderDate))
                            SELECT OrderYear, OrderMonth,Revenue,SUM(Revenue)
                            OVER ( ORDER BY OrderYear,OrderMonth
                            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
                            AS RollingAverage
                            FROM MonthlyRevenue

WITH CustomerTerritory AS ( SELECT COUNT(CustomerID) AS TotalCustomers , ST.Name AS Name,
                            ROW_NUMBER() OVER(ORDER BY  COUNT(CustomerID)) AS Rank
                             FROM Sales.Customer AS SC
                             INNER JOIN Sales.SalesTerritory AS ST
                             ON SC.TerritoryID = ST.TerritoryID
                             GROUP BY Name )
                             SELECT Name, Rank, TotalCustomers
                             FROM CustomerTerritory

WITH ProductCategory AS (SELECT PC.Name AS Category, COUNT(PP.Name) AS TotalProducts, 
                            ROW_NUMBER() OVER (ORDER BY COUNT(PP.Name)) as Ranks
                            FROM Production.Product AS PP
                            INNER JOIN Production.ProductSubcategory AS PS
                            ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
                            INNER JOIN Production.ProductCategory AS PC
                            ON PS.ProductCategoryID = PC.ProductCategoryID
                            GROUP BY PC.Name)
                            SELECT Category, Ranks,TotalProducts
                            FROM ProductCategory

WITH YOY_Growth AS (
    SELECT 
        Curr.OrderYear,
        Curr.OrderMonth,
        Curr.Revenue AS CurrentRevenue,
        Prev.Revenue AS PreviousRevenue
    FROM (
        SELECT 
            YEAR(OrderDate) AS OrderYear,
            MONTH(OrderDate) AS OrderMonth,
            SUM(OrderQty * UnitPrice) AS Revenue
        FROM Sales.SalesOrderDetail AS SD
        INNER JOIN Sales.SalesOrderHeader AS SH
            ON SD.SalesOrderID = SH.SalesOrderID
        GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ) AS Curr
    LEFT JOIN (
        SELECT 
            YEAR(OrderDate) AS OrderYear,
            MONTH(OrderDate) AS OrderMonth,
            SUM(OrderQty * UnitPrice) AS Revenue
        FROM Sales.SalesOrderDetail AS SD2
        INNER JOIN Sales.SalesOrderHeader AS SH2
            ON SD2.SalesOrderID = SH2.SalesOrderID
        GROUP BY YEAR(OrderDate), MONTH(OrderDate)
    ) AS Prev
        ON Curr.OrderYear = Prev.OrderYear + 1
        AND Curr.OrderMonth = Prev.OrderMonth
)
SELECT 
    OrderYear,
    OrderMonth,
    CurrentRevenue,
    PreviousRevenue,
    ( (CurrentRevenue - PreviousRevenue) * 1.0 / PreviousRevenue ) * 100 AS YoY_Growth_Percent
FROM YOY_Growth
ORDER BY OrderYear, OrderMonth                    



----Day 18 : Window Functions – ROW_NUMBER, RANK

SELECT Name, ListPrice,
ROW_NUMBER() OVER(ORDER BY ListPrice DESC) AS PriceRank
FROM Production.Product

SELECT BusinessEntityID, HireDate,
ROW_NUMBER() OVER(ORDER BY HireDate DESC) AS RankHireDate
FROM HumanResources.Employee

SELECT CustomerID,
ROW_NUMBER() OVER(ORDER BY CustomerID DESC) AS RankCustomer
FROM Sales.Customer

SELECT Name, ListPrice,
RANK() OVER( ORDER BY ListPrice) AS ProductRank
FROM Production.Product

SELECT BusinessEntityID, HireDate,
RANK()OVER(ORDER BY HireDate) AS EmployeeHireDate
FROM HumanResources.Employee

SELECT 
        SalesOrderID,
        TotalQuantity,
        RANK() OVER(ORDER BY TotalQuantity DESC) AS OrderRank
        FROM( SELECT SalesOrderID, SUM(OrderQty) AS TotalQuantity
        FROM Sales.SalesOrderDetail 
        GROUP BY SalesOrderID) AS OrderSummary

WITH OrderSum AS ( SELECT SalesOrderID,
                    SUM(OrderQty) AS Total
                    FROM Sales.SalesOrderDetail 
                    GROUP BY SalesOrderID)
                    SELECT SalesOrderID, Total,
                    RANK() OVER(ORDER BY Total DESC) AS RankTotal
                    FROM OrderSum

SELECT CustomerID, TotalSales,
RANK() OVER(ORDER BY TotalSales DESC)
FROM (SELECT CustomerID, COUNT(SalesOrderID) AS TotalSales
        FROM Sales.SalesOrderHeader
        GROUP BY CustomerID) AS Summary

SELECT TotalEmployee, Department,
ROW_NUMBER() OVER(ORDER BY TotalEmployee DESC) AS DepartmentRank
FROM(
SELECT COUNT(HE.BusinessEntityID) AS TotalEmployee,HD.Name AS Department
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
GROUP BY HD.Name) AS Summary

SELECT TotalProducts,Category,
ROW_NUMBER() OVER(ORDER BY TotalProducts DESC)  AS Ranking FROM
(SELECT COUNT(PP.Name) AS TotalProducts, PC.Name AS Category
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name) AS ProductCategory

SELECT TotalProducts,Category,
ROW_NUMBER() OVER(ORDER BY TotalProducts DESC)  AS Ranking FROM
(SELECT  TOP 5 COUNT(PP.Name) AS TotalProducts, PC.Name AS Category
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name) AS ProductCategory

SELECT TotalEmployee, Department,
ROW_NUMBER() OVER(ORDER BY TotalEmployee DESC) AS DepartmentRank
FROM(
SELECT TOP 5 COUNT(HE.BusinessEntityID) AS TotalEmployee,HD.Name AS Department
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
GROUP BY HD.Name) AS Summary

SELECT CustomerID, TotalSales,
RANK() OVER(ORDER BY TotalSales DESC)
FROM (SELECT TOP 5 CustomerID, COUNT(SalesOrderID) AS TotalSales
        FROM Sales.SalesOrderHeader
        GROUP BY CustomerID) AS Summary

SELECT OrderYear,TotalOrder,
ROW_NUMBER() OVER(ORDER BY TotalOrder DESC) FROM(
SELECT TOP 10 YEAR(OrderDate) AS OrderYear,COUNT(SalesOrderID) AS TotalOrder
FROM Sales.SalesOrderHeader
GROUP BY Year(OrderDate)) AS Orders

SELECT Customers,Revenue, Territory,
ROW_NUMBER() OVER(ORDER BY Revenue) AS Ranking FROM(
SELECT TOP 5 COUNT(SC.CustomerID) AS Customers, SUM(OrderQty * UnitPrice) AS Revenue, ST.Name AS Territory
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY ST.Name) AS TY

SELECT SalesPerson,Revenue, OrderYear,
ROW_NUMBER()OVER(ORDER BY Revenue) FROM(
SELECT TOP 5  BusinessEntityID AS SalesPerson, SUM(OrderQty * UnitPrice) AS Revenue,YEAR(OrderDate) AS OrderYear
FROM Sales.SalesPerson AS SP
INNER JOIN Sales.SalesOrderHeader AS SH
ON SP.BusinessEntityID = SH.SalesPersonID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY BusinessEntityID, YEAR(OrderDate)) AS Salesperson

SELECT Name, ListPrice,
ROW_NUMBER() OVER( ORDER BY ListPrice) AS ProductRank
FROM Production.Product

SELECT BusinessEntityID, HireDate,
ROW_NUMBER()OVER(ORDER BY HireDate) AS EmployeeHireDate
FROM HumanResources.Employee

SELECT SalesOrderID,Revenue,
RANK()OVER(ORDER BY Revenue DESC) FROM(
SELECT SalesOrderID, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderDetail 
GROUP BY SalesOrderID) AS SalesOrder

SELECT  TOP 1 TotalProducts,Category,
ROW_NUMBER() OVER(ORDER BY TotalProducts DESC)  AS Ranking FROM
(SELECT  TOP 5 COUNT(PP.Name) AS TotalProducts, PC.Name AS Category
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name) AS ProductCategory

SELECT  TOP 1 BusinessEntityID, HireDate,
ROW_NUMBER() OVER(ORDER BY HireDate DESC) AS RankHireDate
FROM HumanResources.Employee

SELECT  MAX(TotalQty) FROM(
SELECT SC.CustomerID, SUM(OrderQty) AS TotalQty FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID ) AS St

SELECT  Territory,
RANK() OVER (PARTITION BY Territory ORDER BY Revenue DESC) FROM(
SELECT TOP 1 SC.CustomerID,ST.Name AS Territory, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY SC.CustomerID, ST.Name) AS Summary

WITH CustomerRevenue AS (
    SELECT 
        SC.CustomerID,
        ST.Name AS Territory,
        SUM(OrderQty * UnitPrice) AS Revenue,
        RANK() OVER (PARTITION BY ST.Name ORDER BY SUM(OrderQty * UnitPrice) DESC) AS RevenueRank
    FROM Sales.Customer AS SC
    INNER JOIN Sales.SalesOrderHeader AS SH
        ON SC.CustomerID = SH.CustomerID
    INNER JOIN Sales.SalesOrderDetail AS SD
        ON SH.SalesOrderID = SD.SalesOrderID
    INNER JOIN Sales.SalesTerritory AS ST
        ON SH.TerritoryID = ST.TerritoryID
    GROUP BY SC.CustomerID, ST.Name
)
SELECT CustomerID, Territory, Revenue
FROM CustomerRevenue
WHERE RevenueRank = 1

WITH ProductYear  AS (
SELECT PP.Name AS PrdctName,
        YEAR(OrderDate) AS OrderYear,
        RANK() OVER(PARTITION BY PP.Name ORDER BY YEAR(OrderDate)) AS YearRank
        FROM Production.Product AS PP
        INNER JOIN Sales.SalesOrderDetail AS SD
        ON PP.ProductID = SD.ProductID
        INNER JOIN Sales.SalesOrderHeader AS SH
        ON SD.SalesOrderID = SH.SalesOrderID
        GROUP BY PP.Name,YEAR(OrderDate))
SELECT PrdctName,OrderYear,YearRank
FROM ProductYear 


--Day 19 : Window Functions – DENSE_RANK, NTILE

SELECT Name, ListPrice,
DENSE_RANK() OVER (ORDER BY ListPrice DESC)  AS DRank
FROM Production.Product

SELECT HireDate, BusinessEntityID,
DENSE_RANK() OVER(ORDER BY HireDate) FROM HumanResources.Employee

SELECT SalesOrderID, SUM(OrderQty),
DENSE_RANK() OVER (ORDER BY SUM(OrderQty)) AS Quantity
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

SELECT Customers,Revenue,
DENSE_RANK() OVER(ORDER BY Revenue DESC) AS RevenueRank FROM(
SELECT SC.CustomerID AS Customers,SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID ) AS SRevenue

SELECT Name, ListPrice,
NTILE(4) OVER(ORDER BY ListPrice) AS Quartile 
FROM Production.Product

SELECT BusinessEntityID,JobTitle,
NTILE(4) OVER (ORDER BY BusinessEntityID) AS Quartile
FROM HumanResources.Employee

SELECT Customers,Revenue,
NTILE(5) OVER(ORDER BY Revenue DESC) AS RevenueQ FROM(
SELECT  SC.CustomerID AS Customers,SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID ) AS SRevenue

SELECT SalesOrderID, SUM(OrderQty),
NTILE(10) OVER (ORDER BY SUM(OrderQty)) AS Quantity
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

SELECT Name, ListPrice, 
CASE NTILE(3) OVER(ORDER BY ListPrice DESC)  
                WHEN 1 THEN 'Low'
                WHEN 2 THEN 'Medium'
                WHEN 3 THEN'High'
                END AS PriceCategory
        FROM Production.Product

SELECT BusinessEntityID, JobTitle,
CASE NTILE(2) OVER (ORDER BY BusinessEntityID) 
            WHEN 1 THEN 'Junior'
            WHEN 2 THEN 'Senior'
            END AS EmployeeCategory
FROM HumanResources.Employee

SELECT Name, ListPrice,
DENSE_RANK() OVER (ORDER BY ListPrice DESC)  AS DRank
FROM Production.Product

SELECT Name, ListPrice,
RANK() OVER (ORDER BY ListPrice DESC)  AS DRank
FROM Production.Product

SELECT HireDate, BusinessEntityID,
DENSE_RANK() OVER(ORDER BY HireDate) FROM HumanResources.Employee

SELECT HireDate, BusinessEntityID,
RANK() OVER(ORDER BY HireDate) FROM HumanResources.Employee

SELECT SalesOrderID, SUM(OrderQty),
NTILE(4) OVER (ORDER BY SUM(OrderQty)) AS Quantity
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

SELECT SalesOrderID, SUM(OrderQty),
NTILE(10) OVER (ORDER BY SUM(OrderQty)) AS Quantity
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

SELECT Name, Revenue,NTILE(4) OVER(ORDER BY Revenue DESC) AS NTRevenue FROM(
SELECT Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SH
ON ST.TerritoryID = SH.TerritoryID 
INNER JOIN Sales.SalesOrderDetail AS SD
ON SD.SalesOrderID = SH.SalesOrderID 
GROUP BY Name) AS NT

SELECT CategoryName, Total,
NTILE(4) OVER(ORDER BY Total DESC)  FROM(
SELECT PC.Name AS CategoryName, SUM(ListPrice) AS Total FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name) AS CN

SELECT Name, Revenue,NTILE(5) OVER(ORDER BY Revenue DESC) AS NTRevenue FROM(
SELECT Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SH
ON ST.TerritoryID = SH.TerritoryID 
INNER JOIN Sales.SalesOrderDetail AS SD
ON SD.SalesOrderID = SH.SalesOrderID 
GROUP BY Name) AS NT

SELECT BusinessEntityID, Department,Tenure,
NTILE(4) OVER (ORDER BY Tenure DESC)  AS TenureQuartile FROM(
SELECT HE.BusinessEntityID, DATEDIFF(YEAR, HireDate, GETDATE()) AS Tenure,
HD.Name AS Department FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
WHERE EndDate IS NULL
) AS Dpt

SELECT Subcategory, Total, 
NTILE(4) OVER(ORDER BY Total) AS SubcategoryQuartile 
FROM (SELECT PS.Name AS Subcategory, SUM(ListPrice) AS Total FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID  = PS.ProductSubcategoryID
GROUP BY PS.Name) AS PSC

SELECT Total,ProductName, NTILE(4) OVER (ORDER BY Total DESC) AS QuantityQuartile FROM(
SELECT SUM(OrderQty) AS Total, PP.Name AS ProductName FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID 
GROUP BY PP.Name) AS PCS

SELECT *
FROM (
    SELECT P.ProductID,
           PC.Name AS Category,
           SUM(SD.OrderQty * SD.UnitPrice) AS Revenue,
           NTILE(4) OVER (PARTITION BY PC.Name ORDER BY SUM(SD.OrderQty * SD.UnitPrice) DESC) AS QuartileRank
    FROM Production.Product AS P
    INNER JOIN Production.ProductSubcategory AS PSC
        ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
    INNER JOIN Production.ProductCategory AS PC
        ON PSC.ProductCategoryID = PC.ProductCategoryID
    INNER JOIN Sales.SalesOrderDetail AS SD
        ON P.ProductID = SD.ProductID
    GROUP BY P.ProductID, PC.Name
) AS RankedProducts
WHERE QuartileRank = 1



--Day 20 : Window Functions – LEAD, LAG

SELECT SalesOrderID,
        OrderDate,
        LAG(OrderDate, 1) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousDate
        FROM Sales.SalesOrderHeader

SELECT SalesOrderID,
        OrderDate,
        LEAD(OrderDate, 1) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousDate
        FROM Sales.SalesOrderHeader

SELECT HD.Name, HireDate,
LAG(HireDate,1) OVER (Partition BY HD.Name ORDER BY HireDate) AS Previous_Date
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
WHERE EndDate IS NULL

SELECT HD.Name, HireDate,
LEAD(HireDate,1) OVER (Partition BY HD.Name ORDER BY HireDate) AS Previous_Date
FROM HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
WHERE EndDate IS NULL

SELECT PC.Name,ListPrice,
LAG(ListPrice, 1) OVER ( PARTITION BY PC.Name ORDER BY ListPrice) AS Previous_ListPrice
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

SELECT PC.Name,ListPrice,
LEAD( ListPrice, 1) OVER ( PARTITION BY PC.Name ORDER BY ListPrice) AS Previous_ListPrice
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

SELECT Name,SalesQuota,
LAG(SalesQuota, 1) OVER(PARTITION BY Name ORDER BY SalesQuota) AS Previous_Quota
FROM Sales.SalesPerson AS SP
INNER JOIN Sales.SalesTerritory AS ST
ON SP.TerritoryID = ST.TerritoryID

SELECT Name,SalesQuota,
LEAD(SalesQuota, 1) OVER(PARTITION BY Name ORDER BY SalesQuota) AS Previous_Quota
FROM Sales.SalesPerson AS SP
INNER JOIN Sales.SalesTerritory AS ST
ON SP.TerritoryID = ST.TerritoryID

SELECT 
    SC.CustomerID,
    SH.SalesOrderID,
    SUM(SD.OrderQty) AS Total_Qty,
    LAG(SUM(SD.OrderQty), 1) OVER (
        PARTITION BY SC.CustomerID 
        ORDER BY SH.OrderDate
    ) AS PreviousQty
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
    ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
    ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID, SH.SalesOrderID, SH.OrderDate
ORDER BY SC.CustomerID, SH.OrderDate

SELECT 
    SC.CustomerID,
    SH.SalesOrderID,
    SUM(SD.OrderQty) AS Total_Qty,
    LEAD(SUM(SD.OrderQty), 1) OVER (
        PARTITION BY SC.CustomerID 
        ORDER BY SH.OrderDate
    ) AS PreviousQty
FROM Sales.Customer AS SC
INNER JOIN Sales.SalesOrderHeader AS SH
    ON SC.CustomerID = SH.CustomerID
INNER JOIN Sales.SalesOrderDetail AS SD
    ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY SC.CustomerID, SH.SalesOrderID, SH.OrderDate
ORDER BY SC.CustomerID, SH.OrderDate

---Day 23 : Transactions & Constraints

BEGIN TRANSACTION 
BEGIN TRY 
INSERT INTO Sales.Customer (PersonID,StoreID,TerritoryID,rowguid,ModifiedDate)
VALUES(NULL,NULL,NULL,NEWID(),GETDATE())

COMMIT TRANSACTION
PRINT 'New Customer Inserted Successfully'
END TRY

BEGIN CATCH 
        ROLLBACK TRANSACTION
        PRINT 'Error occurred.Transaction rolled back'
END CATCH

BEGIN TRANSACTION
BEGIN TRY
UPDATE Production.Product
SET ListPrice = 245.00
WHERE Name = 'bb ball bearing'
COMMIT TRANSACTION
END TRY

BEGIN CATCH
        ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION 
BEGIN TRY
DELETE FROM Sales.SalesOrderDetail 
WHERE SalesOrderID = 5
COMMIT TRANSACTION
END TRY

BEGIN CATCH
        ROLLBACK TRANSACTION 
END CATCH

BEGIN TRANSACTION

INSERT INTO HumanResources.Employee(BusinessEntityID,NationalIDNumber,LoginID,
OrganizationNode,
JobTitle,BirthDate,MaritalStatus,Gender,HireDate,
SalariedFlag,VacationHours,SickLeaveHours,CurrentFlag,rowguid,ModifiedDate)
VALUES(292,234567899,'adventure-works\bb2',Null,'Data Analytics','1999-07-27','S','F','2009-12-12',0,20,100,1,NEWID(),GETDATE())

  ROLLBACK TRANSACTION

BEGIN TRANSACTION

UPDATE HumanResources.Employee 
SET VacationHours = 90
WHERE BusinessEntityID = 5

COMMIT TRANSACTION

BEGIN TRANSACTION
BEGIN TRY
UPDATE Production.Product
SET ListPrice = 500
WHERE Name = 'blade'
COMMIT TRANSACTION
END TRY

BEGIN CATCH
        ROLLBACK TRANSACTION
END CATCH

CREATE TABLE Student(
StudentID INT Primary Key,
Name VARCHAR(50),
Age INT)

CREATE TABLE Department(
StudentID INT Primary Key,
Department VARCHAR(50),
CONSTRAINT FK_Department_Student
        FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID)
        )
ALTER TABLE Student
ADD CONSTRAINT CHK_Student_Age
CHECK(Age >= 18)

ALTER TABLE Department
ADD CONSTRAINT DF_Department_Department DEFAULT 'Unknown' FOR Department

CREATE TABLE Bakery(
Chinchin VARCHAR(50),
Meatpie VARCHAR(20),
Butter VARCHAR (10),
Tools VARCHAR(20),
BakeryID INT PRIMARY KEY,
Amount MONEY )

ALTER TABLE Bakery
ADD CONSTRAINT UQ_Bakery_Tools UNIQUE (Tools)

BEGIN TRANSACTION 
BEGIN TRY
UPDATE Production.Product 
SET StandardCost = 500
WHERE Name = 'ml crankam'

UPDATE Production.WorkOrder 
SET OrderQty = 20
WHERE WorkOrderID = 9

COMMIT TRANSACTION 
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION 
BEGIN TRY
INSERT INTO Sales.SalesOrderDetail(CarrierTrackingNumber,OrderQty,
UnitPrice,UnitPriceDiscount,rowguid,ModifiedDate)
VALUES (Null,20,200,300,NEWID(),GETDATE())

COMMIT TRANSACTION
END TRY

BEGIN CATCH
        ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION

INSERT INTO Student(StudentID,Name, Age)
VALUES(1,'Rofeeah',16)

ROLLBACK TRANSACTION

BEGIN TRANSACTION 
BEGIN TRY 

UPDATE HumanResources.Employee
SET MaritalStatus = 'M'
WHERE JobTitle = 'Senior Tool Manager'

UPDATE HumanResources.Employee
SET VacationHours = 80
WHERE BusinessEntityID = 2

COMMIT TRANSACTION 
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION
BEGIN TRY

UPDATE Production.WorkOrder
SET OrderQty = 12
WHERE WorkOrderID = 9

COMMIT TRANSACTION
END TRY 

BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION
BEGIN TRY

INSERT INTO Production.ProductCategory(Name,rowguid,ModifiedDate)
VALUES('Food',NEWID(),GETDATE())

COMMIT TRANSACTION
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION
BEGIN TRY

DELETE FROM Sales.Customer 
WHERE CustomerID = 19822

COMMIT TRANSACTION
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
END CATCH

BEGIN TRANSACTION
BEGIN TRY

DELETE FROM Production.ProductModel
WHERE ProductModelID = 127

SAVE TRANSACTION MySavePoint;

UPDATE Production.UnitMeasure
SET Name = 'Litre'
WHERE UnitMeasureCode = 'L'

COMMIT TRANSACTION
END TRY

BEGIN CATCH
    IF XACT_STATE() = -1
ROLLBACK TRANSACTION 
    ELSE IF XACT_STATE() = 1
ROLLBACK TRANSACTION MySavePoint
END CATCH


---Day 24 : Stored Procedures & Triggers

CREATE PROCEDURE 
GetProductByName 
    @Name NVARCHAR(50)
AS
BEGIN
    SELECT Name 
    FROM Production.Product
    WHERE Name = @Name;
END

EXEC GetProductByName @Name = 'Mountain Bike'

SELECT * FROM Production.Product

CREATE PROCEDURE GetCustomers 
@CustomerID INT
AS
BEGIN
    SELECT *
    FROM Sales.Customer
    WHERE CustomerID = @CustomerID
END

EXEC GetCustomers @CustomerID   

CREATE PROCEDURE GetEmployee
@BusinessEntityID INT
AS
BEGIN
    SELECT * FROM
    HumanResources.Employee
    WHERE BusinessEntityID = @BusinessEntityID
END

EXEC GetEmployee @BusinessEntityID

---Day 22

SELECT * FROM Production.Location
WHERE Name = 'Paint'

SELECT * FROM Purchasing.Vendor 
WHERE Name LIKE 'Bike%'

CREATE INDEX IX_Name ON Purchasing.Vendor(Name)
SELECT * FROM Purchasing.Vendor 
WHERE Name LIKE 'Bike%'

CREATE INDEX IX_Name ON Production.Product(Name)

SELECT Name FROM Production.Product

CREATE INDEX IX_CustomerID ON Sales.Customer(CustomerID)

CREATE INDEX IX_CustomerID_OrderDate ON Sales.SalesOrderHeader(CustomerID,OrderDate)

SELECT CustomerID,OrderDate FROM Sales.SalesOrderHeader

CREATE INDEX IX_BusinessEntityID ON Purchasing.Vendor(BusinessEntityID)

DELETE FROM Purchasing.Vendor
WHERE BusinessEntityID = 1698

ALTER INDEX IX_CustomerID
ON Sales.Customer
REBUILD

SELECT PP.Name AS ProductName, PC.Name AS CategoryName 
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

SELECT PP.Name AS ProductName, 
(SELECT PC.Name FROM Production.ProductSubcategory AS PS
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE PS.ProductSubcategoryID = PP.ProductSubcategoryID)
AS CategoryName
FROM Production.Product AS PP

WITH Employee AS( SELECT COUNT(HE.BusinessEntityID) AS TotalEmployee,Name FROM
HumanResources.Employee AS HE
INNER JOIN HumanResources.EmployeeDepartmentHistory AS ED
ON HE.BusinessEntityID = ED.BusinessEntityID
INNER JOIN HumanResources.Department AS HD
ON ED.DepartmentID = HD.DepartmentID
WHERE ED.EndDate IS NULL
GROUP BY Name)
SELECT TotalEmployee,Name FROM Employee

SELECT OrderDate, SalesOrderID
FROM Sales.SalesOrderHeader
WHERE CustomerID = 101;

CREATE INDEX IX_Customer_Covering
ON Sales.SalesOrderHeader(CustomerID)
INCLUDE (OrderDate, SalesOrderID)

SELECT * 
FROM Sales.SalesOrderHeader
WHERE CustomerID = 101;

CREATE INDEX IX_CustomerID ON Sales.SalesOrderHeader(CustomerID)

SELECT * 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID = 4;

CREATE CLUSTERED INDEX CIX_OrderID ON Sales.SalesOrderHeader(SalesOrderID)

SELECT * 
FROM Sales.SalesOrderHeader
WHERE OrderDate = '2023-01-07';

CREATE NONCLUSTERED INDEX IX_OrderDate ON Sales.SalesOrderHeader(OrderDate)

SELECT PP.Name AS ProductName, PC.Name AS CategoryName 
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

SELECT PP.Name AS ProductName
FROM Production.Product AS PP
WHERE EXISTS( SELECT 1 FROM
                Production.ProductSubcategory AS PS
                WHERE PP.ProductSubcategoryID = PS.ProductSubcategoryID)

SELECT BusinessEntityID FROM HumanResources.Employee
WHERE BusinessEntityID IN( SELECT BusinessEntityID FROM 
HumanResources.EmployeeDepartmentHistory)

SELECT BusinessEntityID FROM HumanResources.Employee AS HE
WHERE EXISTS ( SELECT 1 FROM 
HumanResources.EmployeeDepartmentHistory AS ED
WHERE HE.BusinessEntityID = ED.BusinessEntityID)


----Day 26 : Analytics SQL – Cleaning & Transformations

UPDATE Sales.SpecialOffer
SET MaxQty = 0
WHERE MaxQty IS NULL

UPDATE Sales.Customer
SET PersonID = 0
WHERE PersonID IS NULL

SELECT TRIM(Name) AS Trim_Name FROM Production.Product

SELECT LOWER(Name) AS LowerCase FROM Production.Product

SELECT UPPER(Name) AS UpperCase FROM Production.Product

WITH duplicates_c AS (
                        SELECT *,
                        ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY StoreID) AS RN
                        FROM Sales.Customer)
                    SELECT * FROM duplicates_c WHERE RN > 1

UPDATE Person.EmailAddress
SET EmailAddress = NULL
WHERE CHARINDEX('@', EmailAddress) = 0
   OR CHARINDEX('.', EmailAddress) = 0
   OR EmailAddress LIKE '% %'

SELECT ROUND(ListPrice,2)  AS Round_Column FROM Production.Product

ALTER TABLE Person.Person
ADD  FullName AS CONCAT(FirstName, ' ' , LastName)

SELECT FORMAT(HireDate,'yyyy')  as Year FROM HumanResources.Employee

SELECT DATEDIFF(YEAR,BirthDate,GETDATE()) AS Age FROM HumanResources.Employee

SELECT LEFT(EmailAddress,CHARINDEX('0',EmailAddress)-1) AS Extracted_Name
FROM Person.EmailAddress
WHERE CHARINDEX('0', EmailAddress) > 0

ALTER TABLE Production.Product
ADD Profit AS (ListPrice - StandardCost)

ALTER TABLE Sales.SalesOrderHeader
ADD OrderDuration AS DATEDIFF(Day,OrderDate,ShipDate)

ALTER TABLE HumanResources.Employee
ADD CustomerAge AS DATEDIFF(YEAR,BirthDate,GETDATE())



---Day 27: Analytics SQL – Time Series Analysis

SELECT SUM(OrderQty * UnitPrice) AS Revenue,YEAR(OrderDate) 
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate)

SELECT SUM(OrderQty * UnitPrice) AS Revenue,MONTH(OrderDate) 
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY MONTH(OrderDate)

SELECT SUM(OrderQty * UnitPrice) AS Revenue,DATEPART(QUARTER,OrderDate) AS Quarter
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATEPART(QUARTER,OrderDate)

SELECT SUM(OrderQty * UnitPrice) AS Revenue,DATEPART(DAY,OrderDate) AS Days
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATEPART(DAY,OrderDate) 

SELECT SUM(OrderQty * UnitPrice) AS Revenue,DATENAME(WEEKDAY,OrderDate) AS Wkday
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATENAME(WEEKDAY,OrderDate)

SELECT SUM(OrderQty), YEAR(OrderDate)
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate)

SELECT SUM(OrderQty) AS TotalOrder, DATENAME(Month,OrderDate) AS Months
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATENAME(Month,OrderDate)

SELECT SUM(OrderQty), DATEPART(DAY,OrderDate) AS Days
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATEPART(DAY,OrderDate)

SELECT SUM(OrderQty) AS TotalOrders,CustomerID,YEAR(OrderDate)
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY CustomerID,YEAR(OrderDate)

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate) AS SalesYear,
        LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate)) AS PreviousDate,
        (SUM(OrderQty * UnitPrice) - LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate)) * 100.0 / 
         LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate))) AS YOY_Growth_Percent
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate)
ORDER BY SalesYear

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        MONTH(OrderDate) AS SalesYear,
        LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)) AS PreviousDate,
        (SUM(OrderQty * UnitPrice) - LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)) * 100.0 / 
         LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate))) AS YOY_Growth_Percent
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY MONTH(OrderDate)
ORDER BY SalesYear

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        DATEPART(QUARTER,OrderDate) AS Quarter,
        LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY DATEPART(QUARTER,OrderDate)) AS QuarterDate,
        (SUM(OrderQty * UnitPrice) - LAG(SUM(OrderQty * UnitPrice)) OVER(ORDER BY DATEPART(QUARTER,OrderDate)) * 100.0 / 
        LAG(SUM(OrderQty * UnitPrice)) OVER(ORDER BY DATEPART(QUARTER,OrderDate))) AS QOQ_Growth
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID  = SH.SalesOrderID
GROUP BY DATEPART(QUARTER,OrderDate)
ORDER BY Revenue

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate),
        SUM(SUM(OrderQty * UnitPrice)) 
        OVER (ORDER BY YEAR(OrderDate)
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningRevenue
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate)
ORDER BY Revenue

SELECT
        SUM(OrderQty * UnitPrice) AS Revenue,
        DATENAME(MONTH,OrderDate) AS Months,
        SUM(SUM(OrderQty * UnitPrice))
        OVER (ORDER BY DATENAME(MONTH,OrderDate)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningRevenue
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATENAME(MONTH,OrderDate)
ORDER BY Revenue

SELECT
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate),
        DATENAME(MONTH,OrderDate) AS Months,
        AVG(SUM(OrderQty * UnitPrice))
        OVER (ORDER BY YEAR(OrderDate), DATENAME(MONTH,OrderDate)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)AS MovingAverage
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATENAME(MONTH,OrderDate), MONTH(OrderDate), YEAR(OrderDate)
ORDER BY MONTH(OrderDate),YEAR(OrderDate)

SELECT
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate),
        DATENAME(MONTH,OrderDate) AS Months,
        AVG(SUM(OrderQty * UnitPrice))
        OVER (ORDER BY YEAR(OrderDate), DATENAME(MONTH,OrderDate)
        ROWS BETWEEN 5 PRECEDING AND CURRENT ROW)AS MovingAverage
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATENAME(MONTH,OrderDate), MONTH(OrderDate), YEAR(OrderDate)
ORDER BY MONTH(OrderDate),YEAR(OrderDate)

SELECT
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate),
        DATENAME(MONTH,OrderDate) AS Months,
        AVG(SUM(OrderQty * UnitPrice))
        OVER (ORDER BY YEAR(OrderDate), DATENAME(MONTH,OrderDate)
        ROWS BETWEEN 11 PRECEDING AND CURRENT ROW)AS MovingAverage
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY DATENAME(MONTH,OrderDate), MONTH(OrderDate), YEAR(OrderDate)
ORDER BY MONTH(OrderDate),YEAR(OrderDate)

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        MONTH(OrderDate) AS SalesYear,
        LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)) AS PreviousDate,
        (SUM(OrderQty * UnitPrice) - LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)) * 100.0 / 
         LAG(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate))) AS YOY_Growth_Percent
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY MONTH(OrderDate)
ORDER BY SalesYear

SELECT
    YEAR(OrderDate) AS SalesYear,
    DATEPART(QUARTER, OrderDate) AS QuarterNum,
    SUM(OrderQty * UnitPrice) AS Revenue,
    LAG(SUM(OrderQty * UnitPrice)) 
        OVER (PARTITION BY DATEPART(QUARTER, OrderDate) ORDER BY YEAR(OrderDate)) AS PrevYearRevenue,
    CASE 
        WHEN LAG(SUM(OrderQty * UnitPrice)) 
             OVER (PARTITION BY DATEPART(QUARTER, OrderDate) ORDER BY YEAR(OrderDate)) = 0 
        THEN NULL
        ELSE 
            (SUM(OrderQty * UnitPrice) - 
             LAG(SUM(OrderQty * UnitPrice)) 
                OVER (PARTITION BY DATEPART(QUARTER, OrderDate) ORDER BY YEAR(OrderDate))
            ) * 100.0 /
            LAG(SUM(OrderQty * UnitPrice)) 
                OVER (PARTITION BY DATEPART(QUARTER, OrderDate) ORDER BY YEAR(OrderDate))
    END AS YoY_Growth_Percent
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
    ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate)
ORDER BY SalesYear, QuarterNum

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate) AS YearRevenue,
        Name
        FROM Sales.SalesOrderDetail AS SD
        INNER JOIN Sales.SalesOrderHeader AS SH
        ON SD.SalesOrderID = SH.SalesOrderID
        INNER JOIN Sales.SalesTerritory AS ST
        ON SH.TerritoryID = ST.TerritoryID
GROUP BY YEAR(OrderDate), Name
ORDER BY YearRevenue

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        MONTH(OrderDate) AS YearRevenue,
        Name
        FROM Sales.SalesOrderDetail AS SD
        INNER JOIN Sales.SalesOrderHeader AS SH
        ON SD.SalesOrderID = SH.SalesOrderID
        INNER JOIN Sales.SalesTerritory AS ST
        ON SH.TerritoryID = ST.TerritoryID
GROUP BY MONTH(OrderDate), Name
ORDER BY Revenue

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        DATEPART(QUARTER,OrderDate) AS QuarterNum,
        ST.Name AS Territory
        FROM Sales.SalesOrderDetail AS SD
        INNER JOIN Sales.SalesOrderHeader AS SH
        ON SD.SalesOrderID = SH.SalesOrderID
        INNER JOIN Sales.SalesTerritory AS ST
        ON SH.TerritoryID = ST.TerritoryID
GROUP BY YEAR(OrderDate), DATEPART(QUARTER,OrderDate),ST.Name
ORDER BY Revenue,QuarterNum,Territory

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate),
        LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate)),
        CASE WHEN LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate)) = 0 THEN NULL
        ELSE 
        (SUM(OrderQty * UnitPrice) -  LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate)) * 100.0/
        LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY YEAR(OrderDate)))
        END AS QOQ_Growth
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate)

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        MONTH(OrderDate),
        LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)),
        CASE WHEN LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)) = 0 THEN NULL
        ELSE 
        (SUM(OrderQty * UnitPrice) -  LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)) * 100.0/
        LEAD(SUM(OrderQty * UnitPrice)) OVER (ORDER BY MONTH(OrderDate)))
        END AS QOQ_Growth
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY MONTH(OrderDate)

SELECT 
        SUM(OrderQty * UnitPrice) AS Revenue,
        YEAR(OrderDate),
        ST.Name
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY ST.Name, YEAR(OrderDate)
ORDER BY Revenue

SELECT 
        COUNT(CustomerID) AS TotalCustomer,
        YEAR(OrderDate)
    FROM Sales.SalesOrderHeader
    GROUP BY YEAR(OrderDate)
    ORDER BY TotalCustomer
        

---Day 28 : Analytics SQL – Exploratory Data Analysis

SELECT COUNT(Distinct CustomerID) AS TotalCustomer FROM Sales.Customer

SELECT COUNT(DISTINCT Name) FROM Production.Product

SELECT COUNT(DISTINCT BusinessEntityID) AS TotalEmployee FROM HumanResources.Employee

SELECT COUNT(DISTINCT Name) AS Territory FROM Sales.SalesTerritory

SELECT CustomerID,SUM(OrderQty) AS TotalOrder FROM 
Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY CustomerID

SELECT SUM(OrderQty), Name FROM
Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID
GROUP BY Name

SELECT Name, SUM(OrderQty) AS TotalOrder 
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY Name

SELECT SUM(OrderQty * UnitPrice) AS Revenue, CustomerID
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY CustomerID

SELECT Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID
GROUP BY Name

SELECT TOP 10 CustomerID,SUM(OrderQty) AS TotalOrder FROM 
Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY CustomerID
ORDER BY TotalOrder DESC

SELECT TOP 10 SUM(OrderQty) TotalOrders, Name FROM
Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID
GROUP BY Name
ORDER BY TotalOrders DESC

SELECT TOP 10 Name, SUM(OrderQty) AS TotalOrder 
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY Name
ORDER BY TotalOrder DESC

SELECT TOP 10 SUM(OrderQty * UnitPrice) AS Revenue, CustomerID
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY CustomerID
ORDER BY Revenue DESC

SELECT TOP 10  Name, SUM(OrderQty * UnitPrice) AS Revenue
FROM Production.Product AS PP
INNER JOIN Sales.SalesOrderDetail AS SD
ON PP.ProductID = SD.ProductID
GROUP BY Name
ORDER BY Revenue DESC

SELECT TOP 10 Name, SUM(OrderQty * UnitPrice) AS TotalOrder 
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
ON SH.TerritoryID = ST.TerritoryID
GROUP BY Name
ORDER BY TotalOrder DESC
 
 SELECT
    (AVG(1.0 * OrderQty * UnitPrice) - AVG(1.0 * OrderQty) * AVG(1.0 * UnitPrice)) /
    (SQRT( (AVG(1.0 * OrderQty * OrderQty) - AVG(1.0 * OrderQty) * AVG(1.0 * OrderQty)) *
           (AVG(1.0 * UnitPrice * UnitPrice) - AVG(1.0 * UnitPrice) * AVG(1.0 * UnitPrice))
         )
    ) AS Correlation
FROM Sales.SalesOrderDetail

SELECT
    (AVG(1.0 * DATEDIFF(Year, HireDate,GETDATE()) * VacationHours) - AVG(1.0 * VacationHours) * AVG(1.0 *  DATEDIFF(Year, HireDate,GETDATE()) /
    (SQRT( (AVG(1.0 *  DATEDIFF(Year, HireDate,GETDATE())*  DATEDIFF(Year, HireDate,GETDATE()) - AVG(1.0 * DATEDIFF(Year, HireDate,GETDATE()) * AVG(1.0 * DATEDIFF(Year, HireDate,GETDATE())) *
           (AVG(1.0 *  VacationHours * VacationHours)  - AVG(1.0 * VacationHours) * AVG(1.0 * VacationHours)
         )
     AS Correlation
FROM HumanResources.Employee


---Day 30 : Capstone – Comprehensive SQL Project

SELECT COUNT(SalesOrderID) FROM Sales.SalesOrderDetail

SELECT COUNT(DISTINCT CustomerID) FROM Sales.Customer

SELECT COUNT(DISTINCT Name) AS Product FROM Production.Product

SELECT YEAR(OrderDate), SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY YEAR(OrderDate)

SELECT MONTH(OrderDate),SUM(OrderQty * UnitPrice) AS Revenue
FROM Sales.SalesOrderDetail AS SD
INNER JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY MONTH(OrderDate)

SELECT Name,SUM(OrderQty * UnitPrice) AS Revenue 
FROM Sales.SalesTerritory AS ST
INNER JOIN Sales.SalesOrderHeader AS SH
ON ST.TerritoryID = SH.TerritoryID
INNER JOIN Sales.SalesOrderDetail AS SD
ON SH.SalesOrderID = SD.SalesOrderID
GROUP BY Name

SELECT
  PC.Name AS CategoryName,
  AVG(PP.ListPrice) AS AvgListPrice
FROM Production.Product AS PP
INNER JOIN Production.ProductSubcategory AS PPS
  ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC
  ON PPS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name;

WITH TenurePerEmployee AS (
  SELECT
    ED.BusinessEntityID,
    ED.DepartmentID,
    DATEDIFF(YEAR, ED.StartDate, GETDATE()) AS TenureYears
  FROM HumanResources.EmployeeDepartmentHistory AS ED
  WHERE ED.EndDate IS NULL
)
, MaxTenurePerDept AS (
  SELECT
    DepartmentID,
    MAX(TenureYears) AS MaxTenureYears
  FROM TenurePerEmployee
  GROUP BY DepartmentID
)
SELECT
  t.BusinessEntityID,
  t.DepartmentID,
  t.TenureYears
FROM TenurePerEmployee AS t
INNER JOIN MaxTenurePerDept AS m
  ON t.DepartmentID = m.DepartmentID
  AND t.TenureYears = m.MaxTenureYears;











        



