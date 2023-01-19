 SELECT DATE_PART('year', occurred_at) ord_year,  SUM(total_amt_usd) total_spent
 FROM orders
 GROUP BY 1
 ORDER BY 2 DESC;

**** Query #2 ****
SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC; 

**** Query #3 ****
SELECT DATE_PART('year', occurred_at) ord_year,  COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

**** Query #4 ****
SELECT DATE_TRUNC('month', o.occurred_at) AS MONTH,
SUM(o.total) AS total_amount
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

***** Query #5 *****
SELECT DATE_TRUNC('month', o.occurred_at) AS MONTH, SUM(o.gloss_amt_usd) AS gloss_paper_total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC LIMIT 1;