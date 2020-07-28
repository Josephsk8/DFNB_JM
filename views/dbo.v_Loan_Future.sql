USE [DFNB3]
GO

/*****************************************************************************************************************
NAME:    Loan_Future
PURPOSE: Calculate and predict how much money is lended to customers


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       06/25/2020   JMueras      1. Predict and Prescribe Future Performance - Visualization and Presentation


RUNTIME: 
3s

NOTES: 
Assuming there is a 30% loan fee each year


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/
		
SELECT 0.3 * [cur_bal] + [cur_bal] AS Loan_Future
FROM [dbo].[v_Loan_Future]
WHERE year (as_of_date) <> 2019
ORDER BY 1;
