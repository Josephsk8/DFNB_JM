/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [acct_branch_lat]
      ,[acct_branch_lon]
      ,[acct_branch_add_id]
      ,[acct_branch_add_lat]
      ,[acct_branch_add_lon]
      ,[acct_branch_add_type]
  FROM [DFNB3].[dbo].[tblBranchDim]