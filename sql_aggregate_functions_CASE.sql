SELECT a.id AS ID, o.total_amt_usd AS total_amt,
CASE WHEN o.total_amt_usd > 3000 THEN 'Large' ELSE 'Small' 
END AS order_level
FROM accounts a
JOIN orders o
ON a.id = o.account_id;

**** Query #2 *****
SELECT a.id AS ID, o.total AS total_orders,
CASE WHEN o.total > 2000 THEN 'At Least 2000' 
	WHEN o.total >= 1000 AND o.total <= 1999 
    THEN 'Between 1000 and 2000'
    ELSE 'Less than 1000'  
END AS total_items
FROM accounts a
JOIN orders o
ON a.id = o.account_id;

**** Query #3 ****
SELECT a.id AS ID, SUM(o.total_amt_usd) AS total_sales_usd,
CASE WHEN SUM(o.total_amt_usd) > 200000 THEN 'Lifetime Value' 
	WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) <= 200000 
    THEN 'second level'
    ELSE 'lowest level'
END AS level
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC;

***** Query #4 *****




***** Query #5 *****
SELECT s.name, COUNT(*) num_ords,
     CASE WHEN COUNT(*) > 200 THEN 'top'
     ELSE 'not' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 2 DESC;

Questions:

    Write a query to display for each order, the account ID, total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.

    Write a query to display the number of orders in each of three categories, based on the total number of items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.

    We would like to understand 3 different levels of customers based on the amount associated with their purchases. The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.

    We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.

    We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. Place the top sales people first in your final table.
