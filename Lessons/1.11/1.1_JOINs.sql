SELECT
    jpf.*, 
    cd.*
FROM 
    job_postings_fact AS jpf
JOIN 
    company_dim AS cd
ON jpf.company_id = cd.company_id

LIMIT 10;

SELECT
    job_id,
    job_title_short,
    name AS company_name,
    job_location
FROM 
    job_postings_fact AS jpf
JOIN 
    company_dim AS cd
ON jpf.company_id = cd.company_id

LIMIT 10;
/*
This query is similar to the previous one, but it only selects a few columns instead of all columns from both tables. 
This is a good practice to avoid selecting unnecessary data and improve query performance. However a binder error will occur if the same column name exists in both tables. 
In this case, we have renamed the company name column to avoid the error.


SELECT
    job_id,
    job_title_short,
    company_id,
    name AS company_name,
    job_location
FROM 
    job_postings_fact AS jpf
JOIN 
    company_dim AS cd
ON jpf.company_id = cd.company_id

LIMIT 10;
*/
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM 
    job_postings_fact AS jpf
LEFT JOIN 
    company_dim AS cd
ON jpf.company_id = cd.company_id
;

SELECT *
FROM skills_job_dim
Limit 3;

SELECT *
FROM skills_dim
Limit 3;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM
    job_postings_fact AS jpf
LEFT JOIN
    skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN
    skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM
    job_postings_fact AS jpf
FULL OUTER JOIN
    skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
FULL OUTER JOIN
    skills_dim AS sd
    ON sjd.skill_id = sd.skill_id;
    