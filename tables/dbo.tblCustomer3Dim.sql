/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [acct_id3]
      ,[last_name]
      ,[first_name]
      ,[gender]
  FROM [DFNB3].[dbo].[tblCustomer3Dim]