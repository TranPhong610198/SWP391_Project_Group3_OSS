﻿
USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'TheMoriarty', N'tphong610198@gmail.com', N'$2a$12$CuXL88lRV.caI3o.5ZB/wOM3mUPxEeVp7PnUYC9Tu6iefOfhTlfxO', N'Trần Phong', N'male', N'0123456789', N'uploads/avatars/bb5cb37c-fb96-4a04-a5d6-7bd5732bf5b0.jpg', N'admin', N'active', CAST(N'2025-02-09T16:58:16.1666667' AS DateTime2), CAST(N'2025-02-09T17:12:48.3000000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (2, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$mqTbeXOjwWftYcp3HvgbF.vynnSvUqQfBUY6wj7m7m/tiEnv/YYA6', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLrSqjCMqEhVL5SMILJ6OOpPyI5S64iKP29HhPEV9aIOgF0i-g=s96-c', N'customer', N'active', CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2), CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (3, N'XiaoXunEr', N'XiaoXunEr@gmail.com', N'$2a$10$sYcqeKA5lzaWHHEHojLoxe378EtZni5873xBA8YfljCthxCADhmoy', N'Tiêu Huân Nhi', N'female', N'0987654321', N'uploads/avatars/huannhi.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (4, N'YaoLao', N'YaoLao@gmail.com', N'$2a$10$XFl8Zk5zSXQo/PjN4df.k.twXuumSIvYM7jLRqVcvx2heTFVyW0Ca', N'Dược Lão', N'male', N'0912345678', N'uploads/avatars/duoclao.jpg', N'marketing', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (5, N'XiaoYan', N'XiaoYan@gmail.com', N'$2a$10$ojVPuuE5ZVLPE/wWOSRFIeNKLkBZh/CZeHE57ij4F.cfKYsdmIxAO', N'Tiêu Viêm', N'male', N'0978123456', N'uploads/avatars/tieuviem.jpg', N'sale', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (6, N'XiaoZhan', N'XiaoZhan@gmail.com', N'$2a$10$7d0sV4kA8mSbQoJhGmROJumQnBeqtpzzMxz7yslGGf5Z1lhx85M7O', N'Tiêu Chiến', N'male', N'0934567890', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (7, N'XiaoDing', N'XiaoDing@gmail.com', N'$2a$10$Yw.YHLgW3IAdZAvicADymOZ4CqopkkbD90.DW7m.0Nz3PxuF/pvsK', N'Tiêu Đỉnh', N'male', N'0956781234', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (8, N'Medusa', N'Medusa@gmail.com', N'$2a$10$7Wjzn5r0OX2pcdowGvA39OBnpNP9.b4MvoaXH4terFmIpSN/htzqa', N'Mỹ Đỗ Toa', N'female', N'0923456789', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (9, N'CaiLin', N'CaiLin@gmail.com', N'$2a$10$de4mBMbt0qfpuKCs0jF1I.wHr5/dfWMYQikSJ8aJqbHyZ8qH2IxXu', N'Thái Lan', N'female', N'0965432109', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (10, N'HaiBoDong', N'HaiBoDong@gmail.com', N'$2a$10$5l/p6PdL8crcmH0qAcniEuQGjrlNc1GYrSWKcYVeloYoxtqhczhOe', N'Hải Ba Đông', N'male', N'0998765432', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (11, N'NalanYanran', N'NalanYanran@gmail.com', N'$2a$10$.Aa9sv.fZvHA4HIS6vcfNuSGM.zlr3ldxMuo8FccCVDGIgjaYP8pq', N'Nalan Yên Nhiên', N'female', N'0943216789', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (12, N'GuYuan', N'GuYuan@gmail.com', N'$2a$10$JaWF8M.AaFAxaCcq7e2zK.TLravMOCQvxG3NXAAoKlDMVnL/PVzq6', N'Cổ Nguyên', N'male', N'0981234567', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (13, N'GuXun', N'GuXun@gmail.com', N'$2a$10$s.runNoG/32WCxknTJrbs.6oqxowlmPDAqgFdvEgs7xcOOYyrEbQW', N'Cổ Xán', N'male', N'0976543210', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (14, N'YunShan', N'YunShan@gmail.com', N'$2a$10$tdQRtCI1.aPdt.qbe2ee.eOrC2Tq2XQymcNE9z9.6GChMVWVRHGYy', N'Vân Sơn', N'male', N'0919876543', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (15, N'FaMa', N'FaMa@gmail.com', N'$2a$10$T7bONEjEQCimeWWQGFDPzuhsN10hiSSbQFFugWa.MUOA93XyLYWTu', N'Pháp Mã', N'male', N'0921987654', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (16, N'HuJia', N'HuJia@gmail.com', N'$2a$10$3iPVuYw6ScoAZULHkjrkyOcMSbMzVWMiQH35Pnw.de1rnGNjxN2ku', N'Hồ Gia', N'female', N'0932198765', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (17, N'LingYing', N'LingYing@gmail.com', N'$2a$10$/wuejts3V40G0e/NGB/pOuM5ciGBGTL.fPPNoMDOvb.NVdQmgIjU.', N'Lăng Ảnh', N'male', N'0954321987', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (18, N'YanXiao', N'YanXiao@gmail.com', N'$2a$10$7QRPlkWt96Ah6r.5Frgiku3/QCZpAwMDPyLuvurl61Uqij.fqJbTC', N'Diệp Hiên', N'male', N'0965432198', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (19, N'QingLin', N'QingLin@gmail.com', N'$2a$10$5UThIZ.2xCuTFxaq3Xtd4OQUDPPQLhsWWlbrWXJydo574exxXviKO', N'Thanh Lân', N'female', N'0976543219', N'uploads/avatars/default.jpg', N'customer', N'inactive', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (20, N'XiaoLei', N'XiaoLei@gmail.com', N'$2a$10$WIhlpSF/rOFJ06PxhnhQ7OLriyxm2rkxRKyq2ThvpkRtKQTlzDPcS', N'Tiêu Lôi', N'male', N'0987654329', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (21, N'FengLei', N'FengLei@gmail.com', N'$2a$10$f68ZbQbQru4.i8erDSO4quX27/d/Czq0jRBJXCbOmsHH/zE80tD8.', N'Phong Lôi', N'male', N'0998765431', N'uploads/avatars/default.jpg', N'customer', N'pending', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (22, N'ZiYan', N'ZiYan@gmail.com', N'$2a$10$ky5Lacc8ObH4QwmJ8LGeauTWFq5CT2/cxQhM98ug/lSH4xGYU.J7i', N'Tử Nghiên', N'female', N'0909876543', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON

GO

-- Cấp 1
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (1, N'Quần áo nam', N'Các loại quần áo cho nam', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (2, N'Quần áo nữ', N'Các loại quần áo cho nữ', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (3, N'Quần áo trẻ em', N'Quần áo cho trẻ em', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (4, N'Phụ kiện', N'Các phụ kiện thời trang', NULL, 1, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (5, N'Giày dép', N'Các loại giày dép', NULL, 1, N'active')
GO

-- Cấp 2 - Quần áo nam
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (6, N'Áo nam', N'Các loại áo cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (7, N'Quần nam', N'Các loại quần cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (37, N'Đồ bộ nam', N'Các loại đồ bộ cho nam', 1, 2, N'active')
GO

-- Cấp 2 - Quần áo nữ
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (8, N'Áo nữ', N'Các loại áo cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (9, N'Váy & Chân váy', N'Các loại váy và chân váy', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (38, N'Đồ bộ nữ', N'Các loại đồ bộ cho nữ', 2, 2, N'active')
GO

-- Cấp 2 - Quần áo trẻ em
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (39, N'Áo trẻ em', N'Các loại áo cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (40, N'Quần trẻ em', N'Các loại quần cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (41, N'Váy trẻ em', N'Các loại váy cho trẻ em', 3, 2, N'active')
GO

-- Cấp 2 - Phụ kiện
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (21, N'Túi xách nữ', N'Các loại túi xách cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (22, N'Túi xách nam', N'Các loại túi xách cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (23, N'Thắt lưng nam', N'Thắt lưng cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (24, N'Thắt lưng nữ', N'Thắt lưng cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (42, N'Kính mắt', N'Các loại kính thời trang', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (43, N'Trang sức', N'Các loại trang sức', 4, 2, N'active')
GO

-- Cấp 2 - Giày dép
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (18, N'Giày thể thao', N'Các loại giày thể thao', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (19, N'Giày da', N'Các loại giày da', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (20, N'Sandal', N'Các loại sandal', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (44, N'Dép', N'Các loại dép', 5, 2, N'active')
GO

-- Cấp 3 - Áo nam
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (12, N'Áo sơ mi nam', N'Áo sơ mi công sở', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (13, N'Áo thun nam', N'Áo thun cotton', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (25, N'Áo khoác nam', N'Áo khoác dù, bomber', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (45, N'Áo vest nam', N'Áo vest lịch lãm', 6, 3, N'active')
GO

-- Cấp 3 - Quần nam
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (10, N'Quần jean nam', N'Quần jean các loại', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (11, N'Quần kaki nam', N'Quần kaki lịch lãm', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (27, N'Quần short nam', N'Quần short kaki, jean', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (46, N'Quần tây nam', N'Quần tây công sở', 7, 3, N'active')
GO

-- Cấp 3 - Đồ bộ nam
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (47, N'Đồ bộ thể thao nam', N'Đồ bộ thể thao nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (48, N'Đồ bộ mặc nhà nam', N'Đồ bộ mặc nhà nam', 37, 3, N'active')
GO

-- Cấp 3 - Áo nữ
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (15, N'Áo sơ mi nữ', N'Áo sơ mi công sở', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (16, N'Áo thun nữ', N'Áo thun cotton', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (26, N'Áo khoác nữ', N'Áo khoác dù, bomber', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (49, N'Áo kiểu nữ', N'Áo kiểu thời trang', 8, 3, N'active')
GO

-- Cấp 3 - Váy & Chân váy
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (14, N'Đầm dự tiệc', N'Đầm dài, đầm body', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (17, N'Váy maxi', N'Váy maxi dài', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (28, N'Quần short nữ', N'Quần short kaki, jean', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (50, N'Chân váy', N'Chân váy các loại', 9, 3, N'active')
GO

-- Cấp 3 - Đồ bộ nữ
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (51, N'Đồ bộ thể thao nữ', N'Đồ bộ thể thao nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (52, N'Đồ bộ mặc nhà nữ', N'Đồ bộ mặc nhà nữ', 38, 3, N'active')
GO

-- Cấp 3 - Áo trẻ em
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (53, N'Áo thun trẻ em', N'Áo thun trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (54, N'Áo sơ mi trẻ em', N'Áo sơ mi trẻ em', 39, 3, N'active')
GO

-- Cấp 3 - Quần trẻ em
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (55, N'Quần jean trẻ em', N'Quần jean trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (56, N'Quần short trẻ em', N'Quần short trẻ em', 40, 3, N'active')
GO

-- Cấp 3 - Váy trẻ em
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (57, N'Váy xòe trẻ em', N'Váy xòe trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (58, N'Đầm công chúa trẻ em', N'Đầm công chúa trẻ em', 41, 3, N'active')
GO

-- Cấp 3 - Túi xách nữ
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (36, N'Túi xách tay nữ', N'Túi xách tay nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (59, N'Túi đeo chéo nữ', N'Túi đeo chéo nữ', 21, 3, N'active')
GO

-- Cấp 3 - Túi xách nam
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (35, N'Túi đeo chéo nam', N'Túi đeo chéo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (60, N'Balo nam', N'Balo nam', 22, 3, N'active')
GO

-- Cấp 3 - Thắt lưng nam
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (61, N'Thắt lưng da nam', N'Thắt lưng da nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (62, N'Thắt lưng vải nam', N'Thắt lưng vải nam', 23, 3, N'active')
GO

-- Cấp 3 - Thắt lưng nữ
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (63, N'Thắt lưng da nữ', N'Thắt lưng da nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (64, N'Thắt lưng vải nữ', N'Thắt lưng vải nữ', 24, 3, N'active')
GO

-- Cấp 3 - Kính mắt
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (65, N'Kính râm', N'Kính râm', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (66, N'Kính cận', N'Kính cận', 42, 3, N'active')
GO

-- Cấp 3 - Trang sức
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (67, N'Dây chuyền', N'Dây chuyền', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (68, N'Bông tai', N'Bông tai', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (69, N'Nhẫn', N'Nhẫn', 43, 3, N'active')
GO

-- Cấp 3 - Giày thể thao
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (29, N'Giày Sneaker Nam', N'Giày Sneaker Nam', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (30, N'Giày Sneaker Nữ', N'Giày Sneaker Nữ', 18, 3, N'active')
GO

-- Cấp 3 - Giày da
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (31, N'Giày Tây Nam', N'Giày Tây Nam', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (32, N'Giày Cao Gót', N'Giày Cao Gót', 19, 3, N'active')
GO

-- Cấp 3 - Sandal
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (33, N'Sandal Nam', N'Sandal Nam', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (34, N'Sandal Nữ', N'Sandal Nữ', 20, 3, N'active')
GO

-- Cấp 3 - Dép
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (70, N'Dép lào nam', N'Dép lào nam', 44, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (71, N'Dép quai ngang nữ', N'Dép quai ngang nữ', 44, 3, N'active')
GO

SET IDENTITY_INSERT [dbo].[categories] OFF

GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (1, N'Áo sơ mi trắng', 12, N'Áo sơ mi trắng phong cách, phù hợp với mọi dịp', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://lamia.com.vn/storage/so-mi/ao-so-mi-trang-phoi-ren-xep-ly-la300-2-3.jpg', N'active', 1, N'1', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (2, N'Quần tây đen', 46, N'Quần tây màu đen lịch lãm, phù hợp cho công sở', CAST(280000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://js0fpsb45jobj.vcdn.cloud/storage/upload/media/gumac/QE12080/2-DEN-QE12080.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (3, N'Đầm hoa mùa hè', 14, N'Đầm hoa nhẹ nhàng, thoải mái, phù hợp cho mùa hè', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (4, N'Chân váy denim', 50, N'Chân váy denim thời trang, dễ phối đồ', CAST(220000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (5, N'Áo thun siêu nhân', 53, N'Áo thun với họa tiết siêu nhân, dành cho trẻ em', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5?wid=800&hei=800&qlt=80&fmt=webp', N'active', 1, N'2', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (6, N'Quần short cotton', 56, N'Quần short cotton mềm mại, thoáng mát', CAST(100000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'https://dosi-in.com/file/detailed/187/dosiin-routine-quan-shortstraight-form-fpsh-187855187855.jpg?w=1000&h=1000&fit=fill&fm=webp', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (7, N'Thắt lưng da', 61, N'Thắt lưng da cao cấp, bền đẹp theo thời gian', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://authenticvietnam.vn/wp-content/uploads/that-lung-da-gucci-nam-406831DJ20T_2145_001_100_0000_Light-Leather-belt-with-Double-G-buckle.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (9, N'Giày thể thao', 29, N'Giày thể thao nhẹ nhàng, phù hợp cho cả nam và nữ', CAST(450000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), N'giay_the_thao.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (10, N'Giày sneaker', 30, N'Giày sneaker thời trang, phù hợp cho đi chơi', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'giay_sneaker.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (11, N'Quần short siêu nhân', 56, N'Quần short với họa tiết siêu nhân, dành cho trẻ em', CAST(480000.00 AS Decimal(10, 2)), CAST(550000.00 AS Decimal(10, 2)), N'combo_quan_ao_mua_he.jpg', N'active', 0, N'2', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (12, N'Áo so mi xanh', 12, N'Áo sơ mi xanh phong cách, phù hợp với mọi dịp', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/100/455/439/products/bla-9254.jpg?v=1653388487927', N'active', 0, N'1', CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2), CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
USE [clothing_shop]
GO

-- Populate product_colors table
SET IDENTITY_INSERT [dbo].[product_colors] ON
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (1, 1, N'Trắng')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (2, 1, N'Xanh nhạt')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (3, 2, N'Đen')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (4, 2, N'Xám')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (5, 3, N'Hoa xanh')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (6, 3, N'Hoa đỏ')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (7, 4, N'Xanh đậm')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (8, 4, N'Đen')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (9, 5, N'Đỏ')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (10, 5, N'Xanh')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (11, 6, N'Xanh navy')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (12, 6, N'Xám')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (13, 7, N'Nâu')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (14, 7, N'Đen')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (17, 9, N'Trắng')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (18, 9, N'Đen')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (19, 10, N'Trắng')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (20, 10, N'Đen')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (21, 10, N'Xanh') 
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (22, 11, N'Xanh')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (23, 11, N'Đỏ')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (24, 12, N'Xanh')
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (25, 12, N'Xanh đậm')
SET IDENTITY_INSERT [dbo].[product_colors] OFF
GO

-- Populate product_sizes table
SET IDENTITY_INSERT [dbo].[product_sizes] ON
GO
-- Áo sơ mi nam và quần tây - sizes S, M, L, XL
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (1, 1, N'S')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (2, 1, N'M')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (3, 1, N'L')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (4, 1, N'XL')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (5, 2, N'S')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (6, 2, N'M')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (7, 2, N'L')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (8, 2, N'XL')

-- Đầm và chân váy - sizes S, M, L
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (9, 3, N'S')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (10, 3, N'M')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (11, 3, N'L')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (12, 4, N'S')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (13, 4, N'M')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (14, 4, N'L')

-- Quần áo trẻ em - sizes 2-4, 4-6, 6-8
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (15, 5, N'2-4')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (16, 5, N'4-6')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (17, 5, N'6-8')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (18, 6, N'2-4')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (19, 6, N'4-6')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (20, 6, N'6-8')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (21, 11, N'2-4')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (22, 11, N'4-6')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (23, 11, N'6-8')

-- Phụ kiện - sizes onesize hoặc kích thước cụ thể
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (24, 7, N'90cm')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (25, 7, N'100cm')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (26, 7, N'110cm')
--INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (27, 8, N'Onesize')

-- Giày dép - sizes 38-42 cho giày
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (28, 9, N'38')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (29, 9, N'39')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (30, 9, N'40')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (31, 9, N'41')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (32, 9, N'42')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (33, 10, N'38')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (34, 10, N'39')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (35, 10, N'40')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (36, 10, N'41')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (37, 10, N'42')

-- Áo sơ mi xanh - sizes S, M, L, XL
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (38, 12, N'S')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (39, 12, N'M')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (40, 12, N'L')
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (41, 12, N'XL')
SET IDENTITY_INSERT [dbo].[product_sizes] OFF
GO

-- Populate product_variants table with various stock quantities
SET IDENTITY_INSERT [dbo].[product_variants] ON
GO
-- Áo sơ mi trắng variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (1, 1, 1, 1, 50, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (2, 1, 2, 1, 75, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (3, 1, 3, 1, 60, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (4, 1, 4, 1, 40, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (5, 1, 1, 2, 45, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (6, 1, 2, 2, 70, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (7, 1, 3, 2, 55, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (8, 1, 4, 2, 35, CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2))

-- Quần tây đen variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (9, 2, 5, 3, 40, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (10, 2, 6, 3, 65, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (11, 2, 7, 3, 50, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (12, 2, 8, 3, 30, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (13, 2, 5, 4, 35, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (14, 2, 6, 4, 60, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (15, 2, 7, 4, 45, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (16, 2, 8, 4, 25, CAST(N'2025-01-10T00:00:00.0000000' AS DateTime2))

-- Đầm hoa mùa hè variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (17, 3, 9, 5, 30, CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (18, 3, 10, 5, 45, CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (19, 3, 11, 5, 20, CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (20, 3, 9, 6, 25, CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (21, 3, 10, 6, 40, CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (22, 3, 11, 6, 15, CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2))

-- Chân váy denim variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (23, 4, 12, 7, 35, CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (24, 4, 13, 7, 50, CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (25, 4, 14, 7, 25, CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (26, 4, 12, 8, 30, CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (27, 4, 13, 8, 45, CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (28, 4, 14, 8, 20, CAST(N'2025-01-08T00:00:00.0000000' AS DateTime2))

-- Áo thun siêu nhân variants (trẻ em)
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (29, 5, 15, 9, 60, CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (30, 5, 16, 9, 75, CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (31, 5, 17, 9, 50, CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (32, 5, 15, 10, 55, CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (33, 5, 16, 10, 70, CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (34, 5, 17, 10, 45, CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2))

-- Quần short cotton variants (trẻ em)
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (35, 6, 18, 11, 65, CAST(N'2025-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (36, 6, 19, 11, 80, CAST(N'2025-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (37, 6, 20, 11, 55, CAST(N'2025-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (38, 6, 18, 12, 60, CAST(N'2025-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (39, 6, 19, 12, 75, CAST(N'2025-01-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (40, 6, 20, 12, 50, CAST(N'2025-01-25T00:00:00.0000000' AS DateTime2))

-- Thắt lưng da variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (41, 7, 24, 13, 40, CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (42, 7, 25, 13, 50, CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (43, 7, 26, 13, 30, CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (44, 7, 24, 14, 35, CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (45, 7, 25, 14, 45, CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (46, 7, 26, 14, 25, CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2))

-- Giày thể thao variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (49, 9, 28, 17, 25, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (50, 9, 29, 17, 35, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (51, 9, 30, 17, 40, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (52, 9, 31, 17, 30, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (53, 9, 32, 17, 20, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (54, 9, 28, 18, 20, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (55, 9, 29, 18, 30, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (56, 9, 30, 18, 35, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (57, 9, 31, 18, 25, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (58, 9, 32, 18, 15, CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2))


--Giày sneaker variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (59, 10, 33, 19, 30, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (60, 10, 34, 19, 40, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (61, 10, 35, 19, 50, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (62, 10, 36, 19, 35, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (63, 10, 37, 19, 25, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (64, 10, 33, 20, 20, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (65, 10, 34, 20, 30, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (66, 10, 35, 20, 45, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (67, 10, 36, 20, 40, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (68, 10, 37, 20, 30, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (69, 10, 33, 21, 25, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (70, 10, 34, 21, 35, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (71, 10, 35, 21, 50, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (72, 10, 36, 21, 45, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2)),
       (73, 10, 37, 21, 30, CAST(N'2025-01-09T00:00:00.0000000' AS DateTime2));


--Quần short siêu nhân variants (trẻ em)
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (74, 11, 21, 22, 55, CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2)),
       (75, 11, 22, 22, 65, CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2)),
       (76, 11, 23, 22, 50, CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2)),
       (77, 11, 21, 23, 45, CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2)),
       (78, 11, 22, 23, 60, CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2)),
       (79, 11, 23, 23, 55, CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2));

--Áo sơ mi xanh variants
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) 
VALUES (80, 12, 38, 24, 40, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (81, 12, 39, 24, 55, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (82, 12, 40, 24, 35, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (83, 12, 41, 24, 50, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (84, 12, 38, 25, 45, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (85, 12, 39, 25, 60, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (86, 12, 40, 25, 30, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2)),
       (87, 12, 41, 25, 55, CAST(N'2025-01-14T00:00:00.0000000' AS DateTime2));

SET IDENTITY_INSERT [dbo].[product_variants] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (1, N'Xu hướng thời trang mùa xuân 2025', N'https://mcdn.coolmate.me/image/December2022/xu-huong-thoi-trang-xuan-he-2023-805_866.jpg', N'Khám phá xu hướng thời trang hot nhất cho mùa xuân năm 2025', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững. Mùa này mang đến góc nhìn mới mẻ về phong cách cổ điển với sự nhấn mạnh vào vật liệu thân thiện với môi trường và những món đồ đa năng có thể tạo kiểu theo nhiều cách. Các xu hướng chính bao gồm chủ nghĩa tối giản màu pastel, áo khoác oversize và denim bền vững.', 4, 1, N'published', CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2), CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (2, N'Làm thế nào để xây dựng một tủ quần áo con nhộng', N'https://songxanhsongkhoe.vn/wp-content/uploads/2020/11/co-gai-dung-truoc-tu-quan-an-va-sap-xep-tu-do-con-nhong-1-1024x683.jpg', N'Hướng dẫn thiết yếu để tạo ra một tủ quần áo đa năng', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai muốn giảm thiểu quần áo trong khi vẫn tối đa hóa các lựa chọn về phong cách. Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách lựa chọn những món đồ thiết yếu, phối hợp màu sắc và chuyển mùa.', 4, 1, N'published', CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2), CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (3, N'Thời trang bền vững: Hướng dẫn đầy đủ', N'https://tse1.mm.bing.net/th?id=OIP.jBJ4gAN070RxCwsuzGaMZAHaFF&pid=Api&P=0&h=180', N'Mọi thứ bạn cần biết về thời trang bền vững', N'Thời trang bền vững không chỉ là một xu hướng - mà còn là điều cần thiết cho tương lai của hành tinh chúng ta. Tìm hiểu về vật liệu thân thiện với môi trường, quy trình sản xuất có đạo đức và cách đưa ra những lựa chọn bền vững hơn khi mua thời trang.', 4, 0, N'published', CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2), CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (4, N'Xu hướng màu sắc cho mùa hè năm 2025', N'https://cdn.vuahanghieu.com/unsafe/1200x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/2021/10/15-xu-huong-mau-sac-thoi-trang-trend-mua-thu-dong-2021-06102021134538.jpg', N'Khám phá bảng màu rực rỡ của mùa hè năm 2025', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ của phong cách cổ điển trong thời trang, khi các xu hướng từ thập kỷ trước được tái hiện với những biến tấu hiện đại, tạo nên sự giao thoa độc đáo giữa quá khứ và hiện tại. Bên cạnh đó, bảng màu của mùa hè năm nay cũng vô cùng rực rỡ và đa dạng, phản ánh sự kết nối giữa con người và thiên nhiên. Những gam màu nổi bật bao gồm Future Dusk – sắc xanh lam đậm đầy bí ẩn, Transcendent Pink – hồng nhẹ nhàng thể hiện sự tinh tế, Aquatic Awe – xanh ngọc bích tươi mát như đại dương, Sunset Coral – cam san hô ấm áp như ánh hoàng hôn, và Ray Flower – vàng rực rỡ tràn đầy năng lượng. Sự kết hợp giữa phong cách cổ điển và bảng màu ấn tượng này không chỉ tạo nên những bộ trang phục vừa hoài cổ vừa hiện đại mà còn mang đến cảm giác tin cậy, ổn định trong một thế giới đang không ngừng thay đổi.', 4, 1, N'published', CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (5, N'Phụ kiện 101: Hướng dẫn đầy đủ', N'https://cf.shopee.vn/file/b849b807196691d47472df6073839200', N'Làm chủ nghệ thuật phối phụ kiện cho trang phục của bạn', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc lựa chọn đồ trang sức phù hợp đến việc lựa chọn túi xách và giày dép phù hợp với trang phục của bạn. Hướng dẫn toàn diện này bao gồm mọi thứ từ những dịp bình thường đến trang trọng.', 4, 0, N'draft', CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2), CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (6, N'Kỹ thuật xếp lớp cho mùa đông', N'https://tiki.vn/blog/wp-content/uploads/2023/03/mix-do-mua-dong-phong-cach-han-quoc.jpg', N'Làm chủ nghệ thuật phối đồ nhiều lớp thời trang cho mùa đông', N'Tìm hiểu cách kết hợp các kết cấu và mảnh ghép khác nhau để tạo nên những bộ trang phục mùa đông ấm áp và thời trang. Từ lớp lót giữ nhiệt đến áo khoác nổi bật, chúng tôi sẽ chia nhỏ các kỹ thuật thiết yếu để luôn sang trọng và thoải mái.', 4, 1, N'published', CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (7, N'Những cải tiến về vải thân thiện với môi trường', N'https://dongphucthanhhung.vn/wp-content/uploads/2023/05/vai-than-thien-voi-moi-truong.jpg', N'Khám phá công nghệ vải bền vững mang tính đột phá', N'Những cải tiến về vải thân thiện với môi trường đang trở thành xu hướng quan trọng trong ngành thời trang bền vững. Các chất liệu như sợi tre, vải từ tảo biển, sợi dứa Piñatex hay polyester tái chế (rPET) không chỉ giúp giảm tác động tiêu cực đến môi trường mà còn mang lại sự thoải mái và bền bỉ cho người sử dụng. Bên cạnh đó, công nghệ sản xuất hiện đại đã giúp tối ưu hóa quy trình dệt may, giảm đáng kể lượng nước, hóa chất và rác thải. Những thay đổi này không chỉ hướng tới việc bảo vệ hành tinh mà còn mở ra một tương lai bền vững hơn cho ngành công nghiệp thời trang.', 4, 0, N'published', CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2), CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (8, N'Những vật dụng thiết yếu cho tủ đồ tối giản', N'https://noithatminhkhoi.com/upload/images/xay-dung-tu-quan-ao-toi-gian-cho-nam-gioi-04.jpg', N'Tạo một tủ quần áo đa năng với ít món đồ hơn', N'Một tủ đồ tối giản không cần quá nhiều món đồ nhưng vẫn đảm bảo tính linh hoạt và phong cách. Những vật dụng thiết yếu như áo sơ mi trắng, áo thun trơn, quần jeans tối màu hay blazer giúp bạn dễ dàng phối hợp trang phục cho nhiều dịp khác nhau. Bên cạnh đó, một đôi giày thể thao thoải mái và giày da thanh lịch sẽ giúp bạn luôn sẵn sàng cho cả ngày thường lẫn sự kiện quan trọng. Kết hợp với túi xách đa năng và một vài phụ kiện tinh tế, tủ đồ tối giản không chỉ giúp tiết kiệm thời gian mà còn tạo nên vẻ ngoài hiện đại, tinh tế và không bao giờ lỗi mốt.', 4, 1, N'published', CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2), CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (9, N'Sự hồi sinh của thời trang cổ điển', N'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg', N'Phong cách cổ điển đang quay trở lại như thế nào?', N'Phong cách cổ điển đang quay trở lại mạnh mẽ trong nhiều lĩnh vực như thời trang, nội thất, thiết kế đồ họa và nghệ thuật. Xu hướng này không chỉ đơn thuần là việc tái hiện lại quá khứ mà còn là sự kết hợp giữa nét đẹp truyền thống với yếu tố hiện đại, tạo ra một phong cách tân cổ điển (Neo-Classic) đầy tinh tế.', 1, 0, N'published', CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (10, N'Quần áo tích hợp công nghệ', N'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg', N'Tương lai của thời trang gặp gỡ công nghệ', N'Quần áo tích hợp công nghệ đang trở thành xu hướng mới trong ngành thời trang, mang lại sự tiện lợi và trải nghiệm hiện đại cho người dùng. Từ áo khoác có khả năng tự điều chỉnh nhiệt độ, vải chống thấm nước nhưng vẫn thoáng khí, đến quần áo thể thao có cảm biến theo dõi sức khỏe, công nghệ đang thay đổi cách chúng ta mặc và sử dụng trang phục hàng ngày. Ngoài ra, các chất liệu thông minh như vải dẫn điện, vải đổi màu theo môi trường hay trang phục có thể kết nối với thiết bị di động đang mở ra một kỷ nguyên mới cho thời trang ứng dụng. Với sự kết hợp giữa thẩm mỹ và công nghệ, quần áo thông minh không chỉ đáp ứng nhu cầu tiện nghi mà còn giúp nâng cao chất lượng cuộc sống.', 4, 1, N'published', CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (11, N'Mẹo thời trang tiết kiệm', N'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg', N'Trông tuyệt vời mà không tốn kém', N'Thời trang tiết kiệm không có nghĩa là phải từ bỏ phong cách, mà ngược lại, bạn có thể vẫn sành điệu mà không tốn quá nhiều chi phí. Trước tiên, hãy đầu tư vào những món đồ cơ bản và dễ phối như áo sơ mi trắng, quần jeans và blazer – những item không bao giờ lỗi mốt. Thứ hai, săn sale thông minh bằng cách theo dõi các đợt giảm giá lớn hoặc mua sắm tại các cửa hàng second-hand, nơi bạn có thể tìm được nhiều món đồ độc đáo với giá rẻ. Ngoài ra, học cách mix & match giúp bạn tận dụng tối đa tủ đồ mà không cần mua sắm liên tục. Cuối cùng, bảo quản quần áo đúng cách sẽ giúp chúng bền hơn, giúp bạn tiết kiệm chi phí thay thế. Với những mẹo này, bạn hoàn toàn có thể xây dựng phong cách riêng mà không cần tiêu tốn quá nhiều tiền.', 4, 0, N'published', CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (12, N'Ảnh hưởng của văn hóa trong thời trang', N'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg', N'Xu hướng thời trang toàn cầu và nguồn cảm hứng văn hóa', N'Văn hóa ảnh hưởng sâu sắc đến thời trang, từ trang phục truyền thống đến xu hướng hiện đại. Mỗi nền văn hóa mang đến những màu sắc, họa tiết và kiểu dáng đặc trưng, giúp định hình phong cách thời trang đa dạng. Bên cạnh đó, âm nhạc, nghệ thuật và phong trào xã hội cũng góp phần tạo ra những xu hướng mới. Sự giao thoa giữa các nền văn hóa trong thời đại toàn cầu hóa giúp thời trang ngày càng phong phú, kết hợp giữa truyền thống và hiện đại, góp phần lan tỏa giá trị văn hóa trên toàn thế giới.', 4, 1, N'published', CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2), CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (13, N'Thiết kế giày bền vững', N'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg', N'Những cách tiếp cận sáng tạo đối với giày dép thân thiện với môi trường', N'Thiết kế giày bền vững đang trở thành xu hướng quan trọng trong ngành thời trang, hướng đến việc giảm thiểu tác động tiêu cực đến môi trường. Các thương hiệu ngày càng chú trọng sử dụng vật liệu tái chế, hữu cơ hoặc có khả năng phân hủy sinh học như da thực vật, nhựa tái chế và cao su tự nhiên. Bên cạnh đó, quy trình sản xuất cũng được tối ưu hóa để tiết kiệm năng lượng và giảm lượng khí thải. Không chỉ thân thiện với môi trường, giày bền vững còn được thiết kế để đảm bảo độ bền cao, giúp người tiêu dùng sử dụng lâu dài và hạn chế rác thải thời trang.', 4, 0, N'published', CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2), CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (14, N'Xu hướng nhiếp ảnh thời trang', N'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8', N'Sự phát triển của nghệ thuật hình ảnh thời trang', N'Xu hướng nhiếp ảnh thời trang đang không ngừng thay đổi, phản ánh sự kết hợp giữa nghệ thuật, công nghệ và văn hóa đương đại. Những phong cách hoài cổ như film photography đang quay trở lại, mang đến cảm giác chân thực và giàu cảm xúc. Bên cạnh đó, nhiếp ảnh thời trang hiện đại còn ứng dụng AI và công nghệ CGI để tạo ra những bộ ảnh mang đậm tính sáng tạo và siêu thực. Xu hướng "street style photography" cũng tiếp tục được ưa chuộng, tập trung vào sự tự nhiên và phong cách cá nhân. Ngoài ra, việc đề cao tính bền vững trong nhiếp ảnh thời trang ngày càng phổ biến, với các chiến dịch quảng cáo ưu tiên sử dụng ánh sáng tự nhiên và hạn chế tác động đến môi trường.', 4, 1, N'draft', CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2), CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (15, N'Phát triển phong cách cá nhân', N'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg', N'Khám phá và phát triển bản sắc thời trang độc đáo của bạn', N'Phát triển phong cách cá nhân là một quá trình khám phá và thể hiện bản thân thông qua thời trang. Thay vì chạy theo xu hướng, hãy tìm ra những trang phục, màu sắc và kiểu dáng phù hợp với cá tính và lối sống của bạn. Việc hiểu rõ vóc dáng, sở thích và cảm hứng từ các nền văn hóa khác nhau sẽ giúp bạn xây dựng một phong cách độc đáo. Ngoài ra, đầu tư vào những món đồ cơ bản nhưng chất lượng, kết hợp với phụ kiện tinh tế, cũng là cách để tạo dấu ấn riêng. Quan trọng nhất, phong cách cá nhân không chỉ nằm ở trang phục mà còn thể hiện qua sự tự tin và cách bạn thể hiện bản thân mỗi ngày.', 4, 0, N'published', CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (16, N'Thương hiệu thời trang đạo đức', N'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png', N'Các thương hiệu hàng đầu tạo ra tác động tích cực', N'Thương hiệu thời trang đạo đức đang ngày càng thu hút sự quan tâm khi người tiêu dùng chú trọng hơn đến tính bền vững và trách nhiệm xã hội. Các thương hiệu này cam kết sử dụng nguyên liệu thân thiện với môi trường, quy trình sản xuất công bằng và đảm bảo điều kiện làm việc tốt cho người lao động. Họ thường áp dụng mô hình sản xuất minh bạch, sử dụng chất liệu hữu cơ, tái chế hoặc công nghệ tiên tiến để giảm thiểu tác động tiêu cực đến môi trường. Việc ủng hộ các thương hiệu này không chỉ giúp bảo vệ hành tinh mà còn góp phần thúc đẩy sự công bằng trong ngành thời trang.', 4, 1, N'published', CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (17, N'Thời trang kỹ thuật số và Metaverse', N'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png', N'Thời trang trong thế giới kỹ thuật số và ảo', N'Thời trang kỹ thuật số và Metaverse đang mở ra một kỷ nguyên mới, nơi quần áo không chỉ tồn tại trong thế giới thực mà còn hiện diện trong không gian ảo. Các thương hiệu lớn và nhà thiết kế đang phát triển trang phục kỹ thuật số, cho phép người dùng mua, mặc và trưng bày chúng trên các nền tảng Metaverse hoặc mạng xã hội. Công nghệ blockchain và NFT giúp xác thực quyền sở hữu của những món đồ này, tạo ra một thị trường mới đầy tiềm năng. Với sự phát triển của thực tế ảo (VR) và thực tế tăng cường (AR), thời trang không còn bị giới hạn bởi chất liệu vật lý mà có thể biến đổi linh hoạt theo môi trường số, mở ra cơ hội sáng tạo vô tận cho cả người tiêu dùng lẫn ngành công nghiệp thời trang.', 4, 0, N'draft', CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2), CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (18, N'Cách mạng thời trang thích ứng', N'https://file.hstatic.net/200000775589/article/hippie-style_cd4cf3dfcf234ac7aa46653dd6b140cc.jpg', N'Thiết kế toàn diện cho mọi vóc dáng và khả năng', N'Cách mạng thời trang thích ứng đang thay đổi cách chúng ta tiếp cận quần áo, tập trung vào tính linh hoạt, đa năng và bền vững. Các thiết kế ngày nay không chỉ đáp ứng nhu cầu thẩm mỹ mà còn có khả năng thích nghi với môi trường và lối sống của người mặc. Từ vải co giãn đa chiều, quần áo biến đổi theo thời tiết đến trang phục công nghệ cao giúp điều chỉnh nhiệt độ cơ thể, tất cả đều hướng đến sự tiện lợi và tối ưu hóa trải nghiệm cá nhân. Bên cạnh đó, các thương hiệu cũng đẩy mạnh sản xuất theo mô hình thời trang bền vững, sử dụng vật liệu tái chế và công nghệ thân thiện với môi trường. Đây không chỉ là một xu hướng mà còn là một cuộc cách mạng thay đổi cách chúng ta mặc và tiêu dùng thời trang.', 4, 1, N'published', CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2), CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (2, N'dfe99b7b-3adc-4263-b819-ebca71ff6b2a', CAST(N'2025-02-09T17:41:58.857' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO



INSERT INTO footer_settings (type, field_name, value, image) VALUES
(N'info', N'Tên cửa hàng', N'Fashion Store', NULL),
(N'info', N'Giới thiệu', N'Chuyên bán quần áo thời trang', NULL),
(N'contact', N'Email', N'support@fashionstore.com', NULL),
(N'contact', N'Địa chỉ', N'thôn 4, xã Thạch Hòa, huyện Thạch Thất, Hà Nội', NULL),
(N'contact', N'Tổng đài hỗ trợ', N'+84 123 456 789', NULL),
(N'social', N'Facebook', N'https://facebook.com/fashion', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT83dd8_4WZCT-LsYC477q2WKocjms9OHCg0g&s'),
(N'social', N'Instagram', N'https://instagram.com/fashion', N'https://cdn-icons-png.freepik.com/256/15707/15707869.png?semt=ais_hybrid') 



SET IDENTITY_INSERT [dbo].[coupons] ON 
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (1, N'ABC123XYZ', N'percentage', CAST(10.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (2, N'DEF456UVW', N'fixed', CAST(20000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), NULL, 100, 0, CAST(N'2025-07-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (3, N'GHI789RST', N'percentage', CAST(15.00 AS Decimal(10, 2)), CAST(75000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 75, 0, CAST(N'2025-08-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (4, N'JKL012PQR', N'fixed', CAST(30000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), NULL, 200, 0, CAST(N'2025-09-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (5, N'MNO345NOP', N'percentage', CAST(20.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-10-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (6, N'STU678KLM', N'fixed', CAST(50000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), NULL, 25, 0, CAST(N'2025-11-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (7, N'VWX901HIJ', N'percentage', CAST(25.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 100, 0, CAST(N'2025-12-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (8, N'YZA234EFG', N'fixed', CAST(15000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), NULL, 150, 0, CAST(N'2026-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (9, N'BCD567BCD', N'percentage', CAST(30.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 30, 0, CAST(N'2026-02-28T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (10, N'EFG890YZA', N'fixed', CAST(25000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), NULL, 75, 0, CAST(N'2026-03-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (11, N'HIJ123VWX', N'percentage', CAST(5.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 500, 0, CAST(N'2026-04-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (12, N'KLM456STU', N'fixed', CAST(10000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, NULL, 0, CAST(N'2026-05-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (13, N'NOP789MNO', N'percentage', CAST(12.50 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)), 250, 0, CAST(N'2026-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (14, N'QRS012JKL', N'fixed', CAST(40000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), NULL, 40, 0, CAST(N'2025-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'expired')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [created_at], [status]) VALUES (15, N'TUV345GHI', N'percentage', CAST(35.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 20, 0, CAST(N'2025-01-28T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'expired')
GO
SET IDENTITY_INSERT [dbo].[coupons] OFF
GO


INSERT INTO sliders (title, image_url, link, status, display_order, notes) VALUES
('Summer Collection 2025', 'https://file.hstatic.net/200000775589/article/hippie-style_cd4cf3dfcf234ac7aa46653dd6b140cc.jpg', 'http://localhost:9999/fashionshop/post?id=18', 'active', 1, 'Highlighting our newest summer collection with bright colors and lightweight fabrics'),
('End of Season Sale - Up to 70% Off', 'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png', 'http://localhost:9999/fashionshop/post?id=17', 'active', 2, 'Major clearance sale on all winter items'),
('New Arrivals - Spring Fashion', 'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png', 'http://localhost:9999/fashionshop/post?id=16', 'active', 3, 'Featuring the latest spring trends and styles'),
('Exclusive Designer Collection', 'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg', 'http://localhost:9999/fashionshop/post?id=15', 'active', 4, 'Premium designer wear for both men and women'),
('Sport & Active Wear', 'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8', 'http://localhost:9999/fashionshop/post?id=14', 'active', 5, 'High-performance sportswear for your active lifestyle'),
('Wedding Season Special', 'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg', 'http://localhost:9999/fashionshop/post?id=13', 'active', 6, 'Elegant formal wear for wedding season'),
('Kids Fashion Week', 'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg', 'http://localhost:9999/fashionshop/post?id=12', 'inactive', 7, 'Cute and comfortable clothing for children'),
('Accessories Collection', 'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg', 'http://localhost:9999/fashionshop/post?id=11', 'active', 8, 'Complete your look with our trendy accessories'),
('Sustainable Fashion Line', 'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg', 'http://localhost:9999/fashionshop/post?id=10', 'active', 9, 'Eco-friendly clothing made from sustainable materials'),
('Holiday Gift Guide', 'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg', 'http://localhost:9999/fashionshop/post?id=9', 'inactive', 10, 'Perfect gift ideas for your loved ones');


SET IDENTITY_INSERT [dbo].[cart] ON 
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (1, 1, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (2, 2, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (3, 3, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[cart] OFF
GO

SET IDENTITY_INSERT [dbo].[cart_items] ON 
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (2, 1, 2, 3, 3)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (3, 2, 3, 2, 3)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (4, 3, 1, 1, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (6, 1, 1, 1, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (7, 1, 2, 3, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (8, 2, 3, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO


-- Thêm 10 sản phẩm mới
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES 
(13, N'Áo khoác bomber nam', 25, N'Áo khoác bomber phong cách thể thao, chống gió tốt', CAST(399000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/sg-11134201-22120-xvrnqiw8jzkvf2', N'active', 0, NULL, CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2)),
(14, N'Quần jogger thể thao', 27, N'Quần jogger co giãn, thoải mái khi vận động', CAST(199000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-livwvvkgnt6o01', N'active', 0, NULL, CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2)),
(15, N'Đầm maxi hoa nhí', 17, N'Đầm maxi dài họa tiết hoa nhí, phong cách boho', CAST(375000.00 AS Decimal(10, 2)), CAST(420000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lij2q6zy1e9v10', N'active', 0, NULL, CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2)),
(16, N'Áo thun unisex', 16, N'Áo thun form rộng, unisex, phong cách đường phố', CAST(150000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/bc3e9c11622c2932fe4f2f8a9a6d0f17', N'active', 0, NULL, CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2)),
(17, N'Váy công chúa cho bé gái', 58, N'Váy công chúa lấp lánh cho bé gái, phù hợp dự tiệc', CAST(289000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134201-23020-2s9cfgvr22nv8c', N'active', 0, NULL, CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2)),
(18, N'Balo nam thời trang', 60, N'Balo nam chống nước, nhiều ngăn, phù hợp đi học, đi làm', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/sg-11134201-22120-qz5c8pq2mlkv95', N'active', 0, NULL, CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2)),
(19, N'Dây chuyền bạc nữ', 67, N'Dây chuyền bạc 925 thiết kế tinh tế, sang trọng', CAST(225000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lfvlj4fzzknf2d', N'active', 0, NULL, CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2)),
(20, N'Giày cao gót nữ', 32, N'Giày cao gót 7cm, mũi nhọn, phù hợp công sở', CAST(330000.00 AS Decimal(10, 2)), CAST(380000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lgz7vylsnfjs70', N'active', 0, NULL, CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2)),
(21, N'Kính mát thời trang', 65, N'Kính mát chống tia UV, gọng kim loại sành điệu', CAST(175000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj1a0v3a1mjn01', N'active', 0, NULL, CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2)),
(22, N'Áo sơ mi nam kẻ sọc', 12, N'Áo sơ mi nam kẻ sọc, chất vải cotton thoáng mát', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lgjq0u51ifzw12', N'active', 0, NULL, CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2), CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2)),
(23, N'Quần jean skinny nữ', 28, N'Quần jean skinny co giãn cao, ôm sát tôn dáng', CAST(279000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lj1vbifz3vn72f', N'active', 0, NULL, CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2)),
(24, N'Áo len oversize unisex', 13, N'Áo len dệt kim dày dặn, kiểu dáng rộng rãi phong cách Hàn Quốc', CAST(299000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/89ad6db8c5c03674d32481d05089294f', N'active', 0, NULL, CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2)),
(25, N'Túi đeo chéo nữ mini', 59, N'Túi đeo chéo nữ kiểu dáng nhỏ gọn, nhiều ngăn tiện lợi', CAST(210000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/2eaed89d84a8687973c77c12dca9c437', N'active', 0, NULL, CAST(N'2025-02-25T10:10:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:10:00.0000000' AS DateTime2)),
(26, N'Bông tai bạc hình giọt nước', 68, N'Bông tai nữ bạc 925 thiết kế tinh tế hình giọt nước', CAST(129000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljpnnxnegk2xab', N'active', 0, NULL, CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2)),
(27, N'Áo khoác nữ cardigan', 26, N'Áo khoác cardigan dệt kim mỏng nhẹ, kiểu dáng basic', CAST(265000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhnrwk0zfgzv43', N'active', 0, NULL, CAST(N'2025-02-25T10:20:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:20:00.0000000' AS DateTime2)),
(28, N'Dép lào nam cao cấp', 70, N'Dép lào nam chất liệu cao su bền bỉ, đế chống trượt', CAST(155000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/1000306633/product/05__18__3c36ca9e22124cfcb03a94be6ff34c5c_1024x1024.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2)),
(29, N'Áo thun trẻ em hoạt hình', 53, N'Áo thun cotton in họa tiết hoạt hình dễ thương cho bé', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lje0s29p95d8d2', N'active', 0, NULL, CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2)),
(30, N'Nhẫn bạc đính đá zircon', 69, N'Nhẫn bạc 925 đính đá zircon sang trọng', CAST(199000.00 AS Decimal(10, 2)), CAST(230000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-ljxk7oa9kxoz7e', N'active', 0, NULL, CAST(N'2025-02-25T10:35:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:35:00.0000000' AS DateTime2)),
(31, N'Chân váy xếp ly dáng ngắn', 50, N'Chân váy xếp ly dáng tennis, phong cách Hàn Quốc', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lkhunb8lfqlc03', N'active', 0, NULL, CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2)),
(32, N'Quần kaki nam dáng suông', 11, N'Quần kaki nam dáng suông basic, chất vải cao cấp', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/03341df4624a5884c1af2265c251f5b6', N'active', 0, NULL, CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2));
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO

-- Thêm màu sắc cho các sản phẩm mới
SET IDENTITY_INSERT [dbo].[product_colors] ON
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES 
(26, 13, N'Đen'),
(27, 13, N'Navy'),
(28, 13, N'Xanh olive'),
(29, 14, N'Đen'),
(30, 14, N'Xám'),
(31, 14, N'Xanh đậm'),
(32, 15, N'Trắng họa tiết hoa xanh'),
(33, 15, N'Hồng họa tiết hoa trắng'),
(34, 16, N'Trắng'),
(35, 16, N'Đen'),
(36, 16, N'Xám'),
(37, 17, N'Hồng pastel'),
(38, 17, N'Tím lavender'),
(39, 18, N'Đen'),
(40, 18, N'Xám'),
(41, 18, N'Xanh navy'),
(42, 19, N'Bạc'),
(43, 19, N'Vàng hồng'),
(44, 20, N'Đen'),
(45, 20, N'Kem'),
(46, 20, N'Đỏ đô'),
(47, 21, N'Đen'),
(48, 21, N'Nâu'),
(49, 21, N'Vàng gold'),
(50, 22, N'Trắng sọc xanh'),
(51, 22, N'Trắng sọc đen'),
(52, 22, N'Xanh nhạt sọc trắng'),
(53, 23, N'Xanh đậm'),
(54, 23, N'Đen'),
(55, 23, N'Xanh nhạt'),
(56, 24, N'Kem'),
(57, 24, N'Xám'),
(58, 24, N'Nâu'),
(59, 25, N'Đen'),
(60, 25, N'Hồng'),
(61, 25, N'Kem'),
(62, 26, N'Bạc'),
(63, 26, N'Vàng hồng'),
(64, 27, N'Kem'),
(65, 27, N'Xanh mint'),
(66, 27, N'Hồng nhạt'),
(67, 28, N'Đen'),
(68, 28, N'Nâu'),
(69, 29, N'Trắng họa tiết'),
(70, 29, N'Xanh da trời họa tiết'),
(71, 29, N'Vàng họa tiết'),
(72, 30, N'Bạc'),
(73, 30, N'Vàng hồng'),
(74, 31, N'Đen'),
(75, 31, N'Xám'),
(76, 31, N'Kẻ caro'),
(77, 32, N'Be'),
(78, 32, N'Xanh navy'),
(79, 32, N'Đen');
GO
SET IDENTITY_INSERT [dbo].[product_colors] OFF
GO

-- Thêm kích thước cho các sản phẩm mới
SET IDENTITY_INSERT [dbo].[product_sizes] ON
GO
-- Áo khoác bomber nam
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES 
(42, 13, N'S'),
(43, 13, N'M'),
(44, 13, N'L'),
(45, 13, N'XL'),
-- Quần jogger thể thao
(46, 14, N'S'),
(47, 14, N'M'),
(48, 14, N'L'),
(49, 14, N'XL'),
-- Đầm maxi hoa nhí
(50, 15, N'S'),
(51, 15, N'M'),
(52, 15, N'L'),
-- Áo thun unisex
(53, 16, N'S'),
(54, 16, N'M'),
(55, 16, N'L'),
(56, 16, N'XL'),
-- Váy công chúa cho bé gái
(57, 17, N'2-4'),
(58, 17, N'4-6'),
(59, 17, N'6-8'),
-- Balo nam thời trang
(60, 18, N'Onesize'),
-- Dây chuyền bạc nữ
(61, 19, N'40cm'),
(62, 19, N'45cm'),
(63, 19, N'50cm'),
-- Giày cao gót nữ
(64, 20, N'35'),
(65, 20, N'36'),
(66, 20, N'37'),
(67, 20, N'38'),
(68, 20, N'39'),
-- Kính mát thời trang
(69, 21, N'Onesize'),
-- Áo sơ mi nam kẻ sọc
(70, 22, N'S'),
(71, 22, N'M'),
(72, 22, N'L'),
(73, 22, N'XL'),
-- Quần jean skinny nữ
(74, 23, N'S'),
(75, 23, N'M'),
(76, 23, N'L'),
(77, 23, N'XL'),
-- Áo len oversize unisex
(78, 24, N'S'),
(79, 24, N'M'),
(80, 24, N'L'),
(81, 24, N'XL'),
-- Túi đeo chéo nữ mini
(82, 25, N'Onesize'),
-- Bông tai bạc hình giọt nước
(83, 26, N'Onesize'),
-- Áo khoác nữ cardigan
(84, 27, N'S'),
(85, 27, N'M'),
(86, 27, N'L'),
-- Dép lào nam cao cấp
(87, 28, N'39'),
(88, 28, N'40'),
(89, 28, N'41'),
(90, 28, N'42'),
(91, 28, N'43'),
-- Áo thun trẻ em hoạt hình
(92, 29, N'2-4'),
(93, 29, N'4-6'),
(94, 29, N'6-8'),
(95, 29, N'8-10'),
-- Nhẫn bạc đính đá zircon
(96, 30, N'5'),
(97, 30, N'6'),
(98, 30, N'7'),
(99, 30, N'8'),
-- Chân váy xếp ly dáng ngắn
(100, 31, N'S'),
(101, 31, N'M'),
(102, 31, N'L'),
-- Quần kaki nam dáng suông
(103, 32, N'28'),
(104, 32, N'30'),
(105, 32, N'32'),
(106, 32, N'34'),
(107, 32, N'36');
GO
SET IDENTITY_INSERT [dbo].[product_sizes] OFF
GO

-- Thêm biến thể sản phẩm (variants) với số lượng tồn kho
SET IDENTITY_INSERT [dbo].[product_variants] ON
GO
-- Áo khoác bomber nam
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES 
(88, 13, 42, 26, 40, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(89, 13, 43, 26, 60, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(90, 13, 44, 26, 50, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(91, 13, 45, 26, 30, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(92, 13, 42, 27, 35, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(93, 13, 43, 27, 55, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(94, 13, 44, 27, 45, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(95, 13, 45, 27, 25, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(96, 13, 42, 28, 30, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(97, 13, 43, 28, 50, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(98, 13, 44, 28, 40, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),
(99, 13, 45, 28, 20, CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2)),

-- Quần jogger thể thao
(100, 14, 46, 29, 45, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(101, 14, 47, 29, 65, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(102, 14, 48, 29, 55, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(103, 14, 49, 29, 35, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(104, 14, 46, 30, 40, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(105, 14, 47, 30, 60, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(106, 14, 48, 30, 50, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(107, 14, 49, 30, 30, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(108, 14, 46, 31, 35, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(109, 14, 47, 31, 55, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(110, 14, 48, 31, 45, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),
(111, 14, 49, 31, 25, CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2)),

-- Đầm maxi hoa nhí
(112, 15, 50, 32, 30, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(113, 15, 51, 32, 45, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(114, 15, 52, 32, 25, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(115, 15, 50, 33, 35, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(116, 15, 51, 33, 50, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(117, 15, 52, 33, 30, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),

-- Áo thun unisex
(118, 16, 53, 34, 50, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(119, 16, 54, 34, 70, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(120, 16, 55, 34, 60, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(121, 16, 56, 34, 40, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(122, 16, 53, 35, 55, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(123, 16, 54, 35, 75, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(124, 16, 55, 35, 65, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(125, 16, 56, 35, 45, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(126, 16, 53, 36, 45, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(127, 16, 54, 36, 65, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(128, 16, 55, 36, 55, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),
(129, 16, 56, 36, 35, CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2)),

-- Váy công chúa cho bé gái
(130, 17, 57, 37, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(131, 17, 58, 37, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(132, 17, 59, 37, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(133, 17, 57, 38, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(134, 17, 58, 38, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(135, 17, 59, 38, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Balo nam thời trang
(136, 18, 60, 39, 60, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(137, 18, 60, 40, 65, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(138, 18, 60, 41, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Dây chuyền bạc nữ
(139, 19, 61, 42, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(140, 19, 62, 42, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(141, 19, 63, 42, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(142, 19, 61, 43, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(143, 19, 62, 43, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(144, 19, 63, 43, 15, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Giày cao gót nữ
(145, 20, 64, 44, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(146, 20, 65, 44, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(147, 20, 66, 44, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(148, 20, 67, 44, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(149, 20, 68, 44, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(150, 20, 64, 45, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(151, 20, 65, 45, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(152, 20, 66, 45, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(153, 20, 67, 45, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(154, 20, 68, 45, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(155, 20, 64, 46, 15, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(156, 20, 65, 46, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(157, 20, 66, 46, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(158, 20, 67, 46, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(159, 20, 68, 46, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Kính mát thời trang
(160, 21, 69, 47, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(161, 21, 69, 48, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(162, 21, 69, 49, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Áo sơ mi nam kẻ sọc
(163, 22, 70, 50, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(164, 22, 71, 50, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(165, 22, 72, 50, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(166, 22, 73, 50, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(167, 22, 70, 51, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(168, 22, 71, 51, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(169, 22, 72, 51, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(170, 22, 73, 51, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(171, 22, 70, 52, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(172, 22, 71, 52, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(173, 22, 72, 52, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(174, 22, 73, 52, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Quần jean skinny nữ
(175, 23, 74, 53, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(176, 23, 75, 53, 60, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(177, 23, 76, 53, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(178, 23, 77, 53, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(179, 23, 74, 54, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(180, 23, 75, 54, 65, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(181, 23, 76, 54, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(182, 23, 77, 54, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(183, 23, 74, 55, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(184, 23, 75, 55, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(185, 23, 76, 55, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(186, 23, 77, 55, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Áo len oversize unisex
(187, 24, 78, 56, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(188, 24, 79, 56, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(189, 24, 80, 56, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(190, 24, 81, 56, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(191, 24, 78, 57, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(192, 24, 79, 57, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(193, 24, 80, 57, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(194, 24, 81, 57, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(195, 24, 78, 58, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(196, 24, 79, 58, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(197, 24, 80, 58, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(198, 24, 81, 58, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Túi đeo chéo nữ mini
(199, 25, 82, 59, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(200, 25, 82, 60, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(201, 25, 82, 61, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Bông tai bạc hình giọt nước
(202, 26, 83, 62, 60, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(203, 26, 83, 63, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Áo khoác nữ cardigan
(204, 27, 84, 64, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(205, 27, 85, 64, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(206, 27, 86, 64, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(207, 27, 84, 65, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(208, 27, 85, 65, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(209, 27, 86, 65, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(210, 27, 84, 66, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(211, 27, 85, 66, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(212, 27, 86, 66, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Dép lào nam cao cấp
(213, 28, 87, 67, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(214, 28, 88, 67, 60, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(215, 28, 89, 67, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(216, 28, 90, 67, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(217, 28, 91, 67, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(218, 28, 87, 68, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(219, 28, 88, 68, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(220, 28, 89, 68, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(221, 28, 90, 68, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(222, 28, 91, 68, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Áo thun trẻ em hoạt hình
(223, 29, 92, 69, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(224, 29, 93, 69, 65, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(225, 29, 94, 69, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(226, 29, 95, 69, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(227, 29, 92, 70, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(228, 29, 93, 70, 60, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(229, 29, 94, 70, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(230, 29, 95, 70, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(231, 29, 92, 71, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(232, 29, 93, 71, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(233, 29, 94, 71, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(234, 29, 95, 71, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Nhẫn bạc đính đá zircon
(235, 30, 96, 72, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(236, 30, 97, 72, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(237, 30, 98, 72, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(238, 30, 99, 72, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(239, 30, 96, 73, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(240, 30, 97, 73, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(241, 30, 98, 73, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(242, 30, 99, 73, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Chân váy xếp ly dáng ngắn
(243, 31, 100, 74, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(244, 31, 101, 74, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(245, 31, 102, 74, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(246, 31, 100, 75, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(247, 31, 101, 75, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(248, 31, 102, 75, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(249, 31, 100, 76, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(250, 31, 101, 76, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(251, 31, 102, 76, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),

-- Quần kaki nam dáng suông
(252, 32, 103, 77, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(253, 32, 104, 77, 60, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(254, 32, 105, 77, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(255, 32, 106, 77, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(256, 32, 107, 77, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(257, 32, 103, 78, 40, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(258, 32, 104, 78, 55, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(259, 32, 105, 78, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(260, 32, 106, 78, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(261, 32, 107, 78, 25, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(262, 32, 103, 79, 35, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(263, 32, 104, 79, 50, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(264, 32, 105, 79, 45, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(265, 32, 106, 79, 30, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2)),
(266, 32, 107, 79, 20, CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2));
GO
SET IDENTITY_INSERT [dbo].[product_variants] OFF
GO