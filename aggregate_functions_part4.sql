SELECT a.name AS account_name, AVG(o.standard_qty) AS std_quantity_avg, AVG(o.poster_qty) AS poster_quantity_avg, AVG(o.gloss_qty) AS glossy_avg
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

**** Query #2 ****
SELECT a.name AS account_name, AVG(o.standard_amt_usd) AS std_quantity_amt_usd, AVG(o.poster_amt_usd) AS poster_amt_usd, AVG(o.gloss_amt_usd) AS gloss_amt_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

**** Query #3 ****
SELECT w.channel AS channel, s.name AS sales_rep_name, COUNT(w.occurred_at) AS num_occurrences
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY w.channel, s.name
ORDER BY num_occurrences DESC;

**** Query #4 ****
SELECT w.channel AS channel, r.name AS region_name, COUNT(w.occurred_at) AS num_occurrences
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
GROUP BY r.name, w.channel
ORDER BY num_occurrences DESC;


Questions: GROUP BY Part II

Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.

    For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.

    For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.

    Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

    Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
