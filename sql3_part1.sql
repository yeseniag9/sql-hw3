-- Inner join on the Actor and Film actor table
select actor.actor_id, first_name, last_name, film_id
from film_actor
inner join actor
on actor.actor_id = film_actor.actor_id

-- Left join on the Actor and Film_actor table 
select actor.actor_id, first_name, last_name, film_id
from film_actor
left join actor
on actor.actor_id = film_actor.actor_id;

-- Join that will produce info about a customer from the counrty of Agola
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where country = 'Angola'

-- Subqueries

-- Two queries split apart (which will become a subquery later)

-- Find a customer_id that has an amount greater than 175 in total payments
select customer_id
from payment
group by customer_id 
having sum(amount) > 175
order by sum(amount) desc;

select store_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
)
group by store_id, first_name, last_name;

-- Basic subsquery

select * 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

-- Another basic subquery where all films are in english
select *
from film 
where language_id in (
	select language_id
	from language 
	where name = 'English'
);