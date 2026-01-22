USE [DemWpf]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NOT NULL,
	[PickUpPointId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Status] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[PickUpPointId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PickUpPoint] PRIMARY KEY CLUSTERED 
(
	[PickUpPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Article] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Unit] [nvarchar](255) NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Photo] [nvarchar](255) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInOrder](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_ProductInOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Login] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Женская обувь')
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Мужская обувь')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name]) VALUES (1, N'Alessio Nesca')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name]) VALUES (2, N'CROSBY')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name]) VALUES (3, N'Kari')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name]) VALUES (4, N'Marco Tozzi')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name]) VALUES (5, N'Rieker')
GO
INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name]) VALUES (6, N'Рос')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (1, CAST(N'2025-02-27T00:00:00.000' AS DateTime), CAST(N'2025-04-20T00:00:00.000' AS DateTime), 1, 4, 901, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (2, CAST(N'2022-09-28T00:00:00.000' AS DateTime), CAST(N'2025-04-21T00:00:00.000' AS DateTime), 11, 1, 902, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (3, CAST(N'2025-03-21T00:00:00.000' AS DateTime), CAST(N'2025-04-22T00:00:00.000' AS DateTime), 2, 2, 903, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (4, CAST(N'2025-02-20T00:00:00.000' AS DateTime), CAST(N'2025-04-23T00:00:00.000' AS DateTime), 11, 3, 904, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (5, CAST(N'2025-03-17T00:00:00.000' AS DateTime), CAST(N'2025-04-24T00:00:00.000' AS DateTime), 2, 4, 905, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (6, CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-04-25T00:00:00.000' AS DateTime), 15, 1, 906, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (7, CAST(N'2025-02-28T00:00:00.000' AS DateTime), CAST(N'2025-04-26T00:00:00.000' AS DateTime), 3, 2, 907, N'Завершен')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (8, CAST(N'2025-03-31T00:00:00.000' AS DateTime), CAST(N'2025-04-27T00:00:00.000' AS DateTime), 19, 3, 908, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (9, CAST(N'2025-04-02T00:00:00.000' AS DateTime), CAST(N'2025-04-28T00:00:00.000' AS DateTime), 5, 4, 909, N'Новый ')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [PickUpPointId], [UserId], [Code], [Status]) VALUES (10, CAST(N'2025-04-03T00:00:00.000' AS DateTime), CAST(N'2025-04-29T00:00:00.000' AS DateTime), 19, 4, 910, N'Новый ')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (1, N'420151, г. Лесной, ул. Вишневая, 32')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (2, N'125061, г. Лесной, ул. Подгорная, 8')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (3, N'630370, г. Лесной, ул. Шоссейная, 24')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (4, N'400562, г. Лесной, ул. Зеленая, 32')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (5, N'614510, г. Лесной, ул. Маяковского, 47')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (6, N'410542, г. Лесной, ул. Светлая, 46')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (7, N'620839, г. Лесной, ул. Цветочная, 8')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (8, N'443890, г. Лесной, ул. Коммунистическая, 1')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (9, N'603379, г. Лесной, ул. Спортивная, 46')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (10, N'603721, г. Лесной, ул. Гоголя, 41')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (11, N'410172, г. Лесной, ул. Северная, 13')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (12, N'614611, г. Лесной, ул. Молодежная, 50')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (13, N'454311, г.Лесной, ул. Новая, 19')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (14, N'660007, г.Лесной, ул. Октябрьская, 19')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (15, N'603036, г. Лесной, ул. Садовая, 4')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (16, N'394060, г.Лесной, ул. Фрунзе, 43')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (17, N'410661, г. Лесной, ул. Школьная, 50')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (18, N'625590, г. Лесной, ул. Коммунистическая, 20')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (19, N'625683, г. Лесной, ул. 8 Марта')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (20, N'450983, г.Лесной, ул. Комсомольская, 26')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (21, N'394782, г. Лесной, ул. Чехова, 3')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (22, N'603002, г. Лесной, ул. Дзержинского, 28')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (23, N'450558, г. Лесной, ул. Набережная, 30')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (24, N'344288, г. Лесной, ул. Чехова, 1')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (25, N'614164, г.Лесной,  ул. Степная, 30')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (26, N'394242, г. Лесной, ул. Коммунистическая, 43')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (27, N'660540, г. Лесной, ул. Солнечная, 25')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (28, N'125837, г. Лесной, ул. Шоссейная, 40')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (29, N'125703, г. Лесной, ул. Партизанская, 49')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (30, N'625283, г. Лесной, ул. Победы, 46')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (31, N'614753, г. Лесной, ул. Полевая, 35')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (32, N'426030, г. Лесной, ул. Маяковского, 44')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (33, N'450375, г. Лесной ул. Клубная, 44')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (34, N'625560, г. Лесной, ул. Некрасова, 12')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (35, N'630201, г. Лесной, ул. Комсомольская, 17')
GO
INSERT [dbo].[PickUpPoint] ([PickUpPointId], [Address]) VALUES (36, N'190949, г. Лесной, ул. Мичурина, 26')
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (1, N'B320R5', N'Туфли', N'шт.', CAST(4300.00 AS Decimal(8, 2)), 1, 5, 1, 2, 6, N'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', N'9.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (2, N'B431R5', N'Ботинки', N'шт.', CAST(2700.00 AS Decimal(8, 2)), 2, 5, 2, 2, 5, N'Мужские кожаные ботинки/мужские ботинки', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (3, N'C436G5', N'Ботинки', N'шт.', CAST(10200.00 AS Decimal(8, 2)), 1, 1, 1, 15, 9, N'Ботинки женские, ARGO, размер 40', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (4, N'D268G5', N'Туфли', N'шт.', CAST(4399.00 AS Decimal(8, 2)), 2, 5, 1, 3, 12, N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (5, N'D329H3', N'Полуботинки', N'шт.', CAST(1890.00 AS Decimal(8, 2)), 2, 1, 1, 4, 4, N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'8.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (6, N'D364R4', N'Туфли', N'шт.', CAST(12400.00 AS Decimal(8, 2)), 1, 3, 1, 16, 5, N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (7, N'D572U8', N'Кроссовки', N'шт.', CAST(4100.00 AS Decimal(8, 2)), 2, 6, 2, 3, 6, N'129615-4 Кроссовки мужские', N'6.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (8, N'E482R4', N'Полуботинки', N'шт.', CAST(1800.00 AS Decimal(8, 2)), 1, 3, 1, 2, 14, N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (9, N'F427R5', N'Ботинки', N'шт.', CAST(11800.00 AS Decimal(8, 2)), 2, 5, 1, 15, 11, N'Ботинки на молнии с декоративной пряжкой FRAU', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (10, N'F572H7', N'Туфли', N'шт.', CAST(2700.00 AS Decimal(8, 2)), 1, 4, 1, 2, 14, N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'7.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (11, N'F635R4', N'Ботинки', N'шт.', CAST(3244.00 AS Decimal(8, 2)), 2, 4, 1, 2, 13, N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'2.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (12, N'G432E4', N'Туфли', N'шт.', CAST(2800.00 AS Decimal(8, 2)), 1, 3, 1, 3, 15, N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'10.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (13, N'G531F4', N'Ботинки', N'шт.', CAST(6600.00 AS Decimal(8, 2)), 1, 3, 1, 12, 9, N'Ботинки женские зимние ROMER арт. 893167-01 Черный', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (14, N'G783F5', N'Ботинки', N'шт.', CAST(5900.00 AS Decimal(8, 2)), 1, 6, 2, 2, 8, N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'4.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (15, N'H535R5', N'Ботинки', N'шт.', CAST(2300.00 AS Decimal(8, 2)), 2, 5, 1, 2, 7, N'Женские Ботинки демисезонные', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (16, N'H782T5', N'Туфли', N'шт.', CAST(4499.00 AS Decimal(8, 2)), 1, 3, 2, 4, 5, N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'3.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (17, N'J384T6', N'Ботинки', N'шт.', CAST(3800.00 AS Decimal(8, 2)), 2, 5, 2, 2, 16, N'B3430/14 Полуботинки мужские Rieker', N'5.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (18, N'J542F5', N'Тапочки', N'шт.', CAST(500.00 AS Decimal(8, 2)), 1, 3, 2, 13, 0, N'Тапочки мужские Арт.70701-55-67син р.41', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (19, N'K345R4', N'Полуботинки', N'шт.', CAST(2100.00 AS Decimal(8, 2)), 2, 2, 2, 2, 3, N'407700/01-02 Полуботинки мужские CROSBY', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (20, N'K358H6', N'Тапочки', N'шт.', CAST(599.00 AS Decimal(8, 2)), 1, 5, 2, 20, 2, N'Тапочки мужские син р.41', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (21, N'L754R4', N'Полуботинки', N'шт.', CAST(1700.00 AS Decimal(8, 2)), 1, 3, 1, 2, 7, N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (22, N'M542T5', N'Кроссовки', N'шт.', CAST(2800.00 AS Decimal(8, 2)), 2, 5, 2, 18, 3, N'Кроссовки мужские TOFA', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (23, N'N457T5', N'Полуботинки', N'шт.', CAST(4600.00 AS Decimal(8, 2)), 1, 2, 1, 3, 13, N'Полуботинки Ботинки черные зимние, мех', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (24, N'O754F4', N'Туфли', N'шт.', CAST(5400.00 AS Decimal(8, 2)), 2, 5, 1, 4, 18, N'Туфли женские демисезонные Rieker артикул 55073-68/37', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (25, N'P764G4', N'Туфли', N'шт.', CAST(6800.00 AS Decimal(8, 2)), 1, 2, 1, 15, 15, N'Туфли женские, ARGO, размер 38', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (26, N'S213E3', N'Полуботинки', N'шт.', CAST(2156.00 AS Decimal(8, 2)), 2, 2, 2, 3, 6, N'407700/01-01 Полуботинки мужские CROSBY', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (27, N'S326R5', N'Тапочки', N'шт.', CAST(9900.00 AS Decimal(8, 2)), 2, 2, 2, 17, 15, N'Мужские кожаные тапочки "Профиль С.Дали" ', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (28, N'S634B5', N'Кеды', N'шт.', CAST(5500.00 AS Decimal(8, 2)), 2, 2, 2, 3, 0, N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (29, N'T324F5', N'Сапоги', N'шт.', CAST(4699.00 AS Decimal(8, 2)), 1, 2, 1, 2, 5, N'Сапоги замша Цвет: синий', NULL)
GO
INSERT [dbo].[Product] ([ProductId], [Article], [Name], [Unit], [Price], [SupplierId], [ManufacturerId], [CategoryId], [Discount], [Count], [Description], [Photo]) VALUES (30, N'А112Т4', N'Ботинки', N'шт.', CAST(4990.00 AS Decimal(8, 2)), 1, 3, 1, 3, 6, N'Женские Ботинки демисезонные kari', N'1.jpg')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (1, 11, 2)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (1, 30, 2)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (2, 14, 1)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (2, 16, 1)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (3, 7, 10)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (3, 17, 10)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (4, 5, 4)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (4, 10, 5)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (5, 11, 2)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (5, 30, 2)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (6, 14, 1)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (6, 16, 1)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (7, 7, 10)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (7, 17, 10)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (8, 5, 4)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (8, 10, 5)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (9, 1, 5)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (9, 12, 1)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (10, 8, 5)
GO
INSERT [dbo].[ProductInOrder] ([OrderId], [ProductId], [Count]) VALUES (10, 26, 5)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 
GO
INSERT [dbo].[Supplier] ([SupplierId], [Name]) VALUES (1, N'Kari')
GO
INSERT [dbo].[Supplier] ([SupplierId], [Name]) VALUES (2, N'Обувь для вас')
GO
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (1, N'Администратор', N'Никифорова Весения Николаевна', N'94d5ous@gmail.com', N'uzWC67')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (2, N'Администратор', N'Сазонов Руслан Германович', N'uth4iz@mail.com', N'2L6KZG')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (3, N'Администратор', N'Одинцов Серафим Артёмович', N'yzls62@outlook.com', N'JlFRCZ')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (4, N'Менеджер', N'Степанов Михаил Артёмович', N'1diph5e@tutanota.com', N'8ntwUp')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (5, N'Менеджер', N'Ворсин Петр Евгеньевич', N'tjde7c@yahoo.com', N'YOyhfR')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (6, N'Менеджер', N'Старикова Елена Павловна', N'wpmrc3do@tutanota.com', N'RSbvHv')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (7, N'Авторизированный клиент', N'Михайлюк Анна Вячеславовна', N'5d4zbu@tutanota.com', N'rwVDh9')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (8, N'Авторизированный клиент', N'Ситдикова Елена Анатольевна', N'ptec8ym@yahoo.com', N'LdNyos')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (9, N'Авторизированный клиент', N'Ворсин Петр Евгеньевич', N'1qz4kw@mail.com', N'gynQMT')
GO
INSERT [dbo].[User] ([UserId], [Role], [FullName], [Login], [Password]) VALUES (10, N'Авторизированный клиент', N'Старикова Елена Павловна', N'4np6se@mail.com', N'AtnDjr')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickUpPoint] FOREIGN KEY([PickUpPointId])
REFERENCES [dbo].[PickUpPoint] ([PickUpPointId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[ProductInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductInOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProductInOrder] CHECK CONSTRAINT [FK_ProductInOrder_Order]
GO
ALTER TABLE [dbo].[ProductInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductInOrder_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProductInOrder] CHECK CONSTRAINT [FK_ProductInOrder_Product]
GO
