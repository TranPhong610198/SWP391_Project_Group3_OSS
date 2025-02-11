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
(1, N'Xu hướng thời trang mùa xuân 2025', 
    N'https://mcdn.coolmate.me/image/December2022/xu-huong-thoi-trang-xuan-he-2023-805_866.jpg',
    
    N'Khám phá xu hướng thời trang hot nhất cho mùa xuân năm 2025',
    N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững. Mùa này mang đến góc nhìn mới mẻ về phong cách cổ điển với sự nhấn mạnh vào vật liệu thân thiện với môi trường và những món đồ đa năng có thể tạo kiểu theo nhiều cách. Các xu hướng chính bao gồm chủ nghĩa tối giản màu pastel, áo khoác oversize và denim bền vững.',
    4,
    1,
    'published',
    CAST(N'2024-01-15T10:00:00' AS DateTime2),
    CAST(N'2024-01-15T10:00:00' AS DateTime2)),
(2, N'Làm thế nào để xây dựng một tủ quần áo con nhộng',
    N'https://songxanhsongkhoe.vn/wp-content/uploads/2020/11/co-gai-dung-truoc-tu-quan-an-va-sap-xep-tu-do-con-nhong-1-1024x683.jpg',
    
    N'Hướng dẫn thiết yếu để tạo ra một tủ quần áo đa năng',
    N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai muốn giảm thiểu quần áo trong khi vẫn tối đa hóa các lựa chọn về phong cách. Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách lựa chọn những món đồ thiết yếu, phối hợp màu sắc và chuyển mùa.',
    4,
    1,
    'published',
    CAST(N'2024-01-20T14:30:00' AS DateTime2),
    CAST(N'2024-01-20T14:30:00' AS DateTime2)),
(3, N'Thời trang bền vững: Hướng dẫn đầy đủ',
    N'https://tse1.mm.bing.net/th?id=OIP.jBJ4gAN070RxCwsuzGaMZAHaFF&pid=Api&P=0&h=180',
    
    N'Mọi thứ bạn cần biết về thời trang bền vững',
    N'Thời trang bền vững không chỉ là một xu hướng - mà còn là điều cần thiết cho tương lai của hành tinh chúng ta. Tìm hiểu về vật liệu thân thiện với môi trường, quy trình sản xuất có đạo đức và cách đưa ra những lựa chọn bền vững hơn khi mua thời trang.',
    4,
    0,
    'published',
    CAST(N'2024-01-25T09:15:00' AS DateTime2),
    CAST(N'2024-01-25T09:15:00' AS DateTime2)),
(4, N'Xu hướng màu sắc cho mùa hè năm 2025',
    N'https://cdn.vuahanghieu.com/unsafe/1200x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/2021/10/15-xu-huong-mau-sac-thoi-trang-trend-mua-thu-dong-2021-06102021134538.jpg',
    
    N'Khám phá bảng màu rực rỡ của mùa hè năm 2025',
    N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ của phong cách cổ điển trong thời trang, khi các xu hướng từ thập kỷ trước được tái hiện với những biến tấu hiện đại, tạo nên sự giao thoa độc đáo giữa quá khứ và hiện tại. Bên cạnh đó, bảng màu của mùa hè năm nay cũng vô cùng rực rỡ và đa dạng, phản ánh sự kết nối giữa con người và thiên nhiên. Những gam màu nổi bật bao gồm Future Dusk – sắc xanh lam đậm đầy bí ẩn, Transcendent Pink – hồng nhẹ nhàng thể hiện sự tinh tế, Aquatic Awe – xanh ngọc bích tươi mát như đại dương, Sunset Coral – cam san hô ấm áp như ánh hoàng hôn, và Ray Flower – vàng rực rỡ tràn đầy năng lượng. Sự kết hợp giữa phong cách cổ điển và bảng màu ấn tượng này không chỉ tạo nên những bộ trang phục vừa hoài cổ vừa hiện đại mà còn mang đến cảm giác tin cậy, ổn định trong một thế giới đang không ngừng thay đổi.',
    4,
    1,
    'published',
    CAST(N'2024-02-01T11:45:00' AS DateTime2),
    CAST(N'2024-02-01T11:45:00' AS DateTime2)),
