
-- hierachy in table
SELECT A.id, A.employee_name AS Employee, 
       B.employee_name AS Manager, B.manager_id
FROM Employees AS A
JOIN Employees AS B ON A.id = B.manager_id;

-- customer table created 
select A.CustomerID as Customer1,B.CustomerName as Customer2,A.city
from Customers as A
join Customers as B
on A.city=B.city AND A.CustomerID<>B.CustomerID

--compare monthly sales 

select A.region,B.region,A.month as currect
,B.month as previous,A.sales-B.sales as salesChange
from monthlysales as A
join monthlysales as B
on A.region=B.region and A.month='2025-06-01' and B.month='2025-05-01'

--remove duplicate 
select A.CustomerID as Record1,
B.CustomerID AS Record2,A.CustomerName,A.City
from customers As A
join customers As B
on A.customerName=B.customerName
and A.City=A.City and A.CustomerID<B.CustomerID