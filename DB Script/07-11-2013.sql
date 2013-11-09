USE [ArabiSkyDB]
GO
/****** Object:  Table [dbo].[TB_Users]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[UserPermission] [int] NULL,
	[UserStatus] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_TB_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_Users] ON
INSERT [dbo].[TB_Users] ([UserID], [UserName], [EmailAddress], [Password], [UserPermission], [UserStatus], [CreateDate]) VALUES (5, N'Osama Khodrog', N'admin', N'CjkFHsinVfoYwBSWPzEr+Q==', 0, 1, CAST(0x000085CB0126A2CB AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_Users] OFF
/****** Object:  Table [dbo].[TB_UserMessage]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserMessage](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[MessageTitle] [nvarchar](max) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[MessageCreateDate] [date] NULL,
	[MessageUserID] [int] NULL,
	[MessageSendUsers] [int] NULL,
	[MessageFlag] [int] NULL,
 CONSTRAINT [PK_TB_UserMessage] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_RegisterUsers]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_RegisterUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[User_FullName] [nvarchar](max) NULL,
	[User_EmailAddress] [nvarchar](max) NULL,
	[User_Password] [nvarchar](max) NULL,
	[User_FacebookID] [nvarchar](max) NULL,
	[User_Status] [int] NULL,
	[User_UserType] [int] NULL,
	[User_CountAds] [int] NULL,
	[User_Country] [int] NULL,
	[User_MobileNumber] [nvarchar](max) NULL,
	[User_City] [int] NULL,
	[User_Image] [nvarchar](max) NULL,
	[User_CreateDate] [datetime] NULL,
 CONSTRAINT [PK_TB_RegisterUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_RegisterUsers] ON
INSERT [dbo].[TB_RegisterUsers] ([UserID], [User_FullName], [User_EmailAddress], [User_Password], [User_FacebookID], [User_Status], [User_UserType], [User_CountAds], [User_Country], [User_MobileNumber], [User_City], [User_Image], [User_CreateDate]) VALUES (27, N'اسامة محمود علي خدرج', N'khodrog@yahoo.com', N'Azb3llYGC18YwBSWPzEr+Q==', N'', 1, 0, 100, 12, N'962785946301', 0, N'ArabiSkyImages/UserProfile/Osama.jpg', CAST(0x000085CB0126A2CB AS DateTime))
INSERT [dbo].[TB_RegisterUsers] ([UserID], [User_FullName], [User_EmailAddress], [User_Password], [User_FacebookID], [User_Status], [User_UserType], [User_CountAds], [User_Country], [User_MobileNumber], [User_City], [User_Image], [User_CreateDate]) VALUES (28, N'علي خدرج', N'ali.khodrog@gmail.com', N'Azb3llYGC18YwBSWPzEr+Q==', N'', 1, 0, 20, 12, N'0795885661', 0, NULL, CAST(0x0000A25E00190DA6 AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_RegisterUsers] OFF
/****** Object:  Table [dbo].[TB_Country]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NULL,
	[CountryStatus] [smallint] NULL,
	[CountryCreateDate] [datetime] NULL,
 CONSTRAINT [PK_TB_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_Country] ON
INSERT [dbo].[TB_Country] ([CountryID], [CountryName], [CountryStatus], [CountryCreateDate]) VALUES (12, N'المملكة الاردنية الهاشمية', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_Country] ([CountryID], [CountryName], [CountryStatus], [CountryCreateDate]) VALUES (14, N'المملكة العربية السعودية', 1, CAST(0x0000A24601251DE9 AS DateTime))
INSERT [dbo].[TB_Country] ([CountryID], [CountryName], [CountryStatus], [CountryCreateDate]) VALUES (15, N'الاراضي الفلسطينية', 1, CAST(0x0000A246013573A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_Country] OFF
/****** Object:  Table [dbo].[TB_Category]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Category](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](max) NULL,
	[CatStatus] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_TB_Category] PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_Category] ON
INSERT [dbo].[TB_Category] ([Cat_ID], [CatName], [CatStatus], [CreateDate]) VALUES (1, N'للبيع', 1, CAST(0x0000A23A00CFF55F AS DateTime))
INSERT [dbo].[TB_Category] ([Cat_ID], [CatName], [CatStatus], [CreateDate]) VALUES (2, N'الخدمات', 1, CAST(0x0000A23A00D00452 AS DateTime))
INSERT [dbo].[TB_Category] ([Cat_ID], [CatName], [CatStatus], [CreateDate]) VALUES (3, N'وظائف شاغرة', 1, CAST(0x0000A23A00D00C33 AS DateTime))
INSERT [dbo].[TB_Category] ([Cat_ID], [CatName], [CatStatus], [CreateDate]) VALUES (4, N'للإيجار', 1, CAST(0x0000A23A00D01841 AS DateTime))
INSERT [dbo].[TB_Category] ([Cat_ID], [CatName], [CatStatus], [CreateDate]) VALUES (5, N'الباحثين عن عمل', 1, CAST(0x0000A23A00D02102 AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_Category] OFF
/****** Object:  Table [dbo].[TB_Ads]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Ads](
	[AdsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CatID] [int] NULL,
	[SubCatID] [int] NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
	[AdsPrice] [float] NULL,
	[AdsTitle] [nvarchar](max) NULL,
	[AdsDescription] [nvarchar](max) NULL,
	[AdsUpdateCreateDate] [datetime] NULL,
	[AdsCreateDate] [datetime] NULL,
	[AdsStatus] [int] NULL,
	[AdsImages] [nvarchar](max) NULL,
	[AdsHit] [int] NULL,
	[AdsYoutubeURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_TB_Ads] PRIMARY KEY CLUSTERED 
(
	[AdsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteArticls]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteArticls]
@articls_ID int
AS
begin
	delete from TB_Articls where Articls_ID=@articls_ID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_LoginRegisterUsers]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_LoginRegisterUsers]
	@userPassword nvarchar(max),
	@userEmailAddress nvarchar(max)
AS
BEGIN
	IF EXISTS(SELECT User_EmailAddress,User_Password from TB_RegisterUsers where User_EmailAddress=@userEmailAddress AND User_Password=@userPassword)
		SELECT	UserID,User_FullName,User_EmailAddress,User_Password,User_FacebookID,User_Image,
				(select count(TB_Ads.AdsID) from TB_Ads where TB_RegisterUsers.UserID = TB_Ads.UserID) as User_CountAdsUsed,
				User_Status,User_UserType,User_CountAds,User_Country,User_City,User_MobileNumber,
				User_CreateDate FROM TB_RegisterUsers where User_EmailAddress=@userEmailAddress and User_Password=@userPassword
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_InsertRegisterUsers]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_InsertRegisterUsers]
	@userFullName nvarchar(max),
	@userEmailAddress nvarchar(max),
	@userPassword nvarchar(max),	
	@userFacebookID nvarchar(max),
	@userStatus smallint,
	@userType smallint,
	@userCountAds int,
	@userMobileNumber nvarchar(max),
	@userCountry int,
	@userCity int,
	@userImage nvarchar(max),
	@returnValue INT OUTPUT
AS
Begin
	if NOT EXISTS(SELECT User_EmailAddress from TB_RegisterUsers where User_EmailAddress=@userEmailAddress)
		BEGIN
			INSERT INTO TB_RegisterUsers(User_FullName,User_EmailAddress,User_Password,User_FacebookID,User_Status,User_UserType,User_CountAds,User_Country,User_City,User_MobileNumber,User_Image,User_CreateDate)
			VALUES(@userFullName,@userEmailAddress,@userPassword,@userFacebookID,@userStatus,@userType,@userCountAds,@userCountry,@userCity,@userMobileNumber,@userImage,GETDATE())
			set @returnValue = 1
		END
	ELSE
		set @returnValue = 0
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_GetEmailUnReadCount]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_GetEmailUnReadCount]	
@userID int
AS
begin
	SELECT COUNT(*) FROM TB_UserMessage WHERE MessageUserID = @userID AND MessageFlag = 0
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_GetEmailByEmailID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_GetEmailByEmailID]	
@messageID int,
@userID int
AS
begin
	select s.UserID,r.UserID,s.User_FullName as sender, m.MessageFlag,m.MessageTitle,m.MessageBody,m.MessageCreateDate,s.User_Image 
	from TB_RegisterUsers s ,TB_UserMessage m,TB_RegisterUsers r 
	where m.MessageID = @messageID AND r.UserID=@userID And m.MessageSendUsers =s.UserID and m.MessageUserID=r.UserID  order by m.MessageID DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_GetByUserID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_GetByUserID]
	@userID int 
AS
BEGIN
	SELECT	UserID,User_FullName,User_EmailAddress,User_Password,User_FacebookID,User_Image,
			(select count(TB_Ads.AdsID) from TB_Ads where TB_RegisterUsers.UserID = TB_Ads.UserID) as User_CountAdsUsed,
			User_Status,User_UserType,User_CountAds,User_Country,User_City,User_MobileNumber,User_CreateDate 
	FROM TB_RegisterUsers where UserID = @userID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_GetByUserEmailAddress]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ArabiSky_GetByUserEmailAddress]
	@userEmailAddress nvarchar(max)
AS
BEGIN
	SELECT	UserID,User_FullName,User_EmailAddress,User_Password,User_FacebookID,
			User_Status,User_UserType,User_CountAds,User_Country,User_City,User_MobileNumber,User_CreateDate 
	FROM TB_RegisterUsers where User_EmailAddress = @userEmailAddress
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_GetAllUserFromAdmin]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_GetAllUserFromAdmin]
 
AS
BEGIN
	SELECT	TB_RegisterUsers.UserID,User_FullName,User_EmailAddress,User_Password,User_FacebookID,
			User_Status,User_UserType,User_CountAds,
			(select TB_Country.CountryName from TB_Country where TB_RegisterUsers.User_Country = TB_Country.CountryID) as User_CountryRelated,
			(select count(TB_Ads.AdsID) from TB_Ads where TB_RegisterUsers.UserID = TB_Ads.UserID) as User_CountAdsUsed,
			User_Country,User_City,User_MobileNumber,User_CreateDate 
	FROM TB_RegisterUsers
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_GetAllMyEmail]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_GetAllMyEmail]	
@userID int
AS
begin
	select s.UserID,s.User_FullName as sender, m.MessageID,m.MessageFlag,m.MessageTitle,m.MessageCreateDate,s.User_Image from TB_RegisterUsers s,TB_RegisterUsers r
	,TB_UserMessage m where m.MessageUserID = @userID and r.UserID = m.MessageUserID 
	and s.UserID = m.MessageSendUsers order by m.MessageID DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_DeleteUser]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ArabiSky_DeleteUser]
	@userID int 
AS
BEGIN
	DELETE FROM TB_RegisterUsers WHERE UserID = @userID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_DeleteMessage]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ArabiSky_DeleteMessage]	
@messageID int
AS
begin
	delete from TB_UserMessage where MessageID = @messageID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ApprovedAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ApprovedAds]
@adsID int
as
	update TB_Ads set
		AdsStatus = 1
	where AdsID = @adsID
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUsers]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddUsers]
@userFullName nvarchar(max),
@userEmailAddress nvarchar(max),
@userPassword nvarchar(max),
@userPermission int,
@userStatus nvarchar(max)
AS
begin
if Not Exists(select EmailAddress from TB_Users where EmailAddress = @userEmailAddress)
	begin
			insert into TB_Users(UserName,EmailAddress,Password,UserPermission,UserStatus,CreateDate)
			values(@userFullName,@userEmailAddress,@userPassword,@userPermission,@userStatus,getdate())
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_UpdateUserPassword]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ArabiSky_UpdateUserPassword]
	@userID int,
	@userPassword nvarchar(max),
	@returnValue INT OUTPUT
AS
Begin
		BEGIN
			UPDATE TB_RegisterUsers SET 
				User_Password = @userPassword
			WHERE UserID = @userID
			set @returnValue = 1
		END
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_UpdateRegisterUsers]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSky_UpdateRegisterUsers]
	@userID int,
	@userFullName nvarchar(max),
	@userEmailAddress nvarchar(max),
	@userPassword nvarchar(max),
	@userFacebookID nvarchar(max),
	@userStatus smallint,
	@userType smallint,
	@userCountAds int,
	@userCountry int,
	@userCity int,
	@userMobileNumber nvarchar(max),
	@userImage nvarchar(max),
	@returnValue INT OUTPUT
AS
Begin
		BEGIN
			UPDATE TB_RegisterUsers SET 
				User_FullName = @userFullName,
				User_EmailAddress = @userEmailAddress,
				User_Password = @userPassword,
				User_FacebookID = @userFacebookID,
				User_CountAds = @userCountAds,
				User_Status = @userStatus,
				User_UserType = @userType,
				User_Country = @userCountry,
				User_City = @userCity,
				User_Image = @userImage,
				User_MobileNumber = @userMobileNumber
			WHERE UserID = @userID
			set @returnValue = 1
		END
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_SendMessage]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ArabiSky_SendMessage]	
@messageTitle nvarchar(max),
@messageBody nvarchar(max), 
@messageUserID int,
@messageSendUsers int
AS
begin
	insert into TB_UserMessage(MessageTitle,MessageBody,MessageCreateDate,MessageUserID,MessageSendUsers,MessageFlag)
	values(@messageTitle,@messageBody,GETDATE(),@messageUserID,@messageSendUsers,0)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_ManageCountry]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Osama Khodrog>
-- Create date: <26-09-2013>
-- Description:	<This table create to insert Country in ArabiSky>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ArabiSky_ManageCountry]
	@action int,
	@countryID int,
	@countryName nvarchar(max),
	@countryStatus smallint
AS


/********************************Insert New Country*********************************/
IF @action=1
Begin
	if NOT EXISTS(SELECT CountryName from TB_Country where CountryName=@countryName)
	BEGIN
		INSERT INTO TB_Country(CountryName,CountryStatus,CountryCreateDate)
		VALUES(@countryName,@countryStatus,GETDATE())
	END
