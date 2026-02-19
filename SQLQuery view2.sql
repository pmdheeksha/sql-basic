--Provide a view that combines details from orders,products,customers,and employees.
CREATE VIEW Sales.V_Order_Details AS(
	SELECT
	o.OrderID,
	o.OrderDate,
	p.Product,
	p.Category,
	COALESCE(c.FirstName,'')+''+COALESCE(c.LastName,'') CustomerName,
	c.country Customercountry,
	COALESCE(e.FirstName,'')+''+COALESCE(e.LastName,'') SalesPersonName,
	e.Department,
	o.Sales,o.Quantity
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p
	ON p.ProductID = o.ProductID
	LEFT JOIN Sales.Customers c
	ON c.CustomerID = o.CustomerID
	LEFT JOIN Sales.Employees e
	ON e.employeeID = o.SalesPersonID
)