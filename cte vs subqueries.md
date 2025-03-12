| Feature               | CTE (Common Table Expression)                            | Subqueries                                      |
|-----------------------|--------------------------------------------------|------------------------------------------------|
| **Definition**        | A temporary result set defined using `WITH`      | A query nested inside another query           |
| **Readability**       | Improves readability, making complex queries easier to understand | Can become complex and difficult to read if deeply nested |
| **Reusability**       | Can be referenced multiple times within the main query | Cannot be reused multiple times in the same query |
| **Performance**       | Optimized for large datasets; can improve query execution | May execute multiple times if used multiple times |
| **Use Case**         | Ideal for recursive queries, ranking, and breaking down complex queries | Used when a temporary result is needed only once |
| **Example**          | ```sql
WITH CTE AS (
    SELECT department_id, AVG(salary) AS avg_salary 
    FROM hr.employees 
    GROUP BY department_id
)
SELECT e.employee_id, e.first_name, e.salary, CTE.avg_salary
FROM hr.employees e
JOIN CTE ON e.department_id = CTE.department_id;
``` | ```sql
SELECT e.employee_id, e.first_name, e.salary, 
       (SELECT AVG(salary) FROM hr.employees WHERE department_id = e.department_id) AS avg_salary
FROM hr.employees e;
``` |
| **Recursion Support** | Supports recursion using `WITH RECURSIVE`        | Does not support recursion                     |
| **Optimization**      | Optimized by the SQL engine for better execution plans | Might be recalculated for each row, affecting performance |

