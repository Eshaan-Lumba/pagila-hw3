/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */


WITH CustomerRentalRank AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        inventory_id,
        RANK() OVER (PARTITION BY customer_id ORDER BY rental_date DESC) AS ranking
    FROM
        customer
        JOIN rental USING (customer_id)
)

SELECT
    crr.customer_id,
    crr.first_name,
    crr.last_name
FROM
    CustomerRentalRank crr
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
WHERE
    crr.ranking <= 5
AND
    category.name = 'Action'
GROUP BY
    crr.customer_id, crr.first_name, crr.last_name
HAVING 
    count(*) >= 4
ORDER BY
    crr.customer_id;

