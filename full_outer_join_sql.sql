***** Query #1 *****
SELECT *
FROM accounts a
FULL OUTER JOIN sales_reps s
ON a.sales_rep_id = s.id
WHERE a.sales_rep_id IS NULL OR s.id IS NULL;


/*Finding Matched and Unmatched Rows with FULL OUTER JOIN

If unmatched rows existed (they don't for this query),
 you could isolate them by adding the following line to the end of the query:

 
WHERE accounts.sales_rep_id IS NULL OR sales_reps.id IS NULL */