(5, N'Phụ kiện 101: Hướng dẫn đầy đủ',
    N'https://cf.shopee.vn/file/b849b807196691d47472df6073839200',
    
    N'Làm chủ nghệ thuật phối phụ kiện cho trang phục của bạn',
    N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc lựa chọn đồ trang sức phù hợp đến việc lựa chọn túi xách và giày dép phù hợp với trang phục của bạn. Hướng dẫn toàn diện này bao gồm mọi thứ từ những dịp bình thường đến trang trọng.',
    4,
    0,
    'draft',
    CAST(N'2024-02-05T16:20:00' AS DateTime2),
    CAST(N'2024-02-05T16:20:00' AS DateTime2)),

	(6, N'Kỹ thuật xếp lớp cho mùa đông', 
    N'http://fashionnet.vn/public/uploads/images/2(128).jpg',
    
    N'Làm chủ nghệ thuật phối đồ nhiều lớp thời trang cho mùa đông',
    N'Tìm hiểu cách kết hợp các kết cấu và mảnh ghép khác nhau để tạo nên những bộ trang phục mùa đông ấm áp và thời trang. Từ lớp lót giữ nhiệt đến áo khoác nổi bật, chúng tôi sẽ chia nhỏ các kỹ thuật thiết yếu để luôn sang trọng và thoải mái.',
    4,
    1,
    'published',
    CAST(N'2024-02-10T10:00:00' AS DateTime2),
    CAST(N'2024-02-10T10:00:00' AS DateTime2)),

(7, N'Những cải tiến về vải thân thiện với môi trường', 
    N'https://dongphucthanhhung.vn/wp-content/uploads/2023/05/vai-than-thien-voi-moi-truong.jpg',
    
    N'Khám phá công nghệ vải bền vững mang tính đột phá',
    N'Những cải tiến về vải thân thiện với môi trường đang trở thành xu hướng quan trọng trong ngành thời trang bền vững. Các chất liệu như sợi tre, vải từ tảo biển, sợi dứa Piñatex hay polyester tái chế (rPET) không chỉ giúp giảm tác động tiêu cực đến môi trường mà còn mang lại sự thoải mái và bền bỉ cho người sử dụng. Bên cạnh đó, công nghệ sản xuất hiện đại đã giúp tối ưu hóa quy trình dệt may, giảm đáng kể lượng nước, hóa chất và rác thải. Những thay đổi này không chỉ hướng tới việc bảo vệ hành tinh mà còn mở ra một tương lai bền vững hơn cho ngành công nghiệp thời trang.',
    4,
    0,
    'published',
    CAST(N'2024-02-15T14:30:00' AS DateTime2),
    CAST(N'2024-02-15T14:30:00' AS DateTime2)),

(8, N'Những vật dụng thiết yếu cho tủ đồ tối giản', 
    N'https://noithatminhkhoi.com/upload/images/xay-dung-tu-quan-ao-toi-gian-cho-nam-gioi-04.jpg',
    
    N'Tạo một tủ quần áo đa năng với ít món đồ hơn',
    N'Một tủ đồ tối giản không cần quá nhiều món đồ nhưng vẫn đảm bảo tính linh hoạt và phong cách. Những vật dụng thiết yếu như áo sơ mi trắng, áo thun trơn, quần jeans tối màu hay blazer giúp bạn dễ dàng phối hợp trang phục cho nhiều dịp khác nhau. Bên cạnh đó, một đôi giày thể thao thoải mái và giày da thanh lịch sẽ giúp bạn luôn sẵn sàng cho cả ngày thường lẫn sự kiện quan trọng. Kết hợp với túi xách đa năng và một vài phụ kiện tinh tế, tủ đồ tối giản không chỉ giúp tiết kiệm thời gian mà còn tạo nên vẻ ngoài hiện đại, tinh tế và không bao giờ lỗi mốt.',
    4,
    1,
    'published',
    CAST(N'2024-02-20T09:15:00' AS DateTime2),
    CAST(N'2024-02-20T09:15:00' AS DateTime2)),

