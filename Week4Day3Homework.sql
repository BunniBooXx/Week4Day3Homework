-- 1. 1. List all customers who live in Texas (useJOINs)
-- NO data available trie LIKE 'Texas' and LIKE T%, did not give different result
SELECT * 
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address LIKE 'T_____%';

--2. Get all payments above $6.99 with the Customer's FullName
SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;


--3.Show all customers names who have made payments over $175(use
--subqueries)
--SELECT first_name, last_name, amount
--NO DATA 
SELECT first_name, last_name,amount
FROM (
    SELECT  first_name, last_name,amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.amount
--INNER JOIN 
--ON actor.actor_id = film_actor.actor_id
WHERE amount > 175.00
ORDER BY customer.customer_id DESC
) AS b_name_amount;

--4. List all customers that live in Nepal (use the city
--table)
-- NO DATA
SELECT address,city,customer_id 
FROM city
INNER JOIN address
ON city.city_id = address.address_id
INNER JOIN customer
ON customer.customer_id = address.address_id
WHERE city Like 'Nepal';

--5. Which staff member had the most transactions?
SELECT DISTINCT staff_id, amount
FROM payment
WHERE amount > 0
GROUP BY payment.staff_id ,payment.amount
HAVING MAX(amount) > 0;

--6.How many movies of each rating are there?
SELECT film, rating,title
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY film.film_id, film.rating, film.title
HAVING rating = 'PG-13';

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

SELECT DISTINCT customer_id, amount
FROM payment
WHERE amount > 6.99;
SELECT first_name, last_name
FROM (
    SELECT  first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY customer.customer_id DESC
) AS l_name_amount;

--8.How many free rentals did our store give away?
SELECT amount 
FROM payment
INNER JOIN rental
ON payment.payment_id = rental.rental_id
WHERE amount > 0
GROUP BY payment.payment_id, payment.amount, rental.rental_id;




