-- Use DB
	USE fast_food_db;
	GO

--tittle 
/*error*/
/*Avance2*/

--Insert data into the 'categories' table
	INSERT INTO categories (category_name) VALUES
	('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
	('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');
	GO

	SELECT * FROM categories 
	

/*the INSERT statement conflicted with the FK (Foreign key) constraint "FK_products_catego_#". The conclict ocurred in db 'fast_food_db.... 
The products table creates a reference to the categories table. The error occurred bcs products were inserted first with the categories table being empty*/
--Create the 'price' column in the 'products' table
	ALTER TABLE products
	ADD price DECIMAL(10, 2);
	GO
--Insert data into the 'products' table
	INSERT INTO products (product_name, category_id, price) VALUES
	('Hamburguesa Deluxe', 1, 9.99), 
	('Cheeseburger', 1, 7.99), 
	('Pizza Margarita', 10, 11.99), 
	('Pizza Pepperoni', 10, 12.99), 
	('Helado de Chocolate', 7, 2.99),
	('Helado de Vainilla', 7, 2.99), 
	('Ensalada César', 4, 5.99), 
	('Ensalada Griega', 4, 6.99), 
	('Pastel de Zanahoria', 2, 3.99), 
	('Brownie', 2, 2.99);
	GO	

	SELECT * FROM products 
	

-- Insert data into the 'branches' table.
	INSERT INTO branches (branch_name, location ) VALUES
	('Sucursal Central', '1234 Main St'), 
	('Sucursal Norte', '5678 North St'), 
	('Sucursal Este', '9101 East St'), 
	('Sucursal Oeste', '1121 West St'), 
	('Sucursal Sur', '3141 South St'),
	('Sucursal Playa', '1516 Beach St'), 
	('Sucursal Montaña', '1718 Mountain St'), 
	('Sucursal Valle', '1920 Valley St'), 
	('Sucursal Lago', '2122 Lake St'), 
	('Sucursal Bosque', '2324 Forest St');
	GO

	SELECT * FROM branches

-- Create the 'address' column in the 'customers' table.
	ALTER TABLE customers
	ADD address VARCHAR(255); 
	GO
--Insert data into the 'customers' table. 
	INSERT INTO customers (customer_name, address) VALUES
	('Cliente Uno', '1000 A Street'), 
	('Cliente Dos', '1001 B Street'), 
	('Cliente Tres', '1002 C Street'), 
	('Cliente Cuatro', '1003 D Street'), 
	('Cliente Cinco', '1004 E Street'),
	('Cliente Seis', '1005 F Street'), 
	('Cliente Siete', '1006 G Street'), 
	('Cliente Ocho', '1007 H Street'), 
	('Cliente Nueve', '1008 I Street'), 
	('Cliente Diez', '1009 J Street');
	GO

	SELECT * FROM  customers
	

/*--Create the 'description' column in the 'order_origins' table.
	ALTER TABLE order_origins
	ADD description VARCHAR(500); 
	GO*/
--Insert data into the 'order_origins' table
	INSERT INTO order_origins (description) VALUES
	('En línea'), 
	('Presencial'), 
	('Teléfono'), 
	('Drive Thru'), 
	('App Móvil'),
	('Redes Sociales'), 
	('Correo Electrónico'), 
	('Publicidad'), 
	('Recomendación'), 
	('Evento');
	GO
	
	SELECT * FROM  order_origins
	
	
	-- Insert dates into 'payment_types' table
	INSERT INTO payment_types (payment_type_name) VALUES --INSERT INTO TiposPago (Descripcion) VALUES
	('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
	('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');
	GO

	SELECT * FROM  payment_types

	-- Insert dates into 'messengers' table
	INSERT INTO messengers (messenger_name, is_external) VALUES
	('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
	('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);
	GO

	SELECT * FROM messengers

-- Insert data into the 'departments' table
	INSERT INTO departments (department_name) VALUES
	('Administración'),
	('Ventas'),
	('Cocina'),
	('Cafetería'),
	('Logística'),
	('Servicio'),
	('Restaurante'),
	('Mantenimiento');
	GO

	SELECT * FROM  departments 
	

/*The column was initially created with the INT data type, and was later updated to DECIMAL using the ALTER COLUMN statement.*/
/*--Update the 'price' column in the 'order_items' table.
	ALTER TABLE order_items
	ALTER COLUMN price DECIMAL (10,2);
	GO*/
/*-- Insert dates into the order_items
	INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
	(1, 1, 3, 23.44),
	(1, 2, 5, 45.14),
	(1, 3, 4, 46.37),
	(1, 4, 4, 42.34),
	(1, 5, 1, 18.25),
	(1, 6, 4, 20.08),
	(1, 7, 2, 13.31),
	(1, 8, 2, 20.96),
	(1, 9, 4, 30.13),
	(1, 10, 3, 38.34);
	GO*/
/*Error inserting data into order_items
The iNSERT statment conflicted with the FK constraint "FK_order_ite_produc_#. The conclict ocurred in database "fast_food_db", table "dbo.products", column 'product_id'
The error occurred because there was no 'product_id' with the number 1, so the identity was reset. */
/*--Clear the 'products' table data
	DELETE FROM products;
	GO
--Reset the identity (1,1)
	DBCC CHECKIDENT ('products', RESEED, 0);
	GO*/


	--Insert the data into the 'products' table again
		INSERT INTO products (product_name, category_id, price) VALUES
		('Hamburguesa Deluxe', 1, 9.99), 
		('Cheeseburger', 1, 7.99), 
		('Pizza Margarita', 10, 11.99), 
		('Pizza Pepperoni', 10, 12.99), 
		('Helado de Chocolate', 7, 2.99),
		('Helado de Vainilla', 7, 2.99), 
		('Ensalada César', 4, 5.99), 
		('Ensalada Griega', 4, 6.99), 
		('Pastel de Zanahoria', 2, 3.99), 
		('Brownie', 2, 2.99);
		GO	

		SELECT * FROM products

/*Error inserting data into employees
Msg 245, Level 16, State 1, Line 90
Conversion failed when converting the varchar value 'Administración' to data type int. 
The error you're seeing occurs because the 'department_id' column in the 'employees' table expects an integer value, but you're trying to insert a string ('Administration'). 
-- Create the 'branch_id' column in the 'employees' table.	
	ALTER TABLE employees
	ADD branch_id INT;
	GO	
--- Add FK branches (id) to employees
	ALTER TABLE employees
	ADD CONSTRAINT FK_branch_id FOREIGN KEY (branch_id) REFERENCES branches(branch_id);
	GO
-- Create the 'department_name' column in the 'employees' table.
	ALTER TABLE employees
	ADD department_name VARCHAR(50);
	GO*/
-- Insert data into the 'employees' table	
	INSERT INTO employees (employee_name, position, department_name, branch_id, role) VALUES
	('John Doe', 'Gerente', 1, 1, 'Vendedor'), 
	('Jane Smith', 'Subgerente', 2, 1, 'Vendedor'), 
	('Bill Jones', 'Cajero', 2, 1, 'Vendedor'), 
	('Alice Johnson', 'Cocinero', 3, 1, 'Vendedor'), 
	('Tom Brown', 'Barista', 4, 1, 'Vendedor'),
	('Emma Davis', 'Repartidor', 5, 1, 'Mensajero'), 
	('Lucas Miller', 'Atención al Cliente', 6, 1, 'Vendedor'), 
	('Olivia García', 'Encargado de Turno', 1, 1, 'Vendedor'), 
	('Ethan Martinez', 'Mesero', 7, 1, 'Vendedor'), 
	('Sophia Rodriguez', 'Auxiliar de Limpieza', 8, 1, 'Vendedor');
	GO

	SELECT * FROM employees
	
--Create the 'employee_id' column in the 'orders' table.
	ALTER TABLE orders
	ADD employee_id INT;
	GO
-- Add FK 'employee_id' to 'orders'
	ALTER TABLE orders
	ADD CONSTRAINT FK_employee_id FOREIGN KEY (employee_id) REFERENCES employees (employee_id);
	GO
/*--Create the 'employee_id' column in the 'orders' table.
	ALTER TABLE orders
	ADD messenger_id INT;
	GO*/
-- Insert data into the 'orders' table
	INSERT INTO orders (customer_id, employee_id, branch_id, messenger_id, payment_type_id, order_origin_id, sale_time,  total_amount,  kilometers_to_cover, dispatch_datetime,  delivery_datetime, order_taken_datetime,  order_ready_datetime)  VALUES
	(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
	(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
	(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
	(4, 4, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
	(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
	(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
	(7, 7, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
	(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
	(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
	(10, 10, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');
	GO

	SELECT * FROM messengers
	
	
--Create the 'description' column in the 'order_origins' table.
	ALTER TABLE order_items
	ADD price DECIMAL (10,2);
	Go
-- Try inserting the data into the 'order_items' table again
		INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
		(1, 1, 3, 23.44),
		(1, 2, 5, 45.14),
		(1, 3, 4, 46.37),
		(1, 4, 4, 42.34),
		(1, 5, 1, 18.25),
		(1, 6, 4, 20.08),
		(1, 7, 2, 13.31),
		(1, 8, 2, 20.96),
		(1, 9, 4, 30.13),
		(1, 10, 3, 38.34);
		GO
	
		SELECT * FROM  orders
		





--Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?
	SELECT 
		COUNT(DISTINCT order_id) AS unique_orders_rows --(AS=alias,creates an alternate name for the result of the query)
	FROM 
		orders;
	GO

-- Pregunta: ¿Cuántos empleados existen en cada departamento?
	SELECT 
		department_name,
		COUNT(*) AS number_of_employees
	FROM 
		employees
	GROUP BY 
		department_name
	ORDER BY 
		department_name;
	GO
--  Verify
	SELECT * FROM employees;
	GO

-- Pregunta: ¿Cuántos productos hay por código de categoría?
	SELECT category_id, --selecciona la columna
		COUNT(*) --cuenta el num. de productos de cada categora
		AS number_of_products 
	FROM 
		products
	GROUP BY 
		category_id
	ORDER BY 
		category_id;
	GO

--Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?
	SELECT 
		COUNT(*) AS total_customers
	FROM 
		customers;
	GO

--Pregunta: ¿Cuáles son las sucursales con un promedio de Facturación/Ingresos superior a 1000.00 y que minimizan sus costos en base al promedio de kilómetros recorridos de todas sus entregas gestionadas? Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.
	WITH branch_averages AS ( --Create a CTE
		SELECT
			b.branch_name,
			AVG(o.total_amount) AS average_revenue,
			AVG(o.kilometers_to_cover) AS average_km
		FROM
			orders o
		JOIN
			branches b ON o.branch_id = b.branch_id
		GROUP BY
			b.branch_name
		HAVING
			AVG(o.total_amount) > 1000.00
	)
	SELECT
		branch_name,
		average_revenue,
		average_km
	FROM
		branch_averages
	ORDER BY
		average_km;
	GO



--UPDATE Y DELETE 'Consignas'


-- Update the price of a specific product
-- Example: Increase the price of 'Pizza Margarita' by 1.00
UPDATE products
SET price = price + 1.00
WHERE product_name = 'Pizza Margarita';
GO

-- Verify the update by selecting the updated product
SELECT * FROM products WHERE product_name = 'Pizza Margarita';
GO

/*-- Delete a specific product from the products table
-- Example: Remove the 'Brownie' product from the table
DELETE FROM products
WHERE product_name = 'Brownie';
GO
The DELETE statement conflicted with the REFERENCE constraint "FK__order_ite__produ__5629CD9C". The conflict occurred in database "fast_food_db", table "dbo.order_items", column 'product_id'.*/
--solution: 
-- First, delete the related records in the order_items table
DELETE FROM order_items
WHERE product_id IN (
    SELECT product_id FROM products WHERE product_name = 'Brownie'
);
GO
-- Now, delete the product from the products table
DELETE FROM products
WHERE product_name = 'Brownie';
GO
-- Verify the deletion by selecting all remaining products
SELECT * FROM products;
GO


-- Update the branch location for a specific branch
-- Example: Change the location of 'Sucursal Norte' to '789 New North St'
UPDATE branches
SET location = '789 New North St'
WHERE branch_name = 'Sucursal Norte';
GO

-- Verify the update by selecting the updated branch
SELECT * FROM branches WHERE branch_name = 'Sucursal Norte';
GO

/*-- Delete a specific customer from the customers table
-- Example: Remove 'Cliente Diez' from the table
DELETE FROM customers
WHERE customer_name = 'Cliente Diez';
GO
/*The DELETE statement conflicted with the REFERENCE constraint "FK__orders__customer__4D94879B". The conflict occurred in database "fast_food_db", table "dbo.orders", column 'customer_id'.
*/
-- Verify the deletion by selecting all remaining customers
SELECT * FROM customers;
GO*/
--solution
-- First, delete the related records in the orders table
DELETE FROM orders
WHERE customer_id IN (
    SELECT customer_id FROM customers WHERE customer_name = 'Cliente Diez'
);
GO

-- Now, delete the customer from the customers table
DELETE FROM customers
WHERE customer_name = 'Cliente Diez';
GO

-- Verify the deletion by selecting all remaining customers
SELECT * FROM customers;
GO


-- Update the order status for a specific order
-- Example: Change the 'total_amount' for the order with order_id 1
UPDATE orders
SET total_amount = total_amount + 100.00
WHERE order_id = 1;
GO

-- Verify the update by selecting the updated order
SELECT * FROM orders WHERE order_id = 1;
GO

-- Delete all orders with a total amount less than 500.00
-- This will remove any orders that are not meeting the minimum revenue criteria
DELETE FROM orders
WHERE total_amount < 1000.00;
GO

-- Verify the deletion by selecting all remaining orders
SELECT * FROM orders;
GO

/*Explanation:
UPDATE Example 1: Increases the price of the 'Pizza Margarita' product by 1.00.
DELETE Example 1: Removes the 'Brownie' product from the products table.
UPDATE Example 2: Changes the location of the 'Sucursal Norte' branch.
DELETE Example 2: Removes 'Cliente Diez' from the customers table.
UPDATE Example 3: Increases the total_amount for the order with order_id 1.
DELETE Example 3: Deletes all orders with a total_amount less than 500.00.*/


