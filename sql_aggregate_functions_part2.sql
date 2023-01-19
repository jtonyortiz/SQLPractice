SELECT MIN(occurred_at) AS order_date
FROM orders;

**** Query #2 ****

SELECT occurred_at AS order_date
FROM orders
ORDER BY occurred_at ASC
LIMIT 1;

**** Query #3 ****
SELECT occurred_at AS order_date
FROM orders
ORDER BY occurred_at ASC
LIMIT 1;

**** Query #4 ****
SELECT MAX(occurred_at) AS order_date
FROM orders;

**** Query #5 ****
SELECT occurred_at AS order_date
FROM orders
ORDER BY occurred_at DESC
LIMIT 1;

**** Query #6 ****
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
           AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
           AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;