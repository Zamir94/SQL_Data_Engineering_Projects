/*
Find the top 10 companies for posting jobs
They must have >3000 postings
Only in the US.
*/
EXPLAIN ANALYZE
SELECT
    cd.name AS company_name,
    COUNT(*) AS num_postings
FROM job_postings_fact
LEFT JOIN company_dim AS cd
ON job_postings_fact.company_id = cd.company_id
GROUP BY cd.name
HAVING COUNT(*) > 3000
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT 
  cd.name AS company_name,
  COUNT(jpf.*) AS posting_count
FROM 
  job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
  ON jpf.company_id = cd.company_id
GROUP BY cd.name
HAVING COUNT(jpf.job_id) > 3000
LIMIT 10;