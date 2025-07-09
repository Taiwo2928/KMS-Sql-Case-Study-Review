# KMS-Sql-Case-Study-Review
Applying my SQL skills from DSA Data Analysis Class to solve case scenarios.

# Project Topic
Kultra Mega Stores Inventory
## Project Overview
Engaged as a Business Intelligence Analyst to support the Abuja division of KMS. The Business Manager has shared an Excel file containing order data from 2009 to 2012 and has requested that I analyze the data and present my key insights and findings.
### Files Given
KMS Sql Case Study.csv

Order_Status.csv

### Steps Involved
1. Create my Database (KMS_db)
2. Importing my flat files (KMS SqlCase Study.csv and Order_Status.csv) into my Database
3. Change Data type of Row_ID, Order_ID from smallint to int and allow NUll
4. Solve Case Scenarios with SQL queries

#### Case Scenario 1
4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers

Review:

Understanding Factors that may influence low revenue
1. Purchase of Low-margin
2. Infrequent purchase

Steps to be Taken
1. Recommend products based on their purchase history
2. Bundle low-cost items with premium products they haven't tried
3. Promote personalized communication and offers.

#### Case Scenario II
11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer

Review:

From data; Delivery Truck is mostly used for High-priority orders with the highest shipping cost while ExpressAir has the lowest shipping cost from high-priority orders.

Conclusion; No, the company did not appropraitely align shipping cost with Order Priority.
This imply inefficient spending, where shipping method does not reflect the importance of the order.