(9, N'Sự hồi sinh của thời trang cổ điển', 
    N'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg',
    
    N'Phong cách cổ điển đang quay trở lại như thế nào?',
    N'Phong cách cổ điển đang quay trở lại mạnh mẽ trong nhiều lĩnh vực như thời trang, nội thất, thiết kế đồ họa và nghệ thuật. Xu hướng này không chỉ đơn thuần là việc tái hiện lại quá khứ mà còn là sự kết hợp giữa nét đẹp truyền thống với yếu tố hiện đại, tạo ra một phong cách tân cổ điển (Neo-Classic) đầy tinh tế.',
    1,
    0,
    'published',
    CAST(N'2024-02-25T11:45:00' AS DateTime2),
    CAST(N'2024-02-25T11:45:00' AS DateTime2)),

(10, N'Quần áo tích hợp công nghệ', 
    N'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg',
    
    N'Tương lai của thời trang gặp gỡ công nghệ',
    N'Quần áo tích hợp công nghệ đang trở thành xu hướng mới trong ngành thời trang, mang lại sự tiện lợi và trải nghiệm hiện đại cho người dùng. Từ áo khoác có khả năng tự điều chỉnh nhiệt độ, vải chống thấm nước nhưng vẫn thoáng khí, đến quần áo thể thao có cảm biến theo dõi sức khỏe, công nghệ đang thay đổi cách chúng ta mặc và sử dụng trang phục hàng ngày. Ngoài ra, các chất liệu thông minh như vải dẫn điện, vải đổi màu theo môi trường hay trang phục có thể kết nối với thiết bị di động đang mở ra một kỷ nguyên mới cho thời trang ứng dụng. Với sự kết hợp giữa thẩm mỹ và công nghệ, quần áo thông minh không chỉ đáp ứng nhu cầu tiện nghi mà còn giúp nâng cao chất lượng cuộc sống.',
    4,
    1,
    'published',
    CAST(N'2024-03-01T16:20:00' AS DateTime2),
    CAST(N'2024-03-01T16:20:00' AS DateTime2)),

(11, N'Mẹo thời trang tiết kiệm', 
    N'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg',
    
    N'Trông tuyệt vời mà không tốn kém',
    N'Thời trang tiết kiệm không có nghĩa là phải từ bỏ phong cách, mà ngược lại, bạn có thể vẫn sành điệu mà không tốn quá nhiều chi phí. Trước tiên, hãy đầu tư vào những món đồ cơ bản và dễ phối như áo sơ mi trắng, quần jeans và blazer – những item không bao giờ lỗi mốt. Thứ hai, săn sale thông minh bằng cách theo dõi các đợt giảm giá lớn hoặc mua sắm tại các cửa hàng second-hand, nơi bạn có thể tìm được nhiều món đồ độc đáo với giá rẻ. Ngoài ra, học cách mix & match giúp bạn tận dụng tối đa tủ đồ mà không cần mua sắm liên tục. Cuối cùng, bảo quản quần áo đúng cách sẽ giúp chúng bền hơn, giúp bạn tiết kiệm chi phí thay thế. Với những mẹo này, bạn hoàn toàn có thể xây dựng phong cách riêng mà không cần tiêu tốn quá nhiều tiền.',
    4,
    0,
    'published',
    CAST(N'2024-03-05T10:00:00' AS DateTime2),
    CAST(N'2024-03-05T10:00:00' AS DateTime2)),

