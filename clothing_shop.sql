USE [clothing_shop]
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1, N'phongthhe186443', N'phongthhe186443@fpt.edu.vn', N'$2a$10$2HaTiMAHmWZduYRfpFulIOS3jQ.Z6BDve2p.NC3A6.FSwF60mm55W', N'Tran Hoai Phong (K18 HL)', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocKorZbXPjM14r4glTBRNlEZDdW9FnyjfHx92DpGr276xUILAg=s96-c', N'customer', N'active', CAST(N'2025-02-05T13:40:32.0866667' AS DateTime2), CAST(N'2025-02-05T13:40:32.0866667' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1199, N'admin', N'adswp391@gmail.com', N'$2a$10$Kw1bXVeHV.LGz43OacSlOeelj970GviE8Hj9znxN8LqUMHCVqGkOm', N'Admin', N'male', N'0866046581', NULL, N'admin', N'active', CAST(N'2025-01-26T00:40:51.8233333' AS DateTime2), CAST(N'2025-01-27T16:43:39.2500000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1210, N'huy412004', N'huy412004@gmail.com', N'$2a$10$r5La2lBV1EKIw0DDANSvhu1cUGfUSFoShPLieGPeBMu.SYgG.PI/a', N'Nguyễn Huy', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJ9Ru_QdcSUo68k_cGG6qm2yYtRCKlLFxCIZz0WA3b3nVx7QNYY=s96-c', N'customer', N'active', CAST(N'2025-01-27T17:15:19.9300000' AS DateTime2), CAST(N'2025-01-27T17:15:19.9300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1211, N'huytai2009', N'huytai2009@gmail.com', N'$2a$10$P1DdyvtPcgOhfCIC8hlB.uT0WjT0uu57Lp/DYvDNio7ZNt9Ahxqt2', N'Tài nguyễn', N'other', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJ4vlixggpcNgsb6vBxc0xCIKqzZBjTH_dN8cG_Zn2rVUNeahA=s96-c', N'customer', N'active', CAST(N'2025-01-27T17:25:51.4300000' AS DateTime2), CAST(N'2025-01-27T17:25:51.4300000' AS DateTime2))
GO
INSERT [dbo].[users] ([id], [username], [email], [password_hash], [full_name], [gender], [mobile], [avatar], [role], [status], [created_at], [updated_at]) VALUES (1213, N'huyy', N'huyndhe186775@fpt.edu.vn', N'$2a$10$ytAEagmxQTZdzCe.TOntl.t50ADTx9aHXdLxj7qYEXx1vS5B1z4HG', N'huy', N'male', N'0866046598', NULL, N'customer', N'active', CAST(N'2025-01-31T23:09:02.0300000' AS DateTime2), CAST(N'2025-01-31T23:09:19.4200000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] ON 
GO
INSERT [dbo].[tokenPassword] ([id], [token], [expiryTime], [isUsed], [UserID]) VALUES (36, N'2c37ce3b-3e3a-4674-8e31-b2e966f7be88', CAST(N'2025-01-31T23:11:02.043' AS DateTime), 1, 1213)
GO
SET IDENTITY_INSERT [dbo].[tokenPassword] OFF
GO
