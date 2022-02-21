/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct first_name || ' ' || last_name as "Actor Name"
from actor
join film_actor on (actor.actor_id=film_actor.actor_id)
join (
    select film_id, unnest(special_features) as special_feature
    from film
) t on (film_actor.film_id=t.film_id)
where special_feature='Behind the Scenes'
order by "Actor Name";
