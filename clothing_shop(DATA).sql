USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'TheMoriarty', N'tphong610198@gmail.com', N'$2a$12$CuXL88lRV.caI3o.5ZB/wOM3mUPxEeVp7PnUYC9Tu6iefOfhTlfxO', N'Trần Phong', N'male', N'0123456789', N'uploads/avatars/bb5cb37c-fb96-4a04-a5d6-7bd5732bf5b0.jpg', N'customer', N'active', CAST(N'2025-02-09T16:58:16.1666667' AS DateTime2), CAST(N'2025-02-09T17:12:48.3000000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (2, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$mqTbeXOjwWftYcp3HvgbF.vynnSvUqQfBUY6wj7m7m/tiEnv/YYA6', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLrSqjCMqEhVL5SMILJ6OOpPyI5S64iKP29HhPEV9aIOgF0i-g=s96-c', N'customer', N'active', CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2), CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2))
GO
INSERT INTO [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at])
VALUES
(3, N'XiaoXunEr', N'XiaoXunEr@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Huân Nhi', N'female', N'0987654321', N'uploads/avatars/default.jpg', N'customer', N'active', GETDATE(), GETDATE()),
(4, N'YaoLao', N'YaoLao@gmail.com', N'$2a$10$CommonPasswordHash', N'Dược Lão', N'male', N'0912345678', N'uploads/avatars/default.jpg', N'marketing', N'active', GETDATE(), GETDATE()),
(5, N'XiaoYan', N'XiaoYan@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Viêm', N'male', N'0978123456', N'uploads/avatars/default.jpg', N'sale', N'pending', GETDATE(), GETDATE()),
(6, N'XiaoZhan', N'XiaoZhan@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Chiến', N'male', N'0934567890', N'uploads/avatars/default.jpg', N'customer', N'active', GETDATE(), GETDATE()),
(7, N'XiaoDing', N'XiaoDing@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Đỉnh', N'male', N'0956781234', N'uploads/avatars/default.jpg', N'sale', N'inactive', GETDATE(), GETDATE()),
(8, N'Medusa', N'Medusa@gmail.com', N'$2a$10$CommonPasswordHash', N'Mỹ Đỗ Toa', N'female', N'0923456789', N'uploads/avatars/default.jpg', N'marketing', N'active', GETDATE(), GETDATE()),
(9, N'CaiLin', N'CaiLin@gmail.com', N'$2a$10$CommonPasswordHash', N'Thái Lan', N'female', N'0965432109', N'uploads/avatars/default.jpg', N'customer', N'pending', GETDATE(), GETDATE()),
(10, N'HaiBoDong', N'HaiBoDong@gmail.com', N'$2a$10$CommonPasswordHash', N'Hải Ba Đông', N'male', N'0998765432', N'uploads/avatars/default.jpg', N'sale', N'active', GETDATE(), GETDATE()),
(11, N'NalanYanran', N'NalanYanran@gmail.com', N'$2a$10$CommonPasswordHash', N'Nalan Yên Nhiên', N'female', N'0943216789', N'uploads/avatars/default.jpg', N'marketing', N'inactive', GETDATE(), GETDATE()),
(12, N'GuYuan', N'GuYuan@gmail.com', N'$2a$10$CommonPasswordHash', N'Cổ Nguyên', N'male', N'0981234567', N'uploads/avatars/default.jpg', N'customer', N'active', GETDATE(), GETDATE()),
(13, N'GuXun', N'GuXun@gmail.com', N'$2a$10$CommonPasswordHash', N'Cổ Xán', N'male', N'0976543210', N'uploads/avatars/default.jpg', N'marketing', N'active', GETDATE(), GETDATE()),
(14, N'YunShan', N'YunShan@gmail.com', N'$2a$10$CommonPasswordHash', N'Vân Sơn', N'male', N'0919876543', N'uploads/avatars/default.jpg', N'sale', N'inactive', GETDATE(), GETDATE()),
(15, N'FaMa', N'FaMa@gmail.com', N'$2a$10$CommonPasswordHash', N'Pháp Mã', N'male', N'0921987654', N'uploads/avatars/default.jpg', N'customer', N'pending', GETDATE(), GETDATE()),
(16, N'HuJia', N'HuJia@gmail.com', N'$2a$10$CommonPasswordHash', N'Hồ Gia', N'female', N'0932198765', N'uploads/avatars/default.jpg', N'marketing', N'active', GETDATE(), GETDATE()),
(17, N'LingYing', N'LingYing@gmail.com', N'$2a$10$CommonPasswordHash', N'Lăng Ảnh', N'male', N'0954321987', N'uploads/avatars/default.jpg', N'customer', N'active', GETDATE(), GETDATE()),
(18, N'YanXiao', N'YanXiao@gmail.com', N'$2a$10$CommonPasswordHash', N'Diệp Hiên', N'male', N'0965432198', N'uploads/avatars/default.jpg', N'sale', N'active', GETDATE(), GETDATE()),
(19, N'QingLin', N'QingLin@gmail.com', N'$2a$10$CommonPasswordHash', N'Thanh Lân', N'female', N'0976543219', N'uploads/avatars/default.jpg', N'marketing', N'inactive', GETDATE(), GETDATE()),
(20, N'XiaoLei', N'XiaoLei@gmail.com', N'$2a$10$CommonPasswordHash', N'Tiêu Lôi', N'male', N'0987654329', N'uploads/avatars/default.jpg', N'customer', N'active', GETDATE(), GETDATE()),
(21, N'FengLei', N'FengLei@gmail.com', N'$2a$10$CommonPasswordHash', N'Phong Lôi', N'male', N'0998765431', N'uploads/avatars/default.jpg', N'sale', N'pending', GETDATE(), GETDATE()),
(22, N'ZiYan', N'ZiYan@gmail.com', N'$2a$10$CommonPasswordHash', N'Tử Nghiên', N'female', N'0909876543', N'uploads/avatars/default.jpg', N'marketing', N'active', GETDATE(), GETDATE());

GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (2, N'dfe99b7b-3adc-4263-b819-ebca71ff6b2a', CAST(N'2025-02-09T17:41:58.857' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO