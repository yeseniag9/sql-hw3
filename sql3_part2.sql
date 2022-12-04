select * from payment;

-- Stored procedure example to imitate a late fee charge

create or replace procedure latefee(
	customer INTEGER,
	lateFeeAmount DECIMAL
)
language plpgsql
as $$
begin
	-- Add a late fee to customer payment amount
	update payment 
	set amount = amount + lateFeeAmount
	where customer_id = customer_id;

	-- Commit the above statement inside of a transaction
	commit;
end;
$$

-- Calling a stored procedure
call lateFee(341, 2.00);

-- Check that the late fee has been posted
select * from payment where customer_id = 341;

-- To delete the procedure:
drop procedure latefee;

-- Stored functions
-- Make a stored function to insert data into the actor table 

create or replace function add_actor(_actor_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _last_update TIMESTAMP without TIME zone)
returns void
as $MAIN$
begin
	insert into actor(actor_id, first_name, last_name, last_update)
	values (_actor_id, _first_name, _last_name, _last_update);
end;
$MAIN$
language plpgsql;

-- Bad call of function 
call add_actor(500, 'Kevin', 'Hart', current_timestamp)

-- Good call of function 
select add_actor(599, 'Kevin', 'Hart', NOW()::timestamp);

-- Verify addition
select * from actor where actor_id = 599;

-- delete/drop the stored function
drop function add_actor;