# INNER JOIN
### short notes

- The INNER JOIN keyword selects records that have matching values in both tables.

- By using INNER JOIN we will not get the records where there is not a match, we will only get the records that matches both tables.

- Syntax:
```sql
SELECT <records>
FROM table_A
INNER JOIN table_B on table_A.column = table_A.column