(12, N'Ảnh hưởng của văn hóa trong thời trang', 
    N'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg',
    
    N'Xu hướng thời trang toàn cầu và nguồn cảm hứng văn hóa',
    N'Văn hóa ảnh hưởng sâu sắc đến thời trang, từ trang phục truyền thống đến xu hướng hiện đại. Mỗi nền văn hóa mang đến những màu sắc, họa tiết và kiểu dáng đặc trưng, giúp định hình phong cách thời trang đa dạng. Bên cạnh đó, âm nhạc, nghệ thuật và phong trào xã hội cũng góp phần tạo ra những xu hướng mới. Sự giao thoa giữa các nền văn hóa trong thời đại toàn cầu hóa giúp thời trang ngày càng phong phú, kết hợp giữa truyền thống và hiện đại, góp phần lan tỏa giá trị văn hóa trên toàn thế giới.',
    4,
    1,
    'published',
    CAST(N'2024-03-10T14:30:00' AS DateTime2),
    CAST(N'2024-03-10T14:30:00' AS DateTime2)),

(13, N'Thiết kế giày bền vững', 
    N'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg',
    
    N'Những cách tiếp cận sáng tạo đối với giày dép thân thiện với môi trường',
    N'Thiết kế giày bền vững đang trở thành xu hướng quan trọng trong ngành thời trang, hướng đến việc giảm thiểu tác động tiêu cực đến môi trường. Các thương hiệu ngày càng chú trọng sử dụng vật liệu tái chế, hữu cơ hoặc có khả năng phân hủy sinh học như da thực vật, nhựa tái chế và cao su tự nhiên. Bên cạnh đó, quy trình sản xuất cũng được tối ưu hóa để tiết kiệm năng lượng và giảm lượng khí thải. Không chỉ thân thiện với môi trường, giày bền vững còn được thiết kế để đảm bảo độ bền cao, giúp người tiêu dùng sử dụng lâu dài và hạn chế rác thải thời trang.',
    4,
    0,
    'published',
    CAST(N'2024-03-15T09:15:00' AS DateTime2),
    CAST(N'2024-03-15T09:15:00' AS DateTime2)),

(14, N'Xu hướng nhiếp ảnh thời trang', 
    N'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8',
    
    N'Sự phát triển của nghệ thuật hình ảnh thời trang',
    N'Xu hướng nhiếp ảnh thời trang đang không ngừng thay đổi, phản ánh sự kết hợp giữa nghệ thuật, công nghệ và văn hóa đương đại. Những phong cách hoài cổ như film photography đang quay trở lại, mang đến cảm giác chân thực và giàu cảm xúc. Bên cạnh đó, nhiếp ảnh thời trang hiện đại còn ứng dụng AI và công nghệ CGI để tạo ra những bộ ảnh mang đậm tính sáng tạo và siêu thực. Xu hướng "street style photography" cũng tiếp tục được ưa chuộng, tập trung vào sự tự nhiên và phong cách cá nhân. Ngoài ra, việc đề cao tính bền vững trong nhiếp ảnh thời trang ngày càng phổ biến, với các chiến dịch quảng cáo ưu tiên sử dụng ánh sáng tự nhiên và hạn chế tác động đến môi trường.',
    4,
    1,
    'draft',
    CAST(N'2024-03-20T11:45:00' AS DateTime2),
    CAST(N'2024-03-20T11:45:00' AS DateTime2)),

(15, N'Phát triển phong cách cá nhân', 
    N'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg',
    
    N'Khám phá và phát triển bản sắc thời trang độc đáo của bạn',
    N'Phát triển phong cách cá nhân là một quá trình khám phá và thể hiện bản thân thông qua thời trang. Thay vì chạy theo xu hướng, hãy tìm ra những trang phục, màu sắc và kiểu dáng phù hợp với cá tính và lối sống của bạn. Việc hiểu rõ vóc dáng, sở thích và cảm hứng từ các nền văn hóa khác nhau sẽ giúp bạn xây dựng một phong cách độc đáo. Ngoài ra, đầu tư vào những món đồ cơ bản nhưng chất lượng, kết hợp với phụ kiện tinh tế, cũng là cách để tạo dấu ấn riêng. Quan trọng nhất, phong cách cá nhân không chỉ nằm ở trang phục mà còn thể hiện qua sự tự tin và cách bạn thể hiện bản thân mỗi ngày.',
    4,
    0,
    'published',
    CAST(N'2024-03-25T16:20:00' AS DateTime2),
    CAST(N'2024-03-25T16:20:00' AS DateTime2)),

