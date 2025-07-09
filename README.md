# KMS-Sql-Case-Study-Review
Applying my SQL skills from DSA Data Analysis Class to solve case scenarios.

# Project Topic
Kultra Mega Stores Inventory
## Project Overview
Engaged as a Business Intelligence Analyst to support the Abuja division of KMS. The Business Manager has shared an Excel fi le containing order data from 2009 to 2012 and has requested that I analyze the data and present my key insights and findings.
### Files Given
KMS Sql Case Study.csv
Order_Status.csv

### Steps Involved
1. Create my Database (KMS_Db)
2. Importing my flat files (KMS SqlCase Study.csv and Order_Status.csv) into my Database
3. Change Data type of Row_ID, Order_ID from smallint to int and allow NUll
4. Solve Case Scenarios with SQL queries

#### Case Scenario 1
1. Which product category had the highest
/sql/
Select Top 1 Product_Category, ROUND(Sum(Sales), 0) as Highest_Sales from
[KMS Sql Case Study]
Group by Product_Category
Order by Highest_Sales desc 
