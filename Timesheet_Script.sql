USE [master]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 10/18/2017 4:21:00 PM ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLHELL\MSSQL\DATA\EmployeeDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLHELL\MSSQL\DATA\EmployeeDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeDB]
GO
/****** Object:  StoredProcedure [dbo].[REPORTS1]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[REPORTS1]
@Mode varchar(25)
AS


IF (@Mode='ManHours')

BEGIN
SELECT 
      [PROJDESC]
       ,[WORKHRS]
     
      ,[USERNAME]
  FROM [EmployeeDB].[dbo].[TRANSACTIONS] WHERE USERNAME='Administrator' Group by PROJDESC, WORKHRS, USERNAME
  END

  IF (@Mode='WORKLOC')

BEGIN
SELECT 
      [PROJDESC]
       ,[WORKHRS]
     
      ,[USERNAME]
  FROM [EmployeeDB].[dbo].[TRANSACTIONS] WHERE USERNAME='Administrator' Group by PROJDESC, WORKHRS, USERNAME
  END


GO
/****** Object:  StoredProcedure [dbo].[SP_DELMASTER]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_DELMASTER]

		@LOCID nvarchar(1000)=null,
		@DELNO nvarchar(1000)=null,
		@DELDESC nvarchar(1000)=null,
		@USERNAME nvarchar(1000)= NULL,
		@Mode varchar(25)
AS
 
IF (@Mode='Insert')

BEGIN

       INSERT INTO DELMASTER(LOCID,DELNO,DELDESC,DATE_TIME,USERNAME) VALUES(@LOCID,@DELNO,@DELDESC,getdate(),@USERNAME)

END
 
IF (@Mode='Delete')
BEGIN
       DELETE FROM DELMASTER WHERE DELNO = @DELNO
END

IF (@Mode='Update')
BEGIN
		UPDATE DELMASTER SET DELDESC = @DELDESC, LOCID = @LOCID WHERE DELNO = @DELNO

		END

		IF (@Mode='ChkDel') 
BEGIN
	SELECT * FROM DELMASTER WHERE DELNO = @DELNO
END

IF (@Mode='View')
BEGIN
       SELECT * FROM DELMASTER
END


GO
/****** Object:  StoredProcedure [dbo].[SP_pickdeliverables]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_pickdeliverables]

as
begin

SELECT LOCID
      ,DELDESC
      ,DATE_TIME
      ,USERNAME
	  ,DELNO
  FROM [EmployeeDB].[dbo].[DELMASTER]
 
  end

GO
/****** Object:  StoredProcedure [dbo].[SP_picklocation]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_picklocation]

as
begin

SELECT LOCID
      ,LOCDESC
      ,DATE_TIME
      ,USERNAME
  FROM [EmployeeDB].[dbo].[LOCMASTER]
 
  end


GO
/****** Object:  StoredProcedure [dbo].[SP_pickprojects]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_pickprojects]

as
begin

SELECT LOCID
	,PROJNO
      ,PROJDESC
	  ,EPCCOMP
      ,DATE_TIME
      ,USERNAME
	  
  FROM [EmployeeDB].[dbo].[PROJMASTER]
 
  end

GO
/****** Object:  StoredProcedure [dbo].[SP_PROJMASTER]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_PROJMASTER]

		@LOCID nvarchar(1000)=null,
		@PROJNO nvarchar(1000)=null,
		@PROJDESC nvarchar(1000)=null,
		@EPCCOMP nvarchar(1000)=null,
		@USERNAME nvarchar(1000)= NULL,
		@Mode varchar(25)
AS
 
IF (@Mode='Insert')

BEGIN


       INSERT INTO PROJMASTER(LOCID,PROJNO,PROJDESC,EPCCOMP,DATE_TIME,USERNAME) 
	   VALUES(@LOCID,@PROJNO,@PROJDESC,@EPCCOMP,getdate(),@USERNAME)
	   
END
 
IF (@Mode='Delete')
BEGIN
       DELETE FROM PROJMASTER WHERE PROJNO = @PROJNO
END

IF (@Mode='Update')
BEGIN
		UPDATE PROJMASTER SET PROJDESC = @PROJDESC, LOCID = @LOCID, EPCCOMP = @EPCCOMP
		 WHERE PROJNO = @PROJNO

		END

		IF (@Mode='ChkProj') 
BEGIN
	SELECT * FROM PROJMASTER WHERE PROJNO = @PROJNO
END

IF (@Mode='View')
BEGIN
       SELECT * FROM PROJMASTER
END


GO
/****** Object:  StoredProcedure [dbo].[sp_tblDepartment]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**********************************************************************************************/


