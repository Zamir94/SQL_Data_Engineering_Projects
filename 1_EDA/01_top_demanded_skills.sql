/*
What are the most in-demand skills for data engineers?
- Identify the top 10 in-demand skills for data engineers.
- Focus on jobs located in Minnesoata as well as remote jobs.
- Why? Retaining top talent is crucial for companies, and understanding the skills that are in high demand can help guide training and hiring strategies.
*/
SELECT 

  sd.skills,
  COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
  ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
  ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE

GROUP BY
  sd.skills
Order BY
  demand_count DESC
LIMIT 10
;
/*
Here's the insight into the top 10 in-demand skills for data engineers
- SQL and Python are the most sought-after skills, 
indicating that data engineers need to be proficient 
in both programming and database management.
- While cloud platforms line AWS and Azure are also in high demand,
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
*/