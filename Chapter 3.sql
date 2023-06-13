--update practice
--update employee dealership id

select 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.dealership_id
from
	employees e 
join
	dealershipemployees d 
on 
	e.employee_id = d.employee_id 
where 
	e.first_name = 'Kristopher' and e.last_name = 'Blumfield'
	

update dealershipemployees
set dealership_id = 20
where employee_id = 9

--update customer Ernestus Abeau sales record from JCB to Mastercard on invoice 9086714242 

select 
	s.sale_id,
	s.invoice_number,
	c.first_name,
	c.last_name,
	s.payment_method 
from
	sales s
join 
	customers c 
on
	s.customer_id = c.customer_id 
where c.first_name = 'Ernestus' and c.last_name = 'Abeau'


update sales
set payment_method = 'mastercard'
where invoice_number = '9086714242'

--practice delete 
--

select 
	*
from 
	sales s 
where 
	invoice_number = '2436217483'
	
delete from 
	sales
where 
	invoice_number = '2436217483'
	
select 
	*
from 
	employees e 
where 
	employee_id = '35'
	
delete from 
	employees 
where 
	employee_id = '35'

	
