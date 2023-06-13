create procedure vehicle_sold(in car_id int)
language plpgsql
as $$
begin
	update vehicles
	set is_sold = true 
	where vehicle_id = car_id;
end;$$




select *
from vehicles v 
where vehicle_id = 1

call vehicle_sold(1)


--
create or replace procedure vehicle_returned(in car_id int)
language plpgsql
as $$
begin 
	update vehicles 
	set is_sold = false, is_new = false 
	where vehicle_id = car_id;

	insert into oilchangelogs (oil_change_log_id, vehicle_id)
	values (default, car_id);
end;$$;
end


select *
from vehicles v 
where vehicle_id = 1

--triggers

CREATE FUNCTION set_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  UPDATE sales
  SET pickup_date = NEW.purchase_date + integer '7'
  WHERE sales.sale_id = NEW.sale_id;
  
  RETURN NULL;
END;
$$


CREATE TRIGGER new_sale_made
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE set_pickup_date();
 
 insert into sales (
 	vehicle_id, employee_id, customer_id, 
 	dealership_id, price, deposit, purchase_date, 
 	invoice_number, payment_method
 )
 values (4, 5, 15, 3, 22000, 3000, '2023-06-06', '12345', 'americanexpress' );
 
 
 select * from sales s 
 where s.purchase_date = '2023-06-06'
 
CREATE or replace FUNCTION set_purchase_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
  NEW.purchase_date := CURRENT_DATE + INTERVAL '3 days';
  
  RETURN NEW;
END;
$$


create TRIGGER new_purchase_made 
  AFTER INSERT
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE set_purchase_date();

 insert into sales (
 	vehicle_id, employee_id, customer_id, 
 	dealership_id, price, deposit, 
 	invoice_number, payment_method
 )
 values (5, 6, 15, 3, 24000, 3500, '6789', 'visa' );

select * from sales s 
where 


