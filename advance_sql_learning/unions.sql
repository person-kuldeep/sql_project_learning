-- UNIONS

SELECT 
    job_title_short,
    company_id,
    salary_year_avg
FROM jobs_january

UNION ALL

SELECT 
    job_title_short,
    company_id,
    salary_year_avg
FROM jobs_fabruary

UNION ALL

SELECT 
    job_title_short,
    company_id,
    salary_year_avg
FROM jobs_march;

-- UNION IS FOR DISTANT VALUE

SELECT 
    job_title_short,
    company_id,
    salary_year_avg
FROM jobs_fabruary

UNION

SELECT 
    job_title_short,
    company_id,
    salary_year_avg
FROM jobs_march;


-- PRACTICE PROBLEM 8


SELECT 
    job_of_1quater.job_title_short,
    job_of_1quater.job_location,
    job_of_1quater.job_via,
    job_of_1quater.job_posted_date::DATE,
    job_of_1quater.salary_year_avg
    
FROM(
SELECT *
FROM jobs_january
UNION ALL
SELECT *
FROM jobs_fabruary
UNION ALL
SELECT *
FROM jobs_march
) AS job_of_1quater

WHERE job_of_1quater.salary_year_avg >70000
ORDER BY job_of_1quater.salary_year_avg;