CREATE PROCEDURE [dbo].[sp_tblDepartment]
@DepartmentId int=null,
@DepartmentName varchar(100)=null,
@Mode varchar(25)
AS

IF (@Mode='Insert') 
IF NOT EXISTS (SELECT * FROM tblDepartment WHERE DepartmentName=@DepartmentName)
BEGIN
	INSERT INTO tblDepartment(DepartmentName) VALUES(@DepartmentName)
END

IF (@Mode='View') 
BEGIN
	SELECT * FROM tblDepartment
END

IF (@Mode='ViewByID') 
BEGIN
	SELECT * FROM tblDepartment WHERE DepartmentId = @DepartmentId
END

IF (@Mode='Update') 
BEGIN
	UPDATE tblDepartment
	SET DepartmentName = @DepartmentName
	WHERE DepartmentId = @DepartmentId
END

IF (@Mode='Delete') 
BEGIN
	DELETE FROM tblDepartment WHERE DepartmentId = @DepartmentId
END




GO
/****** Object:  StoredProcedure [dbo].[sp_tblEmployee]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**********************************************************************************************/


CREATE PROCEDURE [dbo].[sp_tblEmployee]
@EmployeeId int=null,
@Name varchar(200)=null,
@DOB datetime=null,
@Degree varchar(200)=null,
@Address varchar(300)=null,
@City varchar(50)=null,
@State varchar(50)=null,
@Zip varchar(50)=null,
@Phone varchar(15)=null,
@Mobile varchar(15)=null,
@Email varchar(100)=null,
@Designation varchar(100)=null,
@DepartmentId int=null,
@DOJ datetime=null,
@DOC datetime=null,
@Bio text=null,
@Photo varchar(100)=null,
@Status int=null,
@Years int=null,
@Mode varchar(25)
AS

IF (@Mode='Insert') 
IF NOT EXISTS (SELECT * FROM [tblEmployee] WHERE [Name]=@Name and DOB=@DOB)
BEGIN
	INSERT INTO [tblEmployee]
           ([Name]
           ,[DOB]
		   ,[Degree]
           ,[Address]
           ,[City]
           ,[State]
           ,[Zip]
           ,[Phone]
           ,[Mobile]
           ,[Email]
           ,[Designation]
           ,[DepartmentId]
           ,[DOJ]
           ,[DOC]
           ,[Bio]
           ,[Photo]
           ,[Status])
     VALUES
           (@Name
           ,@DOB
		   ,@Degree
           ,@Address
           ,@City
           ,@State
           ,@Zip
           ,@Phone
           ,@Mobile
           ,@Email
           ,@Designation
           ,@DepartmentId
           ,@DOJ
           ,@DOC
           ,@Bio
           ,@Photo
           ,@Status)
END

IF (@Mode='View') 
BEGIN
	SELECT * FROM [tblEmployee]
END

IF (@Mode='ViewActive') 
BEGIN
	SELECT * FROM [tblEmployee] WHERE Status = 1 ORDER BY DepartmentId, DOJ
END

IF (@Mode='ViewInActive') 
BEGIN
	SELECT * FROM [tblEmployee] WHERE Status = 0
END

IF (@Mode='ViewByID') 
BEGIN
	SELECT * FROM [tblEmployee] WHERE EmployeeId = @EmployeeId
