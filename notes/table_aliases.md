# Table Aliases in PostgreSQL

## What is a Table Alias?
- A **table alias** is a temporary name given to a table (or subquery) in a SQL statement.
- It simplifies complex queries and improves readability.

## Syntax
```sql
SELECT column_name
FROM table_name AS alias_name;
```


- The AS keyword is optional:
```sql
SELECT column_name
FROM table_name alias_name;
```

## Use Cases
- Shortening long table names in queries.
- Referencing derived tables or subqueries:

## Example 1
```sql
SELECT p.patient_name, p.DOB
FROM patients p;
```

## Example 2
```sql
SELECT 
    p.patient_name,
    p.DOB
FROM patients p
WHERE TO_DATE(p.DOB, 'MM-DD-YY') > '2025-01-01';
```
