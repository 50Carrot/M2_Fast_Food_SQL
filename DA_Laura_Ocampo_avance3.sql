-- Use DB
	USE fast_food_db;
	GO

/*Avance3*/


-- �Cu�l es el total de ventas (TotalCompra) a nivel global?
	SELECT 
		SUM(total_amount) AS total_global_sales
	FROM 
		orders;
	GO


-- �Cu�l es el precio promedio de los productos dentro de cada categor�a?
	SELECT 
		c.category_name,
		AVG(p.price) AS average_price
	FROM 
		products p
	JOIN 
		categories c ON p.category_id = c.category_id
	GROUP BY 
		c.category_name
	ORDER BY 
		c.category_name;
	GO


-- �Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?
	SELECT 
		b.branch_name,
		MIN(o.total_amount) AS min_order,
		MAX(o.total_amount) AS max_order
	FROM 
		orders o
	JOIN 
		branches b ON o.branch_id = b.branch_id
	GROUP BY 
		b.branch_name
	ORDER BY 
		b.branch_name;
	GO


-- �Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?
	SELECT 
		MAX(kilometers_to_cover) AS max_km_recovered
	FROM 
		orders;
	GO


-- Promedio de cantidad de productos por orden
-- �Cu�l es la cantidad promedio de productos por orden?
	SELECT 
		AVG(order_items.quantity) AS avg_product_quantity
	FROM 
		order_items;
	GO


-- �C�mo se distribuye la Facturaci�n Total del Negocio de acuerdo a los m�todos de pago?
	SELECT 
		pt.payment_type_name,
		SUM(o.total_amount) AS total_sales
	FROM 
		orders o
	JOIN 
		payment_types pt ON o.payment_type_id = pt.payment_type_id
	GROUP BY 
		pt.payment_type_name
	ORDER BY 
		total_sales DESC;
	GO


-- �Cu�l Sucursal tiene el ingreso promedio m�s alto?
	WITH branch_avg_sales AS (
		SELECT 
			b.branch_name,
			AVG(o.total_amount) AS avg_sales
		FROM 
			orders o
		JOIN 
			branches b ON o.branch_id = b.branch_id
		GROUP BY 
			b.branch_name
	)
	SELECT 
		TOP 1 branch_name,
		avg_sales
	FROM 
		branch_avg_sales
	ORDER BY 
		avg_sales DESC;
	GO


-- �Cu�les son las sucursales que han generado ventas totales por encima de $1000?
	SELECT 
		b.branch_name,
		SUM(o.total_amount) AS total_sales
	FROM 
		orders o
	JOIN 
		branches b ON o.branch_id = b.branch_id
	GROUP BY 
		b.branch_name
	HAVING 
		SUM(o.total_amount) > 1000
	ORDER BY 
		total_sales DESC;
	GO

-- Comparaci�n de ventas promedio antes y despu�s de una fecha espec�fica
-- �C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?
	WITH sales_comparison AS (
		SELECT 
			CASE 
				WHEN o.dispatch_datetime < '2023-07-01' THEN 'before'
				ELSE 'after'
			END AS period,
			AVG(o.total_amount) AS avg_sales
		FROM 
			orders o
		GROUP BY 
			CASE 
				WHEN o.dispatch_datetime < '2023-07-01' THEN 'before'
				ELSE 'after'
			END
	)
	SELECT 
		period,
		avg_sales
	FROM 
		sales_comparison
	ORDER BY 
		period;
	GO


-- �Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, cu�l es el ingreso promedio de estas ventas, y cu�l ha sido el importe m�ximo alcanzado por una orden en dicha jornada?
	SELECT 
		sale_time,
		COUNT(*) AS sales_count,
		AVG(total_amount) AS avg_income,
		MAX(total_amount) AS max_amount
	FROM 
		orders
	GROUP BY 
		sale_time
	ORDER BY 
		sales_count DESC;
	GO