END

IF (@Mode='ViewService') 
BEGIN
	SELECT *,DATEDIFF(year, DOJ, getdate()) as Experience FROM [tblEmployee] WHERE Status = 1 ORDER BY DOJ
END

IF (@Mode='FilterService') 
BEGIN
	SELECT *,DATEDIFF(year, DOJ, getdate()) as Experience FROM [tblEmployee] WHERE Status = 1 and DATEDIFF(Year, DOJ, getdate())=@Years ORDER BY DOJ
END

IF (@Mode='ViewYears') 
BEGIN
	SELECT distinct DATEDIFF(Year, DOJ, getdate()) as EmpExp FROM [tblEmployee] WHERE Status = 1
END

IF (@Mode='Update') 
BEGIN
	UPDATE [tblEmployee]
	SET [Name] = @Name
      ,[DOB] = @DOB
	  ,[Degree] = @Degree
      ,[Address] = @Address
      ,[City] = @City
      ,[State] = @State
      ,[Zip] = @Zip
      ,[Phone] = @Phone
      ,[Mobile] = @Mobile
      ,[Email] = @Email
      ,[Designation] = @Designation
      ,[DepartmentId] = @DepartmentId
      ,[DOJ] = @DOJ
      ,[DOC] = @DOC
      ,[Bio] = @Bio
      ,[Photo] = @Photo
      ,[Status] = @Status
	WHERE EmployeeId = @EmployeeId
END

IF (@Mode='Delete') 
BEGIN
	DELETE FROM [tblEmployee] WHERE EmployeeId = @EmployeeId
END

IF (@Mode='Birthday') 
BEGIN
	SELECT * FROM tblEmployee WHERE DATEPART(MONTH, [DOB]) = DATEPART(MONTH, getdate()) and Status = 1 ORDER BY DATEPART(DAY, [DOB]) 
END

IF (@Mode='EmpCount') 
BEGIN
	SELECT count(EmployeeId) as EmpCount FROM tblEmployee WHERE Status = 1
END




GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocation]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_tblLocation]
@LOCID nvarchar(500),
       @LOCDESC nvarchar(1000)=null,
      
       @USERNAME nvarchar(1000)= NULL,
       @Mode varchar(25)
AS
 
IF (@Mode='Insert')

BEGIN
       INSERT INTO LOCMASTER(LOCID,LOCDESC,DATE_TIME,USERNAME) VALUES(@LOCID,@LOCDESC,getdate(),@USERNAME)
END

IF (@Mode='Update')
BEGIN
		UPDATE LOCMASTER SET LOCDESC =@LOCDESC  WHERE LOCID = @LOCID

		END
 
IF (@Mode='Delete')
BEGIN
       DELETE FROM LOCMASTER WHERE LOCID = @LOCID
END
 


GO
/****** Object:  StoredProcedure [dbo].[sp_tblLogin]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_tblLogin]
@LoginId int=null,
@LoginName varchar(100)=null,
@Email varchar(100)=null,
@Username varchar(20)=null,
@Password varchar(20)=null,
@Rights int=null,
@Mode varchar(25)
AS

IF (@Mode='Insert') 
IF NOT EXISTS (SELECT * FROM tblLogin WHERE Username=@Username)
BEGIN
	INSERT INTO tblLogin(LoginName,Email,Username,Password,Rights,ModifiedDate) VALUES(@LoginName,@Email,@Username,@Password,@Rights,getdate())
END

IF (@Mode='View') 
BEGIN
	SELECT * FROM tblLogin
END

IF (@Mode='ViewByID') 
BEGIN
	SELECT * FROM tblLogin WHERE LoginId = @LoginId
END

IF (@Mode='ChkLogin') 
BEGIN
	SELECT * FROM tblLogin WHERE Username = @Username and Password = @Password
END

IF (@Mode='Update') 
BEGIN
	UPDATE [tblLogin]
	SET [LoginName] = @LoginName
      ,[Email] = @Email
      ,[Username] = @Username
      ,[Password] = @Password
	  ,[Rights] = @Rights
      ,[ModifiedDate] = getdate()
	WHERE LoginId = @LoginId
END

IF (@Mode='Delete') 
BEGIN
	DELETE FROM [tblLogin] WHERE LoginId = @LoginId
END



GO
/****** Object:  StoredProcedure [dbo].[sp_tblTrainings]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**********************************************************************************************/


