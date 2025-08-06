Create database superstore_db;
use superstore_db;

-- create table structure for the data set
create table superstore (
RowID int,
OrderID varchar(20),
OrderDate Date,
ShipDate Date,
ShipMode varchar(50),
CustomerID varchar(20),
CustomerName varchar(100),
Segment varchar(50),
Country varchar(50),
City varchar(50),
State varchar(50),
PostalCode int,
Region varchar(50),
ProductID varchar(20),
Category varchar(50),
SubCategory varchar(50),
ProductName varchar(150),
Sales decimal(10,2),
Quantity int,
Discount decimal(5,2),
Profit decimal(10,2)
);

-- total sale by category
select category, sum(sales)
from raw_sales_data
group by category;

-- total sale by subcategory
select subcategory, sum(sales)
from raw_sales_data
group by subcategory;

-- top 5 states by total sale
select state, sum(sales) as TotalSale
from raw_sales_data
group by state
order by TotalSale
Limit 5;

-- total sale and total profit by region
select region, 
	sum(sales) as totalsale,
	sum(profit)as totalProfit
from superstore
group by region;

-- top 10 monthly sales
select date_format(OrderDate, "%Y-%m") as month,
	sum(sales) as MonthlySale
from superstore
group by month
order by MonthlySale desc
limit 10;

-- each year top 3 months sales
with MonthlySales as (
	select 
		year(OrderDate) as year,
        date_format(OrderDate, "%Y-%m") as year_months,
        sum(sales) as Monthly_Sale
	from superstore
    group by year, year_months
),
RankedSale as (
	select 
		year,
        year_months,
        Monthly_Sale,
        Rank() over(partition by year order by Monthly_sale desc) as sales_rank
	from MonthlySales
)
select
	year,
    year_months,
    Monthly_Sale
from RankedSale
where sales_rank <= 3
order by year desc, monthly_sale desc;

-- top 10 sold products
select productname, sum(sales) as total_sale
from superstore
group by productname
order by total_sale desc
limit 10;

-- top 5 best selling furniture products for each month
with MonthlyProductSales as (
	select 
		date_format(OrderDate, "%Y-%m") as YearMonth,
        ProductID,
        ProductName,
        Category,
        sum(sales) as TotalSale,
        sum(Quantity) as TotalQuantity,
        Rank() over (partition by date_format(OrderDate, "%Y-%m") order by sum(Quantity) desc) as quantityRank
	from superstore
    Where category = "Furniture"
    group by YearMonth, ProductID, ProductName, category
)
select 
	YearMonth,
    ProductID,
    ProductName,
    Category,
    TotalSale,
    TotalQuantity
from MonthlyProductSales
where quantityRank <= 5
order by YearMonth desc, TotalQuantity desc;

-- Product with negative profit 
select productID, ProductName, category, subcategory, sum(profit) as TotalProfit
from superstore
group by ProductID, ProductName, category, subcategory
Having TotalProfit < 0
order by TotalProfit ASC;
