-- 1. Count employees per department
SELECT department_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY department_id;

-- 2. Total salary per department
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id;

-- 3. Average salary per department
SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id;

-- 4. Minimum salary per department
SELECT department_id, MIN(salary) AS min_salary
FROM hr.employees
GROUP BY department_id;

-- 5. Maximum salary per department
SELECT department_id, MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id;

-- 6. Count employees per job role
SELECT job_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY job_id;

-- 7. Total salary per job role
SELECT job_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id;

-- 8. Average salary per job role
SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id;

-- 9. Departments with more than 5 employees
SELECT department_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 10. Departments where total salary > 100,000
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

-- 11. Departments where average salary > 50,000
SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

-- 12. Departments where max salary > 80,000
SELECT department_id, MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) > 80000;

-- 13. Departments where min salary < 30,000
SELECT department_id, MIN(salary) AS min_salary
FROM hr.employees
GROUP BY department_id
HAVING MIN(salary) < 30000;

-- 14. Departments where number of employees is between 5 and 10
SELECT department_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) BETWEEN 5 AND 10;

-- 15. Departments where salary variance > 500,000
SELECT department_id, VARIANCE(salary) AS salary_variance
FROM hr.employees
GROUP BY department_id
HAVING VARIANCE(salary) > 500000;

-- 16. Departments where salary standard deviation > 5,000
SELECT department_id, STDDEV(salary) AS salary_stddev
FROM hr.employees
GROUP BY department_id
HAVING STDDEV(salary) > 5000;

-- 17. Employees sorted by salary in descending order
SELECT employee_id, first_name, salary
FROM hr.employees
ORDER BY salary DESC;

-- 18. Employees sorted by department and salary
SELECT employee_id, first_name, department_id, salary
FROM hr.employees
ORDER BY department_id ASC, salary DESC;

-- 19. Employees sorted by last name alphabetically
SELECT employee_id, first_name, last_name
FROM hr.employees
ORDER BY last_name ASC;

-- 20. Employees sorted by hire date
SELECT employee_id, first_name, hire_date
FROM hr.employees
ORDER BY hire_date ASC;

-- 21. Employees sorted by commission, placing NULLs last
SELECT employee_id, first_name, commission_pct
FROM hr.employees
ORDER BY commission_pct NULLS LAST;

-- 22. Employees sorted by commission, placing NULLs first
SELECT employee_id, first_name, commission_pct
FROM hr.employees
ORDER BY commission_pct NULLS FIRST;

-- 23. Employees sorted by length of first name
SELECT employee_id, first_name
FROM hr.employees
ORDER BY LENGTH(first_name) ASC;

-- 24. Employees sorted by last two characters of last name
SELECT employee_id, first_name, last_name
FROM hr.employees
ORDER BY SUBSTR(last_name, -2) ASC;

-- 25. Employees sorted by uppercase first name
SELECT employee_id, UPPER(first_name) AS upper_name
FROM hr.employees
ORDER BY upper_name ASC;

-- 26. Employees sorted by salary after adding a bonus
SELECT employee_id, first_name, salary
FROM hr.employees
ORDER BY (salary + 500) DESC;

-- 27. Employees sorted by job ID and last name
SELECT employee_id, first_name, last_name, job_id
FROM hr.employees
ORDER BY job_id ASC, last_name ASC;

-- 28. Employees sorted by department, then by first name
SELECT employee_id, first_name, department_id
FROM hr.employees
ORDER BY department_id ASC, first_name ASC;

-- 29. Employees with IT_PROG job role first
SELECT employee_id, first_name, job_id
FROM hr.employees
ORDER BY CASE WHEN job_id = 'IT_PROG' THEN 1 ELSE 2 END;

-- 30. Employees with priority to salaries above 5000
SELECT employee_id, first_name, salary
FROM hr.employees
ORDER BY CASE WHEN salary > 5000 THEN 1 ELSE 2 END, salary DESC;

-- 31. Departments where total salary between 50,000 and 200,000
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 50000 AND 200000;

-- 32. Departments where max salary is at least double the min salary
SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) >= 2 * MIN(salary);

-- 33. Employees in department 50 at the top
SELECT employee_id, first_name, department_id
FROM hr.employees
ORDER BY CASE WHEN department_id = 50 THEN 1 ELSE 2 END, department_id ASC;

-- 34. Employees sorted by highest salary ratio
SELECT department_id, MAX(salary) / AVG(salary) AS salary_ratio
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) / AVG(salary) > 1.5
ORDER BY salary_ratio DESC;

-- 35. Employees sorted by job ID then salary
SELECT employee_id, first_name, salary, job_id
FROM hr.employees
ORDER BY job_id ASC, salary DESC;

-- 36. Employees sorted by highest commission first
SELECT employee_id, first_name, commission_pct
FROM hr.employees
ORDER BY commission_pct DESC NULLS LAST;

-- 37. Employees sorted by salary, keeping those with no commission at the bottom
SELECT employee_id, first_name, salary, commission_pct
FROM hr.employees
ORDER BY CASE WHEN commission_pct IS NULL THEN 2 ELSE 1 END, salary DESC;

-- 38. Employees sorted by department and descending salary
SELECT employee_id, first_name, department_id, salary
FROM hr.employees
ORDER BY department_id ASC, salary DESC;

-- 39. Employees where more than 50% earn above 60,000
SELECT job_id, COUNT(CASE WHEN salary > 60000 THEN 1 END) * 1.0 / COUNT(*) AS high_earner_ratio
FROM hr.employees
GROUP BY job_id
HAVING COUNT(CASE WHEN salary > 60000 THEN 1 END) > COUNT(*) / 2;

-- 40. Departments where IT and HR salaries sum to 80,000 or more
SELECT department_id, SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) AS it_hr_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) >= 80000;
