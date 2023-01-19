/* Questions for Queries: */

1. Use the accounts table to create first and last name columns 
that hold the first and last names for the primary_poc.

2. Now see if you can do the same thing for every 
rep name in the sales_reps table. 
Again provide first and last name columns.




Sample:

SELECT first_name,
        last_name,
        city_state,
        POSITION(',' IN city_state) AS comma_position,
        STRPOS(city_state, ',') AS substr_comma_position,
        LOWER(city_state) AS lowercase,
        UPPER(city_state) as uppercase,
        LEFT(city_state, POSITION(',' IN city_state) - 1) as city
FROM demo.customer_data;

**** Query #1 *****
SELECT 
LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;

**** Query #2 *****

SELECT 
LEFT(name, STRPOS(name, ' ') - 1) AS first_name,
RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
FROM sales_reps;

