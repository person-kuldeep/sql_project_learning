WITH top_paying_jobs AS (
    SELECT  job_id
           -- company_dim.name AS company_name,
           -- job_title,
           -- job_location,
           -- salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home IS TRUE AND
        salary_year_avg IS NOT NULL 
    ORDER BY salary_year_avg DESC
    LIMIT 10 )

SELECT  skills_dim.skills,
        COUNT(top_paying_jobs.job_id) AS most_asked_skills_count
FROM skills_job_dim
--RIGHT JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id

--LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
-- if not inner join it also show null skill mean where skill is not difined by company
GROUP BY skills_dim.skill_id 
ORDER BY  most_asked_skills_count DESC

/*  json file of this query's result
[
  {
    "job_id": 226942,
    "company_name": "Mantys",
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "650000.0",
    "skills": null
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "salary_year_avg": "400000.0",
    "skills": "oracle"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "salary_year_avg": "400000.0",
    "skills": "kafka"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "salary_year_avg": "400000.0",
    "skills": "linux"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "salary_year_avg": "400000.0",
    "skills": "git"
  },
  {
    "job_id": 209315,
    "company_name": "ЛАНИТ",
    "job_title": "Data base administrator",
    "job_location": "Belarus",
    "salary_year_avg": "400000.0",
    "skills": "svn"
  },
  {
    "job_id": 641501,
    "company_name": "Citigroup, Inc",
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "job_location": "Jacksonville, FL",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 641501,
    "company_name": "Citigroup, Inc",
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "job_location": "Jacksonville, FL",
    "salary_year_avg": "375000.0",
    "skills": "word"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "skills": "r"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "skills": "vba"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 1110602,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1147675,
    "company_name": "Illuminate Mission Solutions",
    "job_title": "Sr Data Analyst",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "skills": null
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "company_name": "Torc Robotics",
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "skills": "sas"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "company_name": "Care.com",
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "skills": "looker"
  },
  {
    "job_id": 1059665,
    "company_name": "Anthropic",
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "350000.0",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "company_name": "Anthropic",
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "350000.0",
    "skills": "python"
  },
  {
    "job_id": 547382,
    "company_name": "Meta",
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "salary_year_avg": "336500.0",
    "skills": null
  },
  {
    "job_id": 894135,
    "company_name": "OpenAI",
    "job_title": "Research Scientist",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "285000.0",
    "skills": "github"
  }
]
*/

WITH top_paying_jobs AS (
    SELECT  job_id,
            company_dim.name AS company_name,
            job_title,
            salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home IS TRUE AND
        salary_year_avg IS NOT NULL 
    ORDER BY salary_year_avg DESC
    LIMIT 10 )

SELECT  top_paying_jobs.*,
        skills_dim.skills
FROM skills_job_dim
--RIGHT JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN top_paying_jobs ON top_paying_jobs.job_id = skills_job_dim.job_id

--LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

