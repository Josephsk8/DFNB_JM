/*****************************************************************************************************************
NAME:    dbo.tblAccountDim
PURPOSE: Create table dbo.tblAccountDim

SUPPORT: Joseph Mueras

MODIFICATION LOG:
Ver       Date         Author          Description
-------   ----------   -------------   -----------------------------------------------------------------------------
1.0       06/10/2020   Joseph Mueras   1. Built this script for LDS BC IT 240


RUNTIME: 

NOTES: 
Account Dimension

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

USE [DFNB3]
GO

ALTER TABLE [dbo].[tblAccountDim] DROP CONSTRAINT [FK_tblAccountDim_prod_id_tblProductDim_prod_id]
GO

ALTER TABLE [dbo].[tblAccountDim] DROP CONSTRAINT [FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id]
GO

ALTER TABLE [dbo].[tblAccountDim] DROP CONSTRAINT [FK_tblAccountDim_branch_id_tblBranchDim_branch_id]
GO

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 12/5/2019 7:33:27 PM ******/
DROP TABLE [dbo].[tblAccountDim]
GO

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 12/5/2019 7:33:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountDim](
	[acct_id] [int] NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_tblAccountDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDim_branch_id_tblBranchDim_branch_id] FOREIGN KEY([branch_id])
REFERENCES [dbo].[tblBranchDim] ([branch_id])
GO

ALTER TABLE [dbo].[tblAccountDim] CHECK CONSTRAINT [FK_tblAccountDim_branch_id_tblBranchDim_branch_id]
GO

ALTER TABLE [dbo].[tblAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id] FOREIGN KEY([pri_cust_id])
REFERENCES [dbo].[tblCustomerDim] ([cust_id])
GO

ALTER TABLE [dbo].[tblAccountDim] CHECK CONSTRAINT [FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id]
GO

ALTER TABLE [dbo].[tblAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDim_prod_id_tblProductDim_prod_id] FOREIGN KEY([prod_id])
REFERENCES [dbo].[tblProductDim] ([prod_id])
GO

ALTER TABLE [dbo].[tblAccountDim] CHECK CONSTRAINT [FK_tblAccountDim_prod_id_tblProductDim_prod_id]
GO


