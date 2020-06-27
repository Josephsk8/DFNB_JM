/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [cust_id2]
      ,[last_name]
      ,[first_name]
      ,[gender]
  FROM [DFNB3].[dbo].[tblCustomer2Dim]