end
/********************************Insert New Country*********************************/




/********************************Update Country*********************************/
IF @action=2
Begin
	UPDATE TB_Country SET 
		CountryName = @countryName,
		CountryStatus = @countryStatus
	WHERE TB_Country.CountryID = @countryID
end
/********************************Update Country*********************************/





/********************************Delegte Country*********************************/
IF @action=3
Begin
	DELETE FROM TB_Country WHERE CountryID = @countryID
end
/********************************Delegte Country*********************************/




/********************************Select Country*********************************/
IF @action=4
Begin
	SELECT CountryID,CountryName,CountryStatus,CountryCreateDate FROM TB_Country
end
/********************************Select Country*********************************/



/********************************Select Country By CountryID*********************************/
IF @action=5
Begin
	SELECT CountryID,CountryName,CountryStatus,CountryCreateDate FROM TB_Country where CountryID=@countryID
end
/********************************Select Country By CountryID*********************************/


/********************************Select Country By CountryID----Just Active Country*********************************/
IF @action=6
Begin
	SELECT CountryID,CountryName,CountryStatus,CountryCreateDate FROM TB_Country where CountryStatus=1
end
/********************************Select Country By CountryID----Just Active Country*********************************/
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteCategory]
@gategoryID int
AS
begin
	delete from TB_Category where Cat_ID=@gategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCategory]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddCategory]
