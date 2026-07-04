CASE STUDY

A Commercial bank has experienced an increase in loan defaults over the past year, affecting profitability and exposing the institution to higher credit risk. To address this,the risk management team has commissioned the data Analytics team to conduct a comprehensive analysis of the loan portfolio. The objective is to identify risk factors, understand borrower behaviour, and provide actionable recommendations that will improve future lending decisions. These will be achieved through a data-driven approach.
For this project, I created synthetic datasets using Claude and chatgpt, generating realistic data to address key business questions. Through this approach, I aim to demonstrate how data can guide effective decision-making and support customer-centric strategies.

 TOOLS USED
SQL Server Management Studio
 DATA STRUCTURE
There are 6 tables, each containing a 2years transaction records. These datasets collectively provide comprehensive information on various aspects of user data, such as:

Customer table: This table contains 6 columns and 500 rows. It tells personal information about the user.

Account table: The table contains 7 columns and 613 rows. Each user in the User table has at least one account type (savings, loan, checking) and at most three account types. It provides essential information about each account.

Transaction table: It contains 8 columns and 10,000 rows. The table gives a detailed information on each transaction that has taken place throughout the company's existence.

Repayment table: Includes 5 columns and 1000 rows. This table logs transaction records flagged as having potential indicators of fraud.

Loan table

Expenses table;

After creating the datasets, I ensured there were no duplicates, verified that columns had appropriate data types, and confirmed there were no null values, preparing the tables for querying in SSMS.

ANSWERING BUSINESS QUESTIONS
I curated a list of advanced business questions, along with the corresponding queries, including the use of triggers and stored procedures, aimed at supporting the company's goal of effectively monitoring user retention, engagement, and activity levels. These analytical questions provide actionable insights and use of complex SQL techniques to help the company make data-driven decisions, ultimately enhancing their ability to understand and meet customer needs.

I provided a detailed explanation of the business impact of these analyses on both the company and the users. Read here: https://medium.com/@abowabat/analytical-exploration-of-fintech-transactions-automation-advanced-analytics-and-fraud-detection-c0bcccec885f

Connect with me on LinkedIn - www.linkedin.com/in/taibat-abowaba









































































# CREDIT-RISK-AND-FINANCIAL-ANALYTICS-IN-BANKING-SECTOR
This Project analyzes a banking credit risk dataset using SQL Server Management Studio (SSMS) to explore customer financial profiles, assess credit risk and generate insights that support data-driven decision
# Project Overview
This project analyzes a banking credit risk dataset using SQL server Management Studio (SSMS) to explore customer financial profiles, assess Loan performance and identify factors that influence credit risk. The analysis answers bussiness driven questions and provides insights that can support lending decison and risk management.
# Business Objectives
Analyze loan performance across different customer segments
I dentify high-risk and low-risk borrowers 
Explore trends in loan approval and repayment behavior
Assess customer credit risk based on financial and demographic data
# Tools used
SQL Server Management Studio (SSMS)
# Methodology

# Data structure
The data set contains customer and loan-related information commonly used in banking and credit risk analysis, including;
Customers
Account
Loan
Repayment
Expense
Department
