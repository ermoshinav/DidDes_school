Сотрудника с максимальной заработной платой.
 SELECT * FROM EMPLOYEE
WHERE salary = (SELECT MAX(salary) FROM EMPLOYEE);

Вывести одно число: максимальную длину цепочки руководителей по таблице сотрудников (вычислить глубину дерева).


Отдел, с максимальной суммарной зарплатой сотрудников.
    SELECT d.Name AS department_name, SUM(e.salary) AS total_salary
    FROM DEPARTMENT d
    JOIN EMPLOYEE e ON d.id = e.department_id
    GROUP BY d.Name
    ORDER BY total_salary DESC
    LIMIT 1;

 Сотрудника, чье имя начинается на «Р» и заканчивается на «н».
    SELECT *
    FROM EMPLOYEE
    WHERE name LIKE 'Р%н';
