-- 1 Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
use sakila; 
select count(*) as number_of_film 
from inventory 
inner join film on film.film_id = inventory.film_id
where film.title = "%Hunchback Impossible%" ; 

-- 2 of all the films in the Sakila database.
SELECT title AS film_name, length 
FROM film 
WHERE length > (SELECT AVG(length) FROM film);
-- 3 Use a subquery to display all actors who appear in the film "Alone Trip". ( j'ai pas du tout eu l'idée )
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id = (
    SELECT f.film_id
    FROM film f
    WHERE f.title = 'Alone Trip'
);
-- BONUS 
-- 4 Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.
SELECT film.title , film.film_id 
from film_category as fc 
inner join film on film.film_id = fc.film_id 
inner join category on category.category_id  = fc.category_id
where category.name like "family" ;