@categoryName nvarchar(max),
@categoryStatus int
AS
begin
if Not Exists(select CatName from TB_Category where CatName = @categoryName)
	begin
			insert into TB_Category(CatName,CatStatus,CreateDate)
			values(@categoryName,@categoryStatus,getdate())
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DashboardStatstic]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DashboardStatstic]
@FromDate nvarchar(max),
@ToDate nvarchar(max)
AS
SELECT (COUNT(UserID)) AS UserRegister from TB_RegisterUsers where User_Status = 1
SELECT (COUNT(UserID)) AS UserRegister from TB_RegisterUsers where User_Status = 0 
SELECT (COUNT(AdsID)) AS AdsApproved from TB_Ads where AdsStatus = 1 
SELECT (COUNT(AdsID)) AS AdsPendding from TB_Ads where AdsStatus = 0 

select CatName ,(select COUNT(AdsID) from TB_Ads where CatID = CA.Cat_ID AND TB_Ads.AdsStatus=1 ) as AdsCount
from TB_Category CA
GO
/****** Object:  StoredProcedure [dbo].[sp_EditCategoryInfo]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditCategoryInfo]
@categoryName nvarchar(max),
@categoryStatus int,
@categoryID int
AS
begin
		update TB_Category set
			CatName = @categoryName,
			CatStatus = @categoryStatus
			where Cat_ID=@categoryID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditAdsCounter]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_EditAdsCounter]
@adsID int,
@adsHit int
as
update TB_Ads set
	AdsHit = @adsHit
where AdsID = @adsID
GO
/****** Object:  StoredProcedure [dbo].[sp_EditAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_EditAds]
@userID int,
@catID int,
@subCatID int, 
@countryID int, 
@cityID int, 
@adsPrice int, 
@adsTitle nvarchar(max), 
@adsDescription nvarchar(max), 
@adsImages nvarchar(max), 
@adsYoutubeURL nvarchar(max),
@adsID int
as
	update TB_Ads set
		UserID = @userID,
		CatID = @catID,
		SubCatID = @subCatID,
		CountryID = @countryID,
		CityID = @cityID,
		AdsPrice = @adsPrice,
		AdsTitle = @adsTitle,
		AdsDescription = @adsDescription,
		AdsImages = @adsImages,
		AdsYoutubeURL = @adsYoutubeURL
	where AdsID = @adsID
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteUser]
@userID nvarchar(max)
AS
begin
	delete from TB_Users where UserID=@userID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditUserInfo]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditUserInfo]
@userFullName nvarchar(max),
@userEmailAddress nvarchar(max),
@userPassword nvarchar(max),
@userPermission int,
@userStatus nvarchar(max),
@userid int
AS
begin
		update TB_Users set
			UserName = @userFullName,
			EmailAddress = @userEmailAddress,
			Password = @userPassword,
			UserPermission =@userPermission,
			UserStatus = @userStatus
			where UserID=@userid
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAdsInfoByAdsID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetAdsInfoByAdsID]
@adsID int
as
	select AdsTitle,AdsDescription,AdsImages,AdsYoutubeURL from dbo.TB_Ads
	where AdsID = @adsID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAdminInfo]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllAdminInfo]
@userID int
AS
Begin
select	users.UserID,
		users.UserName,
		users.EmailAddress,
		users.Password,
		users.UserPermission,
		users.UserStatus,
		users.CreateDate  from TB_Users users  where UserID = @userID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCategory]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllCategory]

AS
select Cat_ID,CatName,CatStatus,CreateDate from TB_Category
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategoryByID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetCategoryByID]
@categoryID nvarchar(max)
AS
Begin
select CatName,CatStatus,CreateDate from TB_Category where Cat_ID = @categoryID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUserInfo]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllUserInfo]

AS
Begin
select	ar.UserID,
		ar.UserName,
		ar.EmailAddress,
		ar.UserPermission,
		ar.UserStatus,
		ar.CreateDate  from TB_Users ar
End
GO
/****** Object:  Table [dbo].[TB_City]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Country_FK_ID] [int] NULL,
	[CityName] [nvarchar](max) NULL,
	[CityStatus] [smallint] NULL,
	[CityCreateDate] [datetime] NULL,
 CONSTRAINT [PK_TB_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_City] ON
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (5, 12, N'عمان', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (6, 12, N'إربد', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (7, 12, N'عجلون', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (8, 12, N'الكرك', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (9, 12, N'البلقاء', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (10, 12, N'معان', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (11, 12, N'الزرقاء', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (12, 12, N'المفرق', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (13, 12, N'الطفيلة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (14, 12, N'مادبا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (15, 12, N'جرش', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (16, 12, N'العقبة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (17, 14, N'الرياض', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (18, 14, N'جدة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (19, 14, N'مكة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (20, 14, N'المدينة المنورة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (21, 14, N'تبوك', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (22, 14, N'الدمام', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (23, 14, N'الاحساء', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (24, 14, N'القطيف', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (25, 14, N'خميس مشيط', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (26, 14, N'المظيلف', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (27, 14, N'الهفوف', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (28, 14, N'المبرز', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (29, 14, N'الطائف', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (30, 14, N'نجران', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (31, 14, N'حفر الباطن', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (32, 14, N'الجبيل', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (33, 14, N'ضباء', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (34, 14, N'الخرج', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (35, 14, N'الثقبة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (36, 14, N'ينبع البحر', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (37, 14, N'الخبر', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (38, 14, N'عرعر', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (39, 14, N'الحوية', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (40, 14, N'عنيزة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (41, 14, N'سكاكا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (42, 14, N'جيزان', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (43, 14, N'القريات', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (44, 14, N'الظهران', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (45, 14, N'الباحة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (46, 14, N'الزلفي', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (47, 14, N'الرس', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (48, 14, N'وادي الدواسر', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (49, 14, N'بيشه', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (50, 14, N'سيهات', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (51, 14, N'شروره', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (52, 14, N'بحره', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (53, 14, N'تاروت', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (54, 14, N'الدوادمي', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (55, 14, N'صبياء', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (56, 14, N'بيش', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (57, 14, N'أحد رفيدة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (58, 14, N'الفريش', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (59, 14, N'بارق', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (60, 14, N'الحوطة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (61, 14, N'الأفلاج', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (64, 15, N'حيفا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (65, 15, N'يافا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (66, 15, N'اللدّ', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (67, 15, N'بئر السبع', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (68, 15, N'عكا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (69, 15, N'الرملة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (70, 15, N'الناصرة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (71, 15, N'أم الفحم', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (72, 15, N'الطيبة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (73, 15, N'الطيرة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (74, 15, N'رهط', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (75, 15, N'سخنين', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (76, 15, N'شفاعمرو', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (77, 15, N'طبريا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (78, 15, N'صفد', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (79, 15, N'بيسان', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (80, 15, N'المجدل', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (81, 15, N'إسدود', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (82, 15, N'القدس', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (83, 15, N'رام الله', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (84, 15, N'الخليل', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (85, 15, N'بيت لحم', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (86, 15, N'نابلس', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (87, 15, N'جنين', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (88, 15, N'طولكرم', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (89, 15, N'اريحا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (90, 15, N'قلقيلية', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (91, 15, N'غزة', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (92, 15, N'خانيونس', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (93, 15, N'رفح', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (94, 15, N'جباليا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (95, 15, N'دير البلح', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (96, 15, N'بيت لاهيا', 1, CAST(0x0000A24600149370 AS DateTime))
INSERT [dbo].[TB_City] ([CityID], [Country_FK_ID], [CityName], [CityStatus], [CityCreateDate]) VALUES (97, 15, N'بيت حانون', 1, CAST(0x0000A24600149370 AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_City] OFF
/****** Object:  Table [dbo].[TB_SubCategories]    Script Date: 11/07/2013 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_SubCategories](
	[SubCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoriesName] [nvarchar](max) NULL,
	[Categories_fk] [int] NULL,
	[SubCategoriesStatus] [int] NULL,
	[SubCategoriesCreateDate] [date] NULL,
 CONSTRAINT [PK_TB_SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoriesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_SubCategories] ON
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (6, N'العقارات و الإسكان', 1, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (7, N'السيارات و المركبات', 1, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (8, N'الكهربائيات و الإلكترونيات', 1, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (9, N'الأثاث و المفروشات', 1, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (10, N'أرقام هواتف مميزة', 1, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (11, N'أشياء أخرى', 1, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (12, N'دروس و دورات تدريبية', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (13, N'الكومبيوتر و الإنترنت', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (14, N'بناء و مقاولات', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (15, N'خدمات كهربائية', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (16, N'السفر و السياحة', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (17, N'خدمات طبية', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (18, N'تجهيز الأطعمة و الحفلات', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (19, N'إصلاح و صيانة السيارات', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (20, N'خدمات قانونية', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (21, N'خدمات أخرى', 2, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (22, N'إدارة / سكرتارية', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (23, N'تسويق / مبيعات', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (24, N'تدريس / تدريب', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (25, N'كمبيوتر / تقنية المعلومات', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (26, N'محاسبة / مالية', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (27, N'طب / تمريض', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (28, N'هندسة', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (29, N'أشغال أخرى', 3, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (30, N'العقارات و الإسكان للإيجار', 4, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (31, N'السيارات و المركبات للإيجار', 4, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (32, N'أشياء أخرى للإيجار', 4, 1, CAST(0xBA370B00 AS Date))
INSERT [dbo].[TB_SubCategories] ([SubCategoriesID], [SubCategoriesName], [Categories_fk], [SubCategoriesStatus], [SubCategoriesCreateDate]) VALUES (33, N'الباحثين عن عمل', 5, 1, CAST(0xBA370B00 AS Date))
SET IDENTITY_INSERT [dbo].[TB_SubCategories] OFF
/****** Object:  StoredProcedure [dbo].[sp_GetUserInfoByEmail]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserInfoByEmail]
@emailAddress nvarchar(max)
AS
Begin
select UserID,UserName,Password,UserPermission,UserStatus,CreateDate from TB_Users where EmailAddress = @emailAddress
End
GO
/****** Object:  StoredProcedure [dbo].[sp_RejectedAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_RejectedAds]
@adsID int
as
	delete from TB_Ads where AdsID = @adsID
GO
/****** Object:  StoredProcedure [dbo].[sp_ReadEmail_ChangeFlag]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_ReadEmail_ChangeFlag]	
@messageID int
AS
begin 
	update TB_UserMessage set
		MessageFlag = 1
	where  MessageID = @messageID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ReAcivateAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ReAcivateAds]
@userID int,
@adsID int,
@adsUpdateDate datetime
AS
begin
	 update TB_Ads set
		AdsUpdateCreateDate = @adsUpdateDate
	 where TB_Ads.UserID = @userID AND TB_Ads.AdsID = @adsID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUser]
@username varchar(max),
@password varchar(max),
@returnValue INT OUTPUT
AS
begin
	IF EXISTS (SELECT EmailAddress,Password FROM TB_Users WHERE EmailAddress=@username AND Password=@password AND UserStatus=1)
		set @returnValue = 1
	ELSE
		set @returnValue = 0
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertAds]
@userID int,
@catID int,
@subCatID int, 
@countryID int, 
@cityID int, 
@adsPrice int, 
@adsTitle nvarchar(max), 
@adsDescription nvarchar(max), 
@adsImages nvarchar(max), 
@adsYoutubeURL nvarchar(max),
@adsUpdateDate datetime
as
	DECLARE @LastAdsID int
	insert into TB_Ads(UserID, CatID, SubCatID, CountryID, CityID, AdsPrice, AdsTitle, AdsDescription, AdsUpdateCreateDate, AdsCreateDate, AdsStatus, AdsImages, AdsHit, AdsYoutubeURL)
	values (@userID, @catID, @subCatID, @countryID, @cityID, @adsPrice, @adsTitle, @adsDescription, @adsUpdateDate, GETDATE(), 1, @adsImages,0, @adsYoutubeURL)
	set @LastAdsID = (SELECT MAX(AdsID) FROM TB_Ads)
	return @LastAdsID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserProfileAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_GetUserProfileAds]
@userID int
as
	SELECT top 10 TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_City.CityName,AdsTitle,AdsDescription,
			AdsImages,Cat_ID,SubCatID,AdsImages
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	AdsStatus = 1 AND  TB_Ads.UserID = @userID order By TB_Ads.AdsUpdateCreateDate DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubCategoriesByCategoriyID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetSubCategoriesByCategoriyID]
@Categories_fk int
AS
Begin
select SubCategoriesID,SubCategoriesName,SubCategoriesStatus from TB_SubCategories where Categories_fk = @Categories_fk AND SubCategoriesStatus=1
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSimlirAdsTen]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetSimlirAdsTen]
@adsSubCat int,
@countryCode int
as 
	--DECLARE @currDate DATETIME;
	--SET @currDate = GETDATE(); 
	SELECT top 10 TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_City.CityName,AdsTitle,AdsDescription,
			AdsImages,Cat_ID,SubCatID,AdsImages
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	TB_Ads.CountryID = @countryCode AND
	--TB_Ads.AdsUpdateCreateDate > @currDate AND 
	AdsStatus = 1 AND SubCatID = @adsSubCat
	order by AdsUpdateCreateDate DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDashbaordAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetDashbaordAds]
@countryCode int
as
	--DECLARE @currDate DATETIME;
	--SET @currDate = GETDATE(); 
	
	SELECT top 10 TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_City.CityName,AdsTitle,AdsDescription,
			AdsImages,Cat_ID,SubCatID,AdsImages
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	TB_Ads.CountryID = @countryCode AND
	--TB_Ads.AdsUpdateCreateDate > @currDate AND 
	AdsStatus = 1  order by AdsUpdateCreateDate DESC
	
	
	
	
	
	
	
    SELECT top 10 TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_City.CityName,AdsTitle,AdsDescription,
			AdsImages,Cat_ID,SubCatID,AdsImages
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	TB_Ads.CountryID = @countryCode AND
	--TB_Ads.AdsUpdateCreateDate > @currDate AND 
	AdsStatus = 1 order By AdsHit DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_SubGetCategoryByID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_SubGetCategoryByID]
@subCategoryID int
AS
Begin
select SubCategoriesID,SubCategoriesName,Categories_fk,SubCategoriesStatus,SubCategoriesCreateDate from TB_SubCategories where SubCategoriesID = @subCategoryID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSubCategory]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllSubCategory]
AS
select SubCategoriesID,SubCategoriesName,(SELECT CatName from TB_Category WHERE Cat_ID = Categories_fk) AS CatName ,SubCategoriesStatus,SubCategoriesCreateDate from TB_SubCategories
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllPenddingAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetAllPenddingAds]

as
	SELECT	AdsID,TB_RegisterUsers.User_FullName,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_Country.CountryName,TB_City.CityName,AdsTitle,AdsDescription,
			AdsUpdateCreateDate,AdsCreateDate	
				
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	AdsStatus = 0
	Order By AdsID DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllMyAdsByUserID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetAllMyAdsByUserID]
@userID int
as
	SELECT	AdsID,TB_RegisterUsers.User_FullName,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_Country.CountryName,TB_City.CityName,AdsTitle,AdsDescription,
			AdsUpdateCreateDate,AdsCreateDate,AdsImages,TB_RegisterUsers.UserID,TB_RegisterUsers.User_Image,
			TB_RegisterUsers.User_FullName,TB_RegisterUsers.User_EmailAddress,AdsYoutubeURL,
			Cat_ID,SubCatID,AdsHit
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	TB_Ads.UserID = @userID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllApprovedAds]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetAllApprovedAds]

as
	SELECT top 100	AdsID,TB_RegisterUsers.User_FullName,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_Country.CountryName,TB_City.CityName,AdsTitle,AdsDescription,
			AdsUpdateCreateDate,AdsCreateDate	
				
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	AdsStatus = 1
	Order By AdsID DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAdsInformationByAdsID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetAdsInformationByAdsID]
@adsID int
as
	--DECLARE @currDate DATETIME;
	--SET @currDate = GETDATE(); 
	
	SELECT	AdsID,TB_RegisterUsers.User_FullName,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_Country.CountryName,TB_City.CityName,AdsTitle,AdsDescription,AdsPrice,
			AdsUpdateCreateDate,AdsCreateDate,AdsImages,TB_RegisterUsers.UserID,TB_RegisterUsers.User_Image,
			TB_RegisterUsers.User_FullName,TB_RegisterUsers.User_EmailAddress,AdsYoutubeURL,
			Cat_ID,SubCatID,AdsHit,TB_Ads.CityID
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	--TB_Ads.AdsUpdateCreateDate > @currDate AND 
	AdsStatus = 1 AND AdsID = @adsID
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAdsCategoiresByCatID]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_GetAdsCategoiresByCatID]
@adsSubCat int
as
	--DECLARE @currDate DATETIME;
	--SET @currDate = GETDATE(); 
	
	SELECT 	TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
			TB_City.CityName,AdsTitle,AdsDescription,
			AdsImages,Cat_ID,SubCatID,AdsImages
	from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
	
	where 
	
	TB_RegisterUsers.UserID = TB_Ads.UserID AND 
	TB_Country.CountryID = TB_Ads.CountryID AND 
	TB_City.CityID = TB_Ads.CityID AND
	TB_Category.Cat_ID = TB_Ads.CatID AND
	TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
	--TB_Ads.AdsUpdateCreateDate > @currDate AND 
	AdsStatus = 1 AND TB_Ads.SubCatID = @adsSubCat order By AdsUpdateCreateDate DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_EditSubCategoryInfo]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_EditSubCategoryInfo]
@SubCategoriesName nvarchar(max),
@CategoriesID_fk int,
@SubCategoriesStatus int,
@SubCategoriesID int
AS
begin
		update TB_SubCategories set
			SubCategoriesName = @SubCategoriesName,
			Categories_fk = @CategoriesID_fk,
			SubCategoriesStatus = @SubCategoriesStatus
			where SubCategoriesID = @SubCategoriesID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSubCategory]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_DeleteSubCategory]
@SubCategoryID int
AS
begin
	delete from TB_SubCategories where SubCategoriesID=@SubCategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSkySearch]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ArabiSkySearch]
@countryID int,
@searchID int,
@searchText nvarchar(max),
@subCatID int,
@cityID int
AS
	--DECLARE @currDate DATETIME;
	--SET @currDate = GETDATE(); 
	
Begin
 
	if (@searchID = 1)
		begin
			SELECT TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
					TB_City.CityName,AdsTitle,AdsDescription,
					AdsImages,Cat_ID,SubCatID,AdsImages
			from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
			
			where 
			
			TB_RegisterUsers.UserID = TB_Ads.UserID AND
			TB_Country.CountryID = @countryID AND 
			TB_City.CityID = TB_Ads.CityID AND
			TB_Category.Cat_ID = TB_Ads.CatID AND
			TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
			--TB_Ads.AdsUpdateCreateDate > @currDate AND
			AdsStatus = 1 order by AdsHit,AdsUpdateCreateDate DESC
		end
	if (@searchID = 2)
		begin
			SELECT TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
					TB_City.CityName,AdsTitle,AdsDescription,
					AdsImages,Cat_ID,SubCatID,AdsImages
			from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories

			where 
			
			TB_RegisterUsers.UserID = TB_Ads.UserID AND
			TB_Country.CountryID = @countryID AND 
			TB_City.CityID = TB_Ads.CityID AND
			TB_Category.Cat_ID = TB_Ads.CatID AND
			TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND
			--TB_Ads.AdsUpdateCreateDate > @currDate AND
			AdsStatus = 1 order by AdsUpdateCreateDate DESC
		end
	if (@searchID = 3)
		begin
			SELECT TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
					TB_City.CityName,AdsTitle,AdsDescription,
					AdsImages,Cat_ID,SubCatID,AdsImages
			from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories

			where 
			
			TB_RegisterUsers.UserID = TB_Ads.UserID AND
			TB_Country.CountryID = @countryID AND 
			TB_City.CityID = TB_Ads.CityID AND
			TB_Category.Cat_ID = TB_Ads.CatID AND
			TB_SubCategories.SubCategoriesID = @subCatID AND
			(TB_Ads.AdsDescription LIKE (N'%' + @searchText + '%') OR TB_Ads.AdsTitle LIKE (N'%' + @searchText + '%')) AND 
			--TB_Ads.AdsUpdateCreateDate > @currDate AND
			AdsStatus = 1 order by AdsUpdateCreateDate DESC
		end
	if (@searchID = 4)
		begin
			SELECT TB_Ads.AdsID,TB_Ads.UserID,TB_Category.CatName,TB_SubCategories.SubCategoriesName,
					TB_City.CityName,AdsTitle,AdsDescription,
					AdsImages,Cat_ID,SubCatID,AdsImages
			from TB_Ads,TB_City,TB_Country,TB_RegisterUsers,TB_Category,TB_SubCategories
			
			where 
			
			TB_RegisterUsers.UserID = TB_Ads.UserID AND
			TB_Country.CountryID = TB_Ads.CountryID AND 
			TB_City.CityID = TB_Ads.CityID AND
			TB_Category.Cat_ID = TB_Ads.CatID AND
			TB_SubCategories.SubCategoriesID = TB_Ads.SubCatID AND

			TB_Ads.SubCatID = @subCatID AND 
			TB_Ads.CityID = @cityID AND
			TB_Ads.CountryID = @countryID AND
 			--TB_Ads.AdsUpdateCreateDate > @currDate AND
 			AdsStatus = 1 order by AdsUpdateCreateDate DESC
		end
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ArabiSky_ManageCity]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Osama Khodrog>
-- Create date: <26-09-2013>
-- Description:	<This table create to insert city in ArabiSky>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ArabiSky_ManageCity]
	@cityID int,
	@country_FK_ID int,
	@cityName nvarchar(max),
	@cityStatus smallint,
	@action int
AS


/********************************Insert New City*********************************/
IF @action=1
Begin
	if NOT EXISTS(SELECT CityName from TB_City where CityName=@cityName)
	BEGIN
		INSERT INTO TB_City(Country_FK_ID,CityName,CityStatus,CityCreateDate)
		VALUES(@country_FK_ID,@cityName,@cityStatus,GETDATE())
	END
