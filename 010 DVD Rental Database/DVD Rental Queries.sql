-- Query 01
-- Count No of Distinct Combinations Of First & Last Name
SELECT COUNT(DISTINCT(A.first_name||A.last_name))
FROM actor AS A

-- Identify The First & Last Name Combination That is Common For More Than One Person
SELECT DISTINCT A1.first_name, A1.last_name
FROM actor AS A1, actor AS A2
WHERE (A1.actor_id != A2.actor_id) AND 
    (A1.first_name = A2.first_name) AND
    (A1.last_name = A2.last_name)

-- Query 02
-- Identify Customer Pairs That Share A Common Address
SELECT C1.first_name, C1.last_name,C2.first_name,C2.first_name
FROM customer AS C1, customer AS C2
WHERE (C1.customer_id != C2.customer_id) AND 
    (C1.address_id = C2.address_id)

-- Query 03
-- What is the total of all the payment amounts
SELECT SUM(amount) 
FROM payment

-- Query 04
-- What is the total amount paid by each customer ?
-- What is the number of payments done by each customer ?
SELECT C.customer_id, C.first_name, C.last_name, P.customer_id, SUM(P.amount),COUNT(P.amount)
FROM customer AS C, payment AS P
WHERE C.customer_id = P.customer_id
GROUP BY C.customer_id

-- Query 05
-- Identify the customer with highest total payment
SELECT C.customer_id, C.first_name, C.last_name, P.customer_id, SUM(P.amount),COUNT(P.amount)
FROM customer AS C, payment AS P
WHERE C.customer_id = P.customer_id
GROUP BY C.customer_id
ORDER BY SUM(P.amount) DESC
LIMIT 1

-- Query 06
-- Which movie was rented the most ?
SELECT F.film_id, F.title, COUNT(F.film_id)
FROM rental AS R, inventory AS I, film AS F
WHERE R.inventory_id = I.inventory_id 
    AND I.film_id = F.film_id
GROUP BY F.film_id
ORDER BY COUNT(R.rental_id) DESC
LIMIT 1

-- Query 07
-- Which Movies Have been rented so far ?
SELECT F.film_id, F.title, F.release_year
FROM rental AS R, inventory AS I, film AS F
WHERE R.inventory_id = I.inventory_id
    AND I.film_id = F.film_id
GROUP BY F.film_id
ORDER BY COUNT(F.film_id)

-- Query 08
-- Which Movies Have Not been rented so far ?
SELECT F.film_id, F.title,F.release_year
FROM film AS F
WHERE F.film_id NOT IN
    (SELECT F.film_id
    FROM rental AS R, inventory AS I, film AS F
    WHERE R.inventory_id = I.inventory_id
        AND I.film_id = F.film_id
    GROUP BY F.film_id
    ORDER BY COUNT(F.film_id))

-- Query 09
-- which Customers Have not rented any movies yet ?
SELECT C.customer_id,C.first_name, C.last_name
FROM customer AS C
WHERE C.customer_id NOT IN 
    (SELECT DISTINCT(rental.customer_id)
    FROM rental)

-- Query 10
-- Display All movies with their respective rental count
SELECT F.film_id, F.title, COUNT(R.rental_id)
FROM rental AS R, inventory AS I, film AS F
WHERE R.inventory_id = I.inventory_id
    AND I.film_id = F.film_id
GROUP BY F.film_id
ORDER BY COUNT(F.film_id) DESC

-- Query 10
-- Show The Number of movies that each actor has acted in 
SELECT A.first_name, A.last_name, COUNT(F.film_id)
FROM actor AS A, film AS F, film_actor AS FA
WHERE F.film_id = FA.film_id
    AND A.actor_id = FA.actor_id
GROUP BY A.actor_id
ORDER BY COUNT(F.film_id) DESC

-- Query 11
-- Which Actors have acted in >20 Films
SELECT A.first_name, A.last_name, COUNT(FA.film_id)
FROM actor AS A, film_actor AS FA
WHERE A.actor_id = FA.actor_id
GROUP BY A.actor_id
HAVING COUNT(FA.film_id)>20  -- Having Should Be After Groupby
ORDER BY COUNT(FA.film_id) DESC

-- Query 12
-- How many actors have only 8 letters in their first name
SELECT A.actor_id, A.first_name
FROM actor AS A
WHERE length(A.first_name)=8

-- Query 13
-- Show All movies with "PG" rating & their respective rental count 
SELECT F.film_id, F.title, F.rating, COUNT(R.rental_id)
FROM film AS F, rental AS R, inventory AS I
WHERE R.inventory_id = I.inventory_id
    AND I.film_id = F.film_id
    AND F.rating = 'PG'
GROUP BY F.film_id
ORDER BY COUNT(R.rental_id) DESC

-- Query 14
-- How many movies available in Store 1 are not available in Store 2
SELECT COUNT(F.film_id)
FROM inventory AS I, film AS F
WHERE I.film_id = F.film_id
    AND I.store_id = 1
    AND F.film_id NOT IN 
            (SELECT film_id
            FROM inventory
            WHERE store_id=2)