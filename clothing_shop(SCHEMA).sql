create database clothing_shop
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
    parent_id INT NULL,
    level INT NOT NULL DEFAULT 1,
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'active',
    FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE NO ACTION
);
GO


-- Products table
CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    description NVARCHAR(MAX),
    original_price DECIMAL(10,2) NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    thumbnail NVARCHAR(255),
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive', 'EOStock')) DEFAULT 'EOStock',
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
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE product_sizes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    size NVARCHAR(20) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE product_colors (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    color NVARCHAR(50) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Product variants table (for sizes and colors)
CREATE TABLE product_variants (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    size_id INT NOT NULL,
    color_id INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    last_restock_date DATETIME2 NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (size_id) REFERENCES product_sizes(id),
    FOREIGN KEY (color_id) REFERENCES product_colors(id)
);

-- Orders table
CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT, -- ID người dùng (NULL nếu là khách vãng lai)
    status NVARCHAR(20) CHECK (status IN ('pending', 'processing', 'shipped', 'completed', 'cancelled')) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    recipient_name NVARCHAR(100) NOT NULL,
    recipient_email NVARCHAR(100) NOT NULL,
    recipient_phone NVARCHAR(20) NOT NULL,
    recipient_address NVARCHAR(MAX) NOT NULL,
    notes NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id)
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

CREATE TABLE order_history (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    updated_by INT NOT NULL,
    status NVARCHAR(20) CHECK (status IN ('pending', 'processing', 'shipped', 'completed', 'cancelled')),
    notes NVARCHAR(MAX),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

-- Mã giảm giá (Coupons)
CREATE TABLE coupons (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- ID mã giảm giá
    code NVARCHAR(50) UNIQUE NOT NULL,  -- Mã giảm giá
    discount_type NVARCHAR(20) CHECK (discount_type IN ('percentage', 'fixed')) NOT NULL,  -- Loại giảm giá (% hoặc số tiền cố định)
    discount_value DECIMAL(10,2) NOT NULL,  -- Giá trị giảm
    min_order_amount DECIMAL(10,2),  -- Giá trị đơn hàng tối thiểu để áp dụng mã
    max_discount DECIMAL(10,2),  -- Giảm tối đa nếu giảm theo %
    usage_limit INT DEFAULT NULL,  -- Số lần sử dụng tối đa (NULL = không giới hạn)
    used_count INT DEFAULT 0,  -- Số lần đã dùng
    expiry_date DATETIME2,  -- Ngày hết hạn của mã
    created_at DATETIME2 DEFAULT GETDATE(),
    status NVARCHAR(20) CHECK (status IN ('active','inactive','expired')) DEFAULT 'active'  -- Trạng thái mã giảm giá
);


CREATE TABLE order_coupons (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- ID duy nhất
    order_id INT NOT NULL,  -- Đơn hàng sử dụng mã giảm giá
    coupon_id INT NOT NULL,  -- ID mã giảm giá được sử dụng
    user_email NVARCHAR(100) NOT NULL,  -- Email của người dùng sử dụng mã giảm giá
    discount_applied DECIMAL(10,2) NOT NULL,  -- Số tiền giảm thực tế
    created_at DATETIME2 DEFAULT GETDATE(),  -- Thời gian sử dụng mã giảm giá
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (coupon_id) REFERENCES coupons(id)
);


-- Giảm giá toàn hệ thống
CREATE TABLE sales_campaign (
    id INT IDENTITY(1,1) PRIMARY KEY,  -- ID giảm giá
    campaign_name NVARCHAR(100) NOT NULL,
    discount_percentage DECIMAL(5,2) NOT NULL,  -- Phần trăm giảm giá
    start_date DATETIME2 NOT NULL,  -- Ngày bắt đầu
    end_date DATETIME2 NOT NULL,  -- Ngày kết thúc
    apply_all BIT DEFAULT 0,  -- 1: Áp dụng cho tất cả sản phẩm, 0: Áp dụng cho category/sản phẩm được chọn
    created_at DATETIME2 DEFAULT GETDATE(),
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'inactive'  -- Trạng thái
);

-- Giảm giá theo category
-- Nếu có category trong sale_campaign_categories, tất cả sản phẩm của category đó sẽ được giảm giá.
CREATE TABLE sale_campaign_categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    discount_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (discount_id) REFERENCES sales_campaign(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Giảm giá theo sản phẩm cụ thể
-- Nếu sản phẩm có trong bảng sale_campaign_products, lấy giảm giá từ sales_campaign
CREATE TABLE sale_campaign_products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    discount_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (discount_id) REFERENCES sales_campaign(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
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
    summary NVARCHAR(MAX),
    content NVARCHAR(MAX) NOT NULL,
    author_id INT NOT NULL,
    is_featured BIT DEFAULT 0,
    status NVARCHAR(20) CHECK (status IN ('draft', 'published', 'archived')) DEFAULT 'draft',
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
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
CREATE TABLE dbo.footer_settings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    type NVARCHAR(50) NOT NULL CHECK (type IN ('social', 'contact', 'info')),
    field_name NVARCHAR(50) NOT NULL,
    value NVARCHAR(MAX) NOT NULL,
    image NVARCHAR(255) NULL,
    status NVARCHAR(20) CHECK (status IN ('active', 'inactive')) DEFAULT 'active'
);


-- Customer contact history table
CREATE TABLE customer_contact_history (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    customer_type NVARCHAR(20) CHECK (customer_type IN ('registered', 'guest')) DEFAULT 'guest',
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

CREATE TABLE cart (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NULL,  -- NULL nếu là khách vãng lai
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cart_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (variant_id) REFERENCES product_variants(id)
);

CREATE TABLE payments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method NVARCHAR(50) CHECK (payment_method IN ('credit_card', 'paypal', 'bank_transfer', 'cod')) NOT NULL,
    payment_status NVARCHAR(20) CHECK (payment_status IN ('pending', 'completed', 'failed', 'refunded')) DEFAULT 'pending',
    transaction_id NVARCHAR(255),
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);


CREATE TABLE shipping (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    shipping_provider NVARCHAR(100) NOT NULL,
    tracking_number NVARCHAR(100) UNIQUE,
    estimated_delivery DATE,
    delivered_at DATETIME2,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);