end
/********************************Insert New City*********************************/




/********************************Update City*********************************/
IF @action=2
Begin
	UPDATE TB_City SET 
		Country_FK_ID = @country_FK_ID,
		CityName = @cityName,
		CityStatus = @cityStatus
	WHERE CityID = @cityID
end
/********************************Update City*********************************/





/********************************Delegte City*********************************/
IF @action=3
Begin
	DELETE FROM TB_City WHERE CityID = @cityID
end
/********************************Delegte City*********************************/




/********************************Select City*********************************/
IF @action=4
Begin
	SELECT CityID,(SELECT CountryName from TB_Country WHERE CountryID = Country_FK_ID) AS CountryName,CityName,CityStatus,CityCreateDate FROM TB_City where CityStatus = @cityStatus
end
/********************************Select City*********************************/



/********************************Select Country By CityID*********************************/
IF @action=5
Begin
	SELECT CityID,Country_FK_ID ,CityName,CityStatus,CityCreateDate FROM TB_City where CityID = @cityID
end
/********************************Select Country By CityID*********************************/




/********************************Select Country By CityID*********************************/
IF @action=6
Begin
	SELECT CityID,Country_FK_ID ,CityName,CityStatus,CityCreateDate FROM TB_City where Country_FK_ID = @country_FK_ID
