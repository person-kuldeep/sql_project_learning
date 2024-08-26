SELECT 
job_title_short,
job_work_from_home,
job_posted_date --::DATE
FROM job_postings_fact
LIMIT 10;

SELECT 
job_title_short,
job_work_from_home,
job_posted_date::TIME
FROM job_postings_fact
LIMIT 10;

SELECT 
job_title_short,
job_work_from_home,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS  time_zone,
EXTRACT(MONTH FROM job_posted_date) AS month_of_job_posted,
EXTRACT(YEAR FROM job_posted_date) AS year_of_job_posted
FROM job_postings_fact
LIMIT 10;


SELECT 
    COUNT(job_id) AS count_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact    
WHERE job_work_from_home IS TRUE 
GROUP BY month
ORDER BY count_jobs DESC;


-- practice problem 6

--january
CREATE TABLE  jobs_january AS
SELECT *
FROM job_postings_fact
WHERE (EXTRACT(MONTH FROM job_posted_date)) = 1 ;

--fabruary
CREATE TABLE  jobs_fabruary AS
SELECT *
FROM job_postings_fact
WHERE (EXTRACT(MONTH FROM job_posted_date)) = 2 ;

--march
CREATE TABLE  jobs_march AS
SELECT *
FROM job_postings_fact
WHERE (EXTRACT(MONTH FROM job_posted_date)) = 3 ;


-- case 
SELECT  COUNT(job_id),
        CASE
        WHEN job_location = 'Anywhere' THEN 'remote'
        ELSE 'outside'
        END AS job_typelocation
FROM job_postings_fact
WHERE salary_year_avg >150000 AND
      job_title_short = 'Data Analyst'
GROUP BY job_typelocation;

SELECT 
        job_title_short,
        salary_year_avg,
        CASE 
        WHEN salary_year_avg<120000 THEN 'Low'
        WHEN salary_year_avg>200000 THEN 'High'
        ELSE 'Standard'
        END AS salary
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


SELECT