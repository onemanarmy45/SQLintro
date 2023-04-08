/* joins: select all the computers from the products table:
using the products table and the categories table, 
return the product name and the category name */
SELECT P.Name AS ProductName, C.Name AS CategoryName
FROM products as P
INNER JOIN categories AS C
ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating 
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating =5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(s.Quantity) AS Total, e.FirstName AS FirstName, e.LastName AS LastName
FROM sales AS s
JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS DeptName, c.Name AS CategoryName
FROM departments AS d
JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT * FROM products WHERE products.Name LIKE '%Hotel California%';
 
 SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', p.Price * SUM(s.Quantity) AS 'Total Price Sold'
 From products AS p
 JOIN sales AS s
 ON p.ProductID = s.ProductID
 Where p.Name LIKE '%Hotel California%'
 GROUP BY p.Name, p.Price;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT * FROM products WHERE Name LIKE '%Visio%';

SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 1 AND p.Name LIKE '%Visio%';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS 'Total Sold'
FROM sales AS s
JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;