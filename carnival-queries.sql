--select 
--	d.business_name,
--	d.city,
--	d.state,
--	d.website
--from dealerships d 

--select
--	c.first_name,
--	c.last_name,
--	c.email
--from
--	customers c 

--select *
--from 
--	sales s
--inner join salestypes s2 on s.sales_type_id = s2.sales_type_id 
--where s2.sales_type_name = 'Lease'

--select *
--from 
--	sales s 
--where purchase_date between '2015-01-01' and '2020-01-01'
--order by purchase_date desc 

--select *
--from sales s 
--where deposit > 5000 or payment_method = 'americanexpress'

--select distinct
--	employees.last_name || ', ' || employees.first_name employee_name,
--	sales.employee_id,
--	sum(sales.price) over() total_sales,
--	sum(sales.price) over(partition by employees.employee_id) total_employee_sales
--from
--	employees
--join
--	sales
--on
--	sales.employee_id = employees.employee_id
--order by employee_name

--Write a query that shows the total purchase sales income per dealership.
--Write a query that shows the purchase sales income per dealership for July of 2020.
--Write a query that shows the purchase sales income per dealership for all of 2020.

--select distinct 
--	d.business_name,
--	d.dealership_id, 
--	case when s2.sales_type_name = 'Purchase' then sum(s.price) over(partition by d.dealership_id) else 0 end as total_purchase_sales_income
--from 
--	dealerships d 
--join
--	sales s on s.dealership_id = d.dealership_id 
--join 
--	salestypes s2 on s2.sales_type_id = s.sales_type_id 
--where 
--	s2.sales_type_name = 'Purchase'
--order by d.business_name 

--select distinct 
--	d.business_name,
--	d.dealership_id, 
--	case when s2.sales_type_name = 'Purchase' 
--	and s.purchase_date >= '2020-07-01'
--	and s.purchase_date < '2020-08-01'
--	then sum(s.price) over(partition by d.dealership_id) else 0 end as total_purchase_sales_income
--from 
--	dealerships d 
--join
--	sales s on s.dealership_id = d.dealership_id 
--join 
--	salestypes s2 on s2.sales_type_id = s.sales_type_id 
--where 
--	s2.sales_type_name = 'Purchase'	
--order by d.business_name 

--SELECT
--    d.business_name,
--    d.dealership_id,
--    SUM(s.price) AS total_purchase_sales_income
--FROM
--    dealerships d
--JOIN
--    sales s ON s.dealership_id = d.dealership_id
--JOIN
--    salestypes s2 ON s2.sales_type_id = s.sales_type_id
--WHERE
--    s2.sales_type_name = 'Purchase'
--    AND s.purchase_date >= '2020-07-01'
--    AND s.purchase_date < '2020-08-01'
--GROUP BY
--    d.business_name,
--    d.dealership_id
--ORDER BY
--    d.business_name;

--SELECT
--    d.business_name,
--    d.dealership_id,
--    SUM(s.price) OVER (PARTITION BY d.business_name, d.dealership_id) AS total_purchase_sales_income,
--    'July 2020' AS month
--FROM
--    dealerships d
--JOIN
--    sales s ON s.dealership_id = d.dealership_id
--JOIN
--    salestypes s2 ON s2.sales_type_id = s.sales_type_id
--WHERE
--    s2.sales_type_name = 'Purchase'
--    AND s.purchase_date >= '2020-07-01'
--    AND s.purchase_date < '2020-08-01'
--ORDER BY
--    d.business_name;

--SELECT
--    d.business_name,
--    d.dealership_id,
--    SUM(s.price) OVER (PARTITION BY d.business_name, d.dealership_id) AS total_purchase_sales_income,
--    '2020' AS year 
--FROM
--    dealerships d
--JOIN
--    sales s ON s.dealership_id = d.dealership_id
--JOIN
--    salestypes s2 ON s2.sales_type_id = s.sales_type_id
--WHERE
--    s2.sales_type_name = 'Purchase'
--    AND s.purchase_date >= '2020-01-01'
--    AND s.purchase_date < '2020-12-31'
--ORDER BY
--    d.business_name;

--select distinct 
--	d.business_name,
--	d.dealership_id, 
--	case when s2.sales_type_name = 'Lease' then sum(s.price) over(partition by d.dealership_id) else 0 end as total_purchase_sales_income
--from 
--	dealerships d 
--join
--	sales s on s.dealership_id = d.dealership_id 
--join 
--	salestypes s2 on s2.sales_type_id = s.sales_type_id 
--where 
--	s2.sales_type_name = 'Lease'
--order by d.business_name 


