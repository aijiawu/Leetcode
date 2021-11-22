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

--RANK():       1,1,1,4,4,6
--DENSE_RANK(): 1,1,1,2,2,3 (最好用Dense_rank)

-------------------------------------------------------------------------

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        Select 
            ISNULL(
             (Select Salary
             From Employee
             Group By Salary
             Order By Salary DESC
             OFFSET @N-1 Row
             FETCH NEXT 1 ROW ONLY), NULL) as NthHighestSalary       
    );
END


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
RETURN (
    Select ISNULL(Salary,NULL) as NthHighestSalary
    FROM (Select Distinct Salary, dense_rank() over (order by Salary desc) as rnk from Employee) as temp
    where temp.rnk=@N
);
END
--這種寫法在176.題不可行。

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
RETURN (
    Select ISNULL(
        (Select Salary
         From (Select Distinct Salary, dense_rank() OVER (order by Salary DESC) as rnk From Employee) as temp
         Where rnk=@N), null) as SecondHighestSalary
);
END

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


