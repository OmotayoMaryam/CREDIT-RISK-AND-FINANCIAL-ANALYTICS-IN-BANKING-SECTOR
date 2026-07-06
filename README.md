# Project Title
Credit Risk and Financial Analytics Using SQL

# Project Overview
Financial institutions rely on data-driven insights to make informed lending decisions, manage credit risk and maintain a healthy loan portfolio.
This project analyzes a banking credit risk data set using SQL Server Management Studio (SSMS) to examine customer profiles, loan information, repayment records and expense data.
By applying SQL techniques such as joins, aggregate functions, CTES, and CASE statements. The analysis identifies key credit risk indicators and supports better lending and risk managements decisions.


# CASE STUDY

A Commercial bank has experienced an increase in loan defaults over the past year, affecting profitability and exposing the institution to higher credit risk. To address this,the risk management team has commissioned the data Analytics team to conduct a comprehensive analysis of the loan portfolio. The objective is to identify risk factors, understand borrower behaviour, and provide actionable recommendations that will improve future lending decisions. These will be achieved through a data-driven approach.
For this project, I created synthetic datasets using Claude and chatgpt, generating realistic data to address key business questions. Through this approach, I aim to demonstrate how data can guide effective decision-making and support customer-centric strategies.

# TOOLS USED
SQL Server Management Studio

# DATA STRUCTURE
The dataset consists of 6 interrelated tables containing a total of 3,380 records. All tables are linked through primary and foreign key relationships enabling cross-table analysis using SQL JOIN operations.These datasets collectively provide comprehensive information on various aspects such as:

Customer table: This table contains 11 columns and 200 rows. It tells personal information about each customer. It serves as the master table and it is linked to the account and loan tables via the customerID column.

Account table: The table contains 8 columns and 280 rows. It has the record of all bank accounts opened by customers. Each customer in the customer table has at least one account type (savings, current, fixed and Domiciliary). It is linked to customer table via customerID and Transaction table via AccountID.

Transaction table: This table records all financial transactions carried out across all accounts. It is the largest table in the dataset as it contains 9 columns and 1500 rows. It is linked to Account table via AccountID.

Repayment table: It contains 8 columns and 700 rows. This table contains records of borrower's loan repayment transactions,including repayment date, amount paid and repayment status. it is used to monitor loan performance, track repayment behaviour and assess credit risk.

Loan table; It contains 11 columns and 300 rows. This table gives detailed information about all loans disbursed to customers, including loan amount, interest rate, loan status and loan type amongst others. It is linked to the customer table via customerID and to the Repayment table via LoanID.

Expenses table; It contains 9 columns and 400 rows. It contains records of organizational expenditures, including expense category, departments, payment mode and other related expenditure details. It is used to monitor spending, analyze departmental expenses, track budget utilization, and support financial reporting.

Prior to Analysis, the data sets were cleaned and validated. This included removing duplicate records,confirming the absence of null values and verifying each column was assigned to appropriate data type. 

# BUSINESS QUESTIONS
To address the objectives of this project, I made a list of business questions and wrote a corresponding SQL Queries to answer them. These questions were designed to analyse customer profiles, loan performance, repayment behaviour and expense trends, tranforming raw banking data into actionable insights that support informed lending decisions and effective credit risk management. The under listed business questions guided the analysis:

1. What is the total number of customers in the portfolio?
2. What is the total and average loan amount issued by the bank?
3. What is the average loan amount by occupation?
4. How much interest revenue is generated per loan type?
5. What is the loan disbursement trend over time?
6. What is the total outstanding loan balance per customer?
7. Which loans are non-performing?
8. Which customers have both a loan and a savings account?
9. What is the total loan amount disbursed vs total repaid?
10. Which regions have the highest loan defaults?
11. Which customers took loans but never made a repayment?
12. How does transaction volume compare to loan repayment trend monthly?
13. What is the total number of customers, accounts, loans and transactions?
14. How do total bank expenses compare to total transaction revenue?
15. What is the overall NPL ratio?
16. Which occupation has the highest loan deafault rate
17. How does the average repayment period compare to loan term?
18. What is the on-time vs late vs missed repayment rate?
19. What is the collateral type distribution across loans?

# Key Findings
1. Self-employed and Unemployed customers default most
2. Over-Leveraged customers showing default payment
3. Budget inconsistencies across departments
4. Regional default concentration
5. Maturing Loans with high outstanding balances
6. Unsecured loans have lowest recovery rates

# Recommendations
Based on the analysis conducted across the 6 tables covering customers,loans,repayments, transactions,expenses and departments, the following recommendations are made to improve credit risk management,loan recovery and overall financial performance:
1. Strengthen Credit Risk Assessment Before Loan Disbursement
The analysis revealed that certain occupations record significantly higher loan deafault rates than others. It is recommended that the bank introduces stricter credit scoring criteria for high-risk occupations and requires additional collateral or guarantors before approving loans for customers in those categories.
2. Monitor Customers with Multiple Active Loans
These Customers represents a higher credit exposure risk. The bank should cap the number of concurrent active loans per customer and conduct regular finacial health checks on these customers to ensure they are not over-leveraged.
3. Optimise Expense Management by Department
The budget utilization and expense growth analysis reveals that some departments consistently overspend while others underutilise their budgets. The bank should impleemt quaterly budget reviews, enforce spending limits and reallocate budgets from underutilising departments to those with critical operational needs.
4. Address Regional Loan Default Concentration
Certain regions record disproportionately high loan default rates. The bank should investigate the socioeconomic factors driving defaults in these regions and consider region-specific loan products, repayment schedules or financial literacy programmes to reduce default rates.
5. Improve Loan Maturity Monitoring
Several loans are approaching maturity with significant outstanding balances. The bank should set up an automated early warning system that alerts managers days before loan maturity so they can engage customers and arrange repayment or restructuring before the loan becomes overdue.
6. Leverage Collateral to Improve Loan Recovery
The collateral distribution analysis shows that a significant number of loans are unsecured. The bank should enforce a stricter collateral policy especially for high-value loans and prioritise recovery efforts on unsecured non-performing loans before they become unrecoverable.

# Conclusion
This project demonstrates that data analytics plays a critical role in modern banking operations. By leveraging SQL to Query and analyse large volumes of financial data, banks can move from reactive to proactive risk managemnet, identify revenue opportunities,optimise operational efficiency and make more informed lending decisions.The insights generated from this analysis provide a strong foundation for data-driven decision making that can significantly improve the bank's credit risk posture and overall financial performance.















