USE [tharwa]
GO
/****** Object:  Table [dbo].[AccessTokens]    Script Date: 24/03/2018 01:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessTokens](
	[tokenId] [varchar](255) NOT NULL,
	[userId] [varchar](255) NOT NULL,
	[applicationId] [varchar](255) NOT NULL,
	[expires] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
 CONSTRAINT [PK_AccessToken] PRIMARY KEY CLUSTERED 
(
	[tokenId] ASC,
	[userId] ASC,
	[applicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 24/03/2018 01:01:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[applicationId] [varchar](255) NOT NULL,
	[description] [varchar](256) NULL,
	[secret] [varchar](255) NULL,
	[grantTypes] [varchar](60) NULL,
	[createdAt] [datetime] NULL,
	[updateAt] [datetime] NULL,
 CONSTRAINT [PK__Applicat__C93A4C996B476EAC] PRIMARY KEY CLUSTERED 
(
	[applicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banque]    Script Date: 24/03/2018 01:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banque](
	[Code] [varchar](3) NOT NULL,
	[RaisonSocial] [varchar](max) NULL,
	[Adresse] [varchar](max) NULL,
	[Mail] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Banque] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24/03/2018 01:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdUser] [varchar](50) NOT NULL,
	[Nom] [varchar](20) NOT NULL,
	[Prenom] [varchar](20) NOT NULL,
	[Adresse] [varchar](90) NULL,
	[Fonction] [varchar](20) NULL,
	[Photo] [varchar](max) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Employeur] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Code]    Script Date: 24/03/2018 01:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Code](
	[codeId] [varchar](4) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[expires] [datetime] NOT NULL,
	[createdAt] [varchar](50) NULL,
	[updatedAt] [varchar](50) NULL,
 CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED 
(
	[codeId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 24/03/2018 01:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commission](
	[Id] [int] NOT NULL,
	[CodeCommission] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Montant] [decimal](19, 4) NOT NULL,
	[NumCompte] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Commission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compte]    Script Date: 24/03/2018 01:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compte](
	[Num] [varchar](50) NOT NULL,
	[Balance] [decimal](19, 4) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[CodeMonnaie] [varchar](10) NOT NULL,
	[IdUser] [varchar](50) NOT NULL,
	[Etat] [int] NOT NULL,
	[TypeCompte] [int] NOT NULL,
 CONSTRAINT [PK_Compte] PRIMARY KEY CLUSTERED 
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monnaie]    Script Date: 24/03/2018 01:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monnaie](
	[Code] [varchar](10) NOT NULL,
	[nom] [varchar](20) NULL,
 CONSTRAINT [PK_Monnaie] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdreVirement]    Script Date: 24/03/2018 01:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdreVirement](
	[Num] [int] NOT NULL,
	[Etat] [int] NOT NULL,
	[Statut] [int] NOT NULL,
	[IdUser] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrdreVirement] PRIMARY KEY CLUSTERED 
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 24/03/2018 01:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[tokenId] [varchar](255) NOT NULL,
	[userId] [varchar](255) NOT NULL,
	[applicationId] [varchar](255) NOT NULL,
	[expires] [datetime] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[tokenId] ASC,
	[userId] ASC,
	[applicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifCommission]    Script Date: 24/03/2018 01:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifCommission](
	[Code] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[montant] [decimal](19, 4) NULL,
	[Pourcentage] [decimal](19, 4) NULL,
 CONSTRAINT [PK_TarifCommission] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/03/2018 01:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [varchar](50) NOT NULL,
	[type] [int] NOT NULL,
	[password] [varchar](max) NOT NULL,
	[username] [varchar](50) NULL,
	[numTel] [varchar](50) NULL,
	[createdAt] [varchar](50) NULL,
	[updatedAt] [varchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Virement]    Script Date: 24/03/2018 01:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Virement](
	[Code] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Motif] [varchar](max) NOT NULL,
	[Statut] [varchar](20) NOT NULL,
	[Montant] [decimal](19, 4) NOT NULL,
	[Justificatif] [varchar](max) NULL,
	[NumOrdreVirement] [int] NULL,
	[NomEmetteur] [varchar](20) NOT NULL,
	[CompteEmmetteur] [varchar](50) NOT NULL,
	[BanqueEmmeteur] [varchar](3) NOT NULL,
	[NomDestinataire] [varchar](20) NOT NULL,
	[CompteDestinataire] [varchar](50) NOT NULL,
	[BanqueDestinataire] [varchar](3) NOT NULL,
	[Type] [int] NOT NULL,
	[IdCommission] [int] NULL,
 CONSTRAINT [PK_Virement] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'1dTXkANrkQKpegZQf3ZRQXMzM3awJYwXplZjvBiCe0Ulfq9eQ4kbrt8xeG9nvLRi2QFNZn9weUsTNEFHxEWBH7Kdfh0zBPPylimxwgyUsPYVLzwKculUkVAXM37z9KWhQmFjprPRMtjWoTh4lhD6gX0jMuqzzMRBxLwSurGmWEP4zQc87NMSrXpgJ26qmNDx8uo4iG6FCDbB70RvMRXc7G3rUOru0n8BDmdU1tQ05fToCZyEq5JrA4xwXD3WfGQ', N'blablabla@mailinator.com', N'clientweb', CAST(N'2018-03-05T09:05:22.207' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'3rNKGbPUbyyo5bmEqfC5IK9cna4YAlikkTHSo3a6mhY6JO0mVn3LApI7mGTNgMpZQvQcTv1e3qje4mjHabGVoV6YTq8AOOglGqhiIGZJeFvEpsHMgXDlI2xcIGMebKFip4x7FQfN0Sb7RI5p7mc7NaUlpqJ4bJ13hOuR9hFPsjzE6lD1JgIltbyR1SNtKdTy9kE96P2hiuPdrMtO8v5Opyx9JB0BDqd7e7FPCNXzCgFjACruKNEfcG1ZrAYmsVT', N'blablabla@mailinator.com', N'clientweb', CAST(N'2018-03-04T22:38:45.973' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'40kwFrCqji7q7sUHBye6yP3XftgjxmMW3PltxRwWbvdaPyJFLi77ZXH5mHESzQohD4VcD7bskW8BPcjlNA2CwhazbD2t3iekuX8gFuF2rPSaDnSKoLU28JrOu4cMqFKttDRoMrAVuvMIDVUl5aaYnboOga4oBRlMchYPbDGXnGQKA3cCHwQ717e6DwGKLKPbeatSy8c6rMjZavs1WoSO1KThoku0unzuZDxyUukDtBOuAohOCtRGcEjjXS4w9aJ', N'test_access@mailinator.com', N'clientweb', CAST(N'2018-03-30T15:42:33.440' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'7mVoPQjk3SYCFoQcX9EEoNZSUURiSWC4TLfA9jBR3owRZXhSdZbXu9qKPDY2pQzSqXQTCSvG8r4SM8Wu8Kz4YGyMD4JwAsIQv6uOHGTPgYj9PtQQPhJFwY4kc6Vz1l0PuBv2UCKA1eixjdAaKCxcECl0LnyHb2Ek2KXzhZnBI1Q7kdZspG3fQxx0tRg3qYQQs31BivYqs4guMcsJSToyz42qBM34ioMVHvGBHY6cL9lKJJh8HjVCBQ0I8Hzfcd2', N'test_tharwa@mailinator.com', N'clientmobile', CAST(N'2018-03-13T03:15:20.887' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'BMufbT6getfrXOkiPbC0Ezqm6LsJMIA7svGF2166XNcMXrkK2fF5OREY5YR3C1PwQ4xdduTa5TgnWDeCiMkAIhuDmX34aPWeHtpqvJ2D7dLZHZ1NivATyDfH6SXlVrZgKYSErUTWXLZXX0k4KsqHGWPSejfnpJASQYjiNtAUMy3XpuxPVg0LvZwDQo3czzlfW2eNEewfB6flPU2WwYsB1XXF2UctpWtaGF8pKHBOYvs8UxMIrbOkpkcQViink1v', N'blablabla@mailinator.com', N'clientweb', CAST(N'2018-03-04T21:22:23.937' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'D2AimRJyuNcimfwjgcKsIkmI7qKxJNBmWUcJnmpBhzgoKQMTjcMZap7mjNzHHjrmd37SM7hjh7MTzCxTW6i4VoLhM3uzZiV5z6VGokjmrBi6RotbQayg7AHxFBqm2HCfkBu8R7xHH2msPgE3zHTGp8jUznMbB7FDQSXCeTTwZbwudJxs0YovnyMYqm5a5XZt7TdaEHOVaJ46ERJokEcpzR7FezwxFU1LgnwL1PUqm61odJ0sxlWqQQvS9MOYtL6', N'test_refresh@mailinator.com', N'clientweb', CAST(N'2018-03-15T19:02:54.607' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'fKkrejnNnTL6qpv569f1fHikmCdW1FmOkjYRRR377P1J218tMf6fxnj7h1HbzTULJSOpF5ADcZ470ugV7FFvwPdn81wrafcPxlVzKrEee8z6oyfjGe2rwgnI4GT3WJkDOsIe8Fgz6L0tEtTa6WSuT0ytOAopTZP5z1hEb36s9lifGHvYMQx8OBC5AcF1XPJlKsKrXw0XnI2hUSc6K7fJZOHNHrUsJg9yMMDPTRyGkqybdtcAvdtJXf4pZBTRO0p', N'ea_azzi@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-04T18:50:07.447' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'KbHuxD34DmAStTxCvQmhDQREJ1D9v5ElMfX0vnXGtv6Gy3xoVNRRgPPoPSZBKcTyAgGDcxuhCFQblLNbT0yNiuBQXxyqQPMMIlbfAkUyyP2r6zO3cmmfavW7OFo7yZf2yKY2QjocefP3uQEpGb5d29sXmQ4udqiwOcsJBpZaZzwK5aw4DkEHETv9txsicudNc9xjrO358QORqYRzj1tJmcS8hnTXQX8sPte56561BXHt7QmRkqa2oo25qgGFmA0', N'test_test@mailinator.com', N'clientmobile', CAST(N'2018-03-12T14:11:07.157' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'lHianuNfsWf7tKdOV06tzgSH2gP62FvI8tUP8mCuimkCnqGn7zZTkXlbohWRQ2yT32QyLJwsPR980SIqqG3jTXzXxzJF3ehaR7AntULwWWA8UqHfOeWkLSoU6k3vwDdcvXPt8eiio6AdgxUM8o0CpTYt8zIm6LYbFhxKKH9FMTAOifnB3NaihpGdkpfmQSxsapHBljZ0Um6E3cywbxFDPg5KjT6I6FV1wXcW2ILsWfWjdSNJa64zP3L039wxmuM', N'em_meguellati@esi.dz', N'clientmobile', CAST(N'2018-03-05T12:27:27.650' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'opNVYEvjitkSyzZnnt9kcyUqlSbbI02UGgvUKTjhN70Y1E4n5FgkK93eynyoRFYOfHuGjE3DebFtYB77fzSGEcworjyp9TdEHEERxFaGLHotSAh3WaLC8JIGtp9uyFaF8nvLZdBywnIZXh2b2BV5GGUQltdKJvzAsskUotu6DE237LTsA0GFVCwcbZNKr1xxX3TcK3Dn7O4sjpMthqklShr8mopndJBK06IoCk0tXLRfJ4nLEgH37QhVvxtogGc', N'em_meguelleti@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-04T18:47:47.837' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'oWk8KlGbf1rydUYsozIrXqBOG97FKyvycghnhOZWMesuihNvqzo9MEkhQB4W2btV3VhEJc4QcvtQdtvAEFDZxzBLxVtTusFU6SUhjgkfE3hF46nkIotqGdpJjgLt7hA05TmpKxgsSuRbEbVLkJ82yMFf8XjZ5fazbsm3sIhurk5jQ9SrDTStpQwWg8HwJc9OHc428KRsIRWiylZ1HLKisBXYuW5oMe0tCD1fxC2slkqdGpjmXmZPPw1RYdBcSwK', N'test_tharwa2@mailinator.com', N'clientweb', CAST(N'2018-03-10T19:41:15.700' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'p8W4jLwFOeTmXt4xb1tbQc60tvIIenmf1DInZEUkfq01y3U6UMUlyTX0JP3UlgifYmdnWWDSZuLEFjgCquMO7qQKn2Nfv5HJCgk1OEESFF57FSv3CFF63mMIo68vcWya3KgrSVFrGA3RpyWs1B6Wt6DwmGMdnuY53o7bm9btQVrulDuPWmx98tpQEGWyEsRYaaOyu0IRkMM3t2DILq1bs3rm6vACFz4YowULerJsWKqhrG95M0tX4UFcN5Pv4JY', N'en_kerkar@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-04T18:46:23.293' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'pDzAXBtbTmje83mEHXssOdXCp2SDMEBZqtSfMH890KhM5s3lplxfoiiMdSGGXh0QLPcKHvXQEGdfWxuucbLBfgyfRsnxZJpUUQGjGRoy4b3yFjbSABzm7Mdwe78JTjbhaDuwb5I8jBK6CJoqOWo5cEqZ65wh5ZjJ6azWIDVPhjDmF8FY1tBVMt6FJUe8OHEfswWsBTVQV1WovcOTu8oPOLnAHAH4wZ7ZhyAMnzjCdgrE6inTjPev2lKHySU3Vqv', N'blablabla@mailinator.com', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-04T18:49:48.357' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'QxEh056u0UpNaxE7jheHmnbmNwXHzgOy64JkVZtAuHhMtQ0wf1LQM7qyHNUgFmh1kKXWSApRJIXNEPWZB26kkG4K1Pf2XahIIsoMuIe4UdqL89P1rbIsnEr4VdRagoVq6WIPDlRJX21a6Q2HjkFAMxmHwnr6VhwL8Z2cc4boTlgoPlIG6TwIHqPQMMOE7E80TeD8LCSaFAMKZ4lDwGbw3vw27Lkxa9Y7pSNwN6cM2sVdDmESIiPLdZIzGKArLbs', N'em_meguellati@esi.dz', N'clientweb', CAST(N'2018-03-03T15:17:53.403' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'wcaQrkW4bFANSiwFKtEJDffx6g0wzsmHRJbUfb1Vzlowg2oRi6yMa9MMvuMvMa2pPIDnbSHDU8esYNVOjP2wxehAAxjn8dJXASKtPzcJPAx9PW6tGy3oOWhdwb6WAaOMWiRQ0xRN8QIiDJLd68orYthsYCdtWSDRHSWTz7MYyE44qo9aeP84qGmfdfTUZ2ZbJZ8BCvqEfmb41wRw4mwJqdvSPTaxa7m5o4HjQodLVqSLfgDnPqkU1wB7js5EvXE', N'em_hammi@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-04T18:49:57.217' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'we517JQHQXC8HRDuXGUjtU1QrsLv0cMccJG2Dx3UoRiaAhzpet5LqysCSFtTxyjPxJXnI7E0ZkkS8gfxLANBIDTSTvLBaL6UxOGF18pAINMaGKGwTlZB4hPT3i4fKSAH2VmLFloYh2xx0T7hChDxbYjRUofAqOTwWkPWM3MHLfN7wdtGH2zTTSr030d9NPPBZkilaPnwceA7imOctIbpc9VedSgk6ej75ZsGFLTCORkmUuwqLLT03MJInZCxdnb', N'en_kerkar@esi.dz', N'clientweb', CAST(N'2018-03-09T17:47:49.977' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'WTf1kCE8pAOrK5Slkmhf3YfAlPG25Wyg0lLYNrbcZu7zWLBRpPDRCPbJy6sGNqoG3VUgdoT5x25fGJWr9qSSw4QjgNngpYcPkpD3P12PEoKIet5YnGZzvrzoo1ft04n2kxmuDK3R0gqO1lFJZNlCA2cVqYJlGtKhroD8motkh8SWCrhYA3YFnFLIlvB25Nq2MtGf2FMQzh2QZrch5I6C8RNhx9UqtPldMmRj7PkxzruSRlaw0RUGbWX8FsA319U', N'em_meguellati@esi.dz', N'clientweb', CAST(N'2018-03-05T10:13:54.060' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[AccessTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'ZtjWEhOzB4A78B6qdyQnhg3SNZ89JNipiK5pzcjrsT5jEC330mSSIsJgkNei52VDaQbo4Cm0J0ETpioCVJhmMorlSdkY5XE7f4BqCEUjJnJ4qMwpOoSxvvuTAQpubd7VcBZfkzpKUkl509htkBvj42uD0bktd2FZpCfz9c8xkDIPDmtpBszlaD89bitrGepi674mvp10jdBIPpU12Ru8jyd3V1Pg5ro99oIyGM6xLf8w1HZV5LR65YHa9P2XUaf', N'test_tharwa@mailinator.com', N'clientweb', CAST(N'2018-03-19T13:11:01.263' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Applications] ([applicationId], [description], [secret], [grantTypes], [createdAt], [updateAt]) VALUES (N'clientmobile', N'application mobile ', N'orca@2018', N'password', NULL, NULL)
GO
INSERT [dbo].[Applications] ([applicationId], [description], [secret], [grantTypes], [createdAt], [updateAt]) VALUES (N'clientweb', N'application wab', N'orca@2018', N'password', NULL, NULL)
GO
INSERT [dbo].[Applications] ([applicationId], [description], [secret], [grantTypes], [createdAt], [updateAt]) VALUES (N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', NULL, N'c0xPUEthRXNDc0JoTmRzVGdRTExJVDlZeVpVU1FveVJ1bW5VcmI0NFAzdURsaWNZdHY1MVkxazlCdHpVNGVIVzpwTzZHNkhpdFF3VWVHOE5va29vVFpTSVhIRWVidHhPTmllblNESldpZ1k2emJ5am1yMU9STHJ5cmtubG1XU3ZY', N'password', NULL, NULL)
GO
INSERT [dbo].[Banque] ([Code], [RaisonSocial], [Adresse], [Mail]) VALUES (N'BNA', N'Banque Nationale dAlgerie ', N'8, Boulevard Che Guevara; 16000 Alger; Algérie', N'banque@bna.dz')
GO
INSERT [dbo].[Banque] ([Code], [RaisonSocial], [Adresse], [Mail]) VALUES (N'THW', N'Tharwa', N'OuedSmar', N'compte@THW.dz')
GO
INSERT [dbo].[Client] ([IdUser], [Nom], [Prenom], [Adresse], [Fonction], [Photo], [Type]) VALUES (N'ea_azzi@esi.dz', N'amal', N'Azzi', N'Bejaia ', N'Etudiante', N'image/picture2.jpg', 0)
GO
INSERT [dbo].[Client] ([IdUser], [Nom], [Prenom], [Adresse], [Fonction], [Photo], [Type]) VALUES (N'em_meguelleti@esi.dz', N'meriem', N'meguelleti', N'Setif ', N'Etudiante', N'image/picture3.jpg', 0)
GO
INSERT [dbo].[Client] ([IdUser], [Nom], [Prenom], [Adresse], [Fonction], [Photo], [Type]) VALUES (N'en_kerkar@esi.dz', N'nawal', N'kerkar', N'Bab El Zouarre', N'Etudiante', N'image/picture.jpg', 0)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'0926', N'test_access@mailinator.com', CAST(N'2018-03-10T15:37:26.997' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'1972', N'en_kerkar@esi.dz', CAST(N'2018-03-09T17:47:07.470' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'3576', N'test_tharwa@mailinator.com', CAST(N'2018-03-19T13:10:43.457' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'4007', N'test_test@mailinator.com', CAST(N'2018-03-30T15:25:00.990' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'7564', N'dl_ikhadallem@esi.dz', CAST(N'2018-03-24T00:39:41.773' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'7613', N'ea_azzi@esi.dz', CAST(N'2018-03-16T15:30:36.887' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'7652', N'test_tharwa2@mailinator.com', CAST(N'2018-03-17T11:42:49.297' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Code] ([codeId], [userId], [expires], [createdAt], [updatedAt]) VALUES (N'7958', N'test_refresh@mailinator.com', CAST(N'2018-03-10T15:38:07.020' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Commission] ([Id], [CodeCommission], [Date], [Montant], [NumCompte]) VALUES (0, 0, CAST(N'2018-02-26T21:33:16.780' AS DateTime), CAST(30.7000 AS Decimal(19, 4)), N'THW000003DZD')
GO
INSERT [dbo].[Compte] ([Num], [Balance], [DateCreation], [CodeMonnaie], [IdUser], [Etat], [TypeCompte]) VALUES (N'THW000003DZD', CAST(3100.4000 AS Decimal(19, 4)), CAST(N'2018-02-26T20:12:22.697' AS DateTime), N'DZD', N'en_kerkar@esi.dz', 1, 0)
GO
INSERT [dbo].[Compte] ([Num], [Balance], [DateCreation], [CodeMonnaie], [IdUser], [Etat], [TypeCompte]) VALUES (N'THW000004DZD', CAST(5100.4000 AS Decimal(19, 4)), CAST(N'2018-02-27T12:06:45.863' AS DateTime), N'DZD', N'ea_azzi@esi.dz', 1, 0)
GO
INSERT [dbo].[Compte] ([Num], [Balance], [DateCreation], [CodeMonnaie], [IdUser], [Etat], [TypeCompte]) VALUES (N'THW000005DZD', CAST(1900.0000 AS Decimal(19, 4)), CAST(N'2018-02-27T12:06:45.863' AS DateTime), N'DZD', N'en_kerkar@esi.dz', 1, 1)
GO
INSERT [dbo].[Compte] ([Num], [Balance], [DateCreation], [CodeMonnaie], [IdUser], [Etat], [TypeCompte]) VALUES (N'THW000006DZD', CAST(127.9948 AS Decimal(19, 4)), CAST(N'2018-02-26T20:12:22.697' AS DateTime), N'EUR', N'en_kerkar@esi.dz', 1, 2)
GO
INSERT [dbo].[Compte] ([Num], [Balance], [DateCreation], [CodeMonnaie], [IdUser], [Etat], [TypeCompte]) VALUES (N'THW000007DZD', CAST(500.4000 AS Decimal(19, 4)), CAST(N'2018-02-26T20:12:22.697' AS DateTime), N'USD', N'en_kerkar@esi.dz', 1, 3)
GO
INSERT [dbo].[Monnaie] ([Code], [nom]) VALUES (N'DZD', N'Dinare Algerien ')
GO
INSERT [dbo].[Monnaie] ([Code], [nom]) VALUES (N'EUR', N'Euro')
GO
INSERT [dbo].[Monnaie] ([Code], [nom]) VALUES (N'USD', N'Dolar Americain')
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'3zpTnxbTRVlpKQHd219WOUlyVIA4oENGQjMfq9XTWvWXHHbDxOC6uWXBl0dF7fk5HF19VTvCsjXfVVXijWdt76mtuEhEEn9MevxXZFHcUxr8zOMA3trs6z76FSGFBOYsioI5oTsSSzQGheOdSFmdHOoX7YtKCO6sMosuunz5mbAK7sGgzyYJAyMftHJXDjIhEoBg5N9kIlsbyJrlzI29vsrAyUGcUqj9HhOagapd6h3PpV50epd8N1NRBqg6VgV', N'en_kerkar@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-05T17:46:23.327' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'4VIW9vXkqlJUqLBPGxynHClaJy3hCunj6Py8rElfPOeADA6t7bOYoAPD7uwAuZCAc9UGtAVU3hmOs8LFtVF1CO0F0re9JGbxn8NEeCFqF74uIz4fCWPkCWDtzpSVjuGYquByed1iH2y1byFy82k32TKMSBmayDB2SWqhuZId3gVqxA68MzIOABjbufpwgmRWfbqWy2Pwd0XAkaoDtGzG2mjv1gidt4Gj19Jt68yHPjUS3gjZa2jEDDH2RidooES', N'blablabla@mailinator.com', N'clientweb', CAST(N'2018-03-05T20:22:24.923' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'5EGjTd2rlwX5qu1VzAp6QXxI3ffdgaUyUa48p8k3MqVlHuFxSM4jVmjftrzJJTdh7Nyv05Lvqhc23OiPxs6nlN37zXqr4tBqTdPygZQbcGyiOSD8qYCLbbtnlwi3k36ovr9PpBhlsoqmvkKp9DQWVOe0Stv2hugYcRrHr0ZFAmJCnIBaHyBhWQbjLNXZemreuWGGIEPALigQqPylAzbncDEab6EsV620dFZlBCDOEsmOrfsYoy9YxbJes2WFuIO', N'ea_azzi@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-05T17:50:07.477' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'7paYpDcW6ZqYAbWP3ZDgcFNpP857EqQUL9KWGlsFUtMtFySS4SYJ4iJJtdydYmsiT1IoRhyXCzStjSxQ9vIB0dsAc3W385Fbx6GkPCTomvzpXTMgR82pRt4XJh8hoMqxjIztuiyn9iAOu2do4wFRcMhGDDZi9oUB0KDFfpw71NUuk4oghnZEdZm6Lizb5ewvQix8dEMFgnWoTJlg5XiIdwkVSPg3ymQLmSSKcXtvsPvq8WBVEvtGp2pWKeSjDZP', N'em_meguellati@esi.dz', N'clientweb', CAST(N'2018-08-31T14:20:42.603' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'aFhebhNLWhLmEqjhrw3ParZyNDSWiZEuPPg26cbKNcxAOmON2iXRgBesVvp1nsaCkw8UVJfQHRDDXbQ1I2CNauGTpKNSz56Hlm5uhQFEdJYShAV4WQb1LxIiHSIndgcjE04aSKPw9ecjxOf8WpW2MnY9e3p5x6CaLCbtoDcW1MNFs2pnsMl7yjKkeTwz7JzAgkaOIMRNsFkFjOntjoCnyUvAGF5OjUDjPwSvIBNmDwyIfyToIG10YceUlUJvG8s', N'em_meguellati@esi.dz', N'clientweb', CAST(N'2018-03-06T09:13:54.103' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'CvWMQs7BN9nBzzEhlMWS2xCuO6eH7tY8jRX67Iq4eiGczhhq8jkGVSpSHH5PFJ4GbF39CqC3J8hvNzhGPiSxMJx5NHT0R1BfXGdA1f2VCIhnfZwbMDNuKCVVLZDj1iMS5KTTbYvVcOr0bekK17egeBL0x3HxPrjKzLyhsL3deDQJr5JccJ9a3mLkJITcBiaGbJ0CNM8HSC9hKiKeu1hYV2RwD5wJY4qCOeEqQ1RxXau00J16twv6dvUkDf2HkYQ', N'test_tharwa@mailinator.com', N'clientmobile', CAST(N'2018-03-14T02:15:21.040' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'd6pMcyBPndHk2nuTtPZsUiRLPfzxqraV2ORq0BXmkqAh0UfECtl3rgcqj49wK2aYRcSZF74R8v8uspeHvotVjfO85TdD6f4idga644TCmHB3qRqWCy8wdffcfKRaxhi8MFBRCdiMj4aRXL8GiBInlv895sWUXrArpoc2lg4LNzb6XRH8uj2wbHtkjOL3uTDJ13ccO5MAUTMMkKSuOIee4WRwfJsmMbgxVLManp5kNgXiswUgC70Qab6AZCeB36f', N'em_meguelleti@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-05T17:47:47.857' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'FRXDHiK9zeVdJ24HDVwl1AfXwUrnpBh7U5v1t0Px1BFZ6zB350Ya4Pvwks6YOOciS13ptPaPTj7mmYntuX3ZgqF73SSNB6WQWSNmIJRNxlhJXAT5Ur8SnQHE31Z6loccn6kluJ7nRp3Bae4dgkJ5fL6FjfyIhkO5xTo9K2ePvCLJiGBK2FGo38CXCGgT6kkEqI0ERjvhCBwA8vxXOlCPhad4hykf68QQSWrhbjt9Fpobr2gTZ49ugCzxtTXh1V6', N'blablabla@mailinator.com', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-05T17:49:48.387' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'G33ERPIrPGVyxfkXBFfyTy7XbpCh49bHeew52iHkY26ew753CwdkBuShkoagGNLuAEP7TRLJo7Vlbtsb8xutmgn4CbCOt3j6pnWKd7xXKPFzFBsfTEwlCdxIWRAJvu6aG6JkF9d7Xy8jIv7uFxnqkwhgq2HXFYD8lpKPLS95gvzPqBRGQg7yy9YGS24Oy8yeLolOmDfb6aEyb9NqGCm27fM1iaId0wxmDI1iMJ1tXYorEaboePZGktIjUYcpbJs', N'en_kerkar@esi.dz', N'clientweb', CAST(N'2018-03-10T16:47:50.570' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'gFHCS6G0oT2X8RzP7jbqi4oD3p5V3vU2AH2MtqDKt5OyGXMJjks8yizjpo3hYp6QMu2xMllmZsUCVpyjn7EyIWRBfwZDLKkIo4fEJew4KhjgXtkLPFbyn0UUA0thFHKEVN9PcfBgvIsXGuS7uha88LOQg4RqrF5kG7tqNs2LC0yM3xzNDL7WxN2Lj4NukHRd2B6SCau1S5DQEg4kOTQkNCYqCgFhsLtDEAOuBsBH0dsFJuKJaA6C0XxkZJd1jdF', N'en_kerkar@esi.dz', N'clientmobile', CAST(N'2018-03-06T11:30:02.267' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'gHaHHaSY2oxyE9hjtJH68PgfLz7W0mapD91Yu5pwDAItGPh7DwxCzO9CVj1RjY8MiU8RR0DWTNHWJYe4g6nqBMBCRAKr7vgUWpNJQFl1Z6mXAIxQCern2xljlVl2rEiQY0nWhUEKqWhr6ATiOKL5c2ccbDEROgmMF5eaEIZCTJJRVtiRVHh3iXZzmalhiCQZF2DKCpy3uNM6Ddrp5VcvyZYmZcECaLH6ek6YLuPovEs5VRtyFTGDi0vhtmd5Aw9', N'test_test@mailinator.com', N'clientweb', CAST(N'2018-03-16T18:02:53.997' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'igGON8BTLZ0Oar3aEpYqSb2yhT9LfQVWu33duUG5984HMiyzQJbPbQhnKrRUbLdHrMyCXfYkcteTpzpMN1JadSebKbJqkcPemvovXT9lF4xxlJ5TABWODwNztD2QCgQmyWpi4WWk1vzno2z5qUFl01NB7ohyTfnoIBzfgf8mlFRuNkXyyFNXu1nH9q3cvGrdd8hZOS2woFwAesDLgmpeJCjawWCNco2d1lLXuRWHkCHGVNPqKqdtnnvrDqZFHAz', N'blablabla@mailinator.com', N'clientweb', CAST(N'2018-03-05T21:38:46.713' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'Itnl4jCPuHJeeJDOlFS7YzPvHJ3UBwFe8YLoQTodwR91y97lAxaZ6Apf2EoxefmpHfYHkPyxVZRNyfYTFSOT3ZH5kyum3FyJ0WZPMs0YZRj215TQGbOeUZm5DDg4WboCFiTfYoPz9M0yharwRGbq8JCzbq2JbaCi8JIAwD3DuiCYAhkyj7mqyBDucul2mNLHAGZUptxuMUEz7CiM7j2oyvYo3Xh4blqjOCGuKWsB052v23FB6IYk8WdgkQQb4Pp', N'test_access@mailinator.com', N'clientweb', CAST(N'2018-03-11T14:42:33.590' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'Jrt50K2rccltsJfoi0iP87hhnOUPq5AbXXFvaSdd72Q93dTK61pAQRKSySHZKTwld1awUOvO3y6bk92lFAWnpDJhmoNgjtqqdlyn5rooMuQlNONR6EUDb3NT4iRfAk8lbpCwQwr43Vyw4eDvIgBYrHF8jE7bLMgP61YU03cBow7bgQlEGKei5OhPBAMsQHFA9NxoHWJ8IgE4eCXtiEBwKKw6UwFWuOEsY658FssU0YrUTu0kDFJutyScYq5pYLv', N'test_tharwa@mailinator.com', N'clientweb', CAST(N'2018-03-20T12:11:01.423' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'KD9gneU6ys1GfQJhoVR6SnXPldMjy10bRyLA6OGmglagwayvIzbZV5oROzI3x1v5xQ9K1tn81bKfl7KCgjtF4XPvORzHItGt80ZZoPcftrIqpmblap24ztfN432EripNNjGzrA1fcM7ouJ0kK30lRyiPhXA2doVRVDKnD7UujeUmSw5S4ElplOygg0Np2DU7kWF2wo9oIFYl6S2FocB0sPMGy2DXkOCRuzgC4uqH1qfHmtvqOGdD9rgg7ImoHS5', N'em_hammi@esi.dz', N'sLOPKaEsCsBhNdsTgQLLIT9YyZUSQoyRumnUrb44P3uDlicYtv51Y1k9BtzU4eHW', CAST(N'2018-03-05T17:49:57.250' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'TwNin3U49AH60Lbdb8LthBDqldzdkLx4DljXRn9eaw5Ed8v4UsaHoCGzvDmTE2CTrg5KuxmNagWBMuluEWm6WTCdaffMHZz8K7Cz8qimBKiYynk3fcZM439U8W8FFXoi8gwVbxG0Uz2yGj9fsSH6tAz9s1mLkb095XQQliGiA86s3bwvWLp029X4YnjTXfyPW40n7jm0BPcuHKYWjokUgUR47SymujpLABgdhEQUGJnQdETd3p5I2fq9WGmmecO', N'test_tharwa2@mailinator.com', N'clientweb', CAST(N'2018-03-11T18:37:57.237' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'uhZZPcTo7IgkDv7GI4n4pGh5LZYcBkUHKqF6MIhOurGTkIs1hDokCiar0LQUpkSedosmUooZnP1ZPwnJ6CM53Nu5km7MDKufLR5GNzO5CvL2XhuGox0deqbF4BzXuoMECDgNH4oewauAyxYiE6RlDH8G7O5Pcn18FCZ6TZ6pJD2px7ooLYDUh7YPKifWurUU73sV3y3igZMMZ7bVlH5dgpHMoM8ihgOGcqA0U7fCm1hsgfqqt0jPeFmfqWwKRYE', N'test_test@mailinator.com', N'clientmobile', CAST(N'2018-03-13T13:11:07.327' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'vcSsDTu9gtCSkhcL1sxrMz7jpCmpOkuGYFmOi9MCt2imAa4Efsn0khPUrgOYS5nq6WBjWL4aTdzfOnwk6xAah5WJvlAeHvDf3pq8cQ5Y1N30j1271nt7wT3XdPuhX4jtxafhIBOhLd6BzG0AucXtvXggwmBW9rI7VSIozIjoPX662Qk350mfNytwdLYumhrvZ30TRoNQpeM3Z7hXLYP7EEnOVn3iDO3y79DJSnFrvjVGT6Fa9sImfdtO37DCSEJ', N'blablabla@mailinator.com', N'clientweb', CAST(N'2018-03-06T08:05:22.293' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'xmknkNyGfeMSO9XhTMETw4L8g1QE0jeyIku63bUXbljhs9nLqTYL1dW80eeXEqBVz5uDlwiQ6d5FohxirJ2dg0VVAK0qo2eAWBkGeT4SaIw9KbBNwRDlQshBGpWe4149b0qSwueVcnaQvIxF0wfLdJ2o3BGuwH4Nj91Nl3TLOmIBazItcDUwSEA7PhqfCKkVNABGDy3QEGcNCPMR5MkZpM4zeOiGvy1u8Mxt22IFbcD526ZaBWqPzFYnAeK5ooP', N'test_refresh@mailinator.com', N'clientweb', CAST(N'2018-03-30T14:38:57.730' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RefreshTokens] ([tokenId], [userId], [applicationId], [expires], [createdAt], [updatedAt]) VALUES (N'XuovnUKsYpLsdsQVHy96wXCY4sePbdUhfXUzu3oZIfJzEwCONxAMKqoT8mAr9WU8FBivL4T1KYiQ7lDgzZZB7oDDvNtcfHJlzEq66wCKCIbVZsi4NGfahS9ahOqNfJbsfpOWAFbHl2NjmtGWuHWOyX2roJR0keJW1E6VWppwFkrIJcuA0tBKoNxWj7AWb79A98HZwWtxGsa7rPMFmokUHXoy0QbvUH75qeQLvmISUyeaCWKVMevdqKKpPcmRqs7', N'em_meguellati@esi.dz', N'clientmobile', CAST(N'2018-03-06T11:27:27.673' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (0, N'Courant vers épargne', CAST(0.0000 AS Decimal(19, 4)), NULL)
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (1, N'Epargne vers courant', NULL, CAST(0.1000 AS Decimal(19, 4)))
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (2, N'Courant vers devise', NULL, CAST(2.0000 AS Decimal(19, 4)))
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (3, N'Devise vers courant', NULL, CAST(1.5000 AS Decimal(19, 4)))
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (4, N'Vers un autre client THARWA', NULL, CAST(1.0000 AS Decimal(19, 4)))
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (5, N'Vers un client d’une autre banque', NULL, CAST(2.0000 AS Decimal(19, 4)))
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (6, N'Virement reçu depuis une autre banque', NULL, CAST(1.5000 AS Decimal(19, 4)))
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (7, N'Commission mensuelle frais de gestion compte courant', CAST(100.0000 AS Decimal(19, 4)), NULL)
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (8, N'Commission mensuelle frais de gestion compte épargne', CAST(50.0000 AS Decimal(19, 4)), NULL)
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (9, N'Commission mensuelle frais de gestion compte devise', CAST(200.0000 AS Decimal(19, 4)), NULL)
GO
INSERT [dbo].[TarifCommission] ([Code], [Description], [montant], [Pourcentage]) VALUES (10, N'Commission sur un ordre de vision : total des commissions sur les virements générés', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'dl_ikhadallem@esi.dz', 1, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'Ikhadallem Lotfi', N'0549018080', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'ea_azzi@esi.dz', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'amel azzi', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'em_hammi@esi.dz', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'mohammed hammi', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'em_meguelleti@esi.dz', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'meriem meguellati', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'en_kerkar@esi.dz', 0, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'nawal kerkar', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'test_access@mailinator.com', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'acess', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'test_refresh@mailinator.com', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'refresh', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'test_test@mailinator.com', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'test', N'213542691679', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'test_tharwa@mailinator.com', 0, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'test tharwa', N'999999999999999', NULL, NULL)
GO
INSERT [dbo].[Users] ([userId], [type], [password], [username], [numTel], [createdAt], [updatedAt]) VALUES (N'test_tharwa2@mailinator.com', 2, N'db523cc5800558b0a84b1a97b8dc34ce4e1337c4d7cd32dcfca6a91b1d420ff4', N'test2', N'999999999999999', NULL, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000003DZDBNA000005DZD201802260938', CAST(N'2018-02-26T20:25:04.510' AS DateTime), N'Envoie dargent', N'1', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'Nawal Kerkar', N'THW000003DZD', N'THW', N'Amel Azzi', N'THW000004DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000003DZDBNA000005DZD201802261053', CAST(N'2018-02-26T21:38:26.163' AS DateTime), N'Envoie dargent', N'1', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'Nawal Kerkar', N'THW000003DZD', N'THW', N'Yasmine Boudjelli', N'BNA000004DZD', N'THW', 1, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000003DZDTHW000004DZD201802261053', CAST(N'2018-02-26T20:25:04.510' AS DateTime), N'Envoie dargent', N'1', CAST(150.0000 AS Decimal(19, 4)), NULL, NULL, N'Nawal Kerkar', N'THW000003DZD', N'THW', N'Amel Azzi', N'THW000004DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181441', CAST(N'2018-03-18T14:41:39.580' AS DateTime), N'Envoie argent', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'nawal', N'THW000004DZD', N'THW', N'nawal', N'THW000003DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181442', CAST(N'2018-03-18T14:42:39.403' AS DateTime), N'Envoie argent', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'nawal', N'THW000004DZD', N'THW', N'nawal', N'THW000003DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181443', CAST(N'2018-03-18T14:43:11.533' AS DateTime), N'Envoie argent', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'nawal', N'THW000004DZD', N'THW', N'nawal', N'THW000003DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181506', CAST(N'2018-03-18T15:06:44.990' AS DateTime), N'Envoie argent', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'nawal', N'THW000004DZD', N'THW', N'nawal', N'THW000003DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181507', CAST(N'2018-03-18T15:07:47.583' AS DateTime), N'Envoie argent', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'nawal', N'THW000004DZD', N'THW', N'nawal', N'THW000003DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181749', CAST(N'2018-03-18T17:49:10.320' AS DateTime), N'envoie', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'Nawal kerkar', N'THW000004DZD', N'THW', N'Nawal kerkar', N'THW000003DZD', N'THW', 0, NULL)
GO
INSERT [dbo].[Virement] ([Code], [Date], [Motif], [Statut], [Montant], [Justificatif], [NumOrdreVirement], [NomEmetteur], [CompteEmmetteur], [BanqueEmmeteur], [NomDestinataire], [CompteDestinataire], [BanqueDestinataire], [Type], [IdCommission]) VALUES (N'THW000004DZDTHW000003DZD201803181757', CAST(N'2018-03-18T17:57:29.280' AS DateTime), N'envoie', N'0', CAST(100.0000 AS Decimal(19, 4)), NULL, NULL, N'Nawal kerkar', N'THW000004DZD', N'THW', N'Nawal kerkar', N'THW000003DZD', N'THW', 0, NULL)
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Applications] FOREIGN KEY([applicationId])
REFERENCES [dbo].[Applications] ([applicationId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Applications]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[Commission]  WITH CHECK ADD  CONSTRAINT [FK_Commission_Compte] FOREIGN KEY([NumCompte])
REFERENCES [dbo].[Compte] ([Num])
GO
ALTER TABLE [dbo].[Commission] CHECK CONSTRAINT [FK_Commission_Compte]
GO
ALTER TABLE [dbo].[Commission]  WITH CHECK ADD  CONSTRAINT [FK_Commission_TarifCommission] FOREIGN KEY([CodeCommission])
REFERENCES [dbo].[TarifCommission] ([Code])
GO
ALTER TABLE [dbo].[Commission] CHECK CONSTRAINT [FK_Commission_TarifCommission]
GO
ALTER TABLE [dbo].[Compte]  WITH CHECK ADD  CONSTRAINT [FK_Compte_Client] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Client] ([IdUser])
GO
ALTER TABLE [dbo].[Compte] CHECK CONSTRAINT [FK_Compte_Client]
GO
ALTER TABLE [dbo].[Compte]  WITH CHECK ADD  CONSTRAINT [FK_Compte_Monnaie] FOREIGN KEY([CodeMonnaie])
REFERENCES [dbo].[Monnaie] ([Code])
GO
ALTER TABLE [dbo].[Compte] CHECK CONSTRAINT [FK_Compte_Monnaie]
GO
ALTER TABLE [dbo].[OrdreVirement]  WITH CHECK ADD  CONSTRAINT [FK_OrdreVirement_Client] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Client] ([IdUser])
GO
ALTER TABLE [dbo].[OrdreVirement] CHECK CONSTRAINT [FK_OrdreVirement_Client]
GO
ALTER TABLE [dbo].[Virement]  WITH CHECK ADD  CONSTRAINT [FK_Virement_BanqueDest] FOREIGN KEY([BanqueDestinataire])
REFERENCES [dbo].[Banque] ([Code])
GO
ALTER TABLE [dbo].[Virement] CHECK CONSTRAINT [FK_Virement_BanqueDest]
GO
ALTER TABLE [dbo].[Virement]  WITH CHECK ADD  CONSTRAINT [FK_Virement_BanqueEm] FOREIGN KEY([BanqueEmmeteur])
REFERENCES [dbo].[Banque] ([Code])
GO
ALTER TABLE [dbo].[Virement] CHECK CONSTRAINT [FK_Virement_BanqueEm]
GO
ALTER TABLE [dbo].[Virement]  WITH CHECK ADD  CONSTRAINT [FK_Virement_Commission] FOREIGN KEY([IdCommission])
REFERENCES [dbo].[Commission] ([Id])
GO
ALTER TABLE [dbo].[Virement] CHECK CONSTRAINT [FK_Virement_Commission]
GO
ALTER TABLE [dbo].[Virement]  WITH CHECK ADD  CONSTRAINT [FK_Virement_OrdreVirement] FOREIGN KEY([NumOrdreVirement])
REFERENCES [dbo].[OrdreVirement] ([Num])
GO
ALTER TABLE [dbo].[Virement] CHECK CONSTRAINT [FK_Virement_OrdreVirement]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK_Client] CHECK  (([Type]=(0) OR [Type]=(1)))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK_Client]
GO
ALTER TABLE [dbo].[Compte]  WITH CHECK ADD  CONSTRAINT [CK__Compte__Etat__4AB81AF0] CHECK  (([Etat]=(0) OR [Etat]=(1) OR [Etat]=(2) OR [Etat]=(3)))
GO
ALTER TABLE [dbo].[Compte] CHECK CONSTRAINT [CK__Compte__Etat__4AB81AF0]
GO
ALTER TABLE [dbo].[Compte]  WITH CHECK ADD  CONSTRAINT [CK__Compte__TypeComp__4BAC3F29] CHECK  (([TypeCompte]=(0) OR [TypeCompte]=(1) OR [TypeCompte]=(2) OR [TypeCompte]=(3)))
GO
ALTER TABLE [dbo].[Compte] CHECK CONSTRAINT [CK__Compte__TypeComp__4BAC3F29]
GO
ALTER TABLE [dbo].[OrdreVirement]  WITH CHECK ADD  CONSTRAINT [CK_OrdreVirement_Etat] CHECK  (([Etat]=(0) OR [Etat]=(1)))
GO
ALTER TABLE [dbo].[OrdreVirement] CHECK CONSTRAINT [CK_OrdreVirement_Etat]
GO
ALTER TABLE [dbo].[OrdreVirement]  WITH CHECK ADD  CONSTRAINT [CK_OrdreVirement_Statut] CHECK  (([Statut]=(0) OR [Statut]=(1) OR [Statut]=(2)))
GO
ALTER TABLE [dbo].[OrdreVirement] CHECK CONSTRAINT [CK_OrdreVirement_Statut]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_User] CHECK  (([Type]=(0) OR [Type]=(1) OR [Type]=(2)))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_User]
GO
ALTER TABLE [dbo].[Virement]  WITH CHECK ADD  CONSTRAINT [CK_Virement_Statut] CHECK  (([Statut]=(0) OR [Statut]=(1) OR [Statut]=(2)))
GO
ALTER TABLE [dbo].[Virement] CHECK CONSTRAINT [CK_Virement_Statut]
GO
ALTER TABLE [dbo].[Virement]  WITH CHECK ADD  CONSTRAINT [CK_Virement_Type] CHECK  (([Type]=(0) OR [Type]=(1) OR [Type]=(2)))
GO
ALTER TABLE [dbo].[Virement] CHECK CONSTRAINT [CK_Virement_Type]
GO
/****** Object:  StoredProcedure [dbo].[AddClient]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddClient]

(@IdUser varchar(50),@Nom varchar(20)
           ,@Prenom varchar(20)
           ,@Adresse varchar(90)
           ,@NumTel varchar(20)
           ,@Fonction varchar(20)
           ,@Photo varchar(max)
           ,@Type int)
AS
INSERT [dbo].[Client] ([IdUser], [Nom], [Prenom], [Adresse], 
[NumTel], [Fonction], [Photo], [Type]) 
VALUES(@IdUser,@Nom,@Prenom,@Adresse,@NumTel,@Fonction,@Photo,@Type)  
GO
/****** Object:  StoredProcedure [dbo].[AddCompte]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddCompte]

(@Num varchar(50)
           ,@Balance decimal(19,4)
           ,@DateCreation datetime
           ,@CodeMonnaie varchar(10)
           ,@IdUser varchar(50)
           ,@Etat int
           ,@TypeCompte int)
AS
INSERT INTO [dbo].[Compte]
           ([Num]
           ,[Balance]
           ,[DateCreation]
           ,[CodeMonnaie]
           ,[IdUser]
           ,[Etat]
           ,[TypeCompte])
     VALUES
           (@Num,@Balance ,@DateCreation,@CodeMonnaie,@IdUser,@Etat,@TypeCompte) 
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]  
	(@Id varchar(50),@UserName varchar(50),@Pwd varchar(MAX),@Type int)
AS
  INSERT [dbo].[User] ([Id], [UserName], [Pwd], [Type])
   VALUES (@Id, @UserName, @Pwd, @Type)
GO
/****** Object:  StoredProcedure [dbo].[AddVirement]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddVirement]  
    (@Montant decimal(19,4),@CompteDestinataire varchar(50),@CompteEmmetteur varchar(50))
AS
 INSERT [dbo].[Virement] ([Montant],[CompteEmmetteur],[CompteDestinataire])
 VALUES (@Montant, @CompteDestinataire, @CompteEmmetteur)
UPDATE [dbo].[Compte]
SET Balance -=@Montant  
WHERE  Num=@CompteEmmetteur

UPDATE [dbo].[Compte]
SET Balance +=@Montant 
WHERE Num= @CompteDestinataire

GO
/****** Object:  StoredProcedure [dbo].[GetClient]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClient]  
	(@NoClient varchar(50))
AS
  SELECT  *
  FROM  [dbo].Client
  WHERE  [IdUser] = @NoClient
GO
/****** Object:  StoredProcedure [dbo].[GetCompteClient]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCompteClient]
@IdClient varchar(50) , @type Int 
AS
select *  from Compte where IdUser=@IdClient And TypeCompte=@type
GO
/****** Object:  StoredProcedure [dbo].[GetComptesClient]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetComptesClient]
@IdClient varchar(50) 
AS
select Num , TypeCompte  from Compte where IdUser=@IdClient
GO
/****** Object:  StoredProcedure [dbo].[GetNextId]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNextId]
AS
SELECT MAX (SUBSTRING(Num, 4, 6))+1  as id FROM Compte
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUser]
@id varchar(50)
	as 
	Select * from [dbo].[User]  where Id=@id 
GO
/****** Object:  StoredProcedure [dbo].[Virement_Courant_Epargne]    Script Date: 24/03/2018 01:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Virement_Courant_Epargne]  
    (@Montant decimal(19,4),@CompteDestinataire varchar(50)
	,@CompteEmmetteur varchar(50),@Motif varchar(MAX),@NomEmetteur varchar(20)
	,@justificatif varchar(Max),@numordre int)
AS


BEGIN TRANSACTION; 
DECLARE @code varchar(50),
 @date Datetime,
 @dat varchar(12),
 @mois varchar(2),
@annee varchar(4),
 @jour varchar(2),
 @heure varchar(2),
 @minute varchar(2);

set @date=GETDATE();
set  @mois=SUBSTRING(CONVERT(varchar(8), @date,101),1,2)
set  @annee=YEAR(@date);
set @jour=DAY(@date);
set @heure=(SUBSTRING(CONVERT(varchar(8), @date, 108), 1, 2));
set @minute=  (SUBSTRING(CONVERT(varchar(8), @date, 108), 4, 2));
set @dat = CONCAT(@annee,@mois,@jour,@heure,@minute);
set  @code=Concat(@CompteEmmetteur,@CompteDestinataire,@dat);

 INSERT [dbo].[Virement] ([Code]
           ,[Date]
           ,[Motif]
           ,[Statut]
           ,[Montant]
           ,[Justificatif]
           ,[NumOrdreVirement]
           ,[NomEmetteur]
           ,[CompteEmmetteur]
           ,[BanqueEmmeteur]
           ,[NomDestinataire]
           ,[CompteDestinataire]
           ,[BanqueDestinataire]
           ,[Type])
 VALUES (@code, @date, @Motif,'0',@Montant,@justificatif,@numordre
 ,@NomEmetteur,@CompteEmmetteur,'THW',@NomEmetteur,@CompteDestinataire,'THW',0) ;
UPDATE [dbo].[Compte]
SET Balance -=@Montant  
WHERE  Num=@CompteEmmetteur ;

UPDATE [dbo].[Compte]
SET Balance +=@Montant 
WHERE Num= @CompteDestinataire ;

COMMIT; 
GO
