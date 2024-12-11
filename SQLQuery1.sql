use master;
go

-- Creating Database for the data.
create database Retail_Sales;
go

use Retail_Sales;
go

-- The number of data points
select count(*) from [dbo].[superstore_dataset];
go


-- Checkng the data for duplicate values
SELECT 
   [order_id] ,[order_date],[sales], COUNT(*) AS Duplicate_Count
FROM 
    [dbo].[superstore_dataset]
GROUP BY 
    [order_id] ,[order_date],[sales]
HAVING 
    COUNT(*) > 1;
go




-- Checking the data for null values
SELECT *
FROM [dbo].[superstore_dataset]
WHERE [order_id] IS NULL OR [sales] IS NULL OR [customer] IS NULL;
go



-- sales per year
select year([order_date]) as "Year" ,sum([sales]) as "Total sales"
from [dbo].[superstore_dataset] group by year([order_date])
order by year([order_date]) asc



-- Sales per month
select year([order_date]) as "Year", month([order_date]) as "Month" ,sum([sales]) as "Total sales"
from [dbo].[superstore_dataset] group by year([order_date]), month([order_date])
order by year([order_date]) , month([order_date]) asc



-- Months with highest sales
select top(10) year([order_date]) as "Year", month([order_date]) as "Month" ,sum([sales]) as "Total sales"
from [dbo].[superstore_dataset] group by year([order_date]), month([order_date])
order by sum([sales]) desc



-- sales per each category
select [category] , sum([sales]) as "Total Sales" from [dbo].[superstore_dataset] 
group by [category] order by sum([sales]) desc



-- Salesper each subcategory 
select [category],[subcategory],sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [category],[subcategory] order by sum([sales]) desc



--Subcategories with highest sales
select top(5) [category],[subcategory],sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [category],[subcategory] order by sum([sales]) desc



--Subcategories with highest profit
select top(5) [category],[subcategory],sum([profit]) as "Total Profits" from [dbo].[superstore_dataset]
group by [category],[subcategory] order by sum([profit]) desc



--Subcategories with lowest sales
select top(5) [category],[subcategory],sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [category],[subcategory] order by sum([sales]) asc



-- Top 5 products that achieve highest sales
select top(5) [product_name] ,sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [product_name] order by sum([sales]) desc



-- Top 5 products that achieve highest profits
select top(5) [product_name] ,sum([profit]) as "Total Profit" from [dbo].[superstore_dataset]
group by [product_name] order by sum([profit]) desc



--  5 products with lowest sales
select top(5) [product_name] ,sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [product_name] order by sum([sales]) asc


--States with highest sales
select top(5) [state],sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [state] order by sum([sales]) desc


--States with lowest sales
select top(5) [state],sum([sales]) as "Total Sales" from [dbo].[superstore_dataset]
group by [state] order by sum([sales]) asc



--The profits and sales per each year
select year([order_date]) as"Year" , sum(sales) as "Sum Sales",sum([profit]) as "Sum Profit"
from [dbo].[superstore_dataset] group by year([order_date]) 
order by  sum(sales) desc,sum([profit]) desc



-- Manufactory with highest Sales and profits
select top(10) [manufactory], sum([sales]) as "Sum Sales",sum([profit]) as "Sum profits" from [dbo].[superstore_dataset]
group by [manufactory] order by  sum(sales) desc,sum([profit]) desc




-- Cusromers with highest sales and order frequency
select [customer],sum([sales]) as "Total Sales",count(*) as "N of Orders" from [dbo].[superstore_dataset]
group by [customer] having count(*)>10 order by sum([sales]) desc