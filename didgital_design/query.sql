Сотрудника с максимальной заработной платой.
 SELECT * FROM EMPLOYEE
WHERE salary = (SELECT MAX(salary) FROM EMPLOYEE);

Вывести одно число: максимальную длину цепочки руководителей по таблице сотрудников (вычислить глубину дерева).
WITH RECURSIVE EmployeeHierarchy AS (
      SELECT id, chief_id, 1 AS depth FROM EMPLOYEE WHERE chief_id IS NULL
      UNION ALL
      SELECT e.id, e.chief_id, eh.depth + 1 FROM EMPLOYEE e
      INNER JOIN EmployeeHierarchy eh ON e.chief_id = eh.id
    )
    SELECT MAX(depth) AS max_depth FROM EmployeeHierarchy;

Отдел, с максимальной суммарной зарплатой сотрудников.
    SELECT d.Name AS department_name, SUM(e.salary) AS total_salary  FROM DEPARTMENT d
    JOIN EMPLOYEE e ON d.id = e.department_id
    GROUP BY d.Name ORDER BY total_salary DESC
    LIMIT 1;

 Сотрудника, чье имя начинается на «Р» и заканчивается на «н».
    SELECT * FROM EMPLOYEE  WHERE name LIKE 'Р%н';
