USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$2HaTiMAHmWZduYRfpFulIOS3jQ.Z6BDve2p.NC3A6.FSwF60mm55W', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocKorZbXPjM14r4glTBRNlEZDdW9FnyjfHx92DpGr276xUILAg=s96-c', N'customer', N'active', CAST(N'2025-02-05T13:40:32.0866667' AS DateTime2), CAST(N'2025-02-05T13:40:32.0866667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
