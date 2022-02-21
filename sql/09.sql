/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
select special_features, count(film_id)
from (
    select unnest(special_features) as special_features, film_id
    from film
) t
group by special_features
order by special_features;