(16, N'Thương hiệu thời trang đạo đức', 
    N'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png',
    
    N'Các thương hiệu hàng đầu tạo ra tác động tích cực',
    N'Thương hiệu thời trang đạo đức đang ngày càng thu hút sự quan tâm khi người tiêu dùng chú trọng hơn đến tính bền vững và trách nhiệm xã hội. Các thương hiệu này cam kết sử dụng nguyên liệu thân thiện với môi trường, quy trình sản xuất công bằng và đảm bảo điều kiện làm việc tốt cho người lao động. Họ thường áp dụng mô hình sản xuất minh bạch, sử dụng chất liệu hữu cơ, tái chế hoặc công nghệ tiên tiến để giảm thiểu tác động tiêu cực đến môi trường. Việc ủng hộ các thương hiệu này không chỉ giúp bảo vệ hành tinh mà còn góp phần thúc đẩy sự công bằng trong ngành thời trang.',
    4,
    1,
    'published',
    CAST(N'2024-03-30T10:00:00' AS DateTime2),
    CAST(N'2024-03-30T10:00:00' AS DateTime2)),

(17, N'Thời trang kỹ thuật số và Metaverse', 
    N'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png',
    
    N'Thời trang trong thế giới kỹ thuật số và ảo',
    N'Thời trang kỹ thuật số và Metaverse đang mở ra một kỷ nguyên mới, nơi quần áo không chỉ tồn tại trong thế giới thực mà còn hiện diện trong không gian ảo. Các thương hiệu lớn và nhà thiết kế đang phát triển trang phục kỹ thuật số, cho phép người dùng mua, mặc và trưng bày chúng trên các nền tảng Metaverse hoặc mạng xã hội. Công nghệ blockchain và NFT giúp xác thực quyền sở hữu của những món đồ này, tạo ra một thị trường mới đầy tiềm năng. Với sự phát triển của thực tế ảo (VR) và thực tế tăng cường (AR), thời trang không còn bị giới hạn bởi chất liệu vật lý mà có thể biến đổi linh hoạt theo môi trường số, mở ra cơ hội sáng tạo vô tận cho cả người tiêu dùng lẫn ngành công nghiệp thời trang.',
    4,
    0,
    'draft',
    CAST(N'2024-04-05T14:30:00' AS DateTime2),
    CAST(N'2024-04-05T14:30:00' AS DateTime2)),

(18, N'Cách mạng thời trang thích ứng', 
    N'https://file.hstatic.net/200000775589/article/hippie-style_cd4cf3dfcf234ac7aa46653dd6b140cc.jpg',
    
    N'Thiết kế toàn diện cho mọi vóc dáng và khả năng',
    N'Cách mạng thời trang thích ứng đang thay đổi cách chúng ta tiếp cận quần áo, tập trung vào tính linh hoạt, đa năng và bền vững. Các thiết kế ngày nay không chỉ đáp ứng nhu cầu thẩm mỹ mà còn có khả năng thích nghi với môi trường và lối sống của người mặc. Từ vải co giãn đa chiều, quần áo biến đổi theo thời tiết đến trang phục công nghệ cao giúp điều chỉnh nhiệt độ cơ thể, tất cả đều hướng đến sự tiện lợi và tối ưu hóa trải nghiệm cá nhân. Bên cạnh đó, các thương hiệu cũng đẩy mạnh sản xuất theo mô hình thời trang bền vững, sử dụng vật liệu tái chế và công nghệ thân thiện với môi trường. Đây không chỉ là một xu hướng mà còn là một cuộc cách mạng thay đổi cách chúng ta mặc và tiêu dùng thời trang.',
    4,
    1,
    'published',
    CAST(N'2024-04-10T09:15:00' AS DateTime2),
    CAST(N'2024-04-10T09:15:00' AS DateTime2));
SET IDENTITY_INSERT [dbo].[posts] OFF