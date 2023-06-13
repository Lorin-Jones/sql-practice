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

--CREATE VIEW employee_dealership_names AS
--  SELECT 
--    e.first_name,
--    e.last_name,
--    d.business_name
--  FROM employees e
--  INNER JOIN dealershipemployees de ON e.employee_id = de.employee_id
--  INNER JOIN dealerships d ON d.dealership_id = de.dealership_id;

--select
--	*
--from 
--	employee_dealership_names 
--	
--create view all_vehicle_types AS
--	select
--		body_type,
--		make,
--		model 
--	from 
--		vehicletypes v
--	order by
--		v.body_type 

--create view num_of_employees_by_type AS
--select distinct
--	e2.employee_type_name,
--	COUNT(e.employee_id) OVER(partition by e2.employee_type_id) as employees_by_type
--from 
--	employees e 
--join
--	employeetypes e2
--on 
--	e.employee_type_id = e2.employee_type_id 

--SELECT v2.model, SUM(s.price) total_sales
--FROM sales s
--JOIN vehicles v ON s.vehicle_id = v.vehicle_id
--join vehicletypes v2 on v.vehicle_type_id = v2.vehicle_type_id 
--GROUP BY v2.model  
--ORDER BY total_sales DESC
--LIMIT 1;

-- select 
-- 	e.first_name,
-- 	e.last_name,
-- 	SUM(s.price)
 	

--SELECT e.first_name, e.last_name, SUM(s.price) totalSalesIncome
--FROM sales s
--JOIN employees e ON e.employee_id = s.employee_id 
--GROUP BY e.first_name, e.last_name 
--ORDER BY totalSalesIncome DESC
--LIMIT 5;
--
--SELECT d.business_name, SUM(s.price) totalSalesIncome
--FROM sales s
--JOIN dealerships d ON s.dealership_id = d.dealership_id
--GROUP BY d.business_name 
--ORDER BY totalSalesIncome DESC
--LIMIT 5;
--
--SELECT vt.make, vt.model, COUNT(s.sale_id) totalSales, SUM(s.price) totalSalesIncome
--FROM vehicles v
--JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id 
--JOIN sales s ON s.vehicle_id = v.vehicle_id
--GROUP BY vt.make, vt.model
--ORDER BY totalSalesIncome DESC
--LIMIT 1;

select 
	d2.business_name,
	e.employee_id,
	e.last_name,
	e.first_name,
	sum(s.price) total_employee_sales
from 
	sales s 
join employees e on s.employee_id = e.employee_id 
join dealershipemployees d on e.employee_id = d.employee_id 
join dealerships d2 on d.dealership_id = d2.dealership_id 
group by d2.business_name, e.employee_id, e.last_name, e.first_name;






	