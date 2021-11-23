#196. Delete Duplicate Emails

Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id.
Return the result table in any order.

-------------------------------------------------------------------------------------

--Step1. Find the duplicate emails with the smallest id to keep, which is: 1, john@example.com in this case
Select Min(id) as id, email
from Person
Group by email
Having count(email) > 1

--Step2. Delete the duplicate emails with bigger ids from original table-Person
DELETE FROM Person p
WHERE EXISTS(
    Select * From (
        Select Min(id) as id, email
        from Person
        Group by email
        Having count(email) > 1) as temp
    Where p.email=temp.email AND p.id > temp.id)

-------------------------------------------------------------------------------------

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
