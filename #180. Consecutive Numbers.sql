#180. Consecutive Numbers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.

Write an SQL query to find all numbers that appear at least three times consecutively.
Return the result table in any order.
找出連續出現三次以上的數字

------------------------------------------------------------------------------
--當成三張表JOIN，，1=2 & 2=3成立時，就代表連續三次數

Select Distinct a.num as ConsecutiveNums
From Logs a INNER JOIN Logs b ON (a.id+1=b.id) INNER JOIN Logs c ON (a.id+2=c.id)
Where a.num=b.num AND b.num=c.num

------------------------------------------------------------------------------

Input: 
Logs table:
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
 
