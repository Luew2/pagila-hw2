/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */
select distinct film.title 
from film
join inventory on (film.film_id = inventory.film_id)
where film.film_id not in (
    select film.film_id 
    from film
    join inventory on (film.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    join customer on (rental.customer_id=customer.customer_id)
    join address on (customer.address_id=address.address_id)
    join city on (address.city_id=city.city_id)
    join country on (city.country_id=country.country_id)
    where country.country='United States'
)
order by film.title;
