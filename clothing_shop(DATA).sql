﻿USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'admin123', N'tphong610198@gmail.com', N'$2a$12$CuXL88lRV.caI3o.5ZB/wOM3mUPxEeVp7PnUYC9Tu6iefOfhTlfxO', N'Admin', N'male', N'0123456789', N'uploads/avatars/bb5cb37c-fb96-4a04-a5d6-7bd5732bf5b0.jpg', N'admin', N'active', CAST(N'2025-02-09T16:58:16.1666667' AS DateTime2), CAST(N'2025-02-09T17:12:48.3000000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (2, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$mqTbeXOjwWftYcp3HvgbF.vynnSvUqQfBUY6wj7m7m/tiEnv/YYA6', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLrSqjCMqEhVL5SMILJ6OOpPyI5S64iKP29HhPEV9aIOgF0i-g=s96-c', N'customer', N'active', CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2), CAST(N'2025-02-09T17:02:23.6133333' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (3, N'marketing123', N'huy412004@gmail.com', N'$2a$10$sYcqeKA5lzaWHHEHojLoxe378EtZni5873xBA8YfljCthxCADhmoy', N'Marketing', N'male', N'0987654321', N'uploads/avatars/huannhi.jpg', N'marketing', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (4, N'user123', N'user123@gmail.com', N'$2a$10$XFl8Zk5zSXQo/PjN4df.k.twXuumSIvYM7jLRqVcvx2heTFVyW0Ca', N'Khách 1', N'male', N'0912345678', N'uploads/avatars/duoclao.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (5, N'sale123', N'sale123@gmail.com', N'$2a$10$ojVPuuE5ZVLPE/wWOSRFIeNKLkBZh/CZeHE57ij4F.cfKYsdmIxAO', N'Sale', N'male', N'0978123456', N'uploads/avatars/tieuviem.jpg', N'sale', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (6, N'user321', N'user321@gmail.com', N'$2a$10$7d0sV4kA8mSbQoJhGmROJumQnBeqtpzzMxz7yslGGf5Z1lhx85M7O', N'Khách 2', N'male', N'0934567890', N'uploads/avatars/default.jpg', N'customer', N'active', CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2), CAST(N'2025-02-10T03:04:56.3300000' AS DateTime2))
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
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (23, N'datvthe186351', N'datvthe186351@fpt.edu.vn', N'accGoogle$2a$10$h44bRXTsQJQCici5AoAukOA5Ce2fTeBpM6lg/cZ.Nwv.rlR7Jrsi.', N'Vu Tien Dat (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLQS4GRdIkgNSZsWOVpDwwFWXGhLH-yQipv1mlpgBm2-tQ_Af4=s96-c', N'customer', N'active', CAST(N'2025-03-29T03:29:25.0933333' AS DateTime2), CAST(N'2025-03-29T03:29:25.0933333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (1, 1, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (2, 2, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (3, 3, CAST(N'2025-02-21T18:35:43.8400000' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (4, 23, CAST(N'2025-03-29T03:29:25.1166667' AS DateTime2))
GO
INSERT [dbo].[cart] ([id], [user_id], [created_at]) VALUES (5, 4, CAST(N'2025-03-29T03:31:52.8700000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
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
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (6, N'Áo nam', N'Các loại áo cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (7, N'Quần nam', N'Các loại quần cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (8, N'Áo nữ', N'Các loại áo cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (9, N'Váy & Chân váy', N'Các loại váy và chân váy', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (10, N'Quần jean nam', N'Quần jean các loại', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (11, N'Quần kaki nam', N'Quần kaki lịch lãm', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (12, N'Áo sơ mi nam', N'Áo sơ mi công sở', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (13, N'Áo thun nam', N'Áo thun cotton', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (14, N'Đầm dự tiệc', N'Đầm dài, đầm body', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (15, N'Áo sơ mi nữ', N'Áo sơ mi công sở', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (16, N'Áo thun nữ', N'Áo thun cotton', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (17, N'Váy maxi', N'Váy maxi dài', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (18, N'Giày thể thao', N'Các loại giày thể thao', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (19, N'Giày da', N'Các loại giày da', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (20, N'Sandal', N'Các loại sandal', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (21, N'Túi xách nữ', N'Các loại túi xách cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (22, N'Túi xách nam', N'Các loại túi xách cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (23, N'Thắt lưng nam', N'Thắt lưng cho nam', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (24, N'Thắt lưng nữ', N'Thắt lưng cho nữ', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (25, N'Áo khoác nam', N'Áo khoác dù, bomber', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (26, N'Áo khoác nữ', N'Áo khoác dù, bomber', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (27, N'Quần short nam', N'Quần short kaki, jean', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (28, N'Quần short nữ', N'Quần short kaki, jean', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (29, N'Giày Sneaker Nam', N'Giày Sneaker Nam', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (30, N'Giày Sneaker Nữ', N'Giày Sneaker Nữ', 18, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (31, N'Giày Tây Nam', N'Giày Tây Nam', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (32, N'Giày Cao Gót', N'Giày Cao Gót', 19, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (33, N'Sandal Nam', N'Sandal Nam', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (34, N'Sandal Nữ', N'Sandal Nữ', 20, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (35, N'Túi đeo chéo nam', N'Túi đeo chéo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (36, N'Túi xách tay nữ', N'Túi xách tay nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (37, N'Đồ bộ nam', N'Các loại đồ bộ cho nam', 1, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (38, N'Đồ bộ nữ', N'Các loại đồ bộ cho nữ', 2, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (39, N'Áo trẻ em', N'Các loại áo cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (40, N'Quần trẻ em', N'Các loại quần cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (41, N'Váy trẻ em', N'Các loại váy cho trẻ em', 3, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (42, N'Kính mắt', N'Các loại kính thời trang', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (43, N'Trang sức', N'Các loại trang sức', 4, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (44, N'Dép', N'Các loại dép', 5, 2, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (45, N'Áo vest nam', N'Áo vest lịch lãm', 6, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (46, N'Quần tây nam', N'Quần tây công sở', 7, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (47, N'Đồ bộ thể thao nam', N'Đồ bộ thể thao nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (48, N'Đồ bộ mặc nhà nam', N'Đồ bộ mặc nhà nam', 37, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (49, N'Áo kiểu nữ', N'Áo kiểu thời trang', 8, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (50, N'Chân váy', N'Chân váy các loại', 9, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (51, N'Đồ bộ thể thao nữ', N'Đồ bộ thể thao nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (52, N'Đồ bộ mặc nhà nữ', N'Đồ bộ mặc nhà nữ', 38, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (53, N'Áo thun trẻ em', N'Áo thun trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (54, N'Áo sơ mi trẻ em', N'Áo sơ mi trẻ em', 39, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (55, N'Quần jean trẻ em', N'Quần jean trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (56, N'Quần short trẻ em', N'Quần short trẻ em', 40, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (57, N'Váy xòe trẻ em', N'Váy xòe trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (58, N'Đầm công chúa trẻ em', N'Đầm công chúa trẻ em', 41, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (59, N'Túi đeo chéo nữ', N'Túi đeo chéo nữ', 21, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (60, N'Balo nam', N'Balo nam', 22, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (61, N'Thắt lưng da nam', N'Thắt lưng da nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (62, N'Thắt lưng vải nam', N'Thắt lưng vải nam', 23, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (63, N'Thắt lưng da nữ', N'Thắt lưng da nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (64, N'Thắt lưng vải nữ', N'Thắt lưng vải nữ', 24, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (65, N'Kính râm', N'Kính râm', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (66, N'Kính cận', N'Kính cận', 42, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (67, N'Dây chuyền', N'Dây chuyền', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (68, N'Bông tai', N'Bông tai', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (69, N'Nhẫn', N'Nhẫn', 43, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (70, N'Dép lào nam', N'Dép lào nam', 44, 3, N'active')
GO
INSERT [dbo].[categories] ([id], [name], [description], [parent_id], [level], [status]) VALUES (71, N'Dép quai ngang nữ', N'Dép quai ngang nữ', 44, 3, N'active')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (1, N'Áo sơ mi trắng', 12, N'Áo sơ mi trắng phong cách, phù hợp với mọi dịp', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/1000333436/product/tx_03696_da789ffaa68d42d3b2ad129b099e15ae_master.jpg', N'active', 1, N'1', CAST(N'2024-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (2, N'Quần tây đen', 46, N'Quần tây màu đen lịch lãm, phù hợp cho công sở', CAST(280000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000053174/product/20_bddc67b2b01a4fc6a89b6d5ca1e78b33_master.jpg', N'active', 0, NULL, CAST(N'2024-03-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (3, N'Đầm hoa mùa hè', 14, N'Đầm hoa nhẹ nhàng, thoải mái, phù hợp cho mùa hè', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'active', 0, NULL, CAST(N'2024-04-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (4, N'Chân váy denim', 50, N'Chân váy denim thời trang, dễ phối đồ', CAST(220000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2024-05-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (5, N'Áo thun siêu nhân', 53, N'Áo thun với họa tiết siêu nhân, dành cho trẻ em', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5?wid=800&hei=800&qlt=80&fmt=webp', N'active', 1, N'2', CAST(N'2024-05-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (6, N'Quần short cotton', 56, N'Quần short cotton mềm mại, thoáng mát', CAST(100000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'https://ardilla.com.vn/wp-content/uploads/2022/03/TB1601QST.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2024-06-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (7, N'Thắt lưng da', 61, N'Thắt lưng da cao cấp, bền đẹp theo thời gian', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://authenticvietnam.vn/wp-content/uploads/that-lung-da-gucci-nam-406831DJ20T_2145_001_100_0000_Light-Leather-belt-with-Double-G-buckle.jpg', N'active', 0, NULL, CAST(N'2024-07-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (8, N'Thắt lưng da', 61, N'Thắt lưng da cao cấp, bền đẹp theo thời gian', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://babuhandmade.com/wp-content/uploads/2022/01/that-lung-da-day-that-lung-nam-that-lung-nam-dep-that-lung-da-bo-that-lung-da-nam-that-lung-nam-da-bo-mua-that-lung-nam-day-that-lung-da-bo-xin-leather-belts-belts-belt-for-men-buckle-belt-1.jpg', N'EOStock', 0, NULL, CAST(N'2024-08-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (9, N'Giày thể thao', 29, N'Giày thể thao nhẹ nhàng, phù hợp cho cả nam và nữ', CAST(450000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/22/z5855779313414_2914371405362ca7f474791328971969.jpg', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2024-09-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (10, N'Giày sneaker', 30, N'Giày sneaker thời trang, phù hợp cho đi chơi', CAST(350000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/thumb/large/100/041/044/products/48f5343d-9f9a-4ed2-aa02-de2ad1f4fabc-jpeg.jpg?v=1694597357733', N'active', 0, NULL, CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (11, N'Quần short siêu nhân', 56, N'Quần short với họa tiết siêu nhân, dành cho trẻ em', CAST(480000.00 AS Decimal(10, 2)), CAST(550000.00 AS Decimal(10, 2)), N'https://img.alicdn.com/imgextra/i3/350427093/O1CN01JDrMyz22GdnbaZ9Y6_!!350427093.jpg_600x600.jpg_.webp', N'active', 0, N'2', CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2), CAST(N'2025-02-10T05:35:14.1666667' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (12, N'Áo sơ mi xanh', 12, N'Áo sơ mi xanh phong cách, phù hợp với mọi dịp', CAST(180000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://pos.nvncdn.com/a36e05-151378/ps/20230712_TkKQqMtkUO.jpeg', N'active', 0, N'1', CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2), CAST(N'2025-02-10T08:08:36.0633333' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (13, N'Áo khoác bomber nam', 25, N'Áo khoác bomber phong cách thể thao, chống gió tốt', CAST(399000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), N'https://ginstore.com.vn/files/sanpham/1885/1/png/ao-khoac-bomber-local-brand-rg-butterfly-varsity-jacket-nam-nu-tay-da-vasity-bong-chay-form-rong-unisex.png', N'active', 0, NULL, CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (14, N'Quần jogger thể thao', 27, N'Quần jogger co giãn, thoải mái khi vận động', CAST(199000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://thegioidotap.vn/wp-content/uploads/2020/12/quan-dai-the-thao-nam-jogger-sg10-3.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (15, N'Đầm maxi hoa nhí', 17, N'Đầm maxi dài họa tiết hoa nhí, phong cách boho', CAST(375000.00 AS Decimal(10, 2)), CAST(420000.00 AS Decimal(10, 2)), N'https://vayfashion.com/wp-content/uploads/2022/05/2c7cf97edbac2d98f120bf85c824f1aa.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:25:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (16, N'Áo thun unisex', 16, N'Áo thun form rộng, unisex, phong cách đường phố', CAST(150000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://sure.vn/wp-content/uploads/2024/08/7-1-scaled.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (17, N'Váy công chúa cho bé gái', 58, N'Váy công chúa lấp lánh cho bé gái, phù hợp dự tiệc', CAST(289000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://tutupetti.com/wp-content/uploads/2023/07/dam_dep_cho_be_du_tiec_04.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:35:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (18, N'Balo nam thời trang', 60, N'Balo nam chống nước, nhiều ngăn, phù hợp đi học, đi làm', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://gubag.vn/wp-content/uploads/2021/07/balo-nam-thoi-trang-gb-bl14-xd.webp', N'active', 0, NULL, CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:40:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (19, N'Dây chuyền bạc nữ', 67, N'Dây chuyền bạc 925 thiết kế tinh tế, sang trọng', CAST(225000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://pos.nvncdn.com/211f76-106986/ps/20240805_RdCu2zj3rc.jpeg', N'active', 0, NULL, CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (20, N'Giày cao gót nữ', 32, N'Giày cao gót 7cm, mũi nhọn, phù hợp công sở', CAST(330000.00 AS Decimal(10, 2)), CAST(380000.00 AS Decimal(10, 2)), N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/20/z5850479583248_27cb755c82bd913bc95a09019f771777.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:50:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (21, N'Kính mát thời trang', 65, N'Kính mát chống tia UV, gọng kim loại sành điệu', CAST(175000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), N'https://hoyahc.vn/wp-content/uploads/2022/01/kinh-redex-kinh-mat.jpg', N'active', 0, NULL, CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2), CAST(N'2025-02-24T10:55:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (22, N'Áo sơ mi nam kẻ sọc', 12, N'Áo sơ mi nam kẻ sọc, chất vải cotton thoáng mát', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://aoxuanhe.com/upload/product/axh-111/ao-so-mi-nam-ke-soc-xanh-duong-1.jpg', N'active', 0, NULL, CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2), CAST(N'2025-02-24T11:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (23, N'Quần jean skinny nữ', 28, N'Quần jean skinny co giãn cao, ôm sát tôn dáng', CAST(279000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/100/386/478/products/b51045-xanhdam4-1695718398227.jpg?v=1695718423327', N'active', 0, NULL, CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (24, N'Áo len oversize unisex', 13, N'Áo len dệt kim dày dặn, kiểu dáng rộng rãi phong cách Hàn Quốc', CAST(299000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000923713/product/upload_1b135183cd3f4e1da78e48ce8e4404bd_master.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:05:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (25, N'Túi đeo chéo nữ mini', 59, N'Túi đeo chéo nữ kiểu dáng nhỏ gọn, nhiều ngăn tiện lợi', CAST(210000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), N'https://image.kacana.vn/images/product/tui-cheo-dung-dien-thoai-va-tien-you-2811-1720436440.jpg', N'active', 0, NULL, CAST(N'2024-11-25T10:10:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:10:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (26, N'Bông tai bạc hình giọt nước', 68, N'Bông tai nữ bạc 925 thiết kế tinh tế hình giọt nước', CAST(129000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://lili.vn/wp-content/uploads/2021/12/Bong-tai-bac-nu-ma-bach-kim-dinh-da-CZ-hinh-giot-nuoc-LILI_416496_13.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (27, N'Áo khoác nữ cardigan', 26, N'Áo khoác cardigan dệt kim mỏng nhẹ, kiểu dáng basic', CAST(265000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), N'https://bizweb.dktcdn.net/thumb/1024x1024/100/119/564/products/ao-khoac-nu-han-quoc-4476.jpg?v=1726800949063', N'active', 0, NULL, CAST(N'2024-12-25T10:20:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (28, N'Dép lào nam cao cấp', 70, N'Dép lào nam chất liệu cao su bền bỉ, đế chống trượt', CAST(155000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), N'https://cf.shopee.vn/file/c6d1c6eb69fc0f5b382006d61baf5856', N'active', 0, NULL, CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:25:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (29, N'Áo thun trẻ em hoạt hình', 53, N'Áo thun cotton in họa tiết hoạt hình dễ thương cho bé', CAST(120000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'https://product.hstatic.net/1000387570/product/ao_sieu_nhan_dai_tay_be_trai_xanh_1_29b6db9d6dab4e649d6d1528a1cef68d_master.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (30, N'Nhẫn bạc đính đá zircon', 69, N'Nhẫn bạc 925 đính đá zircon sang trọng', CAST(199000.00 AS Decimal(10, 2)), CAST(230000.00 AS Decimal(10, 2)), N'https://lili.vn/wp-content/uploads/2021/08/Nhan-bac-dinh-da-Zircon-Royal-LILI_499436_2.jpg', N'active', 0, NULL, CAST(N'2025-02-25T10:35:00.0000000' AS DateTime2), CAST(N'2025-01-25T10:35:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (31, N'Chân váy xếp ly dáng ngắn', 50, N'Chân váy xếp ly dáng tennis, phong cách Hàn Quốc', CAST(245000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)), N'https://down-vn.img.susercontent.com/file/55791d774c509649738b1bb8aba06a7d', N'active', 0, NULL, CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:40:00.0000000' AS DateTime2))
GO
INSERT [dbo].[products] ([id], [title], [category_id], [description], [original_price], [sale_price], [thumbnail], [status], [is_combo], [combo_group_id], [created_at], [updated_at]) VALUES (32, N'Quần kaki nam', 11, N'Quần kaki nam dáng suông basic, chất vải cao cấp', CAST(299000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), N'https://vulcano.sgp1.digitaloceanspaces.com/media/18894/quan-khaki-3001t-vulcano01.webp', N'active', 0, NULL, CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2), CAST(N'2025-02-25T10:45:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[product_sizes] ON 
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (1, 1, N'M')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (2, 2, N'32')
GO
INSERT [dbo].[product_sizes] ([id], [product_id], [size]) VALUES (3, 3, N'S')
GO
SET IDENTITY_INSERT [dbo].[product_sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[product_colors] ON 
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (1, 1, N'Trắng')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (2, 2, N'Đen')
GO
INSERT [dbo].[product_colors] ([id], [product_id], [color]) VALUES (3, 3, N'Hoa')
GO
SET IDENTITY_INSERT [dbo].[product_colors] OFF
GO
SET IDENTITY_INSERT [dbo].[product_variants] ON 
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (1, 1, 1, 1, 50, NULL)
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (2, 2, 2, 2, 30, NULL)
GO
INSERT [dbo].[product_variants] ([id], [product_id], [size_id], [color_id], [stock_quantity], [last_restock_date]) VALUES (3, 3, 3, 3, 20, NULL)
GO
SET IDENTITY_INSERT [dbo].[product_variants] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (1, 1, 1, 1, 2)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (2, 2, 2, 2, 1)
GO
INSERT [dbo].[cart_items] ([id], [cart_id], [product_id], [variant_id], [quantity]) VALUES (3, 3, 3, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[posts] ON 
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (1, N'Xu hướng thời trang mùa xuân 2025', N'https://mcdn.coolmate.me/image/December2022/xu-huong-thoi-trang-xuan-he-2023-805_866.jpg', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững...', N'Mùa xuân năm 2025 là thời trang màu sắc nổi bật và bền vững. Mùa này mang đến góc nhìn mới mẻ về phong cách cổ điển với sự nhấn mạnh vào vật liệu thân thiện với môi trường và những món đồ đa năng có thể tạo kiểu theo nhiều cách. Các xu hướng chính bao gồm chủ nghĩa tối giản màu pastel, áo khoác oversize và denim bền vững.', 3, 1, N'published', CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2), CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (2, N'Làm thế nào để xây dựng một tủ quần áo con nhộng', N'https://songxanhsongkhoe.vn/wp-content/uploads/2020/11/co-gai-dung-truoc-tu-quan-an-va-sap-xep-tu-do-con-nhong-1-1024x683.jpg', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai...', N'Tủ quần áo con nhộng là giải pháp hoàn hảo cho những ai muốn giảm thiểu quần áo trong khi vẫn tối đa hóa các lựa chọn về phong cách. Hướng dẫn toàn diện này sẽ hướng dẫn bạn cách lựa chọn những món đồ thiết yếu, phối hợp màu sắc và chuyển mùa.', 3, 1, N'published', CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2), CAST(N'2024-01-20T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (3, N'Thời trang bền vững: Hướng dẫn đầy đủ', N'https://tse1.mm.bing.net/th?id=OIP.jBJ4gAN070RxCwsuzGaMZAHaFF&pid=Api&P=0&h=180', N'Thời trang bền vững không chỉ là một xu hướng - mà còn...', N'Thời trang bền vững không chỉ là một xu hướng - mà còn là điều cần thiết cho tương lai của hành tinh chúng ta. Tìm hiểu về vật liệu thân thiện với môi trường, quy trình sản xuất có đạo đức và cách đưa ra những lựa chọn bền vững hơn khi mua thời trang.', 3, 0, N'published', CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2), CAST(N'2024-01-25T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (4, N'Xu hướng màu sắc cho mùa hè năm 2025', N'https://cdn.vuahanghieu.com/unsafe/1200x0/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/news/2021/10/15-xu-huong-mau-sac-thoi-trang-trend-mua-thu-dong-2021-06102021134538.jpg', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ...', N'Mùa hè năm 2025 đánh dấu sự trở lại mạnh mẽ của phong cách cổ điển trong thời trang, khi các xu hướng từ thập kỷ trước được tái hiện với những biến tấu hiện đại, tạo nên sự giao thoa độc đáo giữa quá khứ và hiện tại. Bên cạnh đó, bảng màu của mùa hè năm nay cũng vô cùng rực rỡ và đa dạng, phản ánh sự kết nối giữa con người và thiên nhiên. Những gam màu nổi bật bao gồm Future Dusk – sắc xanh lam đậm đầy bí ẩn, Transcendent Pink – hồng nhẹ nhàng thể hiện sự tinh tế, Aquatic Awe – xanh ngọc bích tươi mát như đại dương, Sunset Coral – cam san hô ấm áp như ánh hoàng hôn, và Ray Flower – vàng rực rỡ tràn đầy năng lượng. Sự kết hợp giữa phong cách cổ điển và bảng màu ấn tượng này không chỉ tạo nên những bộ trang phục vừa hoài cổ vừa hiện đại mà còn mang đến cảm giác tin cậy, ổn định trong một thế giới đang không ngừng thay đổi.', 3, 1, N'published', CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-01T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (5, N'Phụ kiện 101: Hướng dẫn đầy đủ', N'https://cf.shopee.vn/file/b849b807196691d47472df6073839200', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc...', N'Tìm hiểu các nguyên tắc cơ bản về phụ kiện, từ việc lựa chọn đồ trang sức phù hợp đến việc lựa chọn túi xách và giày dép phù hợp với trang phục của bạn. Hướng dẫn toàn diện này bao gồm mọi thứ từ những dịp bình thường đến trang trọng.', 3, 0, N'draft', CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2), CAST(N'2024-02-05T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (6, N'Kỹ thuật xếp lớp cho mùa đông', N'https://tiki.vn/blog/wp-content/uploads/2023/03/mix-do-mua-dong-phong-cach-han-quoc.jpg', N'Tìm hiểu cách kết hợp các kết cấu và...', N'Tìm hiểu cách kết hợp các kết cấu và mảnh ghép khác nhau để tạo nên những bộ trang phục mùa đông ấm áp và thời trang. Từ lớp lót giữ nhiệt đến áo khoác nổi bật, chúng tôi sẽ chia nhỏ các kỹ thuật thiết yếu để luôn sang trọng và thoải mái.', 3, 1, N'published', CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2), CAST(N'2024-02-10T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (7, N'Những cải tiến về vải thân thiện với môi trường', N'https://dongphucthanhhung.vn/wp-content/uploads/2023/05/vai-than-thien-voi-moi-truong.jpg', N'Những cải tiến về vải thân thiện với môi trường đang...', N'Những cải tiến về vải thân thiện với môi trường đang trở thành xu hướng quan trọng trong ngành thời trang bền vững. Các chất liệu như sợi tre, vải từ tảo biển, sợi dứa Piñatex hay polyester tái chế (rPET) không chỉ giúp giảm tác động tiêu cực đến môi trường mà còn mang lại sự thoải mái và bền bỉ cho người sử dụng. Bên cạnh đó, công nghệ sản xuất hiện đại đã giúp tối ưu hóa quy trình dệt may, giảm đáng kể lượng nước, hóa chất và rác thải. Những thay đổi này không chỉ hướng tới việc bảo vệ hành tinh mà còn mở ra một tương lai bền vững hơn cho ngành công nghiệp thời trang.', 3, 0, N'published', CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2), CAST(N'2024-02-15T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (8, N'Những vật dụng thiết yếu cho tủ đồ tối giản', N'https://noithatminhkhoi.com/upload/images/xay-dung-tu-quan-ao-toi-gian-cho-nam-gioi-04.jpg', N'Một tủ đồ tối giản không cần quá nhiều...', N'Một tủ đồ tối giản không cần quá nhiều món đồ nhưng vẫn đảm bảo tính linh hoạt và phong cách. Những vật dụng thiết yếu như áo sơ mi trắng, áo thun trơn, quần jeans tối màu hay blazer giúp bạn dễ dàng phối hợp trang phục cho nhiều dịp khác nhau. Bên cạnh đó, một đôi giày thể thao thoải mái và giày da thanh lịch sẽ giúp bạn luôn sẵn sàng cho cả ngày thường lẫn sự kiện quan trọng. Kết hợp với túi xách đa năng và một vài phụ kiện tinh tế, tủ đồ tối giản không chỉ giúp tiết kiệm thời gian mà còn tạo nên vẻ ngoài hiện đại, tinh tế và không bao giờ lỗi mốt.', 3, 1, N'published', CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2), CAST(N'2024-02-20T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (9, N'Sự hồi sinh của thời trang cổ điển', N'https://www.elle.vn/wp-content/uploads/2019/07/19/Su-khac-biet-giua-thoi-trang-phong-cach-vintage-va-retro.jpg', N'Phong cách cổ điển đang quay trở lại mạnh mẽ...', N'Phong cách cổ điển đang quay trở lại mạnh mẽ trong nhiều lĩnh vực như thời trang, nội thất, thiết kế đồ họa và nghệ thuật. Xu hướng này không chỉ đơn thuần là việc tái hiện lại quá khứ mà còn là sự kết hợp giữa nét đẹp truyền thống với yếu tố hiện đại, tạo ra một phong cách tân cổ điển (Neo-Classic) đầy tinh tế.', 1, 0, N'published', CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2), CAST(N'2024-02-25T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (10, N'Quần áo tích hợp công nghệ', N'https://media-cdn-v2.laodong.vn/storage/newsportal/2022/6/14/1056388/Vr-And-Ar-For-Busine.jpg', N'Quần áo tích hợp công nghệ đang trở thành...', N'Quần áo tích hợp công nghệ đang trở thành xu hướng mới trong ngành thời trang, mang lại sự tiện lợi và trải nghiệm hiện đại cho người dùng. Từ áo khoác có khả năng tự điều chỉnh nhiệt độ, vải chống thấm nước nhưng vẫn thoáng khí, đến quần áo thể thao có cảm biến theo dõi sức khỏe, công nghệ đang thay đổi cách chúng ta mặc và sử dụng trang phục hàng ngày. Ngoài ra, các chất liệu thông minh như vải dẫn điện, vải đổi màu theo môi trường hay trang phục có thể kết nối với thiết bị di động đang mở ra một kỷ nguyên mới cho thời trang ứng dụng. Với sự kết hợp giữa thẩm mỹ và công nghệ, quần áo thông minh không chỉ đáp ứng nhu cầu tiện nghi mà còn giúp nâng cao chất lượng cuộc sống.', 3, 1, N'published', CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-01T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (11, N'Mẹo thời trang tiết kiệm', N'https://songkhoeannhien.vn/wp-content/uploads/2023/02/Lua-chon-quan-ao-vai-tot-skan-2000x1333.jpg', N'Thời trang tiết kiệm không có nghĩa...', N'Thời trang tiết kiệm không có nghĩa là phải từ bỏ phong cách, mà ngược lại, bạn có thể vẫn sành điệu mà không tốn quá nhiều chi phí. Trước tiên, hãy đầu tư vào những món đồ cơ bản và dễ phối như áo sơ mi trắng, quần jeans và blazer – những item không bao giờ lỗi mốt. Thứ hai, săn sale thông minh bằng cách theo dõi các đợt giảm giá lớn hoặc mua sắm tại các cửa hàng second-hand, nơi bạn có thể tìm được nhiều món đồ độc đáo với giá rẻ. Ngoài ra, học cách mix & match giúp bạn tận dụng tối đa tủ đồ mà không cần mua sắm liên tục. Cuối cùng, bảo quản quần áo đúng cách sẽ giúp chúng bền hơn, giúp bạn tiết kiệm chi phí thay thế. Với những mẹo này, bạn hoàn toàn có thể xây dựng phong cách riêng mà không cần tiêu tốn quá nhiều tiền.', 3, 0, N'published', CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-05T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (12, N'Ảnh hưởng của văn hóa trong thời trang', N'https://aodaivietnam.vceo.vn/images/upload/images/a8-1400520557-700x0-1400555235_680x0.jpg', N'Văn hóa ảnh hưởng sâu sắc đến thời trang,...', N'Văn hóa ảnh hưởng sâu sắc đến thời trang, từ trang phục truyền thống đến xu hướng hiện đại. Mỗi nền văn hóa mang đến những màu sắc, họa tiết và kiểu dáng đặc trưng, giúp định hình phong cách thời trang đa dạng. Bên cạnh đó, âm nhạc, nghệ thuật và phong trào xã hội cũng góp phần tạo ra những xu hướng mới. Sự giao thoa giữa các nền văn hóa trong thời đại toàn cầu hóa giúp thời trang ngày càng phong phú, kết hợp giữa truyền thống và hiện đại, góp phần lan tỏa giá trị văn hóa trên toàn thế giới.', 3, 1, N'published', CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2), CAST(N'2024-03-10T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (13, N'Thiết kế giày bền vững', N'https://static.ybox.vn/2015/08/c55b53fec37cc226e1ed8ffeb10d7f33.jpg', N'Thiết kế giày bền vững đang trở thành...', N'Thiết kế giày bền vững đang trở thành xu hướng quan trọng trong ngành thời trang, hướng đến việc giảm thiểu tác động tiêu cực đến môi trường. Các thương hiệu ngày càng chú trọng sử dụng vật liệu tái chế, hữu cơ hoặc có khả năng phân hủy sinh học như da thực vật, nhựa tái chế và cao su tự nhiên. Bên cạnh đó, quy trình sản xuất cũng được tối ưu hóa để tiết kiệm năng lượng và giảm lượng khí thải. Không chỉ thân thiện với môi trường, giày bền vững còn được thiết kế để đảm bảo độ bền cao, giúp người tiêu dùng sử dụng lâu dài và hạn chế rác thải thời trang.', 3, 0, N'published', CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2), CAST(N'2024-03-15T09:15:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (14, N'Xu hướng nhiếp ảnh thời trang', N'https://lh4.googleusercontent.com/G-N1LdssK9CFqmlFcq9e6SUDeBLlwYVhcDxZNwgDDZmtcaEkmH-xsB3jrdQqSOdjjGLNVbe7YTN9V91Ywq1CCOjUN65wl3IhQHzVp3Juzh5G9Vub7Iss4v7CWZLU17hL8eqO8Eb8', N'Xu hướng nhiếp ảnh thời trang đang...', N'Xu hướng nhiếp ảnh thời trang đang không ngừng thay đổi, phản ánh sự kết hợp giữa nghệ thuật, công nghệ và văn hóa đương đại. Những phong cách hoài cổ như film photography đang quay trở lại, mang đến cảm giác chân thực và giàu cảm xúc. Bên cạnh đó, nhiếp ảnh thời trang hiện đại còn ứng dụng AI và công nghệ CGI để tạo ra những bộ ảnh mang đậm tính sáng tạo và siêu thực. Xu hướng "street style photography" cũng tiếp tục được ưa chuộng, tập trung vào sự tự nhiên và phong cách cá nhân. Ngoài ra, việc đề cao tính bền vững trong nhiếp ảnh thời trang ngày càng phổ biến, với các chiến dịch quảng cáo ưu tiên sử dụng ánh sáng tự nhiên và hạn chế tác động đến môi trường.', 3, 1, N'published', CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2), CAST(N'2024-03-20T11:45:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (15, N'Phát triển phong cách cá nhân', N'https://ims.baoyenbai.com.vn/NewsImg/6_2023/286023_1tt.jpg', N'Phát triển phong cách cá nhân là...', N'Phát triển phong cách cá nhân là một quá trình khám phá và thể hiện bản thân thông qua thời trang. Thay vì chạy theo xu hướng, hãy tìm ra những trang phục, màu sắc và kiểu dáng phù hợp với cá tính và lối sống của bạn. Việc hiểu rõ vóc dáng, sở thích và cảm hứng từ các nền văn hóa khác nhau sẽ giúp bạn xây dựng một phong cách độc đáo. Ngoài ra, đầu tư vào những món đồ cơ bản nhưng chất lượng, kết hợp với phụ kiện tinh tế, cũng là cách để tạo dấu ấn riêng. Quan trọng nhất, phong cách cá nhân không chỉ nằm ở trang phục mà còn thể hiện qua sự tự tin và cách bạn thể hiện bản thân mỗi ngày.', 3, 0, N'published', CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2), CAST(N'2024-03-25T16:20:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (16, N'Thương hiệu thời trang đạo đức', N'https://style-republik.com/wp-content/uploads/2021/12/Viettien.png', N'Thương hiệu thời trang đạo đức đang...', N'Thương hiệu thời trang đạo đức đang ngày càng thu hút sự quan tâm khi người tiêu dùng chú trọng hơn đến tính bền vững và trách nhiệm xã hội. Các thương hiệu này cam kết sử dụng nguyên liệu thân thiện với môi trường, quy trình sản xuất công bằng và đảm bảo điều kiện làm việc tốt cho người lao động. Họ thường áp dụng mô hình sản xuất minh bạch, sử dụng chất liệu hữu cơ, tái chế hoặc công nghệ tiên tiến để giảm thiểu tác động tiêu cực đến môi trường. Việc ủng hộ các thương hiệu này không chỉ giúp bảo vệ hành tinh mà còn góp phần thúc đẩy sự công bằng trong ngành thời trang.', 3, 1, N'published', CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2), CAST(N'2024-03-30T10:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (17, N'Thời trang kỹ thuật số và Metaverse', N'https://bestprint.vn/wp-content/uploads/2022/07/1657921823_567_Cac-nha-ban-le-co-can-mot-chien-luoc-thoi.png', N'Thời trang kỹ thuật số và Metaverse đang...', N'Thời trang kỹ thuật số và Metaverse đang mở ra một kỷ nguyên mới, nơi quần áo không chỉ tồn tại trong thế giới thực mà còn hiện diện trong không gian ảo. Các thương hiệu lớn và nhà thiết kế đang phát triển trang phục kỹ thuật số, cho phép người dùng mua, mặc và trưng bày chúng trên các nền tảng Metaverse hoặc mạng xã hội. Công nghệ blockchain và NFT giúp xác thực quyền sở hữu của những món đồ này, tạo ra một thị trường mới đầy tiềm năng. Với sự phát triển của thực tế ảo (VR) và thực tế tăng cường (AR), thời trang không còn bị giới hạn bởi chất liệu vật lý mà có thể biến đổi linh hoạt theo môi trường số, mở ra cơ hội sáng tạo vô tận cho cả người tiêu dùng lẫn ngành công nghiệp thời trang.', 3, 0, N'published', CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2), CAST(N'2024-04-05T14:30:00.0000000' AS DateTime2))
GO
INSERT [dbo].[posts] ([id], [title], [thumbnail], [summary], [content], [author_id], [is_featured], [status], [created_at], [updated_at]) VALUES (18, N'Cách mạng thời trang thích ứng', N'https://file.hstatic.net/200000775589/article/hippie-style_cd4cf3dfcf234ac7aa46653dd6b140cc.jpg', N'Cách mạng thời trang thích ứng đang...', N'Cách mạng thời trang thích ứng đang thay đổi cách chúng ta tiếp cận quần áo, tập trung vào tính linh hoạt, đa năng và bền vững. Các thiết kế ngày nay không chỉ đáp ứng nhu cầu thẩm mỹ mà còn có khả năng thích nghi với môi trường và lối sống của người mặc. Từ vải co giãn đa chiều, quần áo biến đổi theo thời tiết đến trang phục công nghệ cao giúp điều chỉnh nhiệt độ cơ thể, tất cả đều hướng đến sự tiện lợi và tối ưu hóa trải nghiệm cá nhân. Bên cạnh đó, các thương hiệu cũng đẩy mạnh sản xuất theo mô hình thời trang bền vững, sử dụng vật liệu tái chế và công nghệ thân thiện với môi trường. Đây không chỉ là một xu hướng mà còn là một cuộc cách mạng thay đổi cách chúng ta mặc và tiêu dùng thời trang.', 3, 1, N'published', CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2), CAST(N'2024-04-10T09:15:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[posts] OFF
GO
SET IDENTITY_INSERT [dbo].[customer_contact_history] ON 
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (1, 2, N'vip', N'phongthhe186443@fpt.edu.vn', N'Tran Hoai Phong', N'male', N'0987654321', 1, CAST(700000.00 AS Decimal(10, 2)), CAST(N'2025-03-12T10:24:18.1666667' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (2, 4, N'normal', N'user123@gmail.com', N'Dược Lão', N'male', N'0912345678', 1, CAST(650000.00 AS Decimal(10, 2)), CAST(N'2025-03-05T14:12:23.3000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (3, 6, N'vip', N'XiaoZhan@gmail.com', N'Tiêu Chiến', N'male', N'0934567890', 1, CAST(420000.00 AS Decimal(10, 2)), CAST(N'2025-03-15T09:45:32.4000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (4, 8, N'normal', N'Medusa@gmail.com', N'Mỹ Đỗ Toa', N'female', N'0923456789', 1, CAST(900000.00 AS Decimal(10, 2)), CAST(N'2025-02-26T16:58:44.7000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (5, 10, N'vip', N'HaiBoDong@gmail.com', N'Hải Ba Đông', N'male', N'0998765432', 1, CAST(1650000.00 AS Decimal(10, 2)), CAST(N'2025-03-10T11:34:52.9000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (6, 12, N'normal', N'GuYuan@gmail.com', N'Cổ Nguyên', N'male', N'0981234567', 1, CAST(920000.00 AS Decimal(10, 2)), CAST(N'2025-03-01T13:22:17.1000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (7, 14, N'normal', N'YunShan@gmail.com', N'Vân Sơn', N'male', N'0919876543', 1, CAST(360000.00 AS Decimal(10, 2)), CAST(N'2025-03-02T10:15:37.2000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (8, 16, N'vip', N'HuJia@gmail.com', N'Hồ Gia', N'female', N'0932198765', 1, CAST(1310000.00 AS Decimal(10, 2)), CAST(N'2025-03-14T10:15:37.2000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (9, 18, N'normal', N'YanXiao@gmail.com', N'Diệp Hiên', N'male', N'0965432198', 1, CAST(780000.00 AS Decimal(10, 2)), CAST(N'2025-03-04T14:56:32.8000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (10, 20, N'vip', N'XiaoLei@gmail.com', N'Tiêu Lôi', N'male', N'0987654329', 1, CAST(1200000.00 AS Decimal(10, 2)), CAST(N'2025-03-11T16:28:45.3000000' AS DateTime2))
GO
INSERT [dbo].[customer_contact_history] ([id], [user_id], [customer_type], [email], [full_name], [gender], [mobile], [total_purchases], [total_spend], [updated_at]) VALUES (11, 22, N'normal', N'ZiYan@gmail.com', N'Tử Nghiên', N'female', N'0909876543', 1, CAST(800000.00 AS Decimal(10, 2)), CAST(N'2025-03-08T11:45:23.9000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[customer_contact_history] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (2, N'dfe99b7b-3adc-4263-b819-ebca71ff6b2a', CAST(N'2025-02-09T17:41:58.857' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (1, 2, N'completed', CAST(700000.00 AS Decimal(10, 2)), N'Tran Hoai Phong', N'phongthhe186443@fpt.edu.vn', N'0987654321', N'123 Đường ABC, TP.HCM', NULL, NULL, N'ORD1239773154', CAST(N'2023-01-10T00:00:00.0000000' AS DateTime2), CAST(N'2023-01-19T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (2, 4, N'completed', CAST(650000.00 AS Decimal(10, 2)), N'Dược Lão', N'user123@gmail.com', N'0912345678', N'456 Đường XYZ, Hà Nội', NULL, NULL, N'ORD1845647986', CAST(N'2023-02-15T00:00:00.0000000' AS DateTime2), CAST(N'2023-02-15T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (3, 6, N'completed', CAST(420000.00 AS Decimal(10, 2)), N'Tiêu Chiến', N'XiaoZhan@gmail.com', N'0934567890', N'789 Đường DEF, Đà Nẵng', NULL, NULL, N'ORD836805674', CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), CAST(N'2023-03-21T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (4, 8, N'completed', CAST(900000.00 AS Decimal(10, 2)), N'Mỹ Đỗ Toa', N'Medusa@gmail.com', N'0923456789', N'101 Đường GHI, TP.HCM', NULL, NULL, N'ORD1718331060', CAST(N'2023-04-25T00:00:00.0000000' AS DateTime2), CAST(N'2023-04-27T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (5, 10, N'completed', CAST(1650000.00 AS Decimal(10, 2)), N'Hải Ba Đông', N'HaiBoDong@gmail.com', N'0998765432', N'202 Đường JKL, Hà Nội', NULL, NULL, N'ORD108714869', CAST(N'2023-05-30T00:00:00.0000000' AS DateTime2), CAST(N'2023-05-30T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (6, 12, N'completed', CAST(920000.00 AS Decimal(10, 2)), N'Cổ Nguyên', N'GuYuan@gmail.com', N'0981234567', N'303 Đường MNO, Đà Nẵng', NULL, NULL, N'ORD2112537085', CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (7, 14, N'completed', CAST(360000.00 AS Decimal(10, 2)), N'Vân Sơn', N'YunShan@gmail.com', N'0919876543', N'404 Đường PQR, TP.HCM', NULL, NULL, N'ORD2060225566', CAST(N'2024-07-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-10T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[orders] ([id], [user_id], [status], [total_amount], [recipient_name], [recipient_email], [recipient_phone], [recipient_address], [shipping_code], [shiping_name], [notes], [created_at], [updated_at]) VALUES (8, 16, N'completed', CAST(1310000.00 AS Decimal(10, 2)), N'Hồ Gia', N'HuJia@gmail.com', N'0932198765', N'505 Đường STU, Hà Nội', NULL, NULL, N'ORD608289973', CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[order_history] ON 
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (1, 1, 2, N'completed', N'Giao hàng thành công', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (2, 2, 4, N'completed', N'Khách hàng đã nhận hàng', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (3, 3, 6, N'completed', N'Đã giao hàng đúng hẹn', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (4, 4, 8, N'completed', N'Đơn hàng hoàn tất', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (5, 5, 10, N'completed', N'Khách hàng hài lòng về sản phẩm', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (6, 6, 12, N'completed', N'Xác nhận nhận hàng', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (7, 7, 14, N'completed', N'Hoàn tất đơn hàng', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
INSERT [dbo].[order_history] ([id], [order_id], [updated_by], [status], [notes], [updated_at]) VALUES (8, 8, 16, N'completed', N'Giao hàng đúng lịch trình', CAST(N'2025-03-29T03:24:54.8800000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[order_history] OFF
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (1, 1, 1, N'Áo sơ mi trắng', N'https://product.hstatic.net/1000333436/product/tx_03696_da789ffaa68d42d3b2ad129b099e15ae_master.jpg', N'Size M - Màu Trắng', 2, CAST(200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (2, 1, 2, N'Quần tây đen', N'https://product.hstatic.net/200000053174/product/20_bddc67b2b01a4fc6a89b6d5ca1e78b33_master.jpg', N'Size 32 - Màu Đen', 1, CAST(300000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (3, 2, 3, N'Đầm hoa mùa hè', N'https://file.hstatic.net/200000503583/file/vay-hoa-mua-he__11__c2791afbbda941238c114b00b403ec57.jpg', N'Size S - Màu Hoa', 1, CAST(400000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (4, 2, 4, N'Chân váy denim', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luaj8uf2in1bf1', N'Size M - Màu Xanh', 1, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (5, 3, 5, N'Áo thun siêu nhân', N'https://target.scene7.com/is/image/Target/GUEST_1079d260-d8e2-4d6e-b757-7dd7254ddda5', N'Size S - Màu Đỏ', 2, CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (6, 3, 6, N'Quần short cotton', N'https://ardilla.com.vn/wp-content/uploads/2022/03/TB1601QST.jpg', N'Size M - Màu Xám', 1, CAST(120000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (7, 4, 7, N'Thắt lưng da', N'https://authenticvietnam.vn/wp-content/uploads/that-lung-da-gucci-nam-406831DJ20T_2145_001_100_0000_Light-Leather-belt-with-Double-G-buckle.jpg', N'Màu Đen', 2, CAST(200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (8, 4, 9, N'Giày thể thao', N'https://img.mwc.com.vn/giay-thoi-trang?w=480&h=510&FileInput=/Resources/Product/2024/09/22/z5855779313414_2914371405362ca7f474791328971969.jpg', N'Size 42 - Màu Trắng', 1, CAST(500000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (9, 5, 10, N'Giày sneaker', N'https://bizweb.dktcdn.net/thumb/large/100/041/044/products/48f5343d-9f9a-4ed2-aa02-de2ad1f4fabc-jpeg.jpg', N'Size 40 - Màu Đen', 3, CAST(400000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (10, 5, 13, N'Áo khoác bomber nam', N'https://ginstore.com.vn/files/sanpham/1885/1/png/ao-khoac-bomber-local-brand-rg-butterfly-varsity-jacket-nam-nu-tay-da-vasity-bong-chay-form-rong-unisex.png', N'Size L - Màu Xanh', 1, CAST(450000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (11, 6, 14, N'Quần jogger thể thao', N'https://thegioidotap.vn/wp-content/uploads/2020/12/quan-dai-the-thao-nam-jogger-sg10-3.jpg', N'Size M - Màu Xám', 2, CAST(250000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (12, 6, 15, N'Đầm maxi hoa nhí', N'https://vayfashion.com/wp-content/uploads/2022/05/2c7cf97edbac2d98f120bf85c824f1aa.jpg', N'Size M - Màu Hoa', 1, CAST(420000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (13, 7, 16, N'Áo thun unisex', N'https://sure.vn/wp-content/uploads/2024/08/7-1-scaled.jpg', N'Size L - Màu Đen', 2, CAST(180000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (14, 8, 17, N'Váy công chúa cho bé gái', N'https://tutupetti.com/wp-content/uploads/2023/07/dam_dep_cho_be_du_tiec_04.jpg', N'Size S - Màu Hồng', 3, CAST(320000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[order_items] ([id], [order_id], [product_id], [product_name], [product_image], [variant_name], [quantity], [unit_price_at_order]) VALUES (15, 8, 18, N'Balo nam thời trang', N'https://gubag.vn/wp-content/uploads/2021/07/balo-nam-thoi-trang-chong-nuoc-GBA02-den-1.jpg', N'Màu Đen', 1, CAST(350000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (1, 1, 2, 5, N'Chất vải mềm, thiết kế đẹp.', N'approved', CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2), CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (2, 2, 4, 4, N'Rất đáng tiền.', N'approved', CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2), CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (3, 3, 6, 3, N'Đầm rất thoáng mát.', N'approved', CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2), CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (4, 4, 8, 5, N'Rất hợp thời trang.', N'approved', CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2), CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2))
GO
INSERT [dbo].[feedback] ([id], [order_item_id], [user_id], [rating], [comment], [status], [created_at], [updated_at]) VALUES (5, 5, 10, 2, N'Tốt nhưng giao hơi chậm.', N'approved', CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2), CAST(N'2025-03-29T03:25:14.4333333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[payments] ON 
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (1, 1, N'cod', N'completed', N'TX123', CAST(N'2025-03-29T03:25:14.4366667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (2, 2, N'bank_transfer', N'completed', N'TX124', CAST(N'2025-03-29T03:25:14.4366667' AS DateTime2))
GO
INSERT [dbo].[payments] ([id], [order_id], [payment_method], [payment_status], [transaction_id], [created_at]) VALUES (3, 3, N'in_store', N'completed', N'TX125', CAST(N'2025-03-29T03:25:14.4366667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[payments] OFF
GO
SET IDENTITY_INSERT [dbo].[shipping] ON 
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (1, 1, N'GiaoHangNhanh', N'TRACK001', CAST(N'2025-04-01' AS Date), CAST(N'2025-03-29T03:25:14.4366667' AS DateTime2))
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (2, 2, N'ViettelPost', N'TRACK002', CAST(N'2025-04-02' AS Date), CAST(N'2025-03-29T03:25:14.4366667' AS DateTime2))
GO
INSERT [dbo].[shipping] ([id], [order_id], [shipping_provider], [tracking_number], [estimated_delivery], [delivered_at]) VALUES (3, 3, N'GiaoHangTietKiem', N'TRACK003', CAST(N'2025-04-03' AS Date), CAST(N'2025-03-29T03:25:14.4366667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[coupons] ON 
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (1, N'ABC123XYZ', N'percentage', CAST(10.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (2, N'DEF456UVW', N'fixed', CAST(20000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), NULL, 100, 0, CAST(N'2025-07-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (3, N'GHI789RST', N'percentage', CAST(15.00 AS Decimal(10, 2)), CAST(75000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 75, 0, CAST(N'2025-08-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (4, N'JKL012PQR', N'fixed', CAST(30000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), NULL, 200, 0, CAST(N'2025-09-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (5, N'MNO345NOP', N'percentage', CAST(20.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), 50, 0, CAST(N'2025-10-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (6, N'STU678KLM', N'fixed', CAST(50000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), NULL, 25, 0, CAST(N'2025-11-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (7, N'VWX901HIJ', N'percentage', CAST(25.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 100, 0, CAST(N'2025-12-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'active')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (8, N'YZA234EFG', N'fixed', CAST(15000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), NULL, 150, 0, CAST(N'2026-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (9, N'BCD567BCD', N'percentage', CAST(30.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 30, 0, CAST(N'2026-02-28T23:59:59.0000000' AS DateTime2), CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (10, N'EFG890YZA', N'fixed', CAST(25000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), NULL, 75, 0, CAST(N'2026-03-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (11, N'HIJ123VWX', N'percentage', CAST(5.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 500, 0, CAST(N'2026-04-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (12, N'KLM456STU', N'fixed', CAST(10000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), NULL, NULL, 0, CAST(N'2026-05-31T23:59:59.0000000' AS DateTime2), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (13, N'NOP789MNO', N'percentage', CAST(12.50 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)), 250, 0, CAST(N'2026-06-30T23:59:59.0000000' AS DateTime2), CAST(N'2025-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'inactive')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (14, N'QRS012JKL', N'fixed', CAST(40000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), NULL, 40, 0, CAST(N'2025-01-31T23:59:59.0000000' AS DateTime2), CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'expired')
GO
INSERT [dbo].[coupons] ([id], [code], [discount_type], [discount_value], [min_order_amount], [max_discount], [usage_limit], [used_count], [expiry_date], [activation_date], [created_at], [coupon_type], [status]) VALUES (15, N'TUV345GHI', N'percentage', CAST(35.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 20, 0, CAST(N'2025-01-28T23:59:59.0000000' AS DateTime2), CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-19T13:42:03.3666667' AS DateTime2), N'normal', N'expired')
GO
SET IDENTITY_INSERT [dbo].[coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[footer_settings] ON 
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (1, N'info', N'Tên cửa hàng', N'Fashion Store', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (2, N'info', N'Giới thiệu', N'Chuyên bán quần áo thời trang', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (3, N'contact', N'Email', N'support@fashionstore.com', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (4, N'contact', N'Địa chỉ', N'thôn 4, xã Thạch Hòa, huyện Thạch Thất, Hà Nội', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (5, N'contact', N'Tổng đài hỗ trợ', N'+84 123 456 789', NULL, N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (6, N'social', N'Facebook', N'https://facebook.com/fashion', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT83dd8_4WZCT-LsYC477q2WKocjms9OHCg0g&s', N'active')
GO
INSERT [dbo].[footer_settings] ([id], [type], [field_name], [value], [image], [status]) VALUES (7, N'social', N'Instagram', N'https://instagram.com/fashion', N'https://cdn-icons-png.freepik.com/256/15707/15707869.png?semt=ais_hybrid', N'active')
GO
SET IDENTITY_INSERT [dbo].[footer_settings] OFF
GO
SET IDENTITY_INSERT [dbo].[sliders] ON 
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (1, N'Cách mạng thời trang thích ứng 2025', N'https://res.cloudinary.com/agnesb-group/image/upload/dpr_auto,f_auto,q_auto/v1/CMC/Content/D%C3%A9fil%C3%A9s/Collection%20Homme%20%C3%A9t%C3%A9%2025/videocolle25_1', N'http://localhost:9999/fashionshop/post?id=18', N'active', 1, N'Khám phá xu hướng đột phá với thiết kế linh hoạt, chất liệu hiện đại và phong cách đa năng')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (2, N'Thời trang Kỹ thuật số & Metaverse', N'https://luvinus.com/wp-content/uploads/2019/08/y-tuong-thiet-ke-thoi-trang-4.jpg', N'http://localhost:9999/fashionshop/post?id=17', N'active', 2, N'Khám phá sự kết hợp giữa phong cách & công nghệ, mở ra kỷ nguyên thời trang ảo')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (3, N'Hàng mới về – Thời trang bền vững', N'https://img6.thuthuatphanmem.vn/uploads/2022/03/04/background-thoi-trang-hien-dai-dep_025701441.jpg', N'http://localhost:9999/fashionshop/post?id=16', N'active', 3, N'Diện mạo xuân mới với phong cách thời trang đạo đức, thân thiện với môi trường')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (4, N'Khám phá phong cách riêng', N'https://img6.thuthuatphanmem.vn/uploads/2022/03/04/background-quang-cao-thoi-trang-quan-ao_025656570.jpg', N'http://localhost:9999/fashionshop/post?id=15', N'active', 4, N'Trang phục thiết kế giúp bạn thể hiện cá tính và dấu ấn độc đáo của riêng mình')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (5, N'Nhiếp ảnh thời trang & phong cách năng động', N'https://sakurafashion.vn/upload/images_294/photo-5-15585905145021448956672.jpg', N'http://localhost:9999/fashionshop/post?id=14', N'active', 5, N'Ghi lại khoảnh khắc ấn tượng với trang phục thể thao thời thượng trong từng khung hình')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (6, N'Bước đi bền vững', N'https://dvauthentic.vn/wp-content/uploads/2020/12/06-03.jpg', N'http://localhost:9999/fashionshop/post?id=13', N'active', 6, N'Giày thiết kế thanh lịch, thoải mái và thân thiện với môi trường cho ngày trọng đại')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (7, N'Tuần lễ thời trang áo dài', N'https://lamia.com.vn/storage/ao-dai-cach-tan-phoi-hoa-tiet-1.jpg', N'http://localhost:9999/fashionshop/post?id=12', N'inactive', 7, N'Áo dài duyên dáng và thoải mái cho mọi lứa tuổi')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (8, N'Mẹo thời trang tiết kiệm', N'https://chaubui.net/wp-content/uploads/2023/07/tdg4.jpg', N'http://localhost:9999/fashionshop/post?id=11', N'active', 8, N'Tỏa sáng với phong cách ấn tượng mà không cần chi tiêu quá nhiều')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (9, N'Thời trang công nghệ cao', N'https://media.vneconomy.vn/w800/images/upload/2022/09/15/avaa.png', N'http://localhost:9999/fashionshop/post?id=10', N'active', 9, N'Trang phục thông minh, tích hợp công nghệ cho phong cách đột phá')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (10, N'Hướng dẫn quà tặng ngày lễ', N'https://bazaarvietnam.vn/wp-content/uploads/2020/07/iris-van-herpen-haute-couture-xuan-2020-0-thumb.jpg', N'http://localhost:9999/fashionshop/post?id=9', N'inactive', 10, N'Ý tưởng quà tặng hoàn hảo cho những người thân yêu của bạn')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (11, N'Phong cách & thoải mái – Quần hoàn hảo', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/350/935/articles/phoi-do-voi-ao-so-mi-trang-nam.jpg?v=1567229232163', N'http://localhost:9999/fashionshop/productdetail?id=32', N'active', 11, N'Nâng cấp tủ quần áo – Quần thanh lịch, ấm áp & linh hoạt')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (12, N'Duyên dáng & thanh lịch – Váy hoàn hảo', N'https://cdn.vistyle.vn/sites/11/2023/04/cach-phoi-do-voi-chan-vay-jean-dai-thumb.jpeg', N'http://localhost:9999/fashionshop/productdetail?id=31', N'active', 12, N'Tôn vinh thanh lịch – Váy sang trọng, thoải mái & đa năng nâng tầm phong cách')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (13, N'Thanh lịch vượt thời gian – Nhẫn hoàn hảo', N'https://toigingiuvedep.vn/wp-content/uploads/2021/10/hinh-anh-nhan-cuoi-dep-gan-ket-yeu-thuong-giua-vo-va-chong-1.jpg', N'http://localhost:9999/fashionshop/productdetail?id=30', N'active', 13, N'Kỷ niệm mọi dịp – Nhẫn thanh lịch, ý nghĩa & rực rỡ')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (14, N'Dễ thương & thoải mái – Áo phông cho bé', N'https://sadesign.vn/wp-content/uploads/2021/04/cach-chup-anh-quan-ao-tre-em-dep.jpg', N'http://localhost:9999/fashionshop/productdetail?id=29', N'active', 14, N'Dễ thương & ấm áp – Áo sơ mi trẻ em mềm mại, thời trang & vui tươi')
GO
INSERT [dbo].[sliders] ([id], [title], [image_url], [link], [status], [display_order], [notes]) VALUES (15, N'Thoải mái mỗi bước – Đôi dép hoàn hảo', N'https://img5.thuthuatphanmem.vn/uploads/2022/01/17/anh-doi-dep-cao-su-huyen-thoai-thoi-chien-tranh_022810339.jpg', N'http://localhost:9999/fashionshop/productdetail?id=28', N'active', 15, N'Thư giãn phong cách – Dép nhẹ, êm ái & thời trang mỗi ngày')
GO
SET IDENTITY_INSERT [dbo].[sliders] OFF
GO
