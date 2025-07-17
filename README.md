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
2. Importing my flat files (KMS Sql Case Study.csv and Order_Status.csv) into my Database
3. Change Data type of Row_ID, Order_ID from smallint to int and allow NUll
4. Solve Case Scenarios with SQL queries. (KMS_query.sql)

#### Case Scenario 1
1. Which product category had the highest sales?
 
  ```sql

Select Top 1 Product_Category, ROUND(Sum(Sales), 0) as Highest_Sales from
[KMS Sql Case Study]
Group by Product_Category
Order by Highest_Sales desc 
  ```
2. What are the Top 3 and Bottom 3 regions in terms of sales?
```sql
---Top 3 Regions in Sales
Select Top 3 Region, ROUND(Sum(Sales), 0) as Total_Sales from [KMS Sql Case Study]
Group by Region
Order by Total_Sales desc

---Bottom 3 Regions in Sales
Select Top 3 Region, ROUND(Sum(Sales), 0) as Total_Sales from [KMS Sql Case Study]
Group by Region
Order by Total_Sales asc
```

3. What were the total sales of appliances in Ontario?
```sql
---Total Sales of Appliances in Ontario
Select Region, ROUND(Sum(Sales), 0) as [Total Sales of Appliances] from [KMS Sql Case Study]
where Region = 'Ontario' AND Product_Sub_Category = 'Appliances'
Group by Region 
```
4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers

```sql
---Bottom 10 Customer's Revenue
Select Top 10 Customer_Name, ROUND(Sum(Sales), 0) as Revenue from [KMS Sql Case Study]
Group by Customer_Name
Order by Revenue asc
```
Review:

Understanding Factors that may influence low revenue
 1. Purchase of Low-margin
 2. Infrequent purchase

Steps to be Taken
 1. Recommend products based on their purchase history
 2. Bundle low-cost items with premium products they haven't tried
 3. Promote personalized communication and offers.


#### 5. KMS incurred the most shipping cost using which shipping method?
```sql
---Highest Revenue from Ship Mode
Select Top 1 Ship_Mode, ROUND(Sum(Shipping_Cost), 0) as [Highest Revenue] from [KMS Sql Case Study]
Group by Ship_Mode
Order by [Highest Revenue] desc
```

#### Case Scenario II
6. Who are the most valuable customers, and what products or services do they typically purchase?
```sql
---Products/Services Purchased by Most-Valuable Customers
Select Customer_Name, Order_Priority, Product_Name, ROUND(Sum(Sales), 0) as [Total Sales] from 
[KMS Sql Case Study]
Where Order_Priority = 'High'
Group by Customer_Name, Order_Priority, Product_Name
Order by [Total Sales] desc
```
7. Which small business customer had the highest sales?
```sql
---Highest Sales from Small Business Customer
Select Top 1 Customer_Name, Customer_Segment, ROUND(Sum(Sales), 0) as [Highest Sales] from 
[KMS Sql Case Study]
Where Customer_Segment ='Small Business'
Group by Customer_Name, Customer_Segment
Order by [Highest Sales] desc
```
8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
```sql
---Highest Number of Orders placed by Corporate Customer between 2009-2012

Select Top 1 Customer_Name, Customer_Segment, count(distinct Order_ID) as [Unique IDs], Sum(Order_Quantity) as 
[Total Orders] from [KMS Sql Case Study]
Where Customer_Segment ='Corporate' AND Order_Date BETWEEN '2009' AND '2012'
Group by Customer_Name, Customer_Segment
Order by [Total Orders] desc
```
9. Which consumer customer was the most profi table one?
```sql
---Most Profitable Consumer Customer

Select Top 1 Customer_Name, Customer_Segment, ROUND(Sum(Profit), 0) as [Highest Profit] from [KMS Sql Case Study]
Where Customer_Segment ='Consumer' 
Group by Customer_Name, Customer_Segment
Order by [Highest Profit] desc
```
10. Which customer returned items, and what segment do they belong to?
```sql
---Segment of Customer that Returned Items

Select [KMS Sql Case Study].Order_ID,
		[KMS Sql Case Study].Customer_Name,
		[KMS Sql Case Study].Customer_Segment,
		[KMS Sql Case Study].Product_Category

	from [KMS Sql Case Study]
	right join Order_Status
	on Order_Status.Order_ID = [KMS Sql Case Study].Order_ID

```
11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer

```sql
---Shipping Cost by Order Priority by Ship Mode
	
	Select Ship_Mode, Order_Priority, ROUND(Sum(Shipping_Cost), 0) as [Total Cost] from [KMS Sql Case Study]
Group by Ship_Mode, Order_Priority
Order by [Total Cost] desc
```

Review:

From data; Delivery Truck is mostly used for High-priority orders with the highest shipping cost while ExpressAir has the lowest shipping cost from high-priority orders.

Conclusion; 
No, the company did not appropraitely align shipping cost with Order Priority.

This imply inefficient spending, where shipping method does not reflect the importance of the order.
