SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
LIMIT 10;

SELECT
    table_name, column_name, data_type
    FROM
        information_schema.columns
    WHERE
        table_catalog = 'data_jobs'
;

SELECT *
FROM information_schema.table_constraints
WHERE table_catalog = 'data_jobs';


CREATE TABLE students (name VARCHAR CHECK (NOT contains(name, ' ')),
INSERT students VALUES ('Thisnamedoesnothaveaspace'); -- This will fail because the name contains a space
 age INT CHECK (age >= 0));
PRAGMA show_tables_expanded;


DESCRIBE job_postings_fact;
/*
is the same as the code below, but the code below is more standard SQL and will work in any database system. The code above is specific to DuckDB.

SELECT
    table_name, column_name, data_type
    FROM
        information_schema.columns
    WHERE
        table_catalog = 'data_jobs'
;

*/
