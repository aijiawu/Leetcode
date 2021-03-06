#178. Rank Scores

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| Id          | int     |
| Score       | decimal |
+-------------+---------+
Id is the primary key for this table.
Each row of this table contains the score of a game. Score is a floating point value with two decimal places.

Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking. 
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks. --dense_rank
Return the result table ordered by score in descending order.


-------------------------------------------------------------------

select Score, DENSE_RANK() OVER (Order By Score DESC) as [Rank]
From Scores

***別名與關鍵詞重複時加上[]

-------------------------------------------------------------------

Scores table:
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
Output: 
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
