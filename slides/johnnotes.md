# SQL Joins and Aliases introduction

## 1. SQL Aliasing

### What is Aliasing?

Aliases are temporary names given to tables or columns in SQL queries.

They improve readability and clarity, especially in complex queries involving multiple tables or columns with similar names.

Aliases do not change the actual names in the database; they are only valid within the scope of the query.

### Why Use Aliases?
- To shorten long table or column names
- To differentiate between two instances of the same table (important in self joins)
- To make output column names more meaningful

### 1.1 Table Aliasing

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table_name AS alias_name;
```

- The AS keyword is optional but improves clarity
- After aliasing, refer to the table using its alias name in the query

**Example:**

```sql
SELECT c.CustomerName, o.OrderID
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID;
```

Here, Customers is aliased as `c`, and Orders as `o`.

### 1.2 Column Aliasing

**Syntax:**

```sql
SELECT column_name AS alias_name
FROM table_name;
```

This renames the column header in the query output.

**Example:**

```sql
SELECT ID AS CUSTOMER_ID, NAME AS CUSTOMER_NAME
FROM CUSTOMERS;
```

### 1.3 Aliasing with Self Join

When joining a table with itself, use aliases to distinguish between the two instances.

Aliases help avoid confusion and make the query clearer.

**Syntax:**

```sql
SELECT a.column_name, b.column_name
FROM my_table AS a, my_table AS b
WHERE a.join_column = b.join_column;
```

## 2. The SQL Join Clause

### What is a Join?

The SQL JOIN clause is used to combine rows from two or more tables based on a related column between them.

When related data is stored across multiple tables, joins help retrieve records by combining fields from these tables using their foreign keys.

### Join Predicate

- The part of the JOIN clause that specifies the columns used to join tables is called the join predicate
- Usually specified using the ON clause
- Can use comparison operators such as `<`, `>`, `<>`, `<=`, `>=`, `!=`, `BETWEEN`, `LIKE`, `NOT`, etc.
- Multiple predicates can be combined using logical operators `AND`, `OR`, `NOT`

### Using Joins with Update and Delete

- JOINs can be used in UPDATE and DELETE statements to update or delete records based on related data across multiple tables
- When you retrieve data using JOINs, the resultant table is not stored permanently in the database—it is a temporary result set

### Basic Syntax of a Join

```sql
SELECT column_name(s)
FROM table1
JOIN table2
ON table1.column = table2.column;
```

## 3. Types of Joins in SQL

<img src="../ERD/venn.png.png" alt="the venn diagram">

### 3.1 Inner Join

- The INNER JOIN retrieves the intersection of two tables
- It compares each row of the first table with each row of the second table
- Only rows that satisfy the join predicate are included

**Example:**

```sql
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;
```

### 3.2 Outer Join

An Outer Join retrieves all records from one or both tables, even if there are no matching rows in the other table.

Unlike Inner Join, Outer Join includes rows without matches, filling missing values with NULL.

Outer Join is divided into three types:

| Join Type   | Description                                                    |
|-------------|----------------------------------------------------------------|
| LEFT JOIN   | Returns all rows from the left table + matching rows on right |
| RIGHT JOIN  | Returns all rows from the right table + matching rows on left |
| FULL JOIN   | Returns rows where there is a match in either table           |

#### 3.2.1 LEFT JOIN

- Returns all rows from the left table
- If no match in the right table, NULLs fill right table columns

**Example:**

```sql
SELECT customers.name, orders.order_id
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;
```

#### 3.2.2 RIGHT JOIN

- Returns all rows from the right table
- If no match in the left table, NULLs fill left table columns

**Example:**

```sql
SELECT orders.order_id, customers.name
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.id;
```

#### 3.2.3 FULL JOIN

- Returns all rows when there is a match in one of the tables
- Rows without matches in either table are included with NULLs

**Example:**

```sql
SELECT employees.name, departments.department_name
FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.id;
```

## 3.3 Other Joins

### 3.3.1 What is a Self Join?

A Self Join is a regular join where a table is joined with itself. It's like having a conversation with yourself in the mirror - you're dealing with the same data source, but looking at it from two different perspectives simultaneously.
Key Concepts

Uses the same table twice in a single query
Requires table aliases to distinguish between the two instances
Treats the single table as if it were two separate tables
Essential for comparing rows within the same table

Simple Analogy: The Family Tree
Think of a self join like examining a family tree where you want to find relationships between family members. Everyone is in the same family database, but you need to compare different people to find who is whose parent, child, or sibling.

### 3.3.2 Why Use Self Joins?

**Common Use Cases**

- **Hierarchical Data:** Manager-employee relationships, organizational charts

- **Comparative Analysis:** Finding duplicates, similar records, or patterns

- **Sequential Data:** Comparing consecutive records, time series analysis

- **Graph Relationships:** Social networks, recommendation systems

**Real-World Scenarios**

- Finding employees who report to the same manager

- Identifying customers from the same city

- Comparing sales performance between different time periods

- Discovering duplicate records in a dataset

### 3.3.2 Self Join Syntax and Structure

**Basic Syntax**

```sql
SELECT a.column1, b.column2
FROM table_name a, table_name b
WHERE a.common_column = b.common_column
AND a.unique_identifier != b.unique_identifier;
```

**Modern JOIN Syntax **

```sql
SELECT a.column1, b.column2
FROM table_name a
JOIN table_name b ON a.common_column = b.common_column
WHERE a.unique_identifier != b.unique_identifier;
```

### 3.3.2 Cross Join

- Returns the Cartesian product of the two tables (all possible combinations)
- If table1 has M rows and table2 has N rows, result will have M × N rows

**Example:**

```sql
SELECT products.product_name, colors.color_name
FROM products
CROSS JOIN colors;
```

## Applications of SQL Joins and Aliases

 ### INNER JOIN

- **Application:** Fetch matching records from two or more related tables.

- **Use Case:** Display employees along with their department names.

### LEFT JOIN

- **Application:** Retrieve all records from the left table, and matching ones from the right.

- **Use Case:** List all customers, even those who haven’t placed orders.

### RIGHT JOIN

- **Application:** Retrieve all records from the right table, and matching ones from the left.

- **Use Case:** Show all orders, even if some customers are missing.

### FULL OUTER JOIN

- **Application:** Combine all records from both tables, matching where possible.

- **Use Case:** List all employees and all projects, even if unassigned.

### SELF JOIN

- **Application:** Compare records within the same table.

- **Use Case:** Display employees alongside their managers (same table).

#### CROSS JOIN

- **Application:** Create a Cartesian product of two tables (all combinations).

- **Use Case:** Generate all size and color combinations for products.

### Table Aliases

- **Application:** Shorten long table names to improve readability.

- **Use Case:** Use E for Employees and D for Departments in a join query.

### Column Aliases

- **Application:** Rename columns or expressions in query results.

- **Use Case:** Use AS Total for price * quantity in a sales report.