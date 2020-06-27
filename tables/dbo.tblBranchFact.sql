/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [as_of_date]
      ,[acct_id]
      ,[cur_bal]
  FROM [DFNB3].[dbo].[tblBranchFact]