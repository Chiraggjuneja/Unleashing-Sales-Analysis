-- problem statement

# Total sales revenue: Calculate the total revenue generated by the company based on the "Total" column. 
# Monthly sales trend: Create an appropriate chart that shows the monthly sales trend over a given period. The chart should display the total sales revenue for each month. 
# Top-selling products: Determine the top 5 best-selling products based on the total quantity sold. Display the product line under which they are present and quantities in a separate table. 
# Customer analysis: Create a bar chart that shows the distribution of customers based on the total amount they spent. Group customers into different spending ranges (e.g., $0-$100, $101-$500, $501-$1000, etc.) and display the number of customers in each range 
# Sales by branch: Analyse the sales performance by branch. Calculate the total sales revenue for each branch and display the results in a pie chart.
# Sales by customer type: Create a PivotTable that summarizes the total

-- let's begin

create database sales;
use sales;
load data local infile 'E:/Sales Analytics.csv'
into table sales
columns terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines;
set global local_infile=1;
select* from sales;

# NOTE
-- I checked the data, it is already cleaned and there is no missing values in it, so let's start.

#1. Calculate the total revenue generated by the company based on the "Total" column.
select round(sum(total_sales)) from sales;
select year,round(sum(total_sales)) from sales group by year;

#2 Create an appropriate chart that shows the monthly sales trend over a given period. The chart should display the total sales revenue for each month.
select sales.year, sales.month,round(sum(total_sales)) from sales group by sales.year,sales.month  having sales.year=2019;

select sales.year, sales.month,round(sum(total_sales)) from sales group by sales.year,sales.month  having sales.year=2020;

select sales.year, sales.month,round(sum(total_sales)) from sales group by sales.year,sales.month  having sales.year=2021;

#3.Determine the top 5 best-selling products based on the total quantity sold. Display the product line under which they are present and quantities in a separate table.
select sales. product, sum(quantity) as Total_quantity from sales group by  sales.product order by total_quantity desc limit 5;

select product, sum(quantity) as total_quantity, branch  from sales group by product,branch having branch="a" order by total_quantity desc limit 5;

select product, sum(quantity) as total_quantity, branch  from sales group by product,branch having branch="b" order by total_quantity desc limit 5;

select product, sum(quantity) as total_quantity, branch  from sales group by product,branch having branch="c" order by total_quantity desc limit 5; 

#4. Create a bar chart that shows the distribution of customers based on the total amount they spent. Group customers into different spending ranges (e.g., $0-$100, $101-$500, $501-$1000, etc.) and display the number of customers in each range 
select '0-100'as ranges, count(*) as No_Customers from sales where Total_sales between 0 and 100;

select '101-200'as ranges, count(*) as No_Customers from sales where Total_sales  between 101 and 200;

select '201-300'as ranges, count(*) as No_Customers from sales where Total_sales  between 201 and 300;

select '301-400'as ranges, count(*) as No_Customers from sales where Total_sales  between 301 and 400;

select '401-500'as ranges, count(*) as No_Customers from sales where Total_sales  between 401 and 500;

select '501-600'as ranges, count(*) as No_Customers from sales where Total_sales  between 501 and 600;

select '601-700'as ranges, count(*) as No_Customers from sales where Total_sales  between 601 and 700;

select '701-800'as ranges, count(*) as No_Customers from sales where Total_sales  between 701 and 800;

select '801-900'as ranges, count(*) as No_Customers from sales where Total_sales  between 801 and 900;

select '901-1000'as ranges, count(*) as No_Customers from sales where Total_sales  between 901 and 1000;

select '1001-1100'as ranges, count(*) as No_Customers from sales where Total_sales  between 1001 and 1100;

#5.Analyse the sales performance by branch. Calculate the total sales revenue for each branch and display the results in a pie chart.
select Branch,round(sum(total_sales)) as Total_Revenue from sales group by branch having branch="a";

select Branch,round(sum(total_sales)) as Total_Revenue from sales group by branch having branch="b";

select Branch,round(sum(total_sales)) as Total_Revenue from sales group by branch having branch="c";

select year,Branch,round(sum(total_sales)) as Total_Revenue from sales group by year,branch having branch="a";

select year,Branch,round(sum(total_sales)) as Total_Revenue from sales group by year,branch having branch="b";

select year,Branch,round(sum(total_sales)) as Total_Revenue from sales group by year,branch having branch="c";

#6.Sales by customer type: Create a PivotTable that summarizes the total

select customer_type,Round(sum(total_sales)) as Total_Revenue from sales group by Customer_type having Customer_type="normal";

select customer_type,Round(sum(total_sales)) as Total_Revenue from sales group by Customer_type having Customer_type="Member";
