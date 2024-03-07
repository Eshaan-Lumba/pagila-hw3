/*
 * Find every documentary film that is rated G.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */

SELECT title, STRING_AGG(initcap(first_name) || initcap(last_name), ', ') AS actors
FROM actor
JOIN film_actor using (actor_id)
JOIN film using (film_id)
JOIN film_category using (film_id)
JOIN category using (category_id)
WHERE rating = 'G' and name = 'Documentary'
GROUP BY title
ORDER BY title;
