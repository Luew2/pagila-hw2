/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
select film.title
from film
where film.film_id in (
    select film.film_id 
    from film
    join inventory on (film.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    where rental.customer_id=1
    group by film.film_id
    having count(rental.customer_id) > 1
)
order by film.title;
