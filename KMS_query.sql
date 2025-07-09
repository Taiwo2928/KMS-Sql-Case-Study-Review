Create database KMS_db

---ImPORT EXCEL FILES---
---KMS_Sql_Case Study.xls
---Order_Status

Select * from [KMS Sql Case Study]

----Which product category had the highest sale?

Select Top 1 Product_Category, ROUND(Sum(Sales), 0) as Highest_Sales from
[KMS Sql Case Study]
Group by Product_Category
Order by Highest_Sales desc 

---Top 3 Regions in Sales
Select Top 3 Region, ROUND(Sum(Sales), 0) as Total_Sales from [KMS Sql Case Study]
Group by Region
Order by Total_Sales desc

---Bottom 3 Regions in Sales
Select Top 3 Region, ROUND(Sum(Sales), 0) as Total_Sales from [KMS Sql Case Study]
Group by Region
Order by Total_Sales asc

---Total Sales of Appliances in Ontario
Select Region, ROUND(Sum(Sales), 0) as [Total Sales of Appliances] from [KMS Sql Case Study]
where Region = 'Ontario' AND Product_Sub_Category = 'Appliances'
Group by Region 

---Bottom 10 Customer's Revenue
Select Top 10 Customer_Name, ROUND(Sum(Sales), 0) as Revenue from [KMS Sql Case Study]
Group by Customer_Name
Order by Revenue asc

---Highest Revenue from Ship Mode
Select Top 1 Ship_Mode, ROUND(Sum(Shipping_Cost), 0) as [Highest Revenue] from [KMS Sql Case Study]
Group by Ship_Mode
Order by [Highest Revenue] desc

---Products/Services Purchased by Most-Valuable Customers
Select Customer_Name, Order_Priority, Product_Name, ROUND(Sum(Sales), 0) as [Total Sales] from 
[KMS Sql Case Study]
Where Order_Priority = 'High'
Group by Customer_Name, Order_Priority, Product_Name
Order by [Total Sales] desc

---Highest Sales from Small Business Customer
Select Top 1 Customer_Name, Customer_Segment, ROUND(Sum(Sales), 0) as [Highest Sales] from 
[KMS Sql Case Study]
Where Customer_Segment ='Small Business'
Group by Customer_Name, Customer_Segment
Order by [Highest Sales] desc

---Highest Number of Orders placed by Corporate Customer between 2009-2012

Select Top 1 Customer_Name, Customer_Segment, count(distinct Order_ID) as [Unique IDs], Sum(Order_Quantity) as 
[Total Orders] from [KMS Sql Case Study]
Where Customer_Segment ='Corporate' AND Order_Date BETWEEN '2009' AND '2012'
Group by Customer_Name, Customer_Segment
Order by [Total Orders] desc


---Most Profitable Consumer Customer

Select Top 1 Customer_Name, Customer_Segment, ROUND(Sum(Profit), 0) as [Highest Profit] from [KMS Sql Case Study]
Where Customer_Segment ='Consumer' 
Group by Customer_Name, Customer_Segment
Order by [Highest Profit] desc

---Segment of Customer that Returned Items

Select [KMS Sql Case Study].Order_ID,
		[KMS Sql Case Study].Customer_Name,
		[KMS Sql Case Study].Customer_Segment,
		[KMS Sql Case Study].Product_Category

	from [KMS Sql Case Study]
	right join Order_Status
	on Order_Status.Order_ID = [KMS Sql Case Study].Order_ID


	---Shipping Cost by Order Priority by Ship Mode
	
	Select Ship_Mode, Order_Priority, ROUND(Sum(Shipping_Cost), 0) as [Total Cost] from [KMS Sql Case Study]
Group by Ship_Mode, Order_Priority
Order by [Total Cost] desc
