SELECT s.name AS sales_reps, COUNT(a.name) AS account_frequency
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
GROUP BY sales_reps
HAVING COUNT(a.name) > 5
ORDER BY COUNT(a.name) ASC;


**** Query #2 ****
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;

**** Query #3 ****

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;

**** Query #4 *****
SELECT a.id, a.name, o.total_amt_usd AS total_amt_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name, o.total_amt_usd
HAVING o.total_amt_usd > 30000;

**** Query #5 ****
SELECT a.id, a.name, o.total_amt_usd AS total_amt_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name, o.total_amt_usd
HAVING o.total_amt_usd < 1000;

**** Query #6 ****
SELECT a.id, a.name, o.total_amt_usd AS total_amt_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name, o.total_amt_usd
ORDER BY total_amt_spent DESC
LIMIT 1;

**** Query #7 *****
SELECT a.id, a.name, o.total_amt_usd AS total_amt_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name, o.total_amt_usd
ORDER BY total_amt_spent
LIMIT 1;

***** Query #8 *****
SELECT a.id, a.name, COUNT(w.channel) AS fb_channel_frequency
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
HAVING w.channel = 'facebook' AND COUNT(w.channel) > 6;

**** Query #9 ****
SELECT a.id, a.name, COUNT(w.channel) AS fb_channel_frequency
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
HAVING w.channel = 'facebook'
ORDER BY fb_channel_frequency DESC
LIMIT 1;

**** Query # 10 ****
SELECT a.id, a.name, COUNT(w.channel) AS channel_frequency, 
w.channel AS channel
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
ORDER BY channel_frequency DESC
LIMIT 1;
