USE [master]
GO


CREATE DATABASE [AppTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AppTest', FILENAME = N'D:\Archivos\DB\AppTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AppTest_log', FILENAME = N'D:\Archivos\DB\AppTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AppTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [AppTest] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [AppTest] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [AppTest] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [AppTest] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [AppTest] SET ARITHABORT OFF 
GO

ALTER DATABASE [AppTest] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [AppTest] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [AppTest] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [AppTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [AppTest] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [AppTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [AppTest] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [AppTest] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [AppTest] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [AppTest] SET  DISABLE_BROKER 
GO

ALTER DATABASE [AppTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [AppTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [AppTest] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [AppTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [AppTest] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [AppTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [AppTest] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [AppTest] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [AppTest] SET  MULTI_USER 
GO

ALTER DATABASE [AppTest] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [AppTest] SET DB_CHAINING OFF 
GO

ALTER DATABASE [AppTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [AppTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [AppTest] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [AppTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [AppTest] SET QUERY_STORE = OFF
GO

ALTER DATABASE [AppTest] SET  READ_WRITE 
GO


