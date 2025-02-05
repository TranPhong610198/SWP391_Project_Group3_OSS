USE [master]
GO
/****** Object:  Database [clothing_shop]    Script Date: 2/5/2025 1:31:23 PM ******/
CREATE DATABASE [clothing_shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clothing_shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLHUY\MSSQL\DATA\clothing_shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clothing_shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLHUY\MSSQL\DATA\clothing_shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [clothing_shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clothing_shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clothing_shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clothing_shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clothing_shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clothing_shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clothing_shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [clothing_shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [clothing_shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clothing_shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clothing_shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clothing_shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clothing_shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clothing_shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clothing_shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clothing_shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clothing_shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clothing_shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clothing_shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clothing_shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clothing_shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clothing_shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clothing_shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clothing_shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clothing_shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clothing_shop] SET  MULTI_USER 
GO
ALTER DATABASE [clothing_shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clothing_shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clothing_shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clothing_shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clothing_shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clothing_shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [clothing_shop] SET QUERY_STORE = OFF
GO
USE [clothing_shop]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_contact_history]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_contact_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[mobile] [nvarchar](20) NULL,
	[address] [nvarchar](max) NULL,
	[total_purchases] [int] NULL,
	[total_spend] [decimal](10, 2) NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_item_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[status] [nvarchar](20) NULL,
	[created_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[variant_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[sale_id] [int] NULL,
	[status] [nvarchar](20) NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[recipient_name] [nvarchar](100) NOT NULL,
	[recipient_email] [nvarchar](100) NOT NULL,
	[recipient_phone] [nvarchar](20) NOT NULL,
	[recipient_address] [nvarchar](max) NOT NULL,
	[notes] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posts]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[thumbnail] [nvarchar](255) NULL,
	[category_id] [int] NOT NULL,
	[summary] [nvarchar](max) NULL,
	[content] [nvarchar](max) NOT NULL,
	[author_id] [int] NOT NULL,
	[is_featured] [bit] NULL,
	[status] [nvarchar](20) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[image_url] [nvarchar](255) NOT NULL,
	[display_order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_variants]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_variants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [nvarchar](20) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[stock_quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[category_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[original_price] [decimal](10, 2) NOT NULL,
	[sale_price] [decimal](10, 2) NOT NULL,
	[thumbnail] [nvarchar](255) NULL,
	[status] [nvarchar](20) NULL,
	[is_combo] [bit] NULL,
	[combo_group_id] [nvarchar](50) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[setting_key] [nvarchar](50) NOT NULL,
	[setting_value] [nvarchar](max) NOT NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sliders]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sliders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[image_url] [nvarchar](255) NOT NULL,
	[link] [nvarchar](255) NULL,
	[status] [nvarchar](20) NULL,
	[display_order] [int] NULL,
	[notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tokenPassword]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tokenPassword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](255) NOT NULL,
	[expiryTime] [datetime] NOT NULL,
	[isUsed] [bit] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_addresses]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[recipient_name] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[is_default] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/5/2025 1:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[mobile] [nvarchar](20) NULL,
	[avatar] [nvarchar](255) NULL,
	[role] [nvarchar](20) NOT NULL,
	[status] [nvarchar](20) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 

INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (36, N'2c37ce3b-3e3a-4674-8e31-b2e966f7be88', CAST(N'2025-01-31T23:11:02.043' AS DateTime), 1, 1213)
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1199, N'admin', N'adswp391@gmail.com', N'$2a$10$Kw1bXVeHV.LGz43OacSlOeelj970GviE8Hj9znxN8LqUMHCVqGkOm', N'Admin', N'male', N'0866046581', NULL, N'admin', N'active', CAST(N'2025-01-26T00:40:51.8233333' AS DateTime2), CAST(N'2025-01-27T16:43:39.2500000' AS DateTime2))
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1210, N'huy412004', N'huy412004@gmail.com', N'$2a$10$r5La2lBV1EKIw0DDANSvhu1cUGfUSFoShPLieGPeBMu.SYgG.PI/a', N'Nguyễn Huy', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJ9Ru_QdcSUo68k_cGG6qm2yYtRCKlLFxCIZz0WA3b3nVx7QNYY=s96-c', N'customer', N'active', CAST(N'2025-01-27T17:15:19.9300000' AS DateTime2), CAST(N'2025-01-27T17:15:19.9300000' AS DateTime2))
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1211, N'huytai2009', N'huytai2009@gmail.com', N'$2a$10$P1DdyvtPcgOhfCIC8hlB.uT0WjT0uu57Lp/DYvDNio7ZNt9Ahxqt2', N'Tài nguyễn', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJ4vlixggpcNgsb6vBxc0xCIKqzZBjTH_dN8cG_Zn2rVUNeahA=s96-c', N'customer', N'active', CAST(N'2025-01-27T17:25:51.4300000' AS DateTime2), CAST(N'2025-01-27T17:25:51.4300000' AS DateTime2))
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1213, N'huyy', N'huyndhe186775@fpt.edu.vn', N'$2a$10$ytAEagmxQTZdzCe.TOntl.t50ADTx9aHXdLxj7qYEXx1vS5B1z4HG', N'huy', N'male', N'0866046598', NULL, N'customer', N'active', CAST(N'2025-01-31T23:09:02.0300000' AS DateTime2), CAST(N'2025-01-31T23:09:19.4200000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__settings__0DFAC427524289EE]    Script Date: 2/5/2025 1:31:23 PM ******/
ALTER TABLE [dbo].[settings] ADD UNIQUE NONCLUSTERED 
(
	[setting_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164CCB18F3A]    Script Date: 2/5/2025 1:31:23 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572B530660F]    Script Date: 2/5/2025 1:31:23 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[customer_contact_history] ADD  DEFAULT ((0)) FOR [total_purchases]
GO
ALTER TABLE [dbo].[customer_contact_history] ADD  DEFAULT ((0)) FOR [total_spend]
GO
ALTER TABLE [dbo].[customer_contact_history] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[feedback] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[feedback] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[posts] ADD  DEFAULT ((0)) FOR [is_featured]
GO
ALTER TABLE [dbo].[posts] ADD  DEFAULT ('draft') FOR [status]
GO
ALTER TABLE [dbo].[posts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[posts] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[product_images] ADD  DEFAULT ((0)) FOR [display_order]
GO
ALTER TABLE [dbo].[product_variants] ADD  DEFAULT ((0)) FOR [stock_quantity]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [is_combo]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[settings] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[sliders] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[sliders] ADD  DEFAULT ((0)) FOR [display_order]
GO
ALTER TABLE [dbo].[user_addresses] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[customer_contact_history]  WITH CHECK ADD FOREIGN KEY([updated_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[customer_contact_history]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([order_item_id])
REFERENCES [dbo].[order_items] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([variant_id])
REFERENCES [dbo].[product_variants] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([sale_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[product_images]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_variants]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[tokenPassword]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[customer_contact_history]  WITH CHECK ADD CHECK  (([gender]='female' OR [gender]='male'))
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD CHECK  (([status]='rejected' OR [status]='approved' OR [status]='pending'))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([status]='cancelled' OR [status]='completed' OR [status]='shipped' OR [status]='processing' OR [status]='pending'))
GO
ALTER TABLE [dbo].[posts]  WITH CHECK ADD CHECK  (([status]='archived' OR [status]='published' OR [status]='draft'))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[settings]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[sliders]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([gender]='other' OR [gender]='female' OR [gender]='male'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='customer' OR [role]='marketing' OR [role]='sale' OR [role]='admin'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([status]='pending' OR [status]='inactive' OR [status]='active'))
GO
USE [master]
GO
ALTER DATABASE [clothing_shop] SET  READ_WRITE 
GO
