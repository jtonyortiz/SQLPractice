      account_id,
       occurred_at,
       standard_qty,
       NTILE(4) OVER (PARTITION BY account_id ORDER BY standard_qty) AS standard_quartile
  FROM orders 
 ORDER BY account_id DESC

**** Query #2 *****

SELECT
       account_id,
       occurred_at,
       gloss_qty,
       NTILE(2) OVER (PARTITION BY account_id ORDER BY gloss_qty) AS gloss_half
  FROM orders 
 ORDER BY account_id DESC

**** Query #3 ****
SELECT account_id,
occurred_at,
total_amt_usd,
NTILE(4) OVER (ORDER BY total_amt_usd) AS quartile,
NTILE(5) OVER (ORDER BY total_amt_usd) AS quintile,
NTILE(100) OVER (ORDER BY total_amt_usd) AS total_percentile
FROM orders
ORDER BY account_id DESC;