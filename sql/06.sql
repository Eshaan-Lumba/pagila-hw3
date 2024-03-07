/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT distinct(first_name || ' ' || last_name) as "Actor Name"
FROM actor
JOIN film_actor using (actor_id)
WHERE film_id in (
    SELECT film_id
    FROM actor
    JOIN film_actor using (actor_id)
    WHERE first_name || ' ' || last_name = 'RUSSELL BACALL'
)
AND first_name || ' ' || last_name != 'RUSSELL BACALL'
ORDER BY "Actor Name";
