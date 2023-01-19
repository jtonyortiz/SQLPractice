SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

***** Query # 2 ******
SELECT LEFT(name, 1) AS company_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;


***** Query #3 *****
SELECT SUM(num) nums, SUM(letter) letters
FROM 
    (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
    THEN 1 ELSE 0 END AS num, 
    CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
    THEN 0 ELSE 1 END AS letter
    FROM accounts) 
t1;