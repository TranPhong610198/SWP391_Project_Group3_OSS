-- Create database
CREATE DATABASE clothing_shop;
GO

USE clothing_shop;
GO

-- Users table
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) UNIQUE NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password_hash NVARCHAR(255) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,
    gender NVARCHAR(10) CHECK (gender IN ('male', 'female', 'other')) NOT NULL,
    mobile NVARCHAR(20),
    avatar NVARCHAR(255),
    role NVARCHAR(20) CHECK (role IN ('admin', 'sale', 'marketing', 'customer')) NOT NULL,
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive', 'pending')) DEFAULT 'pending',
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);

-- User addresses table
CREATE TABLE user_addresses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    recipient_name NVARCHAR(100) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    address NVARCHAR(MAX) NOT NULL,
    is_default BIT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Categories table
CREATE TABLE categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX),
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'active'
);

-- Products table
CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    description NVARCHAR(MAX),
    original_price DECIMAL(10,2) NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    thumbnail NVARCHAR(255),
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'active',
    is_combo BIT DEFAULT 0,
    combo_group_id NVARCHAR(50),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Product images table
CREATE TABLE product_images (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    image_url NVARCHAR(255) NOT NULL,
    display_order INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Product variants table (for sizes and colors)
CREATE TABLE product_variants (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    size NVARCHAR(20) NOT NULL,
    color NVARCHAR(50) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Orders table
CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    sale_id INT,
    status NVARCHAR(20) CHECK (status IN ('pending', 'processing', 'shipped', 'completed', 'cancelled')) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    recipient_name NVARCHAR(100) NOT NULL,
    recipient_email NVARCHAR(100) NOT NULL,
    recipient_phone NVARCHAR(20) NOT NULL,
    recipient_address NVARCHAR(MAX) NOT NULL,
    notes NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (sale_id) REFERENCES users(id)
);

-- Order items table
CREATE TABLE order_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (variant_id) REFERENCES product_variants(id)
);

-- Feedback table
CREATE TABLE feedback (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_item_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment NVARCHAR(MAX),
    status NVARCHAR(20) CHECK (status IN ('pending', 'approved', 'rejected')) DEFAULT 'pending',
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (order_item_id) REFERENCES order_items(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Posts table
CREATE TABLE posts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    thumbnail NVARCHAR(255),
    category_id INT NOT NULL,
    summary NVARCHAR(MAX),
    content NVARCHAR(MAX) NOT NULL,
    author_id INT NOT NULL,
    is_featured BIT DEFAULT 0,
    status NVARCHAR(20) CHECK (status IN ('draft', 'published', 'archived')) DEFAULT 'draft',
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Sliders table
CREATE TABLE sliders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    image_url NVARCHAR(255) NOT NULL,
    link NVARCHAR(255),
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'active',
    display_order INT DEFAULT 0,
    notes NVARCHAR(MAX)
);

-- Settings table
CREATE TABLE settings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    setting_key NVARCHAR(50) UNIQUE NOT NULL,
    setting_value NVARCHAR(MAX) NOT NULL,
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'active'
);

-- Customer contact history table
CREATE TABLE customer_contact_history (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    email NVARCHAR(100) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,
    gender NVARCHAR(10) CHECK (gender IN ('male', 'female')) NOT NULL,
    mobile NVARCHAR(20),
    address NVARCHAR(MAX),
    total_purchases INT DEFAULT 0,
    total_spend DECIMAL(10,2) DEFAULT 0,
    updated_by INT,
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);


create table tokenPassword (
	id int identity(1,1) primary key,
	token varchar(255) not null,
	expiryTime DATETIME NOT NULL,
	isUsed bit NOT NULL,
	UserID int NOT NULL,
	Foreign key (UserID) references users(id)
)

-- Create trigger for updating updated_at timestamp
GO
CREATE TRIGGER trg_users_update ON users
AFTER UPDATE AS
BEGIN
    UPDATE users
    SET updated_at = GETDATE()
    FROM users
    INNER JOIN inserted ON users.id = inserted.id;
END;

GO
CREATE TRIGGER trg_products_update ON products
AFTER UPDATE AS
BEGIN
    UPDATE products
    SET updated_at = GETDATE()
    FROM products
    INNER JOIN inserted ON products.id = inserted.id;
END;

GO
CREATE TRIGGER trg_posts_update ON posts
AFTER UPDATE AS
BEGIN
    UPDATE posts
    SET updated_at = GETDATE()
    FROM posts
    INNER JOIN inserted ON posts.id = inserted.id;
END;

GO
CREATE TRIGGER trg_orders_update ON orders
AFTER UPDATE AS
BEGIN
    UPDATE orders
    SET updated_at = GETDATE()
    FROM orders
    INNER JOIN inserted ON orders.id = inserted.id;
END;