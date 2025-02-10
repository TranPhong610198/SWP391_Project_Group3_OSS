USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'TheMoriarty', N'tphong610198@gmail.com', N'$2a$12$CuXL88lRV.caI3o.5ZB/wOM3mUPxEeVp7PnUYC9Tu6iefOfhTlfxO', N'Trần Phong', N'male', N'0123456789', N'uploads/avatars/bb5cb37c-fb96-4a04-a5d6-7bd5732bf5b0.jpg', N'admin', N'active', CAST(N'2025-02-09T16:58:16.1666667' AS DateTime2), CAST(N'2025-02-09T17:12:48.3000000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (2, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$mqTbeXOjwWftYcp3HvgbF.vynnSvUqQfBUY6wj7m7m/tiEnv/YYA6', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLrSqjCMqEhVL5SMILJ6OOpPyI5S64iKP29HhPEV9aIOgF0i-g=s96-c', N'customer', N'active', CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2), CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (3, N'XiaoXunEr', N'XiaoXunEr@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Huân Nhi', N'female', N'0987654321', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (4, N'YaoLao', N'YaoLao@gmail.com', N'$2a$10$CommonPasswordHash', N'Dược Lão', N'male', N'0912345678', N'uploads/avatars/default.jpg', N'marketing', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (5, N'XiaoYan', N'XiaoYan@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Viêm', N'male', N'0978123456', N'uploads/avatars/default.jpg', N'sale', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (6, N'XiaoZhan', N'XiaoZhan@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Chiến', N'male', N'0934567890', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (7, N'XiaoDing', N'XiaoDing@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Đỉnh', N'male', N'0956781234', N'uploads/avatars/default.jpg', N'sale', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (8, N'Medusa', N'Medusa@gmail.com', N'$2a$10$CommonPasswordHash', N'Mỹ Đỗ Toa', N'female', N'0923456789', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (9, N'CaiLin', N'CaiLin@gmail.com', N'$2a$10$CommonPasswordHash', N'Thái Lan', N'female', N'0965432109', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (10, N'HaiBoDong', N'HaiBoDong@gmail.com', N'$2a$10$CommonPasswordHash', N'Hải Ba Đông', N'male', N'0998765432', N'uploads/avatars/default.jpg', N'sale', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (11, N'NalanYanran', N'NalanYanran@gmail.com', N'$2a$10$CommonPasswordHash', N'Nalan Yên Nhiên', N'female', N'0943216789', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (12, N'GuYuan', N'GuYuan@gmail.com', N'$2a$10$CommonPasswordHash', N'Cổ Nguyên', N'male', N'0981234567', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (13, N'GuXun', N'GuXun@gmail.com', N'$2a$10$CommonPasswordHash', N'Cổ Xán', N'male', N'0976543210', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (14, N'YunShan', N'YunShan@gmail.com', N'$2a$10$CommonPasswordHash', N'Vân Sơn', N'male', N'0919876543', N'uploads/avatars/default.jpg', N'sale', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (15, N'FaMa', N'FaMa@gmail.com', N'$2a$10$CommonPasswordHash', N'Pháp Mã', N'male', N'0921987654', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (16, N'HuJia', N'HuJia@gmail.com', N'$2a$10$CommonPasswordHash', N'Hồ Gia', N'female', N'0932198765', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (17, N'LingYing', N'LingYing@gmail.com', N'$2a$10$CommonPasswordHash', N'Lăng Ảnh', N'male', N'0954321987', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (18, N'YanXiao', N'YanXiao@gmail.com', N'$2a$10$CommonPasswordHash', N'Diệp Hiên', N'male', N'0965432198', N'uploads/avatars/default.jpg', N'sale', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (19, N'QingLin', N'QingLin@gmail.com', N'$2a$10$CommonPasswordHash', N'Thanh Lân', N'female', N'0976543219', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (20, N'XiaoLei', N'XiaoLei@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Lôi', N'male', N'0987654329', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (21, N'FengLei', N'FengLei@gmail.com', N'$2a$10$CommonPasswordHash', N'Phong Lôi', N'male', N'0998765431', N'uploads/avatars/default.jpg', N'sale', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (22, N'ZiYan', N'ZiYan@gmail.com', N'$2a$10$CommonPasswordHash', N'Tử Nghiên', N'female', N'0909876543', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name], [description], [status]) VALUES (1, N'Quần áo nam', N'Các loại quần áo cho nam như áo sơ mi, quần tây, vest', N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [status]) VALUES (2, N'Quần áo nữ', N'Các loại quần áo cho nữ như váy, áo kiểu và chân váy', N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [status]) VALUES (3, N'Quần áo trẻ em', N'Quần áo cho trẻ em như áo thun, quần short và đầm', N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [status]) VALUES (4, N'Phụ kiện', N'Các phụ kiện thời trang như túi xách, thắt lưng và khăn quàng cổ', N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [status]) VALUES (5, N'Giày dép', N'Giày dép cho mọi độ tuổi và giới tính', N'active')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (1, N'Áo sơ mi trắng', 1, N'Áo sơ mi trắng phong cách, phù hợp với mọi dịp', CAST(200000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'ao_so_mi_trang.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (2, N'Quần tây đen', 1, N'Quần tây màu đen lịch lãm, phù hợp cho công sở', CAST(300000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'quan_tay_den.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (3, N'Đầm hoa mùa hè', 2, N'Đầm hoa nhẹ nhàng, thoải mái, phù hợp cho mùa hè', CAST(400000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'dam_hoa_mua_he.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (4, N'Chân váy denim', 2, N'Chân váy denim thời trang, dễ phối đồ', CAST(250000.00 AS Decimal(10, 2)), CAST(220000.00 AS Decimal(10, 2)), N'chan_vay_denim.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (5, N'Áo thun siêu nhân', 3, N'Áo thun với họa tiết siêu nhân, dành cho trẻ em', CAST(150000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'ao_thun_sieu_nhan.jpg', N'active', 1, N'1', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (6, N'Quần short cotton', 3, N'Quần short cotton mềm mại, thoáng mát', CAST(120000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), N'quan_short_cotton.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (7, N'Thắt lưng da', 4, N'Thắt lưng da cao cấp, bền đẹp theo thời gian', CAST(200000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'that_lung_da.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (8, N'Khăn lụa', 4, N'Khăn lụa sang trọng, họa tiết đa dạng', CAST(150000.00 AS Decimal(10, 2)), CAST(130000.00 AS Decimal(10, 2)), N'khan_lua.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (9, N'Giày thể thao', 5, N'Giày thể thao nhẹ nhàng, phù hợp cho cả nam và nữ', CAST(500000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), N'giay_the_thao.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (10, N'Giày sneaker', 5, N'Giày sneaker thời trang, phù hợp cho đi chơi', CAST(400000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'giay_sneaker.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (11, N'Quần short siêu nhân', 3, N'Quần short với họa tiết siêu nhân, dành cho trẻ em', CAST(550000.00 AS Decimal(10, 2)), CAST(480000.00 AS Decimal(10, 2)), N'combo_quan_ao_mua_he.jpg', N'active', 1, N'1', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (12, N'Áo so mi xanh', 1, N'Áo sơ mi xanh phong cách, phù hợp với mọi dịp', CAST(200000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'ao_so_mi_trang.jpg', N'active', 0, NULL, CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2), CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (2, N'dfe99b7b-3adc-4263-b819-ebca71ff6b2a', CAST(N'2025-02-09T17:41:58.857' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO


USE [clothing_shop]
GO
-- First ensure we have some categories for the posts

-- Insert posts data
SET IDENTITY_INSERT [dbo].[posts] ON
INSERT INTO [dbo].[posts] 
([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at])
VALUES
(1, N'Spring Fashion Trends 2025', 
    N'uploads/posts/spring-2025.jpg',
    
    N'Discover the hottest fashion trends for Spring 2025',
    N'Spring 2025 is all about bold colors and sustainable fashion. This season brings a fresh perspective on classic styles with an emphasis on eco-friendly materials and versatile pieces that can be styled multiple ways. Key trends include pastel minimalism, oversized blazers, and sustainable denim.',
    4,
    1,
    'published',
    CAST(N'2025-01-15T10:00:00' AS DateTime2),
    CAST(N'2025-01-15T10:00:00' AS DateTime2)),
(2, N'How to Build a Capsule Wardrobe',
    N'uploads/posts/capsule-wardrobe.jpg',
    
    N'Essential guide to creating a versatile capsule wardrobe',
    N'A capsule wardrobe is the perfect solution for those looking to minimize their clothing while maximizing style options. This comprehensive guide walks you through selecting essential pieces, color coordination, and seasonal transitions.',
    4,
    1,
    'published',
    CAST(N'2025-01-20T14:30:00' AS DateTime2),
    CAST(N'2025-01-20T14:30:00' AS DateTime2)),
(3, N'Sustainable Fashion: A Complete Guide',
    N'uploads/posts/sustainable-fashion.jpg',
    
    N'Everything you need to know about sustainable fashion',
    N'Sustainable fashion is more than just a trend - it''s a necessity for our planet''s future. Learn about eco-friendly materials, ethical manufacturing processes, and how to make more sustainable choices in your fashion purchases.',
    4,
    0,
    'published',
    CAST(N'2025-01-25T09:15:00' AS DateTime2),
    CAST(N'2025-01-25T09:15:00' AS DateTime2)),
(4, N'Color Trends for Summer 2025',
    N'uploads/posts/summer-colors.jpg',
    
    N'Explore the vibrant color palette of Summer 2025',
    N'This summer''s color palette is all about expression and joy. From electric blues to sunset oranges, discover how to incorporate these trending colors into your wardrobe and make a statement.',
    4,
    1,
    'published',
    CAST(N'2025-02-01T11:45:00' AS DateTime2),
    CAST(N'2025-02-01T11:45:00' AS DateTime2)),
(5, N'Accessorizing 101: Complete Guide',
    N'uploads/posts/accessories-guide.jpg',
    
    N'Master the art of accessorizing your outfits',
    N'Learn the fundamental principles of accessorizing, from selecting the right jewelry to choosing bags and shoes that complement your outfit. This comprehensive guide covers everything from casual to formal occasions.',
    4,
    0,
    'draft',
    CAST(N'2025-02-05T16:20:00' AS DateTime2),
    CAST(N'2025-02-05T16:20:00' AS DateTime2)),

	(6, N'Layering Techniques for Winter', 
    N'uploads/posts/winter-layering.jpg',
    
    N'Master the art of stylish winter layering',
    N'Learn how to combine different textures and pieces to create warm, fashionable winter outfits. From thermal base layers to statement coats, we break down the essential techniques for staying chic and comfortable.',
    4,
    1,
    'published',
    CAST(N'2025-02-10T10:00:00' AS DateTime2),
    CAST(N'2025-02-10T10:00:00' AS DateTime2)),

(7, N'Eco-Friendly Fabric Innovations', 
    N'uploads/posts/eco-fabrics.jpg',
    
    N'Discover groundbreaking sustainable fabric technologies',
    N'From recycled ocean plastics to lab-grown textiles, explore the cutting-edge materials revolutionizing the fashion industry and reducing environmental impact.',
    4,
    0,
    'published',
    CAST(N'2025-02-15T14:30:00' AS DateTime2),
    CAST(N'2025-02-15T14:30:00' AS DateTime2)),

(8, N'Minimalist Wardrobe Essentials', 
    N'uploads/posts/minimalist-wardrobe.jpg',
    
    N'Create a versatile wardrobe with fewer pieces',
    N'Learn how to build a functional minimalist wardrobe that combines style, practicality, and personal expression. Our guide covers selecting timeless pieces that mix and match effortlessly.',
    4,
    1,
    'published',
    CAST(N'2025-02-20T09:15:00' AS DateTime2),
    CAST(N'2025-02-20T09:15:00' AS DateTime2)),

(9, N'Vintage Fashion Revival', 
    N'uploads/posts/vintage-fashion.jpg',
    
    N'How vintage styles are making a comeback',
    N'Explore the resurgence of vintage fashion trends and how modern designers are reinterpreting classic looks from different decades.',
    4,
    0,
    'published',
    CAST(N'2025-02-25T11:45:00' AS DateTime2),
    CAST(N'2025-02-25T11:45:00' AS DateTime2)),

(10, N'Tech-Integrated Clothing', 
    N'uploads/posts/tech-fashion.jpg',
    
    N'The future of fashion meets technology',
    N'Discover how smart textiles, wearable tech, and innovative design are transforming the clothing industry, from self-heating jackets to fitness-tracking apparel.',
    4,
    1,
    'published',
    CAST(N'2025-03-01T16:20:00' AS DateTime2),
    CAST(N'2025-03-01T16:20:00' AS DateTime2)),

(11, N'Budget-Friendly Fashion Hacks', 
    N'uploads/posts/budget-fashion.jpg',
    
    N'Look great without breaking the bank',
    N'Expert tips on creating stylish outfits on a budget, including thrifting strategies, versatile piece selection, and smart shopping techniques.',
    4,
    0,
    'published',
    CAST(N'2025-03-05T10:00:00' AS DateTime2),
    CAST(N'2025-03-05T10:00:00' AS DateTime2)),

(12, N'Cultural Influences in Fashion', 
    N'uploads/posts/cultural-fashion.jpg',
    
    N'Global fashion trends and cultural inspirations',
    N'An exploration of how different cultures influence global fashion trends, highlighting unique design elements and traditional textile techniques.',
    4,
    1,
    'published',
    CAST(N'2025-03-10T14:30:00' AS DateTime2),
    CAST(N'2025-03-10T14:30:00' AS DateTime2)),

(13, N'Sustainable Shoe Design', 
    N'uploads/posts/sustainable-shoes.jpg',
    
    N'Innovative approaches to eco-friendly footwear',
    N'Dive into the world of sustainable shoe design, featuring brands that are reimagining footwear using recycled materials, ethical production, and innovative manufacturing techniques.',
    4,
    0,
    'published',
    CAST(N'2025-03-15T09:15:00' AS DateTime2),
    CAST(N'2025-03-15T09:15:00' AS DateTime2)),

(14, N'Fashion Photography Trends', 
    N'uploads/posts/fashion-photography.jpg',
    
    N'The evolving art of fashion imagery',
    N'Explore the latest trends in fashion photography, from digital manipulation to inclusive representation and storytelling through visual media.',
    4,
    1,
    'draft',
    CAST(N'2025-03-20T11:45:00' AS DateTime2),
    CAST(N'2025-03-20T11:45:00' AS DateTime2)),

(15, N'Personal Style Development', 
    N'uploads/posts/personal-style.jpg',
    
    N'Discover and develop your unique fashion identity',
    N'A comprehensive guide to understanding your personal style, including body type analysis, color theory, and building a wardrobe that reflects your personality.',
    4,
    0,
    'published',
    CAST(N'2025-03-25T16:20:00' AS DateTime2),
    CAST(N'2025-03-25T16:20:00' AS DateTime2)),

(16, N'Ethical Fashion Brands', 
    N'uploads/posts/ethical-brands.jpg',
    
    N'Leading brands making a positive impact',
    N'Spotlight on fashion brands committed to sustainable practices, fair labor, and environmental responsibility. Learn how your fashion choices can make a difference.',
    4,
    1,
    'published',
    CAST(N'2025-03-30T10:00:00' AS DateTime2),
    CAST(N'2025-03-30T10:00:00' AS DateTime2)),

(17, N'Digital Fashion and Metaverse', 
    N'uploads/posts/digital-fashion.jpg',
    
    N'Fashion in the digital and virtual world',
    N'Exploring the emerging trends of digital fashion, virtual clothing, and how the metaverse is changing our perception of style and personal expression.',
    4,
    0,
    'draft',
    CAST(N'2025-04-05T14:30:00' AS DateTime2),
    CAST(N'2025-04-05T14:30:00' AS DateTime2)),

(18, N'Adaptive Fashion Revolution', 
    N'uploads/posts/adaptive-fashion.jpg',
    
    N'Inclusive design for all body types and abilities',
    N'A deep dive into adaptive fashion, highlighting designers and brands creating clothing that is both stylish and functional for people with diverse physical needs.',
    4,
    1,
    'published',
    CAST(N'2025-04-10T09:15:00' AS DateTime2),
    CAST(N'2025-04-10T09:15:00' AS DateTime2));
SET IDENTITY_INSERT [dbo].[posts] OFF