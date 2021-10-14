#177. Nth Highest Salary

+-------------+------+
| Column Name | Type |
+-------------+------+
| Id          | int  |
| Salary      | int  |
+-------------+------+
Id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.

Write an SQL query to report the nth highest salary from the Employee table. 
If there is no nth highest salary, the query should report null.
建立Function程序，每次可以快速查找工資第N高的薪水

-------------------------------------------------------------------------

CREATE OR ALTER FUNCTION getNthHighestSalary(@N as INT) 
RETURNS INT
BEGIN
  RETURN (
    select MAX(CASE WHEN rnk=@N THEN salary ELSE null END)
    from (select distinct salary, DENSE_RANK() over (order by salary DESC) AS rnk
          from Employee) as temp
  );
END

#不太清楚為什麼不能用ROW_NUMBER()或RANK()

-------------------------------------------------------------------------

Exmple1:
Input: 
Employee table:
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

Example2:
Input: 
Employee table:
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| Null                   |
+------------------------+
