#Leetcode Project

#176. Second Highest Salary
+-------------+------+
| Column Name | Type |
+-------------+------+
| Id          | int  |
| Salary      | int  |
+-------------+------+
Id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.

Write an SQL query to report the second highest salary from the Employee table. 
If there is no second highest salary, the query should report null.
查詢第二高的薪水，如果沒有第二高的員工，則回傳Null

-------------------------------------------------------------------------------------

方法1: 排除最大，剩下的找MAX=第二名
Select Max(Salary) AS SecondHighestSalary
From Employee
Where Salary < (Select Max(Salary) From Employee)

方法2: 排名Salary，直接列出第二筆資料(利用LIMIT * OFFSET)
Select Salary AS SecondHighestSalary
From Employy
Order By Salary DESC
Limit 1 Offest 1 

***以上並無法避免如果資料只有1筆的時候回傳錯誤值，而非Null值

方法3: 把排名過Salary的表當作Temp Table [IFNULL(...,Null)非必須但這樣比較好記]
Select 
  IFNULL(
    (Select Salary 
    From Employy
    Order By Salary DESC
    Limit 1 Offest 1), 
  Null) AS SecondHighestSalary

-------------------------------------------------------------------------------------
Example 1:
Input: 
Employee table:
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Example 2:
Input: 
Employee table:
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| Null                |
+---------------------+
      

      
      
