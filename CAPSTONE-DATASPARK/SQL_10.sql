use dataspark;


-- 1. Top 5 Customers with most orders

select 
	c.CustomerKey,
    c.Name,
    count(o.Order_Number) as Count
from 
	customers as c
    inner join
    orderdetails as o on c.CustomerKey = o.CustomerKey
group by c.CustomerKey,c.Name
order by Count desc 
limit 5;

-- 2. Top 5 Stores with most orders

select 
	s.StoreKey,
    count(o.Order_Number) as Count
from 
	stores as s
    inner join
    orderdetails as o on s.StoreKey = o.StoreKey
group by s.StoreKey
order by Count desc 
limit 5;

-- 3. Top 5 Performing Stores by Total Revenue

select 
    s.StoreKey,
    sum(t.Total_BillAmount) as Total_Revenue
from 
    stores as s
    inner join totalbillperorder as t on s.StoreKey = t.StoreKey
group by 
    s.StoreKey
order by
    Total_Revenue desc
limit 5;


-- 4. Top 5 Products by Total Sales Quantity

select 
    p.Product_Name,
    sum(s.Quantity) as Total_Quantity
from 
    products as p
    inner join sales as s on p.ProductKey = s.ProductKey
group by 
    p.Product_Name
order by
    Total_Quantity desc
limit 5;

-- 5. Order Counts by Age_Group 

select 
	c.Age_Group,
    count(o.Order_Number) as Count
from 
	customers as c
    inner join
    orderdetails as o on c.CustomerKey = o.CustomerKey
group by c.Age_Group
order by Count desc ;

-- 6. Distribution of Orders by Order Type

select 
	Order_Type,
    count(Order_Type) as Count
from 
    orderdetails
group by Order_Type
order by Count desc;

-- 7. Top 5 Cities with the Highest Number of Customers

select 
    c.City,
    count(c.CustomerKey) as Customer_Count
from 
    customers as c
group by
    c.City
order by
    Customer_Count desc
limit 5;

-- 8. Total Revenue by Country

select 
    c.Country,
    sum(t.Total_BillAmount) as Total_Revenue
from 
    customers as c
    inner join totalbillperorder as t on c.CustomerKey = t.CustomerKey
group by 
    c.Country
order by 
    Total_Revenue desc;


-- 9. Average Delivery Time for Online Orders 

select 
    avg(DATEDIFF(o.Delivery_Date, o.Order_Date)) as Average_Delivery_Days
from 
    onlineorders as o;


-- 10. Top 5 most Delayed online orders

select 
	Order_Number,
	 DATEDIFF(Delivery_Date, Order_Date) as Delivery_Days
from onlineorders
order by Delivery_Days Desc
Limit 5;

-- 11. Top 5 Products by Total Sales Quantity

select 
    p.Product_Name,
    sum(s.Quantity) as Total_Quantity
from 
    products as p
    inner join sales as s on p.ProductKey = s.ProductKey
group by 
    p.Product_Name
order by
    Total_Quantity desc
limit 5;


-- 12. Top 5 Customers by Total Spend

select 
	c.CustomerKey,
    c.Name,
    sum(t.Total_BillAmount) as TotalSpend
from 
	customers as c
    inner join
    totalbillperorder as t on c.CustomerKey = t.CustomerKey
group by 
	c.CustomerKey, c.Name
order by 
	TotalSpend desc 
limit 5;

-- 13. Revenue Trend by Month and Year

select 
    t.Year,
    t.Month,
    sum(t.Total_BillAmount) as Total_Revenue
from 
    totalbillperorder as t
group by
    t.Year, t.Month
order by
    t.Year, t.Month;
