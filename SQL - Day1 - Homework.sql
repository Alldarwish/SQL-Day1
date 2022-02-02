-- I ran a comparison between some tables in AWS DVD Rental Store DB and the test_db tables. It seems some tables did not fully match.
-- Therefore, some of the answers provided on the pdf document are not applicable to test_db tables. They are only applicable to the tables
-- from the AWS DVD Rental Store DB.

-- Q1. How many actors are there with the last name 'Wahlberg'?
-- A1. 2
SELECT 	COUNT(last_name)
FROM 	actor_info
WHERE 	last_name = 'Wahlberg';

-- Q2. How many payments were made between $3.99 and $5.99?
-- A2. 5,566
SELECT  COUNT(amount)
FROM    payment
WHERE   amount BETWEEN 3.99 AND 5.99;

-- Q3. What film does the store have the most of? (Search in inventory)
-- A3. film id: 200 rented 9 times
-- NOTE: Either the question or the expected result is wrong. The question and the expected result cannot both be correct.
--
-- Option 1: This option provides the most rented film by all stores collectively. The outcome meets the expected result.
SELECT 		film_id, COUNT(film_id)
FROM 		inventory
GROUP BY 	film_id
ORDER BY 	COUNT(film_id) DESC;

-- Option 2: This option provides the most rented film by each store individually. This option DOES NOT meet the expected result.
SELECT 		store_id, film_id, COUNT(film_id)
FROM 		inventory
GROUP BY 	store_id, film_id
ORDER BY 	Store_id, COUNT(film_id) DESC;

-- Q4. How many customers have the last name 'William'?
-- A4. Zero!
SELECT 	COUNT(last_name)
FROM 	customer
WHERE 	last_name = 'William';

-- Q5. What store employee (get the ID) sold the most rentals?
-- A5. 1 - 8040
SELECT 		staff_id, COUNT(staff_id)
FROM 		rental
GROUP BY 	staff_id
ORDER BY 	staff_id;

-- Q6. How many different district names are there?
-- A6. 378
SELECT 	COUNT(DISTINCT district)
FROM 	address;

-- Q7. What film has the most actors in it? (use film_actor table and get film_id)
-- A7. film_id 508 - 15 actors
SELECT 		film_id, COUNT(actor_id)
FROM 		film_actor
GROUP BY 	film_id
ORDER BY 	COUNT(actor_id) DESC;

-- Q8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- A8. 13
SELECT 	COUNT(last_name)
FROM 	customer
WHERE 	store_id = 1 AND last_name LIKE '%es';

-- Q9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--     with ids between 380 and 430? (use group by and having > 250)
-- A9. 3
SELECT  	amount, COUNT(rental_id)
FROM    	payment
WHERE   	customer_id BETWEEN 380 and 430
GROUP BY    amount
HAVING 		COUNT(rental_id) > 250;

-- Q10. Within the film table, how many rating categories are there? And what rating has the most
--      movies total?
-- A10. 5 ratings, PG-13 has the most
SELECT  	rating, COUNT(*)
FROM 		film
GROUP BY 	rating
order by 	COUNT(*) DESC;