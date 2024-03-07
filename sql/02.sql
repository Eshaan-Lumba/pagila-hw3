/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM customer
JOIN address using (address_id)
JOIN city using (city_id)
JOIN country using (country_id)
GROUP BY country
ORDER BY count(customer_id) DESC
LIMIT 1;
