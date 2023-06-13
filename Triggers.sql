create table accountsreceivable (
	accountsreceivable_id SERIAL primary key,
	credit_amount int,
	debit_amount int,
	date_received date,
	sale_id int references sales (sale_id)
)

drop table accountsreceivable 

insert into accountsreceivable (
	credit_amount, debit_amount, date_received, sale_id
)
values (23000, 3000, '2023-01-06', 3)

select * from accountsreceivable 

CREATE or replace FUNCTION add_accountsreceivable() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  insert into accountsreceivable (credit_amount, date_received, sale_id)
  values (NEW.deposit, NOW(), NEW.sale_id);
  
  RETURN NEW;
END;
$$


create or replace TRIGGER new_sale_made
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE add_accountsreceivable();
  
 
 insert into sales (deposit, price)
 values (23456, 26810)
 
 select * from accountsreceivable a 
 
CREATE or replace FUNCTION add_returned_accountsreceivable() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
	if new.sale_returned = true then 
	  insert into accountsreceivable (debit_amount, date_received, sale_id)
	  values (NEW.deposit, NOW(), NEW.sale_id);
  	end if;
  RETURN NEW;
END;
$$


create or replace TRIGGER new_return_made
  AFTER UPDATE
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE add_returned_accountsreceivable();

 select * from sales s 
 where sale_id = 146
 
 update sales s 
 set sale_returned = true  
 where sale_id = 146

