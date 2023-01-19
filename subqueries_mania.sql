
/* Subqueries - Subquery Manie */

/* Question 1 : Provide the name of the sales_rep
 in each region with the largest amount of total_amt_usd sales.
*/

SELECT t3.rep_name, t2.region_name, t2.max_sales
FROM (SELECT region_name, MAX(total_sales) max_sales
    FROM(
        SELECT sr.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_sales

        FROM sales_reps sr
        JOIN region r
        ON sr.region_id = r.id
        JOIN accounts a
        ON a.sales_rep_id = sr.id
        JOIN orders o
        ON a.id = o.account_id
        GROUP BY 1, 2
        ORDER BY 3 DESC) t1
    GROUP BY 1) t2
JOIN(
        SELECT sr.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_sales
        FROM sales_reps sr
        JOIN region r
        ON sr.region_id = r.id
        JOIN accounts a
        ON a.sales_rep_id = sr.id
        JOIN orders o
        ON a.id = o.account_id
        GROUP BY 1, 2
        ORDER BY 3 DESC) t3
ON t2.region_name = t3.region_name AND t2.max_sales = t3.total_sales;


***** Query #2 *****
SELECT *
FROM(
  SELECT r.name AS region_name, COUNT(o.total) AS total_orders
  FROM region r
  JOIN sales_reps s
  ON r.id = s.region_id
  JOIN accounts a
  ON s.id = a.sales_rep_id
  JOIN orders o
  ON a.id = o.account_id
  GROUP BY 1
  ORDER BY 2 DESC) t1
ORDER BY t1.total_orders DESC
LIMIT 1;

***** Query #3 *****


***** Query #4 *****

SELECT a.name AS customer_name, MAX(o.total_amt_usd) AS total_amt,
COUNT(w.channel)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN orders o
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


***** Query #5 *****


SELECT AVG(t1.total_amt_usd) AS average_of_ten
FROM(
SELECT a.name AS account_name, SUM(o.total_amt_usd) AS total_amt_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10) t1;


***** Query #6 *****
/* Step 1: Find avg of all accnts */
SELECT AVG(o.total_amt_usd) avg_all
FROM orders o

/* Step 2 : Only pull accounts more than this avg:*/
SELECT o.account_id, AVG(o.total_amt_usd)
FROM orders o
GROUP BY 1
HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                               FROM orders o);

/* Step 3: Find average of these values: */
SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt
    FROM orders o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all
                                   FROM orders o)) temp_table;



