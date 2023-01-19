SELECT SUM(poster_qty)  AS total_poster_sales
FROM orders;

**** Query #2 ****
SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;

**** Query #3 **** 
SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

**** Query #4 ****
SELECT standard_amt_usd + gloss_amt_usd AS  standard_amt, SUM(gloss_amt_usd) AS gloss_amt
FROM orders;

**** Query #5 ****
SELECT SUM(standard_amt_usd)/COUNT(standard_qty) AS total_amt_spent
FROM orders;