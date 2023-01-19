SELECT region.name, sales_reps.name, accounts.name
FROM sales_reps
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON sales_reps.region_id = region.id
ORDER BY accounts.name DESC;


**** Query #1 ****
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

**** QUery #2 ******

SELECT r.name AS region, s.name AS rep, a.name AS account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.name LIKE 'S%' AND r.name = 'Midwest'
ORDER BY a.name;

***** Query #3 ******
SELECT r.name AS region, s.name AS rep, a.name AS account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.name LIKE '% K%' AND r.name = 'Midwest'
ORDER BY a.name;


**** Query #4 ****
SELECT r.name AS region_name, a.name AS account_name, 
o.total_amt_usd/(o.total+0.01) AS unit_price
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
WHERE standard_qty > 100;

**** Query #5 ****
SELECT r.name AS region_name, a.name AS account_name, 
o.total_amt_usd/(o.total+0.01) AS unit_price
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
WHERE standard_qty > 100 AND poster_qty > 50
ORDER BY unit_price ASC;

**** Query #6 ****
SELECT r.name AS region_name, a.name AS account_name, 
o.total_amt_usd/(o.total+0.01) AS unit_price
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
WHERE standard_qty > 100 AND poster_qty > 50
ORDER BY unit_price DESC;

**** Query #7 ****
SELECT DISTINCT w.channel AS channel, a.name AS name
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.id = 1001;

**** Query #8 ****
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE o.occurred_at BETWEEN '2015-01-01' AND '2015-12-31';