end
/********************************Select Country By CityID*********************************/
GO
/****** Object:  StoredProcedure [dbo].[sp_AddSubCategories]    Script Date: 11/07/2013 17:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_AddSubCategories]
@SubCategoriesName nvarchar(max),
@CategoriesID_fk int,
@SubCategoriesStatus int
AS
begin
if Not Exists(select SubCategoriesName from TB_SubCategories where SubCategoriesName = @SubCategoriesName)
	begin
			insert into TB_SubCategories(SubCategoriesName,Categories_fk,SubCategoriesStatus,SubCategoriesCreateDate)
			values(@SubCategoriesName,@CategoriesID_fk,@SubCategoriesStatus,getdate())
	end
end
GO
/****** Object:  ForeignKey [FK_CountryID_CityID]    Script Date: 11/07/2013 17:59:15 ******/
ALTER TABLE [dbo].[TB_City]  WITH CHECK ADD  CONSTRAINT [FK_CountryID_CityID] FOREIGN KEY([Country_FK_ID])
REFERENCES [dbo].[TB_Country] ([CountryID])
GO
ALTER TABLE [dbo].[TB_City] CHECK CONSTRAINT [FK_CountryID_CityID]
GO
/****** Object:  ForeignKey [FK_TB_SubCategories_TB_SubCategories]    Script Date: 11/07/2013 17:59:15 ******/
ALTER TABLE [dbo].[TB_SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_TB_SubCategories_TB_SubCategories] FOREIGN KEY([Categories_fk])
REFERENCES [dbo].[TB_Category] ([Cat_ID])
GO
ALTER TABLE [dbo].[TB_SubCategories] CHECK CONSTRAINT [FK_TB_SubCategories_TB_SubCategories]
GO