CREATE PROCEDURE [dbo].[sp_tblTrainings]
@TrainingId int=null,
@StartDate datetime=null,
@EndDate datetime=null,
@TrainingDetails text=null,
@Effectiveness text=null,
@JobType int=null,
@EmployeeId int=null,
@Mode varchar(25)
AS

IF (@Mode='Insert') 
BEGIN
	INSERT INTO [tblTrainings]
           ([StartDate]
           ,[EndDate]
           ,[TrainingDetails]
           ,[Effectiveness]
           ,[JobType]
		   ,[EmployeeId])
     VALUES
           (@StartDate
           ,@EndDate
           ,@TrainingDetails
           ,@Effectiveness
           ,@JobType
		   ,@EmployeeId)
END

IF (@Mode='ViewByEmployee') 
BEGIN
	SELECT * FROM [tblTrainings] WHERE EmployeeId = @EmployeeId AND JobType = @JobType ORDER BY StartDate
END

IF (@Mode='ViewByID') 
BEGIN
	SELECT * FROM [tblTrainings] WHERE TrainingId = @TrainingId
END

IF (@Mode='Update') 
BEGIN
	UPDATE [tblTrainings]
	SET [StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[TrainingDetails] = @TrainingDetails,
		[Effectiveness] = @Effectiveness,
		[JobType] = @JobType
	WHERE TrainingId = @TrainingId
END

IF (@Mode='Delete') 
BEGIN
	DELETE FROM [tblTrainings] WHERE TrainingId = @TrainingId
END




GO
/****** Object:  StoredProcedure [dbo].[SP_TRANSACTIONS]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_TRANSACTIONS]
@TRANSNUM nvarchar(1000),
		@WORKDATE nvarchar(1000)=null,
		@LOCDESC nvarchar(1000)=null,
		@PROJDESC nvarchar(1000)=null,
		@DELDESC nvarchar(1000)=null,
		@WORKHRS nvarchar(1000)= NULL,
		
		@USERNAME nvarchar(1000)=null,
		@Mode varchar(25)
AS
 
IF (@Mode='Insert')

BEGIN
       INSERT INTO TRANSACTIONS(TRANSNUM,WORKDATE,LOCDESC,PROJDESC,DELDESC,WORKHRS,DATE_TIME,USERNAME) 
	   VALUES(@TRANSNUM,@WORKDATE,@LOCDESC,@PROJDESC,@DELDESC,@WORKHRS,getdate(),@USERNAME)
END
 
IF (@Mode='Delete')
BEGIN
       DELETE FROM TRANSACTIONS WHERE TRANSNUM = @TRANSNUM
END

IF (@Mode='Update')
BEGIN
		UPDATE TRANSACTIONS SET WORKDATE = @WORKDATE, LOCDESC = @LOCDESC, PROJDESC = @PROJDESC, DELDESC = @DELDESC,WORKHRS=@WORKHRS
		
		 WHERE TRANSNUM = @TRANSNUM

		END

		IF (@Mode='ChkTrans') 
BEGIN
	SELECT * FROM TRANSACTIONS WHERE TRANSNUM = @TRANSNUM
END

IF (@Mode='View')
BEGIN
       SELECT * FROM TRANSACTIONS
END


GO
/****** Object:  Table [dbo].[DELMASTER]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DELMASTER](
	[LOCID] [nvarchar](500) NULL,
	[DELDESC] [nvarchar](1000) NULL,
	[DATE_TIME] [datetime] NULL,
	[USERNAME] [nvarchar](1000) NULL,
	[DELNO] [nvarchar](1000) NULL,
	[DELMASTERID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DELMASTER] PRIMARY KEY CLUSTERED 
(
	[DELMASTERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOCMASTER]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCMASTER](
	[LOCID] [nvarchar](500) NOT NULL,
	[LOCDESC] [nvarchar](1000) NULL,
	[DATE_TIME] [datetime] NULL,
	[USERNAME] [nvarchar](1000) NULL,
	[LOCMASTERID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LOCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROJMASTER]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJMASTER](
	[LOCID] [nvarchar](500) NULL,
	[PROJNO] [nvarchar](1000) NULL,
	[PROJDESC] [nvarchar](1000) NULL,
	[EPCCOMP] [nvarchar](1000) NULL,
	[DATE_TIME] [datetime] NULL,
	[USERNAME] [nvarchar](100) NULL,
	[PROJMASTERID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PROJMASTER] PRIMARY KEY CLUSTERED 
(
	[PROJMASTERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Degree] [varchar](250) NULL,
	[Address] [varchar](300) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zip] [varchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Mobile] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Designation] [varchar](100) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DOJ] [datetime] NOT NULL,
	[DOC] [datetime] NOT NULL,
	[Bio] [text] NOT NULL,
	[Photo] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLogin](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Rights] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTrainings]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrainings](
	[TrainingId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[TrainingDetails] [text] NOT NULL,
	[Effectiveness] [text] NOT NULL,
	[JobType] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANSACTIONS]    Script Date: 10/18/2017 4:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTIONS](
	[TRANSNUM] [nvarchar](1000) NOT NULL,
	[WORKDATE] [nvarchar](1000) NULL,
	[LOCDESC] [nvarchar](1000) NULL,
	[PROJDESC] [nvarchar](1000) NULL,
	[DELDESC] [nvarchar](1000) NULL,
	[WORKHRS] [nvarchar](1000) NULL,
	[DATE_TIME] [datetime] NULL,
	[USERNAME] [nvarchar](1000) NULL,
	[TRANSID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TRANSACTIONS] PRIMARY KEY CLUSTERED 
(
	[TRANSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DELMASTER] ON 

INSERT [dbo].[DELMASTER] ([LOCID], [DELDESC], [DATE_TIME], [USERNAME], [DELNO], [DELMASTERID]) VALUES (N'2', N'TEST DATA', CAST(0x0000A672009B06DF AS DateTime), N'Admin', N'D0001', 13)
INSERT [dbo].[DELMASTER] ([LOCID], [DELDESC], [DATE_TIME], [USERNAME], [DELNO], [DELMASTERID]) VALUES (N'1', N'DUKHAN DELIVERY', CAST(0x0000A67200BD2AAF AS DateTime), N'Admin', N'D0004', 14)
SET IDENTITY_INSERT [dbo].[DELMASTER] OFF
SET IDENTITY_INSERT [dbo].[LOCMASTER] ON 

INSERT [dbo].[LOCMASTER] ([LOCID], [LOCDESC], [DATE_TIME], [USERNAME], [LOCMASTERID]) VALUES (N'1', N'Dukhan', CAST(0x0000A65600AB6300 AS DateTime), N'Raju', 1)
INSERT [dbo].[LOCMASTER] ([LOCID], [LOCDESC], [DATE_TIME], [USERNAME], [LOCMASTERID]) VALUES (N'2', N'Shamal', CAST(0x0000A65600BB5120 AS DateTime), N'Siva', 2)
INSERT [dbo].[LOCMASTER] ([LOCID], [LOCDESC], [DATE_TIME], [USERNAME], [LOCMASTERID]) VALUES (N'3', N'Al Khor', CAST(0x0000A65600BB9770 AS DateTime), N'Pramod', 3)
INSERT [dbo].[LOCMASTER] ([LOCID], [LOCDESC], [DATE_TIME], [USERNAME], [LOCMASTERID]) VALUES (N'6', N'Raslaffan', CAST(0x0000A65800BD3D50 AS DateTime), N'Admin', 5)
INSERT [dbo].[LOCMASTER] ([LOCID], [LOCDESC], [DATE_TIME], [USERNAME], [LOCMASTERID]) VALUES (N'7', N'Al Shamal', CAST(0x0000A65E0037E7EC AS DateTime), NULL, 6)
INSERT [dbo].[LOCMASTER] ([LOCID], [LOCDESC], [DATE_TIME], [USERNAME], [LOCMASTERID]) VALUES (N'MESAIEED', N'RAP PROJECET', CAST(0x0000A672009AA65A AS DateTime), N'Admin', 8)
SET IDENTITY_INSERT [dbo].[LOCMASTER] OFF
SET IDENTITY_INSERT [dbo].[PROJMASTER] ON 

INSERT [dbo].[PROJMASTER] ([LOCID], [PROJNO], [PROJDESC], [EPCCOMP], [DATE_TIME], [USERNAME], [PROJMASTERID]) VALUES (N'1', N'P0001', N'CMS', N'SMPL', CAST(0x0000A672009A60DF AS DateTime), N'Admin', 11)
INSERT [dbo].[PROJMASTER] ([LOCID], [PROJNO], [PROJDESC], [EPCCOMP], [DATE_TIME], [USERNAME], [PROJMASTERID]) VALUES (N'6', N'P0002', N'PROMETHUES', N'PROMETHUS', CAST(0x0000A672009A8486 AS DateTime), N'Admin', 12)
INSERT [dbo].[PROJMASTER] ([LOCID], [PROJNO], [PROJDESC], [EPCCOMP], [DATE_TIME], [USERNAME], [PROJMASTERID]) VALUES (N'MESAIEED', N'R0001', N'RAP PERMIT', N'RAP INT', CAST(0x0000A672009ADCCA AS DateTime), N'Admin', 13)
INSERT [dbo].[PROJMASTER] ([LOCID], [PROJNO], [PROJDESC], [EPCCOMP], [DATE_TIME], [USERNAME], [PROJMASTERID]) VALUES (N'2', N'P0004', N'CGE', N'CGE1', CAST(0x0000A67200BD0F63 AS DateTime), N'Admin', 14)
INSERT [dbo].[PROJMASTER] ([LOCID], [PROJNO], [PROJDESC], [EPCCOMP], [DATE_TIME], [USERNAME], [PROJMASTERID]) VALUES (N'3', N'p00012', N'tesst123', N'teteee', CAST(0x0000A67200BF1D6B AS DateTime), N'Admin', 15)
INSERT [dbo].[PROJMASTER] ([LOCID], [PROJNO], [PROJDESC], [EPCCOMP], [DATE_TIME], [USERNAME], [PROJMASTERID]) VALUES (N'3', N'45', N'fgf', N'df', CAST(0x0000A810010C9F85 AS DateTime), N'Admin', 16)
SET IDENTITY_INSERT [dbo].[PROJMASTER] OFF
SET IDENTITY_INSERT [dbo].[tblDepartment] ON 

INSERT [dbo].[tblDepartment] ([DepartmentId], [DepartmentName]) VALUES (1, N'Central')
INSERT [dbo].[tblDepartment] ([DepartmentId], [DepartmentName]) VALUES (2, N'Main Branch')
INSERT [dbo].[tblDepartment] ([DepartmentId], [DepartmentName]) VALUES (3, N'I.T')
SET IDENTITY_INSERT [dbo].[tblDepartment] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmployeeId], [Name], [DOB], [Degree], [Address], [City], [State], [Zip], [Phone], [Mobile], [Email], [Designation], [DepartmentId], [DOJ], [DOC], [Bio], [Photo], [Status]) VALUES (1, N'Raju', CAST(0x00009B2900B34B6E AS DateTime), N'Bcom', N'India', N'Thrissur', N'Kerala', N'123', N'+0288333', N'+0238334', N'aaa@dsmd.com', N'I.T support', 3, CAST(0x00009B2900B34B6E AS DateTime), CAST(0x00009B2900B34B6E AS DateTime), N'good personality', N'adjd.jpg', 2)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([LoginId], [LoginName], [Email], [Username], [Password], [Rights], [ModifiedDate]) VALUES (1, N'Admin', N'a', N'Admin', N'admin', 1, CAST(0x0000A65600ABC6D1 AS DateTime))
SET IDENTITY_INSERT [dbo].[tblLogin] OFF
SET IDENTITY_INSERT [dbo].[tblTrainings] ON 

INSERT [dbo].[tblTrainings] ([TrainingId], [StartDate], [EndDate], [TrainingDetails], [Effectiveness], [JobType], [EmployeeId]) VALUES (1, CAST(0x0000A6D600000000 AS DateTime), CAST(0x0000A6D600000000 AS DateTime), N'ssa', N'sad', 2, 1)
INSERT [dbo].[tblTrainings] ([TrainingId], [StartDate], [EndDate], [TrainingDetails], [Effectiveness], [JobType], [EmployeeId]) VALUES (2, CAST(0x0000A38500000000 AS DateTime), CAST(0x0000A67E00000000 AS DateTime), N'good', N'very good', 2, 2)
SET IDENTITY_INSERT [dbo].[tblTrainings] OFF
SET IDENTITY_INSERT [dbo].[TRANSACTIONS] ON 

INSERT [dbo].[TRANSACTIONS] ([TRANSNUM], [WORKDATE], [LOCDESC], [PROJDESC], [DELDESC], [WORKHRS], [DATE_TIME], [USERNAME], [TRANSID]) VALUES (N'T00021', N'8/23/2016 12:00:00 AM', N'Dukhan', N'CMS', N'TEST DATA', N'54', CAST(0x0000A672009B2B6C AS DateTime), N'Admin', 20)
INSERT [dbo].[TRANSACTIONS] ([TRANSNUM], [WORKDATE], [LOCDESC], [PROJDESC], [DELDESC], [WORKHRS], [DATE_TIME], [USERNAME], [TRANSID]) VALUES (N'T00051t', N'8/15/2016 12:00:00 AM', N'Dukhan', N'CMS', N'TEST DATA', N'31', CAST(0x0000A67200BE17F4 AS DateTime), N'Admin', 23)
INSERT [dbo].[TRANSACTIONS] ([TRANSNUM], [WORKDATE], [LOCDESC], [PROJDESC], [DELDESC], [WORKHRS], [DATE_TIME], [USERNAME], [TRANSID]) VALUES (N'434', N'9/6/2016 12:00:00 AM', N'Al Khor', N'CMS', N'TEST DATA', N'33', CAST(0x0000A67800F663E1 AS DateTime), N'Admin', 24)
INSERT [dbo].[TRANSACTIONS] ([TRANSNUM], [WORKDATE], [LOCDESC], [PROJDESC], [DELDESC], [WORKHRS], [DATE_TIME], [USERNAME], [TRANSID]) VALUES (N'123', N'9/6/2016 12:00:00 AM', N'Al Khor', N'RAP PERMIT', N'TEST DATA', N'33', CAST(0x0000A67800F67497 AS DateTime), N'Admin', 25)
SET IDENTITY_INSERT [dbo].[TRANSACTIONS] OFF
ALTER TABLE [dbo].[DELMASTER]  WITH CHECK ADD FOREIGN KEY([LOCID])
REFERENCES [dbo].[LOCMASTER] ([LOCID])
GO
ALTER TABLE [dbo].[PROJMASTER]  WITH CHECK ADD FOREIGN KEY([LOCID])
REFERENCES [dbo].[LOCMASTER] ([LOCID])
GO
USE [master]
GO
ALTER DATABASE [EmployeeDB] SET  READ_WRITE 
GO
