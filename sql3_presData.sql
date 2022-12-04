-- Customer table for presidents
create table customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);

-- Orders table for the presidents
create table order_ (
	order_id SERIAL primary key,
	order_date DATE default current_date,
	amount numeric(5,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

insert into customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
values(1, 'George', 'Washington', 'gwashh@usa.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');

insert into customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
values(2, 'John', 'Adams', 'jadams@usa.gov', '1200 Hancock', 'Quincy', 'MA', '02169');

insert into customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
values(3, 'Thomas', 'Jefferson', 'tjeff@usa.gov', '931 Thomas Jefferson Pkway', 'Charlottesville', 'VA', '53476');

insert into customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
values(4, 'James', 'Madison', 'jmad@usa.gov', '11350 Conway', 'Orange', 'VA', '78321');

insert into customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
values(5, 'James', 'Monroe', 'jmonroe@usa.gov', '2050 James Monroe Parkway', 'Charlottesville', 'VA', '53476');

select * from customer

-- Insert info into orders table

insert into order_(order_id, amount, customer_id)
values (1, 234.56, 1);

insert into order_(order_id, amount, customer_id)
values (2, 78.50, 3);

insert into order_(order_id, amount, customer_id)
values (3, 124.00, 2);

insert into order_(order_id, amount, customer_id)
values (4, 65.50, 3);

insert into order_(order_id, amount, customer_id)
values (5, 55.50, NULL);

select * from order_

-- customer = table a
-- order_ = table b

-- Inner join (get data that is mutual)
select first_name, last_name, order_date, amount 
from customer
inner join order_ 
on customer.customer_id = order_.customer_id

-- Left join (will only show null values if there is data that does not actually match); returns full left circle
-- If where order_date is null, returns left circle without mutual inner section
select first_name, last_name, order_date, amount
from customer
left join order_ 
on customer.customer_id = order_.customer_id
where order_date is not null

-- Right join
select first_name, last_name, order_date, amount
from customer 
right join order_
on customer.customer_id = order_.customer_id

-- Full join (brings back all of your data)
select first_name, last_name, order_date, amount
from customer
full join order_ 
on customer.customer_id = order_.customer_id

-- Returns everything but mutual inner section
select first_name, last_name, order_date, amount
from customer
full join order_ 
on customer.customer_id = order_.customer_id
where customer.customer_id is null 
or order_.customer_id is null