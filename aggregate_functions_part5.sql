SELECT DISTINCT a.name AS account_name,
COUNT(r.name) AS region_name
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
GROUP BY a.name;

**** Query #2 ****
SELECT DISTINCT s.name AS sales_reps, COUNT(a.name) AS account_name_freq
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
GROUP BY sales_reps
ORDER BY account_name_freq;