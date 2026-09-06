/*
Qestion: What are the top skills based on salary?
- Look at the avreage salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analyst and 
    helps identify the most financially rewarding skills to acquire or improve
*/



SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND 
    salary_year_avg IS NOT NULL
    AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT
    25;


/*
-Big-data skills lead the salary ranking. PySpark ranks first with an average salary of 208,172, 
    while Databricks and Scala also appear in the top 25, suggesting that large-scale data processing is associated 
    with higher-paying analyst roles.
-Higher-paying roles extend beyond traditional analytics. Python tools such as pandas and NumPy 
    feature alongside machine learning and engineering technologies, indicating overlap with data science, 
    data engineering, and software development.
-Salary averages need context. Small samples, seniority, and location can influence rankings, especially 
    for niche tools. These results show which skills accompany higher salaries, rather than how much
    learning each skill would increase earnings.
*/