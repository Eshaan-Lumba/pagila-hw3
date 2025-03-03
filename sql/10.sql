/*
 * Management wants to rank customers by how much money they have spent in order to send coupons to the top 10%.
 *
 * Write a query that computes the total amount that each customer has spent.
 * Include a "percentile" column that contains the customer's percentile spending,
 * and include only customers in at least the 90th percentile.
 * Order the results alphabetically.
 *
 * HINT:
 * I used the `ntile` window function to compute the percentile.
 */

SELECT *
FROM (
    SELECT
    customer_id,
    first_name || ' ' || last_name as name,
    sum(amount) as total_payment,
    ntile(100) OVER (ORDER BY sum(amount)) as percentile
    FROM customer 
    JOIN payment using (customer_id)
    GROUP BY customer_id, name
) t
WHERE t.percentile >= 90
ORDER BY t.name;
