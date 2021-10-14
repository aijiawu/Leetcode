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

方法2: 排名Salary，直接列出第二筆資料(利用LIMIT & OFFSET)
Select Salary AS SecondHighestSalary
From Employy
Order By Salary DESC
Limit 1 Offest 1 

***以上並無法避免如果資料只有1筆的時候回傳空值(沒找到資料)，而非Null值***

方法3: 利用子查詢，把排名過Salary的表當作Temp Table，就會回傳Null值 [IFNULL(...,Null)非必須]
Select 
    (Select Salary 
    From Employy
    Order By Salary DESC
    Limit 1 Offest 3) AS SecondHighestSalary

Select 
  IFNULL(
    (Select Salary 
    From Employy
    Order By Salary DESC
    Limit 1 Offest 1), 
  Null) AS SecondHighestSalary

方法4: 利用rank()先排名薪水順序，多欄多列的子查詢結果當資料表用，一定要記得用別名
Wrong
Select Salary as SecondHighestSalary
From
(Select Salary, Rank() over (order by Salary DESC) as rnk 
From Employee) -> Every derived table must have its own alias
Where rnk=2 

Correct
Select Salary as SecondHighestSalary
From
(Select Salary, Rank() over (order by Salary DESC) as rnk 
From Employee) as temp
Where rnk=2 

/*
依據子查詢的結果，可分為以下三種 : 
(1)【多欄多列】
    必定當『資料表』用，一定要用( )和別名，()與別名皆不能省略
(2)【單欄多列】
    可以當『資料表』或『集合』用；
    若是當集合，一定要用( )，不能給別名
(3)【單欄單列】scalar value(純量值)
    可以當『資料表』、『集合』用和『純量值』(scalar value)；
    若是當純量值，一定要用( )，不能給別名
*/

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
      

      
      
