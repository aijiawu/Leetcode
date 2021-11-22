#181. Employees Earning More Than Their Managers.sql

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Write an SQL query to find the employees who earn more than their managers.
Return the result table in any order.

------------------------------------------------------------------------------

Select e1.name as Employee
From Employee e1, Employee e2
Where e1.managerId=e2.id AND e1.salary > e2.salary


Select e1.name as Employee
From Employee e1 INNER JOIN Employee e2 ON (e1.managerId=e2.id)
Where e1.salary > e2.salary

------------------------------------------------------------------------------

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
