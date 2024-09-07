-- Use DB
	USE fast_food_db;
	GO

/*Avance4*/

-- Pregunta 1: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
-- Query to list all products and their categories
SELECT p.product_name AS 'Product Name', c.category_name AS 'Category Name'
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;
GO

-- Pregunta 2: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?
-- Query to get employees and their assigned branch
SELECT e.employee_name AS 'Employee Name', b.branch_name AS 'Branch Name'
FROM employees e
LEFT JOIN branches b ON e.branch_id = b.branch_id;
GO

-- Pregunta 3: ¿Existen productos que no tienen una categoría asignada?
-- Query to identify products without an assigned category
SELECT p.product_name AS 'Product Name'
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
WHERE c.category_id IS NULL;
GO
/*no arroja error pero no muestra nada*/
-- Check for products without a category assigned
-- Pregunta: ¿Existen productos que no tienen una categoría asignada?
IF NOT EXISTS (
    SELECT 1
    FROM products
    WHERE category_id IS NULL
)
BEGIN
    PRINT 'no existen productos sin categoria';
END
ELSE
BEGIN
    SELECT *
    FROM products
    WHERE category_id IS NULL;
END
GO



-- Pregunta 4: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?
-- Query to get the full details of orders including customer, employee, and courier names

SELECT o.order_id AS 'Order ID', c.customer_name AS 'Customer Name', 
       e.employee_name AS 'Employee Name', m.messenger_name AS 'Messenger Name'
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN messengers m ON o.messenger_id = m.messenger_id;
GO

-- Pregunta 5: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?
-- Query to count products sold by category in each branch
SELECT b.branch_name AS 'Branch Name', c.category_name AS 'Category Name', 
       COUNT(oi.product_id) AS 'Total Products Sold'
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
INNER JOIN categories c ON p.category_id = c.category_id
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN branches b ON o.branch_id = b.branch_id
GROUP BY b.branch_name, c.category_name
ORDER BY b.branch_name, c.category_name;
GO
