--Q1: By Order Quantity, what were the five most popular products sold in 2014?

--Include these data points in the output:

--Order Date Year

--Product ID

--Product Name

--Product Number

--Product Color

--Sales Order Count

--Order Quantity

--Sales Order Line total
--A1:Here they are...
--OrderDateYear p.ProductID ProductName ProductNumber ProductColor SalesOrderIDCount OrderQtySum SalesOrderLineTotalSum
--2014	870	Water Bottle - 30 oz.	WB-H098	NULL	2273	2902	12900.317660
--2014	712	AWC Logo Cap	CA-1098	Multi	1267	1950	14430.970952
--2014	711	Sport-100 Helmet, Blue	HL-U509-B	Blue	1221	1776	52353.591556
--2014	873	Patch Kit/8 Patches	PK-7098	NULL	1608	1761	3850.406000
--2014	707	Sport-100 Helmet, Red	HL-U509-R	Red	1231	1717	51697.665517


SELECT TOP 5 year (soh.OrderDate) AS OrderDateYear
		,p.ProductID
		,p.Name AS ProductName
		,p.ProductNumber
		,p.Color AS ProductColor
		,count(sod.SalesOrderID) AS SalesOrderIDCount
		,sum(sod.OrderQty) AS OrderQtySum
		,sum(sod.LineTotal) AS SalesOrderLineTotalSum
FROM [AdventureWorks2017].[Production].[Product] AS p
	INNER JOIN	
	Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
	INNER JOIN	
	Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE year(soh.OrderDate) = 2014
GROUP BY year(soh.OrderDate)
		,p.ProductID
		,p.Name
		,p.ProductNumber
		,p.Color
ORDER BY 7 desc;

--Q2: How long are the 7 longest Person names and to whom do they belong? Rank by Full Name length, Last Name Length, First Name Length

--Include these data points in the output:

--Business Entity ID
--Full Name
--Full Name Length
--First Name
--First Name Length
--Middle Name
--Last Name
--Last Name Length

--A2. 
--Business Entity ID Full Name Full Name Length First Name First Name Length Middle Name Last Name Last Name Length
--4388	Osarumwense Uwaifiokun Agbonile	31	Osarumwense	11	Uwaifiokun	Agbonile	8
--1979	Ranjit Rudra Varkey Chudukatil	30	Ranjit	6	Rudra	Varkey Chudukatil	17
--565	Janaina Barreiro Gambaro Bueno	30	Janaina Barreiro Gambaro	24	NULL	Bueno	5
--272	Janaina Barreiro Gambaro Bueno	30	Janaina	7	Barreiro Gambaro	Bueno	5
--2348	Janaina Barreiro Gambaro Bueno	30	Janaina	7	Barreiro Gambaro	Bueno	5
--775	Alvaro De Matos Miranda Filho	29	Alvaro	6	NULL	De Matos Miranda Filho	22
--1619	Paulo Sergio Da Silva Pinto	27	Paulo	5	Sergio Da Silva	Pinto	5

SELECT TOP 7 p.BusinessEntityID
			,replace(coalesce(p.FirstName, '') + ' ' + coalesce(p.MiddleName, '') + ' ' + coalesce(p.lastName,''), '  ', ' ') AS FullName
			,len(replace(coalesce(p.FirstName, '') + ' ' + coalesce(p.MiddleName, '') + ' ' + coalesce(p.LastName, ''), '  ', ' ')) AS FullNameLength
			,p.FirstName
			,len(p.FirstName) AS FistNameLength
			,p.MiddleName
			,p.LastName
			,len(p.LastName) AS LastNameLength
FROM [AdventureWorks2017].[Person].[Person] AS p
ORDER BY 3 desc
		,8 desc
		,5 desc;

--Q3: Which Department pays its female workers on average the most per year?

--Include these fields:

--Department ID

--Deartment Name

--Gender

--Total Yearly Pay

--Business Entity ID Count

--Average Yearly Pay

--A3.
--DepartmentID DepartmentName Gender Rate PayFrequency SalariedFlag
--2	Tool Design	F	50000.00	1	50000.00
--16	Executive	F	147713.90	3	49237.9666
--1	Engineering	F	128846.10	3	42948.70
--10	Finance	F	331425.40	8	41428.175
--6	Research and Development	F	81730.80	2	40865.40
--11	Information Services	F	144951.90	4	36237.975
--9	Human Resources	F	60312.40	2	30156.20
--7	Production	F	1271600.00	46	27643.4782
--5	Purchasing	F	160936.80	6	26822.80
--3	Sales	F	186562.40	7	26651.7714

WITH s1
AS (SELECT d.DepartmentID
		  ,d.Name AS DepartmentName
		  ,e.Gender
		  ,eph.Rate
		  ,eph.PayFrequency
		  ,e.SalariedFlag
		  ,CASE
			   WHEN e.SalariedFlag = 1
			   then rate * 1000
			   WHEN e.SalariedFlag = 0 
			   then rate * 2000
			   else 0
		   end as YearlyPay
		  ,count(e.BusinessEntityID) AS BusinessEntityIDCount
		  ,CASE 
			   WHEN e.SalariedFlag = 1
			   then rate * 1000
			   WHEN e.SalariedFlag = 0 
			   then rate * 2000
			   else 0
		   END * count(e.BusinessEntityID) AS TotalYearlyPay
	  FROM HumanResources.Employee AS e
		   inner JOIN
		   HumanResources.EmployeeDepartmentHistory as edh on e.BusinessEntityID = edh.BusinessEntityID
		   inner JOIN
		   HumanResources.EmployeePayHistory AS eph ON edh.BusinessEntityID = eph.BusinessEntityID
		   INNER JOIN
		   HumanResources.Department AS d ON edh.DepartmentID = d.DepartmentID
	  WHERE e.Gender = 'F'
	  GROUP BY d.DepartmentID
			  ,d.Name
			  ,e.Gender
			  ,eph.Rate
			  ,eph.PayFrequency
			  ,e.SalariedFlag
			  ,CASE
					WHEN e.SalariedFlag = 1
					then rate * 1000
					WHEN e.SalariedFlag = 0 
					then rate * 2000
					else 0
			   end)
 SELECT TOP 10 s1.DepartmentID
			, s1.DepartmentName
			, s1.Gender
			, SUM(s1.TotalYearlyPay) AS TotalYearlyPay
			, sum(s1.BusinessEntityIDCount) AS BusinessEntityIDCount
			, sum(s1.TotalYearlyPay) / sum(s1.BusinessEntityIDCount) AS AverageYearlyPay
FROM s1
GROUP BY s1.DepartmentID
		,s1.DepartmentName
		,s1.Gender
ORDER BY 6 desc;

