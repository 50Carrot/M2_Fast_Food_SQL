-- Create DB with file configuration
/*Avance1*/

	CREATE DATABASE fast_food_db
	ON 
	(
		NAME = 'Carrera_BD_Data',
		FILENAME = 'C:\SQL_DB\Carrera_BD_Data.mdf', --master data file
		SIZE = 50MB,
		MAXSIZE = 1GB,
		FILEGROWTH = 5MB
	)
	LOG ON
	(
		NAME = 'Carrera_BD_Log',
		FILENAME = 'C:\SQL_DB\Carrera_BD_Log.ldf', --log data file
		SIZE = 25MB,
		MAXSIZE = 256MB,
		FILEGROWTH = 5MB
	);
	GO

-- Verify the DB creation
	SELECT name, physical_name 
	FROM sys.master_files 
	WHERE database_id = DB_ID('fast_food_db');

-- Use DB
	USE fast_food_db;
	GO

--CTRL + S to save

-- Tabla: customers
	CREATE TABLE customers (
		customer_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the customer (auto-incrementing)
		customer_name VARCHAR(100),  -- (String with a maximum of 100 characters), 
		contact_details VARCHAR(255),
	);
	GO


-- Tabla: branches(sucursales)
	CREATE TABLE branches (
		branch_id INT IDENTITY(1,1) PRIMARY KEY,             
		branch_name VARCHAR(100),             
		location VARCHAR(255)                
	);
	GO

-- Tabla: messengers
	CREATE TABLE messengers (
		messenger_id INT IDENTITY(1,1) PRIMARY KEY,          
		messenger_name VARCHAR(100),          
		is_external BIT -- Indicates if the messenger is external (1) or internal (0)
	);
	GO

-- Tabla: order_origins
	CREATE TABLE order_origins (
		order_origin_id INT IDENTITY(1,1) PRIMARY KEY,    
		origin_name VARCHAR(50),
		description VARCHAR(500)
	);
	GO

-- Tabla: payment_types
	CREATE TABLE payment_types (
		payment_type_id INT IDENTITY(1,1) PRIMARY KEY,       
		payment_type_name VARCHAR(50)          
	);
	GO

-- Tabla: categories
	CREATE TABLE categories (
		category_id INT IDENTITY(1,1) PRIMARY KEY,          
		category_name VARCHAR(50)             
	);
	GO
	 
-- Tabla: departments
	CREATE TABLE departments (
		department_id INT IDENTITY(1,1) PRIMARY KEY,       
		department_name VARCHAR(50)            
	);
	GO

-- Tabla: products
	CREATE TABLE products (
		product_id INT IDENTITY(1,1) PRIMARY KEY,    -- Unique identifier for the product sold 
		product_name VARCHAR(100), -- Name of the product sold
		category_id INT, -- Identifier for the category
		FOREIGN KEY (category_id) REFERENCES categories(category_id) -- FK reference to categories
	);
	GO

-- Tabla: employees
	CREATE TABLE employees (
		employee_id INT IDENTITY(1,1) PRIMARY KEY,
		branch_id INT,
		department_id INT,
		employee_name VARCHAR(100),
		department_name VARCHAR(50),
		position VARCHAR(50),                 
		role VARCHAR(50),  -- Role of the employee
		FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
		FOREIGN KEY (department_id) REFERENCES departments(department_id) -- FK reference to departments
	);
	GO

-- Tabla: orders
	CREATE TABLE orders (
		order_id INT IDENTITY(1,1) PRIMARY KEY,             
		customer_id INT,                      
		branch_id INT,                         
		messenger_id INT,                      
		order_origin_id INT,                   
		payment_type_id INT,
		sale_time VARCHAR(50),  -- Sale time (morning, afternoon, evening)
		total_amount DECIMAL(10, 2) CHECK (total_amount >= 0),           
		kilometers_to_cover DECIMAL(5, 2) CHECK (kilometers_to_cover >= 0), -- Kilometers to cover for delivery
		dispatch_datetime DATETIME,  -- Date and time of dispatch(despacho)
		delivery_datetime DATETIME,            
		order_taken_datetime DATETIME,         
		order_ready_datetime DATETIME,
		FOREIGN KEY (customer_id) REFERENCES customers(customer_id),  -- FK reference to customers
		FOREIGN KEY (branch_id) REFERENCES branches(branch_id),  -- FK reference to branches
		FOREIGN KEY (messenger_id) REFERENCES messengers(messenger_id), -- FK reference to messengers
		FOREIGN KEY (order_origin_id) REFERENCES order_origins(order_origin_id), -- FK reference to order_origins
		FOREIGN KEY (payment_type_id) REFERENCES payment_types(payment_type_id)  -- FK reference to payment_types
	);
	GO

-- Tabla: order_items
	CREATE TABLE order_items (
		order_item_id INT IDENTITY(1,1) PRIMARY KEY,   -- Unique identifier for the order item
		order_id INT,                          
		product_id INT,
		quantity INT CHECK (quantity > 0),  -- Quantity of the product (Ensure quantity is positive)
		FOREIGN KEY (order_id) REFERENCES orders(order_id), -- FK reference to orders
		FOREIGN KEY (product_id) REFERENCES products(product_id) -- FK reference to products
	);
	GO




