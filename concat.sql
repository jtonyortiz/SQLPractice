
/* Query Questions */
Question #1:
Each company in the accounts table wants to create 
an email address for each primary_poc. 
The email address should be the first name of the primary_poc "."
 last name primary_poc "@" company name '.com'.

Question #2:



***** Query #1 *****
SELECT CONCAT(t1.first_name, '.', t1.last_name, '@',t1.company_name,'.com')
FROM(SELECT 
  name AS company_name,
  primary_poc AS poc_name,
  LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) AS first_name,
  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name FROM accounts) t1;


****** Query #2 ******
SELECT CONCAT(t1.first_name, '.', t1.last_name, '@',t1.company_name,'.com')
FROM(SELECT 
  REPLACE(name, ' ', '') AS company_name,
  primary_poc AS poc_name,
  LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) AS first_name,
  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) A
  AS last_name FROM accounts) t1;


***** Query #3 *****

WITH t1 AS (
 SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'), LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;