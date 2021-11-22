#182. Duplicate Emails

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

Write an SQL query to report all the duplicate emails.
Return the result table in any order.

------------------------------------------------------------------------------

Select email as Email
From
    (Select email, count(*) as num
    From Person
    Group by email) as temp
Where num > 1;

Select email as Email
From Person
Group by email
Having count(id) > 1;

Select Distinct p1.email as Email
From Person p1 INNER JOIN Person p2 ON (p1.email=p2.email)
Where p1.id <> p2.id

------------------------------------------------------------------------------

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.
