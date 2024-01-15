
-- question 1: how many actors are there with the last name 'Wahlberg'?
select * from actor;

select first_name, last_name
from actor
where last_name = 'Wahlberg';

-- answer 1: there are 2 actors have the last name 'Wahlberg'.

-- question 2: how many payments were made between $3.99 and $5.99?
select * from payment;

select amount from payment
where amount >= 3.99 and amount <= 5.99;

-- answer 2: there are no payments made between $3.99 and $5.99.

-- question 3: what film does the store have the most of?
select * from inventory;

select inventory_id, film_id from inventory
order by film_id desc;

-- answer 3: the store has the most of inventory item 4,574 which has 1000 units.

-- question 4: how many customers have the last name 'William'?
select * from customers;

select last_name from customers
where last_name = 'William';

-- answer 4: there are no customers with the last name 'William'.

-- question 5: what store employee (get the id) sold the most rentals?
select * from rental;

select staff_id, sum(inventory_id) from rental
group by staff_id;

-- answer 5: staff_id #2 sold the most rentals

-- question 6: how many different district names are there?
select * from address;

select count(distinct district) from address;

-- answer 6: there are 378 different district names.

-- question 7: what film has the most actors in it? (use film_actor table and get film_id)
select * from film_actor;

select actor_id, film_id from film_actor
order by actor_id desc;

-- answer 7: film_id 993 has the most actors.

-- question 8: from store_id 1, how many customers have a last name ending with 'es'? (use customer table)
select * from customer;

select last_name from customer
where last_name like '%es';

-- answer 8: there are no last names that have a last name ending with 'es'. (i tested this with other names and the query does work)

-- question 9: how many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
			-- with ids between 380 and 430? (use group by and having > 250)
select * from payment;

--select * from payment
--where RIGHT(amount::text, 3) = '.99';

SELECT amount, COUNT(rental_id) as rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430 AND RIGHT(amount::text, 3) = '.99'
GROUP BY amount
HAVING COUNT(rental_id) > 250;

-- answer 9: there aren't any. all payment amounts like 4.99, 5.99, etc. all belong to a customer_id of 4

-- question 10: within the film table, how many rating categories are there? and what rating has the most movies total?
select * from film;

select count(distinct rating) from film;

select film_id, rating from film
order by rating desc;

-- answer 10: there are 5 rating categories, and rating NC-17 has the most movies