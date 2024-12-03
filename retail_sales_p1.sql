-- SQL Retail sales analysis - P1

-- create table 
DROP TABLE IF EXISTS retail_sales;
create table retail_sales
(
transactions_id	INT PRIMARY KEY,
sale_date	date,
sale_time	time,
customer_id	int,
gender	varchar(15),
age	int,
category varchar(15),
quantiy	int,
price_per_unit	float,
cogs	float,
total_sale float
);

select * from retail_sales;


select count(*) from retail_sales;


select * from retail_sales
where 
transactions_id	is null
or
sale_date is null	
or
sale_time is null
or
customer_id	is null	
or
gender	is null
or
age	is null
or
category is null
or
quantiy	is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null ;


Delete from retail_sales
where 
transactions_id	is null
or
sale_date is null	
or
sale_time is null
or
customer_id	is null	
or
gender	is null
or
age	is null
or
category is null
or
quantiy	is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;


-- Data Exploration

-- how many sales record?

select count(*) from retail_sales;


-- How many customer do we have?

select count(distinct(customer_id)) from retail_sales;


-- Data Analysis and Bussiness key problems and answers:


--1 Write a query to retrieve all column for sales made on '2022-11-05'.

select * from retail_sales
where sale_date = '2022-11-05';

--2 Write a query to retrieve all transactions where the category is clothing 
--and the quantity sold is more then 4 in the month of Nov-2022.

select * from retail_sales
where 
category = 'Clothing'
and
sale_date >= '2022-11-01' 
and
sale_date <= '2022-11-30'
and 
quantiy >= 4;

--3. Write a sql query to calculate the total sales for each category.

select category, sum(total_sale) as Total_sales
from retail_sales
group by category;


--4. Write a sql query to find the average age of the customer who purchased
--item from the beauty category. 

select category,round(avg(age),2) as average
from retail_sales
where category = 'Beauty'
group by category;


--5. Write a sql query to find all transaations where the total_sale is greater 
-- than 1000.

select * from retail_sales
where total_sale > 1000;


--6 Write a sql query to find the total number of transactions made by each
-- gender in each category.


select category,gender,count(transactions_id) as number_of_transactions
from retail_sales
group by category,gender;

--7 Write a sql query to calculate the average sales of each month.
-- find out best selling month in each year.


select 
extract (month from sale_date) as month,
extract (year from sale_date) as year,
avg(total_sale) as Average 
from retail_sales
group by month,year
order by average desc;


--8 Write a sql query to find the top 5 customers based on the highest total sales.

select customer_id, sum(total_sale) as total_sales 
from retail_sales
group by customer_id
order by total_sales desc
limit 5 ;

--9 Write a sql query to find the number of unique customers who purchased item 
--from each category.


select category ,count(distinct(customer_id)) as Unique_customers
from retail_sales
group by category;


--10 Write a sql query to create each shift and nuber of orders (Example Morning <=12,
-- afternoon between 12 and 17 , evening >17).












