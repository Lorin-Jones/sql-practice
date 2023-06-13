with top_five_dealerships as 
	(
		select  
			d.dealership_id,
			d.business_name,
			SUM(s.price) as total_sales
		from dealerships d
		JOIN sales s ON d.dealership_id = s.dealership_id 
			WHERE s.price IS NOT NULL
			GROUP BY d.business_name, d.dealership_id
			ORDER BY total_sales DESC
			LIMIT 5
	),
	employee_salespeople AS 
	(
		--For the top 5 dealerships, which employees made the most sales?
		SELECT e.first_name , e.last_name, de.dealership_id, COUNT(s.sale_id) AS Number_of_Sales,
        ROW_NUMBER() OVER(PARTITION BY de.dealership_Id ORDER BY COUNT(s.sale_id) DESC) as TopEmployee  
        FROM dealershipemployees de 
		JOIN employees e ON e.employee_id = de.employee_id 
		JOIN sales s ON s.employee_id = de.employee_id 
		GROUP BY de.dealership_id, e.first_name, e.last_name  
		ORDER BY Number_of_Sales DESC
	)
	SELECT td.business_name,
	     td.total_sales, 
	     es.first_name, 
	     es.last_name, 
	     es.Number_of_Sales
	FROM top_five_dealerships td
	INNER JOIN employee_salespeople AS es ON td.dealership_id = es.dealership_id AND TopEmployee = 1
	ORDER BY   td.dealership_id, es.number_of_sales DESC
