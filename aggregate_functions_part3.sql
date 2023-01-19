**** Query # 1 ****

SELECT a.name AS account_name, o.occurred_at AS time_occurred
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY o.occurred_at
LIMIT 1;

**** Query #2 ****
SELECT a.name AS account_name, SUM(o.total) AS total_sales
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

**** Query #3 ****
SELECT w.occurred_at AS date,w.channel AS channel, a.name AS account_name
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
ORDER BY w.occurred_at DESC
LIMIT 3;

**** Query #4 ****
SELECT w.channel AS channel, COUNT(w.channel) as frequency
FROM web_events w
GROUP BY w.channel;

**** Query #5 ****
SELECT w.occurred_at AS web_event, a.primary_poc AS primary_contact
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

**** Ouery #6 ****
SELECT a.name AS account_name, o.total_amt_usd AS total_usd
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY o.total_amt_usd;

**** Query #7 ****
SELECT COUNT(s.name) AS sales_reps, r.name AS region
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
GROUP BY r.name
ORDER BY sales_reps ASC;

Questions 1 - 7:

    Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.

    Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.

    Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.

    Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.

    Who was the primary contact associated with the earliest web_event?

    What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.

    Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
