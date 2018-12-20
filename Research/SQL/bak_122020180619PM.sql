USE [master]
GO
/****** Object:  Database [WebCrawling]    Script Date: 12/20/2018 6:19:56 PM ******/
CREATE DATABASE [WebCrawling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebCrawling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebCrawling.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebCrawling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\WebCrawling_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebCrawling] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebCrawling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebCrawling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebCrawling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebCrawling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebCrawling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebCrawling] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebCrawling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebCrawling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebCrawling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebCrawling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebCrawling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebCrawling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebCrawling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebCrawling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebCrawling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebCrawling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebCrawling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebCrawling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebCrawling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebCrawling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebCrawling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebCrawling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebCrawling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebCrawling] SET RECOVERY FULL 
GO
ALTER DATABASE [WebCrawling] SET  MULTI_USER 
GO
ALTER DATABASE [WebCrawling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebCrawling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebCrawling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebCrawling] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebCrawling] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebCrawling', N'ON'
GO
ALTER DATABASE [WebCrawling] SET QUERY_STORE = OFF
GO
USE [WebCrawling]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WebCrawling]
GO
/****** Object:  Table [dbo].[Company_PipelineUrl]    Script Date: 12/20/2018 6:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_PipelineUrl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[PipelineUrl] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrlType]    Script Date: 12/20/2018 6:19:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrlType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UrlType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebCrawl_Keywords_Global]    Script Date: 12/20/2018 6:19:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebCrawl_Keywords_Global](
	[Keywords_used_for_search__globally_] [nvarchar](max) NOT NULL,
	[Examples] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebCrawl_Urls]    Script Date: 12/20/2018 6:19:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebCrawl_Urls](
	[URLs_for_search__Company_websites_Conferences_] [varchar](max) NOT NULL,
	[Steps_leading_to_web_page] [varchar](max) NULL,
	[Download_option] [varchar](max) NULL,
	[UrlTypeId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company_PipelineUrl] ON 

INSERT [dbo].[Company_PipelineUrl] ([Id], [CompanyName], [PipelineUrl]) VALUES (1, N'Pfizer', N'https://www.pfizer.com/science/drug-product-pipeline')
INSERT [dbo].[Company_PipelineUrl] ([Id], [CompanyName], [PipelineUrl]) VALUES (2, N' Novartis ', N' https://www.novartis.com/our-science/novartis-global-pipeline ')
SET IDENTITY_INSERT [dbo].[Company_PipelineUrl] OFF
SET IDENTITY_INSERT [dbo].[UrlType] ON 

INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (1, N'API')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (2, N'File_csv')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (3, N'File_doc')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (4, N'File_docx')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (5, N'File_pdf')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (6, N'File_txt')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (7, N'File_xls')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (8, N'File_xlsx')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (9, N'GoogleSearch')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (10, N'ManualSearch')
INSERT [dbo].[UrlType] ([Id], [Name]) VALUES (11, N'Pipeline')
SET IDENTITY_INSERT [dbo].[UrlType] OFF
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Clinical', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Compound', N'RG6185; RG-6185; RG 6185')
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Pipeline', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'R&D', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Portfolio', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Research', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Development', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Product', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Candidate', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Drug', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Phase', N'Preclinical; Phase 1; Phase 2; Phase 3; Discontinued; Pre-registration; Launched; Approved; Filed; NDA; IND')
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Indication', N'Cancer; Arthritis; Psoriasis; Infection')
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Therapeutic', N'Oncology; Immunology; Inflammation')
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Target', N'PARP1; ALK; JAK')
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Protein', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'MOA', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Mechanism', N'Inhibitor; Agonist')
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Biologic', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Small', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Molecule', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Antibody', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'ADC', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'NME', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'NCE', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Vaccine', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Therapy', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Biosimilar', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Press', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Release', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Annual', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Report', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'News', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Abstract', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Treatment', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Meeting', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'disease', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Disorder', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Design', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Discovery', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Inhibitor', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Poster', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Conference', NULL)
INSERT [dbo].[WebCrawl_Keywords_Global] ([Keywords_used_for_search__globally_], [Examples]) VALUES (N'Symposium', NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.roche.com/research_and_development/who_we_are_how_we_work/pipeline.htm', N'Company Webpage (Roche) -> Research & Development -> Who we are and how we work -> Pipeline', N'Download option available as csv', 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.bostonpharmaceuticals.com/portfolio/', N'Company Webpage (Bostonpharmaceuticals) -> portfolio', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.celgene.com/research-development/pipeline-pdf/', N'Company Webpage (Celgene) -> Research & Development -> Pipeline', NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://jnj-content-lab.brightspotcdn.com/ea/c0/9e702f994ad48b955a2e9ea6292e/jnj-pipeline-3q2018.pdf', N'Company Webpage (JnJ) -> Investors -> Pharmaceutical Pipeline -> Late Stage Pipeline', NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://nov.ncc.re.kr/eng/pipeline/pipeline/#;', N'Company Webpage (National Onco Venture) -> Pipeline', NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.pfizer.com/science/drug-product-pipeline', N'Company Webpage (Pfizer) -> Our science -> PRODUCT PIPELINE', NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.tevapharm.com/research_development/rd_focus/pipeline/', N'Company Webpage (Teva) -> Research -> Pipeline', N'https://www.tevapharm.com/files/Research_Pipeline_April2018.pdf', 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://www.qurient.com/?page_id=36238&lang=en', NULL, NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.bms.com/researchers-and-partners/in-the-pipeline.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.takeda.com/what-we-do/research-and-development/our-pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.ds-pharma.com/ir/library/annual/pdf/2017/annual_report2017_Eng.pdf', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.astrazeneca.com/our-science/pipeline.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.novartis.com/our-science/novartis-global-pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.merck.com/research/pipeline/home.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.gsk.com/en-gb/research/product-pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.sanofi.com/en/science-and-innovation/research-and-development/', NULL, NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://www.shionogi.com/research/pipeline.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.shire.com/research-and-development/pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.otsuka.com/en/rd/pharmaceuticals/pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://us.eisai.com/research/global-pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.boehringer-ingelheim.ph/research-development/research-development/pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.allergan.com/research-and-development/areas-of-focus/pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.novonordisk.com/rnd/rd-pipeline.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://www.kyowa-kirin.com/research_and_development/pipeline/index.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.chugai-pharm.co.jp/english/ir/reports_downloads/pipeline.html', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://www.amgenpipeline.com/pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.ucb.com/our-science/pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://vaultpharma.com/pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://www.valeant.com/operational-expertise/valeant-united-states/pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://eng.yuhan.co.kr/Rnd/Vision/PipeLine/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.vrtx.com/pipeline-medicines/investigational-medicines-pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.4sc.com/product-pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.aduro.com/pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'www.immunomix.com/technology/', NULL, NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'www.angiochem.com/pipeline', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'www.alkahest.com/product-pipeline/', NULL, NULL, 11)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://meetinglibrary.asco.org/', N'Meetings (for abstracts/posters)', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://cancerres.aacrjournals.org/content/by/year?utm_source=past&utm_medium=dropdown&utm_campaign=menu', N'Meetings (for abstracts/posters)', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://cancerres.aacrjournals.org/content/by/year/2017', N'Meetings (for abstracts/posters)', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.acsmedchem.org/?nd=ACS-NationalAbstracts', N'Meetings (for abstracts/posters)', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.aacc.org/science-and-practice/annual-meeting-abstracts-archive', N'Meetings (for abstracts/posters)', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'https://www.asn-online.org/education/kidneyweek/archives/', N'Meetings (for abstracts/posters)', NULL, NULL)
INSERT [dbo].[WebCrawl_Urls] ([URLs_for_search__Company_websites_Conferences_], [Steps_leading_to_web_page], [Download_option], [UrlTypeId]) VALUES (N'http://aacrjournals.org/site/Meetings/meeting_abs.xhtml', N'Meetings (for abstracts/posters)', NULL, NULL)
/****** Object:  Index [IX_WebCrawl_Urls]    Script Date: 12/20/2018 6:19:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_WebCrawl_Urls] ON [dbo].[WebCrawl_Urls]
(
	[UrlTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WebCrawl_Urls]  WITH CHECK ADD  CONSTRAINT [FK_WebCrawl_Urls_UrlType] FOREIGN KEY([UrlTypeId])
REFERENCES [dbo].[UrlType] ([Id])
GO
ALTER TABLE [dbo].[WebCrawl_Urls] CHECK CONSTRAINT [FK_WebCrawl_Urls_UrlType]
GO
USE [master]
GO
ALTER DATABASE [WebCrawling] SET  READ_WRITE 
GO
