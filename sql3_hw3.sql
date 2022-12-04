-- #1. List all customers who live in Texas
select first_name, last_name
from customer 
full join address 
on customer.address_id = address.address_id
where district = 'Texas'

-- Answer: 5

-- #2. Get all payments above $6.99 with the customer's full name
select first_name, last_name
from customer 
full join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99

select count(payment.customer_id)
from customer
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99

-- Answer: 3,642

-- #3. Show all customers names who have made payments over $175
select first_name, last_name 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
)
group by first_name, last_name

-- Answer: 135

-- #4. List all customers that live in Nepal

select first_name, last_name, country
from customer
inner join address
on customer.address_id = address.address_id 
inner join city 
on address.city_id = city.city_id 
inner join country 
on city.country_id = country.country_id 
where country = 'Nepal'

-- Answer: 1

-- #5. Which staff member had the most transactions?
select first_name, last_name, count(payment.payment_id)
from staff 
full join payment 
on staff.staff_id = payment.staff_id 
group by staff.staff_id

-- Answer: Jon Stephens

-- #6. How many movies of each rating are there?
select count(film_id), rating
from film 
group by rating

-- Answer: 195 R, 209 NC-17, 178 G, 223 PG-13, 194 PG, 1 non-rated

-- #7. Show all customers who have made a single playment above $6.99
select customer.customer_id, first_name, last_name
from customer 
full join payment
on customer.customer_id = payment.customer_id
where amount in (
	select amount
	from payment 
	where amount > 6.99
	group by amount
)
group by customer.customer_id
having count(amount) = 1

-- Answer: 11

-- #8. How many free rentals did our stores give away?
select count(rental_id)
from payment
where amount = 0

-- Answer: 0