/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */
select special_feature, sum(profit) as profit
from ( -- profit per title
    select film.title, sum(payment.amount) as profit, unnest(film.special_features) as special_feature
    from film
    join inventory on (film.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    join payment on (rental.rental_id = payment.rental_id)
    group by film.title, film.special_features
    order by profit desc
) t
group by special_feature
order by special_feature;
