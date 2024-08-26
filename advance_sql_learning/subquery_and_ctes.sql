-- subquery for creating temp table to use in query can used in where, having, from
SELECT * 
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    LIMIT 100
)AS january_jobs;


-- CTE'S can be also used with select , insert , update and delete
WITH january_jobs AS(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    LIMIT 100
)

SELECT*
FROM january_jobs;


-- subquery in where clouse
SELECT company_id,
        name

FROM company_dim
WHERE company_id IN 
(
SELECT DISTINCT company_id 
FROM job_postings_fact
WHERE job_no_degree_mention = TRUE
ORDER BY company_id
)
ORDER BY company_id;


-- cte

WITH job_posted_count AS(
    SELECT company_id,
    COUNT(*) AS job_total
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT
    name,
    job_posted_count.job_total,
    job_posted_count.company_id   
FROM company_dim
LEFT JOIN job_posted_count ON job_posted_count.company_id = company_dim.company_id
ORDER BY job_posted_count.job_total DESC;



WITH jobs_skillwise AS(
SELECT
       COUNT(*) AS no_ofjobs,
       skill_id
FROM skills_job_dim   
GROUP BY skill_id   
)

SELECT skills,
       jobs_skillwise.no_ofjobs,
       jobs_skillwise.skill_id
FROM skills_dim
LEFT JOIN jobs_skillwise ON jobs_skillwise.skill_id =  skills_dim.skill_id
ORDER BY jobs_skillwise.no_ofjobs DESC
LIMIT 50;


WITH jobs_skillwise AS (
SELECT skill_id,
        COUNT(*) AS no_ofjobs
FROM skills_job_dim
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE job_postings_fact.job_work_from_home IS TRUE AND 
      job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skill_id  
)
SELECT skills,
       jobs_skillwise.no_ofjobs,
       jobs_skillwise.skill_id
FROM skills_dim
INNER JOIN jobs_skillwise ON jobs_skillwise.skill_id =  skills_dim.skill_id
ORDER BY jobs_skillwise.no_ofjobs DESC
LIMIT 5;