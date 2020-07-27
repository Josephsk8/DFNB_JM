
USE [DFNB3]
GO

/****** Object:  View [dbo].[v_branch_tran_sum]    Script Date: 7/17/2020 9:50:59 AM ******/
--DROP VIEW [dbo].[v_branch_tran_sum]
--GO

/****** Object:  View [dbo].[v_branch_tran_sum]    Script Date: 7/17/2020 9:50:59 AM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


--DROP VIEW dbo.v_branch_tran_sum;

CREATE VIEW [dbo].[v_branch_tran_sum]
AS
/*****************************************************************************************************************
NAME:    dbo.v_branch_tran_sum
PURPOSE: Create the dbo.v_branch_tran_sum view


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       06/22/2020   JMueras      1. Built this view for LDS BC IT 240


RUNTIME: 
3s

NOTES: 
This view is the main source for this dashboard...

DFNB Branch Transaction Summary v.1.0.pbix



LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

SELECT branch_id
     , acct_branch_id
     , acct_branch_code
     , acct_branch_desc
     , acct_branch_lat
     , acct_branch_lon
     , birth_date
FROM [dbo].[stg_p1]
    
GO



-- Data output

SELECT v.*
  FROM dbo.v_branch_tran_sum as v
ORDER BY 1;