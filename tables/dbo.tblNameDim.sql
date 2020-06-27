/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [last_name]
      ,[first_name]
      ,[gender]
      ,[birth_date]
  FROM [DFNB3].[dbo].[tblNameDim]