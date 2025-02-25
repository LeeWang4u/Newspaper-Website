USE [master]
GO
/****** Object:  Database [News]    Script Date: 7/3/2024 11:27:57 AM ******/
CREATE DATABASE [News]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'News', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEQUANGHIEN\MSSQL\DATA\News.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'News_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEQUANGHIEN\MSSQL\DATA\News_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [News] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [News].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [News] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [News] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [News] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [News] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [News] SET ARITHABORT OFF 
GO
ALTER DATABASE [News] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [News] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [News] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [News] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [News] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [News] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [News] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [News] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [News] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [News] SET  DISABLE_BROKER 
GO
ALTER DATABASE [News] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [News] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [News] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [News] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [News] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [News] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [News] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [News] SET RECOVERY FULL 
GO
ALTER DATABASE [News] SET  MULTI_USER 
GO
ALTER DATABASE [News] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [News] SET DB_CHAINING OFF 
GO
ALTER DATABASE [News] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [News] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [News] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [News] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'News', N'ON'
GO
ALTER DATABASE [News] SET QUERY_STORE = ON
GO
ALTER DATABASE [News] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [News]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/3/2024 11:27:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID_Category] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](50) NOT NULL,
	[Describe] [nvarchar](200) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/3/2024 11:27:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID_Cmt] [int] IDENTITY(1,1) NOT NULL,
	[Content_Cmt] [nvarchar](250) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[ID_Post] [int] NOT NULL,
	[Time_Cmt] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID_Cmt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 7/3/2024 11:27:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[ID_Post] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Content_Post] [ntext] NULL,
	[Image] [varchar](255) NULL,
	[time_post] [datetime] NULL,
	[Email] [nchar](30) NOT NULL,
	[ID_Category] [int] NOT NULL,
 CONSTRAINT [PK_BaiViet] PRIMARY KEY CLUSTERED 
(
	[ID_Post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/3/2024 11:27:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Email] [nchar](30) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[pass_word] [nchar](100) NOT NULL,
	[Active] [bit] NULL,
	[Role] [nchar](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (1, N'Thời sự', N'Tin thời sự mới nhất trong ngày, cập nhật thông tin, hình ảnh về các vấn đề thời sự trong nước')
INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (2, N'Công nghệ', N'Thông tin công nghệ, khoa học mới nhất liên tục được cập nhật hàng giờ')
INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (3, N'Văn Hóa', N'Trang tin văn hóa, giải trí trong nước và quốc tế cập nhật liên tục trong ngày')
INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (4, N'Giáo Dục', N'Tin nhanh giáo dục, tuyển sinh, thi đại học, cao đẳng, tra cứu điểm thi, giải đề')
INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (5, N'Du Lịch', N'Thông tin, hình ảnh các địa điểm du lịch, các danh lam thắng cảnh hấp dẫn trong nước và quốc tế')
INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (6, N'Sức Khỏe', N'Thông tin sức khỏe, y tế trong nước và quốc tế')
INSERT [dbo].[Categories] ([ID_Category], [Category_Name], [Describe]) VALUES (7, N'Thế Giới', N'Tổng hợp sự kiện tin tức thế giới, biển đông, quốc tế, mới nhất, nhanh nhất liên tục trong ngày')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (30, N'Châu Âu thiếu thuốc nổ chế đạn pháo, tên lửa', N'Các nhà máy vũ khí châu Âu không đủ thuốc nổ để chế tạo đạn pháo và tên lửa, trong khi nỗ lực mở rộng nguồn cung vấp phải nhiều trở ngại.

Trong lúc Ukraine đang chịu áp lực ngày càng lớn trên chiến trường, các quốc gia châu Âu tìm mọi cách để tăng sản lượng đạn pháo và tên lửa. Tuy nhiên, Liên minh châu Âu (EU) hồi tháng 1 thừa nhận không thể thực hiện cam kết cung cấp cho Ukraine một triệu quả đạn pháo vào tháng 3 như cam kết từ đầu năm ngoái.

EU ngày 15/3 phân bổ 542 triệu USD để tăng năng suất đạn pháo, tên lửa và các loại đạn dược khác. 3/4 khoản ngân sách nói trên, tương đương khoảng 372 triệu USD, sẽ được chi cho ngành công nghiệp thuốc nổ.

Kế hoạch tăng sản lượng đạn dược các loại của châu Âu tới nay vẫn vấp phải trở ngại lớn là thuốc nổ. Mỗi quả đạn pháo chứa khoảng 10,8 kg thuốc nổ mạnh như trinitrotoluen (TNT), octogen (HMX) hoặc hexogen (RDX), liều phóng cũng cần có thuốc nổ. Các loại đạn kích cỡ lớn hơn như đầu đạn nổ mạnh nặng 450 kg của tên lửa Storm Shadow/SCALP EG cần nhiều thuốc nổ hơn nữa.

Trong khi đó, các hãng sản xuất thuốc nổ tại châu Âu không chắc chắn về khả năng tăng cường sản lượng, khiến họ không thể giúp Ukraine duy trì khả năng cạnh tranh trên chiến trường với lực lượng Nga.

Chiến tranh Lạnh kết thúc khiến nhu cầu vũ khí giảm mạnh, buộc nhiều hãng sản xuất thuốc nổ tại châu Âu phải thu hẹp quy mô sản xuất, sáp nhập hoặc đóng cửa. Anh đóng cửa nhà máy sản xuất thuốc nổ cuối cùng của nước này vào năm 2008. Châu Âu chỉ còn một cơ sở chế tạo TNT lớn ở phía bắc Ba Lan.

Johann Hoecherl, chuyên gia tại Đại học Liên bang Munich, cho biết hoạt động của các nhà máy thuốc nổ tại châu Âu trong nhiều thập kỷ được điều chỉnh để đạt hiệu quả trong thời bình, không phải sản xuất trên quy mô lớn. Điều này khiến chuỗi cung ứng thuốc nổ ngày càng khó đáp ứng cho nhu cầu ngày càng tăng.

Chỉ hai công ty tại châu Âu có khả năng chế tạo thuốc nổ làm liều phóng cho đạn pháo hoặc tên lửa theo tiêu chuẩn NATO, một của Na Uy và một của Pháp. Cả hai doanh nghiệp đều tiếp nhận số lượng đơn hàng khổng lồ sau khi chiến sự Nga - Ukraine bùng phát. Nhà máy của Pháp không thể nhận thêm đơn hàng cho tới năm 2030, dù đang hoạt động hết công suất.

Chuyên gia Tim Lawrenson thuộc Viện Nghiên cứu Chiến lược Quốc tế (IISS) nhận định việc mở lại các nhà máy sản xuất thuốc nổ sẽ mất nhiều thời gian, do cần phải trang bị lại máy móc và tân trang những cơ sở này.

Các công ty đang đổ tiền vào tăng sản lượng thuốc nổ nhằm nhận khoản hỗ trợ càng sớm càng tốt. Tuy nhiên, một người làm trong ngành công nghiệp cho biết để xây mới một nhà máy sẽ mất 3-7 năm. Tập đoàn Rheinmetall của Đức đang xây dựng nhà máy thuốc nổ ở Hungary, song dây chuyền phải tới năm 2027 mới hoạt động.


Christian Moelling, chuyên gia thuộc tổ chức nghiên cứu có tên Hội đồng Quan hệ Đối ngoại Đức, cho biết loạt quy định về an toàn và môi trường cũng là trở ngại trong nỗ lực tăng sản lượng thuốc nổ tại châu Âu.

Các hãng thuốc nổ cũng đối mặt với tình trạng thiếu nhân sự lành nghề, khi nhiều kỹ sư cao tuổi bắt đầu nghỉ hưu và rất ít thanh niên muốn tham gia ngành này.

Nguồn cung nguyên liệu thô chủ chốt như tiền chất thuốc nổ cũng thiếu hụt, trong đó có axit nitric, thành phần quan trọng của cả TNT, HMX, RDX và hợp chất dễ cháy nitrocellulose, thành phần của rất nhiều loại liều phóng.

Một số công ty sản xuất đạn ở châu Âu đang tìm nguồn cung thuốc nổ ở những nơi xa hơn, trong đó có các doanh nghiệp Ấn Độ và Nhật Bản. Tuy nhiên, nhiều chuyên gia lo ngại thuốc nổ từ nơi khác không đáp ứng tiêu chuẩn NATO sẽ ảnh hưởng đến thiết bị quân sự.

Tuyên bố của các nước châu Âu về việc nâng sản lượng đạn pháo lên ít nhất 1,4 triệu quả vào cuối năm 2024 đang đạt một số tiến bộ. Tuy nhiên, trong lúc Nga triển khai chiến dịch tấn công Kharkov và giành được nhiều bước tiến trên chiến trường, nỗ lực tăng sản lượng đạn của EU không đủ nhanh để giải quyết cơn khát đạn pháo của Ukraine.', N'/img/5563187178137268119a-chau-Au-9940-1716867960.jpg', CAST(N'2024-05-28T19:19:41.000' AS DateTime), N'hoang@gmail.com               ', 7)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (31, N'Ông Macron: EU đối diện ''thù trong giặc ngoài'' chưa từng thấy', N'Tổng thống Pháp lo ngại về làn sóng cánh hữu trỗi dậy từ bên trong và thách thức an ninh từ bên ngoài với EU trước thềm bầu cử nghị viện châu Âu.

"Chúng ta đã quá quen với nền dân chủ mà quên rằng bảo vệ nó là cuộc đấu tranh không ngừng nghỉ. Giờ đây, chúng ta đang đối diện tình cảnh thù trong giặc ngoài nhiều chưa từng thấy. Tôi cho rằng nền dân chủ của chúng ta đang gặp khủng hoảng", Tổng thống Pháp Emmanuel Macron phát biểu ngày 26/5 khi họp báo cùng Tổng thống Đức Frank-Walter Steinmeier tại Berlin.

Ông Macron kêu gọi củng cố quan hệ song phương Pháp - Đức, đồng thời bày tỏ lo ngại trước làn sóng "ủng hộ chủ nghĩa toàn trị" đang lan rộng tại hai quốc gia thành viên chủ chốt của Liên minh châu Âu (EU). Lãnh đạo Pháp kêu gọi cử tri hai nước tích cực tham gia bỏ phiếu trong cuộc bầu cử nghị viện châu Âu vào đầu tháng 6 nhằm "bảo vệ nền dân chủ".

"Tôi cho rằng châu Âu đang đối diện thời khắc sinh tử và thật sự lo ngại rằng châu Âu có thể lụi tàn", Tổng thống Pháp nói, lặp lại nhận định gây tranh cãi từng được ông đưa ra hồi tháng 4.

Tổng thống Macron chỉ ra rằng "thù trong" với EU chính là những người theo chủ nghĩa dân tộc cánh hữu đang trỗi dậy ở châu Âu, gây hoài nghi về nền dân chủ khu vực. Ông cáo buộc các chính trị gia và đảng phái cánh hữu đang tìm cách đánh lừa cử tri châu Âu với lập luận "cuộc sống tại châu Âu sẽ đơn giản hơn nếu các nước theo đuổi chủ nghĩa dân tộc".

Tổng thống Đức Steinmeier đồng tình với lãnh đạo Pháp và kêu gọi xây dựng "liên minh các nền dân chủ tại châu Âu". Ông cảnh báo tình hình chính trị EU trước thềm cuộc bầu cử nghị viện năm nay "khác xa cuộc bầu cử trước vì đã có nhiều biến động xảy ra".

"Chúng ta cần cùng nhau học cách tự vệ hiệu quả hơn trước mối đe dọa từ bên ngoài, đồng thời xây dựng xã hội chống chọi tốt hơn trước những đòn nội công ngoại kích", ông Steinmeier phát biểu tại tiệc chiêu đãi ông Macron.

Đây là chuyến thăm cấp nhà nước đầu tiên của Tổng thống Pháp đến Đức trong 24 năm qua, dù ông Macron đã có nhiều chuyến công du, làm việc ở nước láng giềng trong hai nhiệm kỳ.

Khoảng 400 triệu cử tri từ 27 nước EU sẽ bỏ phiếu ngày 6-9/6 để chọn ra 720 thành viên nghị viện châu Âu, những người sẽ quyết định mọi chính sách của khối. Cuộc bỏ phiếu cũng là phép thử về mức độ ủng hộ của châu Âu đối với những người theo chủ nghĩa dân túy cánh hữu.

Khảo sát cử tri EU cho thấy liên minh chính trị theo trường phái trung dung của ông Macron đang thất thế trước các nhóm cánh hữu. Tình trạng tương tự cũng diễn ra với chính trường Đức, khi ba đảng trong liên minh cầm quyền của Thủ tướng Olaf Scholz đều thua kém đảng cực hữu AfD trong các cuộc thăm dò trước bầu cử.', N'/img/Macron-tham-Duc-2-1651-1716788710.jpg', CAST(N'2024-05-28T19:22:48.000' AS DateTime), N'hoang@gmail.com               ', 7)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (32, N'Tây Ban Nha công bố gói viện trợ hơn một tỷ USD cho Ukraine', N'Madrid cam kết viện trợ quân sự trị giá 1,08 tỷ USD cho Kiev, khi Tổng thống Zelensky đang thăm nước này.

Tổng thống Ukraine Volodymyr Zelensky ngày 27/5 hội đàm và ký hiệp ước an ninh song phương với Thủ tướng Pedro Sanchez ở Madrid, Tây Ban Nha. Ông Sanchez cho biết thỏa thuận bao gồm nhiều vấn đề, từ "hỗ trợ quân sự, nhân đạo và tài chính cho đến hợp tác về công nghiệp quốc phòng, hỗ trợ hoạt động tái thiết, rà phá bom mìn và nhiều thứ khác".

Nổi bật trong số đó là "cam kết viện trợ quân sự trị giá một tỷ euro (1,08 tỷ USD) trong năm 2024" cho Ukraine.

"Gói viện trợ sẽ giúp Kiev tăng cường năng lực, bao gồm của các hệ thống phòng thủ cần thiết để bảo vệ dân thường, các thành phố và hạ tầng, vốn đang hứng chịu các cuộc tấn công bừa bãi như cuối tuần qua tại Kharkov", Thủ tướng Tây Ban Nha nói, đề cập cuộc tập kích của Nga vào thành phố ở đông bắc Ukraine khiến 16 người thiệt mạng.

Ông Zelensky và ông Sanchez tại lễ ký hiệp ước an ninh song phương hôm 27/5. Ảnh: Văn phòng Tổng thống Ukraine

Ông Zelensky (trái) và ông Sanchez tại lễ ký hiệp ước an ninh song phương hôm 27/5. Ảnh: Văn phòng Tổng thống Ukraine

Ông Sanchez cho biết Madrid đã cam kết cung cấp đạn tên lửa Patriot cho Ukraine, song điều ông Zelensky hiện cần từ các đối tác là "hệ thống để phóng các quả đạn".

"Ông ấy đang thảo luận với các đồng minh để xem chúng tôi có thể chuyển giao cho Ukraine chính xác bao nhiêu hệ thống, thứ sẽ giúp Ukraine bảo đảm an ninh trên không", Thủ tướng Sanchez cho hay.

Theo lãnh đạo Tây Ban Nha, nước này sẽ chuyển giao cho Ukraine "thêm một lô xe tăng Leopard và đạn dược", cam kết tiếp tục hợp tác với Kiev để nghiên cứu xem có thể giúp nước này bảo vệ vùng trời bằng "các cách và hệ thống thay thế nào khác".

Tây Ban Nha đã cung cấp cho Ukraine 10 xe tăng Leopard. Nước này tháng trước công bố sẽ chuyển giao cho Kiev hệ thống phòng không Patriot nhưng không nêu rõ số lượng.

Sau cuộc hội đàm với Thủ tướng Sanchez, ông Zelensky đã gặp và ăn trưa với Quốc vương Felipe VI. Vua Tây Ban Nha nhấn mạnh viện trợ quân sự của nước này cho Ukraine hoàn toàn mang mục đích phòng thủ và Kiev không được sử dụng vũ khí do Tây Ban Nha cung cấp để tập kích lãnh thổ Nga, tương tự điều kiện viện trợ của Mỹ và một số nước khác.


Quốc vương cũng cho biết "hơn 4.300 binh sĩ Ukraine" đã được đào tạo tại quốc gia này.

Trước Tây Ban Nha, Ukraine đã ký hiệp ước an ninh song phương với một số nước, trong đó có Pháp, Đức và Anh.

Theo số liệu của Viện Kiel, cơ quan theo dõi viện trợ cho Ukraine có trụ sở tại Đức, trước khi công bố gói mới, Tây Ban Nha đã cam kết hỗ trợ quân sự 358 triệu USD cho Ukraine. Đây là mức đóng góp tương đối nhỏ trên bình diện châu Âu. Đức, Anh và Pháp đã lần lượt cam kết viện trợ cho Ukraine lần lượt 20,21 tỷ USD, 10,01 tỷ USD và 6,14 tỷ USD.

Gói viện trợ mới được Tây Ban Nha công bố trong bối cảnh Ukraine đang phải đối mặt với chiến dịch trên bộ quy mô lớn của Nga ở tỉnh đông bắc Kharkov.

Nga cũng thường xuyên tập kích bằng tên lửa, rocket, máy bay không người lái (UAV) và bom dẫn đường vào các thành phố của Ukraine, nhất là Kharkov. Trước tình hình căng thẳng, Ukraine đang kêu gọi các nước phương Tây cung cấp thêm đạn dược và khí tài, đặc biệt là hệ thống phòng không.', N'/img/Zelensky-Sanchez-5421-1716826982.png', CAST(N'2024-05-28T19:23:48.000' AS DateTime), N'hoang@gmail.com               ', 7)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (33, N'Rối loạn trầm cảm vì vợ hay ''nói to, cằn nhằn''', N'Người đàn ông 70 tuổi, đi khám do mất ngủ, chán nản, không muốn về nhà vì vợ thường xuyên nói to, cằn nhằn.

Tại Khoa sức Sức khỏe Tâm thần (Bệnh viện E), bệnh nhân buồn bã, chán nản, nói không có động lực làm gì. Ông cho biết sau khi nghỉ hưu, vợ thường xuyên to tiếng, chỉ trích chồng "giả bệnh, lười không muốn làm việc nhà". Việc này lặp đi lặp lại trong thời gian dài khiến hai vợ chồng không thể nói chuyện, còn ông luôn nghi ngờ bản thân kém cỏi, vô dụng.

Ngày 28/5, bác sĩ Vũ Thu Thủy, Khoa sức Sức khỏe Tâm thần, cho biết bệnh nhân bị rối loạn trầm cảm do thường xuyên phải chịu đựng bạo lực về lời nói. Bác sĩ tư vấn ông dùng thuốc, trị liệu tâm lý, đồng thời giải thích cho người vợ để thay đổi hành vi.

Trầm cảm là rối loạn tâm thần thường gặp, biểu hiện bằng cảm xúc buồn, giảm năng lượng, cảm giác tội lỗi hoặc đánh giá thấp bản thân, rối loạn giấc ngủ, ăn uống, kém tập trung. Trầm cảm là nguyên nhân chính dẫn đến tự sát. Mỗi năm, khoảng 850.000 người chết vì căn bệnh, theo thống kê của Tổ chức Y tế Thế giới (WHO).

Theo bác sĩ, bạo lực gia đình không chỉ đơn thuần là tác động vật lý mà còn bao gồm tâm lý. Bạo lực tâm lý là dùng ngôn ngữ, lời nói, hành vi nặng nề khiến nạn nhân trở nên tự ti, nhút nhát, thậm chí gây hấn, kích động.

"Ở mức độ nặng, người bệnh có thể rối loạn tâm thần như trầm cảm, lo âu, lạm dụng chất", bác sĩ nói.

Nạn nhân của bạo lực tâm lý thường gặp ở phụ nữ, đặc biệt là người đang nuôi con nhỏ và thai phụ. Tuy nhiên, tình trạng này có xu hướng tăng ở nam giới với độ tuổi trung bình trên 40 tuổi.

Theo Báo cáo kết quả thực hiện các mục tiêu quốc gia về bình đẳng giới năm 2023, trong gần 3.200 nạn nhân của bạo lực gia đình thì nạn nhân nam là 565 (chiếm 17,7%; năm 2022 là 481 người chiếm 12,27%).

Để tránh bạo lực tâm lý, vợ chồng cần ngồi nói chuyện, cùng nhau tháo gỡ giải quyết vấn đề. Hai bên phải tôn trọng, thấu hiểu nhau. "Nếu có vấn đề tâm lý tâm thần kèm theo thì phải có sự hỗ trợ của bác sĩ để điều trị sớm", bà Thủy nói.', N'/img/Anhmanhinh20240528luc082234-17-5143-8213-1716859422.png', CAST(N'2024-05-28T19:28:13.000' AS DateTime), N'hoang@gmail.com               ', 6)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (34, N'Thoát stress, lo âu nhờ cái ôm của thiên nhiên', N'Nhà báo Sam Delaney, cây viết nổi tiếng về sức khỏe tâm thần, đối mặt với áp lực tài chính từ khoản vay thế chấp ngày càng tăng và việc nuôi dạy 2 đứa con.

Căng thẳng từ công việc và những lo lắng cuộc sống thường nhật khiến người đàn ông luôn mệt mỏi, chán chường. Anh nỗ lực tìm một lối thoát hoặc phương pháp nào đó để thoát khỏi tình trạng lo âu.

Năm ngoái, Delaney tham gia nghi thức tắm rừng, một phương pháp chữa lành được yêu chuộng tại Nhật Bản, nhằm giải phóng bản thân khỏi những vấn đề sức khỏe thể chất lẫn tinh thần. Đây là sự giao thoa giữa thiền định và chánh niệm, nơi con người tìm lại sự cân bằng, giảm căng thẳng, hạ huyết áp, thậm chí là tăng cường hệ miễn dịch.

Dưới sự hướng dẫn của Gary Evans, một chuyên gia từ Viện Tắm Rừng, Delaney hít thở sâu, để mọi giác quan hòa vào hương thơm của thiên nhiên - từ mùi thơm của lá cây đến mùi đất ẩm. Anh dành thời gian ngắm ánh nắng mặt trời xuyên qua tán lá, lắng nghe tiếng chim ca và tiếng lá cây xào xạc, thực sự đắm chìm trong vẻ đẹp và sự yên bình của khu rừng cổ thụ. Tâm trí Delaney không rối loạn nữa, thay vào đó, nó được giải phóng, sống động và hiện diện hoàn toàn trong hiện tại.

Mùi rêu tươi khiến Sam nhớ đến khu vườn của ông bà. Ảnh: Heathcliff OMalley
Mùi rêu tươi khiến Sam Delaney nhớ đến khu vườn của ông bà. Ảnh: Heathcliff O''Malley

Tại Đại học Derby, các nhà khoa học đã nghiên cứu tác động của của việc đắm mình giữa thiên nhiên lên tâm trạng con người. Tiến sĩ Kirsten McEwen, người đứng đầu nghiên cứu, nhận thấy rằng sau những buổi hòa mình vào thiên nhiên, mức độ lo âu và suy nghĩ thái quá giảm đi đáng kể. Trong khi biến thiên nhịp tim - chỉ số của sức khỏe tim mạch tốt và trạng thái thư giãn - lại tăng lên.

Những người tham gia cảm nhận được sự gắn kết sâu đậm với thiên nhiên và mối quan hệ xã hội. Dưới bóng râm của những tán cây rộng lớn, Packham thực hành những bài thở sâu, nơi không khí trong lành và tiếng rì rào của lá cây tạo nên một bản hòa ca dịu êm, đưa anh đến với một trạng thái nhẹ nhàng và bình yên.

Một nghiên cứu mới đây cũng cho thấy liệu pháp tắm thiên nhiên tăng cường hoạt động của các tế bào "sát thủ tự nhiên" - những tế bào bạch cầu giúp bảo vệ cơ thể chống lại nhiều bệnh tật, bao gồm cả ung thư. Các nghiên cứu tiên phong từ Nhật Bản và Đại học Birmingham đã mở ra một hiểu biết sâu sắc: tắm thiên nhiên không chỉ là một lối tập luyện chánh niệm đầy hiệu quả, mà còn là chìa khóa để mở cánh cửa ngõ của ký ức tuổi thơ, nơi hạnh phúc và vô tư lự tràn ngập.

Trong cái ôm của thiên nhiên, những lo âu về công việc và cuộc sống dần tan biến, nhường chỗ cho sự tập trung vào những giác quan vào cái đẹp của hiện tại. Dịch vụ Y tế Quốc gia Anh (NHS) cũng cho rằng đây là giải pháp cho các vấn đề sức khỏe tâm thần mà không cần dựa vào thuốc men hay trị liệu tâm lý.

Sau buổi tắm thiên nhiên tại Khu Bảo tồn Thiên nhiên Pulborough Brooks, Delaney không chỉ phát hiện ra một liệu pháp tâm lý vừa tiết kiệm chi phí vừa mang lại niềm vui. Anh đã ôm chặt lấy thân cây, hòa mình vào hương thơm tự nhiên và cảm nhận từng chạm nhẹ mà không hề e ngại. Delaney không cần biết đó là loại cây gì hay bí mật của nó là gì. Anh, một cư dân London với những lo lắng thường nhật, đã tìm ra điều kỳ diệu trong việc tắm thiên nhiên, một phát hiện thay đổi cuộc sống. Và trong trái tim mình, anh biết chắc rằng mình sẽ trở lại khu rừng này.


Một nghiên cứu được công bố trên tạp chí Occupational & Environmental Medicine cũng chỉ người ghé thăm không gian xanh ít nhất năm lần mỗi tuần có xu hướng sử dụng ít thuốc tâm thần, thuốc chống tăng huyết áp và thuốc chống hen suyễn hơn so với những người ít tiếp xúc với thiên nhiên. Như vậy, lợi ích từ việc gần gũi với thiên nhiên không chỉ giới hạn ở tinh thần mà còn ảnh hưởng đến sức khỏe thể chất.

Dù lợi ích của việc gần gũi thiên nhiên là rõ ràng và thuyết phục, nhưng với hầu hết người dân thành thị, việc thu xếp 2-3 ngày vào rừng nạp năng lượng là khó khăn. Các chuyên gia đề xuất họ có thể trải nghiệm thiên nhiên ở công viên, vườn bách thảo, vườn nội khu dân cư. Hoặc, việc trồng nhiều cây xanh trong nhà, ban công, sống ở những nơi gần gũi thiên nhiên, hồ nước, sông... cũng là điều hữu ích cho sức khỏe.', N'/img/sam1-jpeg-7910-1716856810.jpg', CAST(N'2024-05-28T19:30:06.000' AS DateTime), N'hoang@gmail.com               ', 6)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (35, N'WHO cảnh báo đại dịch cúm lây từ động vật sang người', N'Tổ chức Y tế Thế giới (WHO) cảnh báo châu Âu cần chuẩn bị cho một đại dịch cúm có nguy cơ cao lây từ động vật sang người.

Tuyên bố được tiến sĩ Maria Van Kerkhove, quyền giám đốc cơ quan Liên Hợp Quốc về phòng chống đại dịch, đưa ra ngày 26/5. Bà cho rằng "chắc chắn" lục địa này sẽ đối mặt với mối đe dọa từ bệnh cúm.

Phát biểu trên podcast của WHO, tiến sĩ Maria Van Kerkhove nhận định Covid-19 không phải đại dịch cuối cùng mà nhân loại cần đối mặt. Mối đe dọa không xác định trong tương lai có thể tấn công theo cách chưa từng thấy trước đây.

"Thế giới đã xuất hiện cúm gia cầm tỷ lệ tái tổ hợp cao, những thay đổi di truyền cho phép virus lây lan giữa các loài, khả năng xảy ra đại dịch cúm là rất cao", bà nói, thêm rằng "Đó là lý do tôi nghĩ chúng ta nên có hệ thống y tế để chuẩn bị sẵn sàng cho việc này".

Bà lo ngại về khả năng thế giới đối mặt với đại dịch từ Arbovirus. Đây là virus lây truyền từ các động vật chân đốt, lan ra từ vết cắn của côn trùng nhiễm bệnh như muỗi và ve. Virus có thể gây ra bệnh Mayaro - một loại bệnh giống sốt xuất huyết truyền qua muỗi nhiễm virus, phổ biến ở Brazil và Bolivia. Nó cũng là nguyên nhân cho bệnh sốt Oropouche.

Trong nhiều thập kỷ, các nhà khoa học cũng cảnh báo cúm gia cầm có thể là nguyên nhân gây ra đại dịch tiếp theo. Các nhà khoa học cho rằng do hiện tượng tái tổ hợp, hai loại virus có thể hợp nhất để tạo thành một chủng lai. Mức độ cúm tự nhiên ở người cao làm tăng nguy cơ bệnh nhân mắc hai bệnh cùng một lúc, dẫn đến tái tổ hợp.

Các nhà khoa học từ lây suy đoán mầm bệnh X - đại diện cho một căn bệnh chưa xác định, lây truyền từ động vật sang người. Đây có thể là virus hoặc vi khuẩn động vật truyền sang người.

Một số người thậm chí cảnh báo đại dịch cúm mới có thể bắt nguồn từ đột biến sinh học, tai nạn sinh học hoặc cuộc tấn công khủng bố, khiến virus bất ngờ lan truyền nhanh chóng.

Theo tiến sĩ Van Kerkhove, WHO có "hệ thống ứng phó dịch mạnh mẽ tại chỗ", nhưng "niềm tin vào giới khoa học đã bị ảnh hưởng sau đại dịch".', N'/img/tjq67hzqq5jeli2ma6xfsqx63i-jpe-7384-2114-1716865305.jpg', CAST(N'2024-05-28T19:31:23.000' AS DateTime), N'hoang@gmail.com               ', 6)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (37, N'Những điều khiến du khách bất tiện khi tới Nhật Bản', N'Thu hút hàng chục triệu lượt khách mỗi năm, hiện đại và lịch sự nhưng Nhật Bản cũng có những điều khiến khách thấy bất tiện như thiếu thùng rác.

Good Luck Trip, công ty lữ hành chuyên đón khách quốc tế đến Nhật Bản, thực hiện cuộc khảo sát trực tuyến năm 2023 để tìm ra những điều khiến khách bối rối khi tới quốc gia này. Cuộc khảo sát thu thập được 891 ý kiến của du khách từ 10 đến 60 tuổi. Dưới đây là những điều khiến khách du lịch thấy bất tiện ở Nhật Bản.

Khó tìm wifi miễn phí

Hơn 31% người được hỏi nói khó tìm wifi miễn phí ở Nhật Bản. Unseen Japan, blog về du lịch và văn hóa Nhật Bản, cho biết ngoài khách sạn và một số quán cà phê, tìm wifi công cộng miễn phí gần như không thể. Du khách tốt hơn nên sử dụng wifi bỏ túi - hoạt động như điểm phát sóng di động, có thể kết nối nhiều thiết bị - nếu du lịch cùng nhóm đông.

Vào tháng 12/2023, cuộc khảo sát khác của Good Luck Trip thực hiện với 946 người tham gia trả lời, cho thấy 96,2% du khách muốn thêm điểm phát wifi miễn phí ở cơ sở lưu trú; 71% muốn thêm điểm phát wifi miễn phí tại nhà ga, sân bay.

Khó khăn khi giao tiếp

Rào cản ngôn ngữ là vấn đề nhiều du khách gặp phải ở Nhật Bản. Tại các trung tâm mua sắm, cửa hàng lớn, du khách có thể thấy những bảng hiệu đa ngôn ngữ. Tuy nhiên, với các cơ sở nhỏ hơn, đa số chỉ có tiếng Nhật Bản và nhân viên không nói tiếng nước ngoài.

Khó giao tiếp nên nhiều du khách đến Nhật thường không đặt chỗ trước ở nhà hàng, tỷ lệ được Good Luck Trip khảo sát là 36,7%; 10,5% du khách tự đặt dịch vụ qua điện thoại.

Ngoài ra, việc thiếu biển báo bằng ngôn ngữ quốc tế cũng khiến du khách thấy bất tiện khi du lịch. Theo Japan Today, dù sử dụng ứng dụng dịch, bản dịch không phải lúc nào cũng dễ hiểu. Unseen Japan thông tin biển báo ở các đô thị lớn thường có tiếng Anh, Trung và Hàn.

"Mê cung" phương tiện công cộng

Hệ thống giao thông công cộng hiện đại ở Nhật Bản giúp việc di chuyển thuận tiện nhưng du khách vẫn cần mất một chút thời gian để làm quen. Nhiều người nói dễ lên nhầm tàu hoặc xe buýt hay bị lạc nếu không tìm đúng lối ra ga, đặc biệt ở thành phố lớn như Tokyo - nơi mạng lưới tàu dày đặc như mê cung.


Thiếu thùng rác

Đây là vấn đề du khách đã phàn nàn suốt nhiều thập kỷ nhưng lại bình thường với người địa phương. Người Nhật thấy việc ăn khi đi bộ là bất lịch sự nên hầu hết ăn ngay và bỏ rác tại nơi mua hoặc ở nhà. Trong một số dịp người Nhật tổ chức ăn uống ở công viên, họ sẽ mang rác về.

Lý do an ninh cũng cần nhắc tới khi Nhật Bản từng chứng kiến vụ khủng bố của giáo phái Aum Shinrikyo vào năm 1995 khiến 12 người chết, 1.000 người bị thương. Giáo phái này đã dùng túi nylon bọc trong giấy báo để phát tán khí độc ở các ga tàu điện ngầm Tokyo. Sau vụ việc, nhiều biện pháp được đưa ra và một trong số đó là loại bỏ thùng rác - nơi có thể giấu các loại vũ khí khủng bố.

Thanh toán

Khoảng 15% người được hỏi thấy khó khăn khi thanh toán bằng ứng dụng di động - tỷ lệ tương tự với các phàn nàn về khó khăn khi sử dụng thẻ tín dụng hoặc ghi nợ. Theo Time Out, việc thanh toán không tiền mặt đã phổ biến hơn ở Nhật nhưng chưa có nhiều lựa chọn loại hình thanh toán quốc tế.

Thiếu nơi hút thuốc

Điều này được Time Out giải thích "do luật pháp và phong tục Nhật Bản, bạn chỉ được hút thuốc ở một số khu vực nhất định". Do đó, du khách cần cẩn trọng khi hút thuốc, đặc biệt khi ở bên ngoài.', N'/img/bady-abbas-w5tk0gdzn9g-unsplas-4159-9398-1716866295.jpg', CAST(N'2024-05-28T19:34:56.000' AS DateTime), N'hoang@gmail.com               ', 5)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (38, N'Những dải ngân hà đẹp nhất thế giới 2024', N'Những bức ảnh chụp dải ngân hà đẹp nhất thế giới đến từ nhiều vùng đất xa xôi, cho du khách trải nghiệm vũ trụ đêm rực sáng ngay trong tầm mắt.
Capture the Atlas, sân chơi của các nhiếp ảnh gia và những người đam mê du lịch trên thế giới, công bố danh sách hơn 20 bức ảnh chụp giải ngân hà đẹp nhất 2024. Danh sách này được chọn từ hơn 5.000 bức ảnh của hàng trăm nhiếp ảnh gia đến từ 15 quốc gia tại các châu lục.

Trên ảnh là Rainbow Valley, tác phẩm đạt giải của tác giả Baillie Farley, chụp dải ngân hà tại Khu bảo tồn thung lũng Cầu Vồng, phía bắc Australia. Chuyến chụp ảnh đã cho cô trải nghiệm "một số bầu trời đêm đẹp nhất thế giới". Farley miêu tả nơi cô chụp ảnh "toát lên nét quyến rũ với màu sắc rực rỡ và sự hình thành địa chất tuyệt đẹp".

Tiêu chí lựa chọn ảnh không chỉ về chất lượng hình ảnh mà mỗi bức ảnh còn mang theo câu chuyện phía sau, tạo nguồn cảm hứng cho độc giả.

Trên ảnh là tác phẩm Saoseo của Alexander Forst, chụp tại Graubuenden, một trong những hồ đẹp nhất Thụy Sĩ. Nơi này được đánh giá "chụp dải ngân hà đẹp nhất từ cuối tháng 7".

Forst cho biết hồ nằm ở độ cao 2.000 m nên sau khi Mặt Trời lặn thời tiết rất lạnh nhưng tác giả lại bỏ quên áo khoác trong ôtô. Để giữ ấm, Forst phải đi vòng quanh hồ để chờ dải ngân hà hiện lên đẹp nhất. Lo ngại bầu trời nhiều mây sẽ che mất các ngôi sao, nhưng "may mắn đã đứng về phía tôi". "Dải ngân hà hiện ra rõ nét trong 30 phút trước khi bị mây che tiếp", Forst nói.

Bức ảnh có tên Lightning Lake của tác giả Tom Rae. Trong một đêm mùa đông đến thung lũng thuộc vườn quốc gia Mount Cook, New Zealand, Rae bắt gặp khung cảnh tuyệt đẹp khiến anh "có cảm giác như đặt chân lên một hành tinh khác". Rae giơ máy lên và ghi lại khung cảnh những tảng băng trôi trong hồ băng màu xanh lam, bầu trời có ánh sáng đỏ rực cùng ánh sáng rực rỡ của hàng tỷ ngôi sao.

Tác phẩm Atmospheric fireworks được Julien Looten chụp vào mùa đông 2023 tại một lâu đài cổ ở Pháp.

Theo các chuyên gia của Capture the Atlas, mùa chụp dải ngân hà từ tháng 2 đến 10 ở Bắc Bán cầu và từ tháng 1 đến 11 ở Nam Bán cầu. Thời điểm tốt nhất để ngắm sao là bầu trời phải đạt đủ tối, không bị ô nhiễm ánh sáng.

Nhiếp ảnh gia Rositsa Dimitrova đặt tên cho bức ảnh này là Blooming Bottle Tree trong chuyến du lịch đên đảo Socotra, Yemen. Không chỉ bầu trời tối "đạt chuẩn" để chụp dải ngân hà, khung cảnh trên đảo được Dimitrova ví "giống như hành tinh khác" và "đẹp đến nghẹt thở".

Điều khiến tác giả ưng ý khi chụp bức ảnh trên là đến đảo đúng thời điểm hoa của cây chai (bottle tree) nở rộ. Hoa của loài cây này chỉ nở trong vài tuần từ tháng 2 đến tháng 3. Để có bức ảnh, tác giả đã cắm trại chụp ảnh gần như suốt đêm.
Tác phẩm Bluff Hut của Rachel Roberts chụp tại thung lũng sông Mungo, New Zealand. Đôi khi những bức ảnh đẹp nhất đến ngoài kế hoạch và đó chính xác là những gì xảy ra trong chuyến đi của nhiếp ảnh gia Roberts đến Bluff Huff, ngôi nhà nhỏ nằm nép mình trong dãy Nam Alps, đảo Nam New Zealand. Để đến khu vực này, du khách chỉ có thể đi bộ hoặc tiếp cận bằng trực thăng.

Desert Bloom được Marcin Zajac chụp tại công viên Goblin Valley, Utah, Mỹ. Tác giả cho biết nơi đây là nằm trong góc xa của cao nguyên Colorado, "nơi tạo ra bầu trời tối nhất nước Mỹ". Bức ảnh được chụp với nền là những bông hoa dại nở rộ trước Three Sisters, núi ba chị em - một điểm thu hút khách tại công viên.


Nhiếp ảnh gia Mihail Minkov chụp The vanity of life tại sa mạc Wadi Rum, Jordan. Bức ảnh làm nổi bật sự tương phản rõ rệt giữa vũ trụ bao la và con người nhỏ bé. Bố cục của bức ảnh vì vậy có chủ đích để hình ảnh con người đứng lọt thỏm giữa thiên nhiên và phía xa là dải ngân hà với ánh sáng rực rỡ.

Minkov cho biết mỗi lần chụp trời đêm lại tràn ngập cảm giác biết ơn vì mình được tồn tại, từ đó anh cảm thấy cuộc sống tươi đẹp hơn và yêu gia đình hơn.


A Clear Welcome là tác phẩm của Francesco Dall''Olmo, nằm trong danh sách những bức ảnh chụp dải ngân hà đẹp nhất 2024, lần đầu được tác giả chụp tại Laguna de los Tres, Pantagonia, Argentina.

Trái ngược dự đoán về không khí lạnh, mưa gió, thời tiết 3 ngày Dall''Olmo ở Pantagonia khá đẹp với bầu trời trong xanh. Bức ảnh được chụp sau khi hoàng hôn buông xuống và dải ngân hà dần hiện lên rõ nét nhất.



Bức ảnh có tên Starlight Therapy của tác giả Kavan Chay chụp tại Vườn quốc gia Aoraki, New Zealand, nơi được mệnh danh "luôn mang đến những niềm vui và câu chuyện thú vị", dù du khách ghé thăm bất kỳ thời điểm nào.

Chay nói để chụp được bức ảnh này đã phải trải qua một cuộc "vật lộn" khi phải mang theo 20-25 kg thiết bị và điều kiện sức khỏe không tốt. Đổi lại, tác giả đã có "những đêm hoàn hảo" dưới những vì sao.', N'/img/4-1716779815.jpg', CAST(N'2024-05-28T19:36:39.000' AS DateTime), N'hoang@gmail.com               ', 5)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (39, N'Bali muốn thành khu tự trị du lịch', N'Chính quyền đảo Bali muốn nhanh chóng được cấp quyền tự trị về du lịch để có thể vừa phát triển du lịch bền vững vừa giúp người dân làm kinh tế.

Giới chức Bali đang kiến nghị chính phủ để tỉnh được cấp quy chế khu tự trị đặc biệt về du lịch. Lãnh đạo địa phương cho rằng điều này sẽ giúp họ quản lý hòn đảo phát triển bền vững về môi trường, thịnh vượng về kinh tế và mang lại lợi ích cho người dân địa phương.

Bali thành khu tự trị đặc biệt về du lịch là để tất cả lựa chọn phát triển du lịch được quản lý xuyên suốt và thống nhất bởi một cơ quan. Các quan chức trên đảo cho biết Bali phát triển nhanh chóng nhưng thiếu quy mô là do quy hoạch không gian và giấy phép xây dựng được cấp không có tầm nhìn bao quát, thống nhất. Người đứng đầu Dịch vụ tích hợp một cửa và đầu tư Denpasar, Ida Bagus Benny Pidada Rurus, chỉ ra một trong những sự thiếu thống nhất này thể hiện qua cách cấp giấy phép kinh doanh khách sạn, cơ sở lưu trú ở Bali.
Các khách sạn, khu nghỉ dưỡng trên 200 phòng phải xin giấy phép ở cấp trung ương. Nơi có 101-200 phòng xin giấy phép ở tỉnh và nơi có 100 phòng trở xuống xin tại quận. "Thường thì các bộ phận này không tham khảo ý kiến của nhau trước khi cấp giấy phép", Rurus nói.

I Made Dwija Suastana, Thư ký của DPD Prajaniti, một tổ chức chính phủ ở Bali, đồng thời là chủ doanh nghiệp, cũng kêu gọi thành lập một ủy ban khẩn cấp để Bali có thể ban các lệnh cấm nhanh nhất.

Sở hữu cảnh quan tự nhiên với những bãi tắm hoang sơ và giá cả phải chăng, Bali từ lâu trở thành một trong điểm đến hút khách nhất Indonesia và châu Á khi đón 11,4 triệu lượt khách năm 2023. Năm 2024, chính quyền đặt mục tiêu đón 14 triệu lượt khách.

Dữ liệu của Cơ quan Thống kê Bali cho biết lượng khách đến đảo đạt gần 470.000 lượt trong tháng 3, tăng hơn 3% so với tháng 2. Tháng 4 bận rộn nhất trong năm 2024 đối với sân bay ở Bali khi có hơn 1,1 triệu hành khách quốc tế và hơn 830.000 lượt khách nội địa ghé thăm. Tháng 5 dự kiến vượt qua tháng 4.

Du lịch trong tháng 4 tăng là nhờ các kỳ nghỉ lễ của người dân trong và ngoài nước. Chuyến thăm bất ngờ của Elon Musk tới Bali đầu tháng 5 cũng là một lý do khiến số liệu khách quốc tế đến hòn đảo tháng này tăng cao.

Bali cũng là điểm đến ngày càng hấp dẫn cho các Nomad Digital (khách du mục số) và trở thành ngôi nhà thứ hai cho các chuyên gia, doanh nhân, người làm việc tự do dựa vào máy tính và mạng Internet.', N'/img/1-4861-1716774560.jpg', CAST(N'2024-05-28T19:37:24.000' AS DateTime), N'hoang@gmail.com               ', 5)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (40, N'Đại học Quốc gia Hà Nội đưa 10.000 sinh viên lên Hòa Lạc', N'Cơ sở Hòa Lạc của Đại học Quốc gia Hà Nội sẽ đón khoảng 10.000 học sinh, sinh viên vào năm học tới, tăng 4.000 so với hiện tại.

Đại học Quốc gia Hà Nội (VNU) ngày 28/5 cho biết thông tin trên. Số tăng thêm gồm sinh viên năm thứ nhất của trường Đại học Y Dược, Công nghệ, Việt Nhật, Luật, Quốc tế, Khoa học liên ngành và khối Sư phạm, lớp 10, 11 trường Đại học Giáo dục.

Để đảm bảo các điều kiện học tập, sinh hoạt, trường cho biết vừa hoàn thiện thêm một khu ký túc xá, nâng tổng số chỗ ở lên 6.000. Ngoài hai tuyến xe bus 74 và 107, từ đầu tháng 6, thành phố có thêm tuyến số 71 kết nối trường với khu vực nội thành (Cầu Giấy, Mỹ Đình, Kim Mã).

Trước đó, cơ sở Hòa Lạc đã có hai giảng đường (quy mô 35.000 m2), cùng một số hạng mục khác như khu nghiên cứu, giáo dục thể chất, dịch vụ tiện ích, y tế...


Đại học Quốc gia Hà Nội hiện có 12 trường và một khoa, tổng gần 40.000 sinh viên. Trên bảng xếp hạng đại học QS và THE năm 2024, VNU lần lượt thuộc nhóm 801-1.000 và 1.001-1.200 thế giới. Mục tiêu đến năm 2025 là vào top 500.

Theo quy hoạch, cơ sở Hòa Lạc gồm 21 dự án với diện tích hơn 1.113 ha, đáp ứng quy mô 60.000 sinh viên. Nơi đây được xây dựng theo mô hình "5 trong 1", gồm các trung tâm đào tạo tài năng; nghiên cứu chuyển giao công nghệ; đổi mới sáng tạo; đô thị đại học thông minh; thử nghiệm hợp tác công tư và đào tạo nghiên cứu.

VNU dự kiến nâng tổng số sinh viên học tập tại Hòa Lạc lên 15.000 vào năm sau.', N'/img/dh-quo-c-gia1-jpg-1716888312-9696-1716888336.jpg', CAST(N'2024-05-28T19:39:10.000' AS DateTime), N'hoang@gmail.com               ', 4)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (41, N'Đại học Bách khoa Hà Nội tăng học phí', N'Học phí Đại học Bách khoa Hà Nội năm học tới khoảng 24-87 triệu đồng, nhiều ngành tăng 1-11 triệu so với hiện tại.

Theo đề án tuyển sinh năm 2024, được Đại học Bách khoa Hà Nội công bố tối 26/5, học phí các chương trình chuẩn khoảng 24-30 triệu đồng/năm, tăng một triệu đồng.

Chương trình song bằng Tiếng Anh giữ ổn định học phí 45 triệu đồng/năm. Các chương trình chất lượng cao cũng hầu hết không tăng, ở mức 33-42 triệu đồng/năm. Riêng ngành Khoa học dữ liệu và Trí tuệ nhân tạo (IT-E10), Logistics và Quản lý chuỗi cung ứng (EM-E14) bằng tiếng Anh thu 64-67 triệu, tăng 7-11 triệu so với năm ngoái.

Với chương trình quốc tế và liên kết, học phí tính theo kỳ, từ 24 đến 29 triệu, giảm một triệu. Cao nhất là ngành Quản trị Kinh doanh (TROY-BA) và Khoa học Máy tính (TROY-IT) hợp tác với Đại học Troy, Mỹ, với học phí là 87 triệu đồng một năm (3 kỳ).

Đại học Bách khoa Hà Nội cho biết học phí các năm sau có thể tăng, nhưng không quá 10%.

Trường cam kết trích 70-80 tỷ đồng vào quỹ học bổng, dành cho sinh viên học tập tốt và có hoàn cảnh khó khăn. Ngoài ra, sinh viên Bách khoa có thể nhận học bổng từ các doanh nghiệp, tổ chức, tổng thêm khoảng 5-7 tỷ đồng một năm.

Đại học Bách khoa Hà Nội năm nay tuyển 9.260 sinh viên theo ba phương thức, gồm xét tuyển tài năng (20% tổng chỉ tiêu), dựa vào điểm thi đánh giá tư duy (30%), xét điểm thi tốt nghiệp THPT (50%).

Điểm chuẩn thi tốt nghiệp năm 2023 của trường dao động 21-29,42. Với xét tuyển theo chứng chỉ quốc tế (SAT, AP, IB, ACT), thí sinh cần đạt SAT 1250 đến 1500/1600 - mức tương đương với nhiều đại học hàng đầu Mỹ, mới trúng tuyển. Nhóm còn lại, điểm chuẩn khoảng 70 đến 98,42/100.', N'/img/BK-2-9666-1712636646-7338-1716737637.jpg', CAST(N'2024-05-28T19:40:26.000' AS DateTime), N'hoang@gmail.com               ', 4)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (42, N'Trẻ 5 tuổi được miễn học phí từ ngày 1/9', N'Trẻ mầm non 5 tuổi ở các trường công lập được miễn học phí từ đầu năm học tới.

Thông tin được nêu trong văn bản ngày 13/5 của Bộ Giáo dục và Đào tạo về các khoản thu năm học 2024-2025.

Bộ lưu ý các địa phương thực hiện chính sách miễn, giảm học phí, hỗ trợ chi phí học tập theo Nghị định 81. Tất cả trẻ mầm non 5 tuổi ở các trường công lập (chưa tự chủ) được miễn học phí, bắt đầu từ ngày 1/9. Trước đây, nhóm được hỗ trợ là trẻ khuyết tật, diện hộ nghèo, mồ côi, ở vùng sâu, hải đảo, vùng đặc biệt khó khăn...

Với khoản thu ngoài học phí như dịch vụ phục vụ, hỗ trợ hoạt động giáo dục, các nhà trường thực hiện theo nghị quyết của HĐND địa phương.

Nghị định 81 quy định trần học phí của tất cả bậc học giai đoạn 2021-2026. Ở mầm non, từ năm học 2022-2023, các trường công lập chưa đảm bảo chi thường xuyên (chưa tự chủ) được thu tối đa 50.000 đến 540.000 đồng mỗi học sinh mỗi tháng, tùy địa bàn. Hàng năm, mức này có thể tăng, nhưng không quá 7,5%.

Do ảnh hưởng của Covid-19, chính sách trên chưa được thực hiện. Năm học vừa qua, các địa phương vẫn áp dụng mức thu từ 2021 trở về trước, cao nhất là 200.000 đồng một tháng. Một số tỉnh, thành miễn học phí cho tất cả học sinh, gồm trẻ mẫu giáo, mầm non là Hải Phòng, Quảng Bình, Đà Nẵng, Bà Rịa-Vũng Tàu.', N'/img/6A5A4595-1618403197-3765-1716805856.jpg', CAST(N'2024-05-28T19:41:32.000' AS DateTime), N'hoang@gmail.com               ', 4)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (43, N'Sốc văn hóa nhà chồng', N'Về làm dâu, chị Hòa nhận ra đã bước chân vào một gia đình trọng nam khinh nữ kiểu mẫu, cửa phòng khách chỉ mở vài lần mỗi năm dành cho đàn ông, cấm tiệt phụ nữ.

Chị Hoàng Thị Hòa, 34 tuổi, ở Hà Nam lấy chồng bằng tuổi, học cùng cấp ba, cách nhà nhau 3 km. Bố mẹ hai bên đều biết nhau nên Hòa yên tâm đi làm dâu, nghĩ sẽ đỡ lạ lẫm hơn những người lấy chồng xa.

Nhưng mọi chuyện vượt ra ngoài tưởng tượng của Hòa. Ở nhà chồng, phụ nữ bị cấm bén mảng đến phòng khách, chỉ được đi cửa dưới, xuống bếp, xuống nhà nhỏ ngồi. Từ lúc về làm dâu, chỉ một lần Hòa được bố mẹ chồng mở cửa chính cho bước vào là lúc bế cháu đích tôn cho ông bà từ bệnh viện về nhà, sau khi sinh.

Tết đầu làm dâu, Hòa thịt con gà mái, rang rồi bê lên bàn thờ làm cỗ cúng gia tiên thì bị bố chồng chặn lại. ''''Nhà mình không cúng gà mái'''', ông tuyên bố và đề nghị con dâu xuống bếp luôn, không được cắm hương lên bàn thờ.

Bữa cơm phụ nữ cũng phải ngồi mâm riêng. Xong bữa đàn ông ra bàn ăn trái cây, hát karaoke để chị em dọn dẹp. Sau Tết, cả nhà Hòa quay lại Hà Nội làm việc, bố mẹ chồng ra cửa đón trước, đợi khi nào có đàn ông đi ngang qua mới cho con nổ máy chạy, để ''''lấy vía'''' cho may mắn.


Cũng cùng cảnh đi làm dâu, chị Nguyễn Quỳnh Trang nói sốc với lối sống và cách cư xử của nhà chồng. Ở nhà chồng chị, con trai là vua, còn nàng dâu bị đối xử như giúp việc. Có lần cả đêm Trang phải thức chăm con ốm. Sáng hôm sau, chị dậy thấy mẹ chồng chuẩn bị hộp cơm cho chồng chị đi làm, còn hộp của chị trống trơn.

''''Sao mẹ nấu cho anh ấy mà không nấu giúp con ạ?", Trang ngạc nhiên hỏi. Chồng thấy thế nhường hộp cơm cho vợ, nhưng bà chặn lại, nói tốn nhiều công làm cho con trai, không ăn là phụ lòng mình.

Bữa cơm nhà chồng, Trang choáng nhất là mọi người cứ thấy thứ gì ngon gắp ăn trước, không cần nhìn người khác để giữ ý như bố mẹ cô vẫn dạy. Người đi vắng không được để phần ngon hơn người ở nhà mà chỉ được toàn đầu thừa, đuôi thẹo.

Nhà chồng Trang có ba chị gái, hai anh trai. Mỗi cuối tuần, con cháu kéo đến đông như hội. Trang phải cặm cụi chợ búa, cơm nước phục vụ cả nhà, sau đó dọn dẹp bát đũa. Chị chồng và các cháu dù lớn vẫn không phụ giúp. Nhiều lúc mệt quá, Trang gọi chồng tới giúp thì lập tức mẹ chồng sẽ nhờ anh ra ngoài làm việc gì đó.

Tiến sĩ y tế công cộng, thạc sĩ tâm lý Lã Linh Nga, giám đốc Trung tâm Nghiên cứu và Ứng dụng Khoa học Tâm lý - Giáo dục (Hà Nội) cho rằng do đặc thù địa lý, vùng miền và văn hóa gia đình nên mỗi gia đình đều có nếp sống khác nhau. Không ít gia đình chồng giống như nhà Thu Trang hay Hòa, có lối sống quá khắc nghiệt khiến nàng dâu bị sốc văn hóa.

Theo bà Nga, cú sốc dễ khiến phụ nữ căng thẳng tâm lý, trút giận lên con cái làm trẻ bị tổn thương. "Nghiêm trọng hơn, sự căng thẳng đó dễ dẫn đến mâu thuẫn gia đình, gây đổ vỡ hôn nhân", bà cảnh báo.

Theo báo cáo của tòa án, trung bình hàng năm Việt Nam có 600.000 vụ ly hôn, trong đó 70% vụ do phụ nữ đệ đơn. Thống kê của Viện nghiên cứu Gia đình và Giới cho thấy mâu thuẫn về lối sống là nguyên nhân phổ biến nhất dẫn đến khủng hoảng hôn nhân.

Chị Hòa là con gái duy nhất trong gia đình hai anh em, luôn được bố mẹ cưng chiều nên không thể chấp nhận văn hóa "trọng nam khinh nữ". Hòa nhiều lần tâm sự với chồng về những hệ lụy khi con trai nối tiếp thói gia trưởng của gia đình. "Chồng bảo anh sống trong gia đình như vậy mà đâu có gia trưởng", Hòa kể.

Nhưng về sống chung chị mới phát hiện bản tính của anh cũng rất "khinh nữ". Khi vợ mang bầu bốn tháng, anh chở đi bốn nơi siêu âm chắc chắn là con trai mới thông báo với bố mẹ để tổ chức ăn mừng. "Mâu thuẫn vợ chồng tôi chỉ nảy sinh từ chuyện ở nhà chồng", cô nói.

Về phần Trang, quá mệt mỏi khi phải đầu tắt mặt tối lo cho đại gia đình chồng, cô đòi ra ở riêng nhưng chồng không chịu. Trang đề nghị họp gia đình để nói hết bức xúc. Nhưng thay vì được giải tỏa khỏi áp lực, cô bị các thành viên trong gia đình chồng lôi ra "đấu tố". Họ nói nàng dâu ích kỷ, soi mói khiến cô càng mệt mỏi hơn.

Bà Linh Nga cho rằng sốc văn hóa nhà chồng thường xảy ra do các cô gái khi yêu thiếu tìm hiểu. "Nhiều người lúc yêu chỉ quan tâm đến bạn trai mà không xem xét về tính cách, thói quen, lối sống của nhà chồng để chuẩn bị tâm lý", bà nói.

Tiến sĩ tâm lý Nguyễn Thị Minh giảng viên Học viện hành chính quốc gia TP HCM cho biết người Việt trước đây thực hành truyền thống nhiều lễ (đám nói, dạm ngõ, ăn hỏi, cưới, lại mặt...). Nhiều người cho rằng các lễ này rườm rà, phức tạp nhưng thông qua các lễ đó, cô dâu có cơ hội tìm hiểu về nhà chồng xem văn hóa thế nào, lối sống ra sao.

"Chẳng hạn lễ lại mặt diễn ra ba ngày sau khi cưới. Trong ba ngày đầu làm dâu, nếu thấy không hợp, cô dâu được trả lễ, coi như không cưới", bà Minh nói, để thấy hiểu nhà chồng quan trọng với nàng dâu thế nào.

Nếu đang rơi vào tình cảnh như Hòa hay Trang, bà Linh Nga khuyên nên bình tĩnh chia sẻ với chồng trên tinh thần góp ý, thay vì phán xét, bởi dù thương nhau cỡ nào, không người đàn ông nào thấy thoải mái khi vợ chê bai nhà mình.

"Rất khó để thay đổi được bố mẹ chồng nên hãy thông qua chồng để tạo sự thay đổi", bà nói.

Chuyên gia cũng cho rằng muốn thay đổi được văn hóa một gia đình, phụ nữ nên thay đổi bản thân mình trước. Cần khẳng định giá trị bản thân qua công việc, thu nhập, nâng cao hiểu biết, xử lý mọi việc thấu đáo để được nhà chồng công nhận.

"Nếu văn hóa nhà chồng khác biệt nhưng không quá tệ thì nên học cách thích nghi. Mỗi bên nên nhẫn nhịn một chút để dung hòa", bà Linh Nga nói.

Thạc sĩ Nguyễn Thị Minh cho rằng một gia đình giống như một tổ chức thu nhỏ. Nàng dâu mới về nhà chồng cũng như một nhân sự mới vào công ty. Người mẹ chồng phải giống như nhà quản lý, vừa có nguyên tắc nhưng cần mềm mại.

"Hãy chỉ dạy cho nàng dâu hiểu văn hóa nhà chồng để cô ấy biết cách cư xử. Lớn tuổi hơn phải mẫu mực, hướng dẫn, hỗ trợ, thường xuyên trao đổi để hiểu con dâu, cho cô ấy thời gian hòa nhập", bà nói.

Hòa chọn tách ra ở riêng trên thành phố, thống nhất với chồng những điều khoản để đạt được sự bình đẳng trong gia đình nhỏ. "Rất may anh cũng hưởng ứng chứ không bảo thủ", cô nói. Hòa cũng ít về quê để tránh nhận thêm những cú sốc mới ở nhà chồng.

Cuộc sống hiện tại của Thu Trang rất ngột ngạt và bế tắc. Dù đã cố gắng thích nghi nhưng cô chỉ thấy mình kiệt sức, già nua và xấu xí hơn trong cuộc hôn nhân này.

"Tôi luôn có ý định ly hôn để giải thoát", Trang nói.
', N'/img/439328710-329894056447151-9713-6046-3302-1715330244.jpg', CAST(N'2024-05-28T19:45:38.000' AS DateTime), N'hoang@gmail.com               ', 3)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (44, N'The Fibonan trang bị bể bơi công nghệ Bio Design', N'Bể bơi tại tòa tháp căn hộ The Fibonan được thiết kế xu hướng bền vững, hài hòa với thiên nhiên bằng công nghệ BioDesign thường sử dụng tại các khu nghỉ dưỡng.

Cụ thể, hồ bơi sinh thái tại The Fibonan ứng dụng công nghệ tiên tiến của Italy loại bỏ hoàn toàn bê tông, sử dụng vật liệu 100% từ thiên nhiên, mô phỏng nên một "bãi biển trong nhà".

Nhờ loại bỏ bê tông và vật liệu xây dựng truyền thống, hồ bơi BioDesign tại The Fibonan nâng cao trải nghiệm thư giãn và tận hưởng của cư dân nhờ sự kết hợp của các thành phần tự nhiên với công nghệ tân tiến và tính thẩm mỹ.

Theo đại diện chủ đầu tư, bể bơi được tạo hình bậc thang ngồi massage với độ dốc vừa phải, tạo nên cảm giác thư giãn như nằm trên bãi biển. Cảnh quan xung quanh cũng được thiết kế tỉ mỉ từ cây cối, vân đá tự nhiên nhằm mang đến cảm giác chân thực nhất. Ngoài ra hệ thống máy chiếu góc rộng mô tả thiên nhiên hùng vĩ trên thế giới cũng mang lại nhiều cảm xúc thư giãn như đang hòa mình giữa thiên nhiên.

Xét về tính ứng dụng, với các lớp kết cấu gồm các loại vật liệu đặc chế và thạch anh, bể bơi BioDesign có độ bền cơ học cao hơn so với kết cấu bê-tông. Đây chính là lý do vì sao loại hồ bơi này được ưa chuộng tại các khu nghỉ dưỡng nhờ thiết kế mới mẻ, trải nghiệm gần gũi với thiên nhiên và là dấu ấn tô điểm cho không gian sống.


Bên cạnh ưu thế về thiết kế và chất liệu, hồ bơi BioDesign tại The Fibonan còn được ứng dụng công nghệ kháng khuẩn ion bạc đến từ Microban - đơn vị nổi tiếng thế giới về hệ thống khử khuẩn. Trang bị này triệt tiêu tới 99% vi khuẩn trên bề mặt thành hồ, gồm các vi khuẩn gây bệnh, gây mùi, các vết bẩn bề mặt và các vi khuẩn làm giảm tuổi thọ bể bơi.

Bên cạnh đó, công nghệ kháng khuẩn Microban thân thiện với môi trường, an toàn khi sử dụng và được đăng ký trên toàn thế giới. Đây cũng là mục tiêu mà An Phú Invest luôn theo đuổi với định hướng đưa thiên nhiên vào không gian sống, đặt sức khỏe và trải nghiệm sống của cư dân lên hàng đầu.

Với mục tiêu mang lại cho cư dân trải nghiệm sống riêng tư, đậm chất nghỉ dưỡng ngay trong căn hộ của mình, dự án The Fibonan được chủ đầu tư An Phú chú trọng đầu tư vào tiện ích, trong đó có bể bơi trong nhà.

Phối cảnh toàn thể tòa tháp căn hộ cao cấp The Fibonan.

Bên cạnh bể bơi trong nhà BioDesign, The Fibonan còn có hơn 40 tiện ích. Tại đây, cư dân được tận hưởng các không gian tiện ích với hai tầng dịch vụ thương mại, tầng tái tạo sức khỏe với tổ hợp thể thao, tầng khám phá và giải trí hiện đại.

Tại tầng 1, cư dân tận hưởng cuộc sống tiện nghi với sảnh đón mang phong cách khách sạn, các khoảng xanh xen kẽ như vườn đứng, vườn tarot, sân chơi trẻ em cùng hệ thống các siêu thị, nhà hàng, cafe kinh doanh sầm uất...

Tầng 2 dự án được bố trí bể bơi bốn mùa công nghệ BioDesign, khu vui chơi trẻ em, khu sinh hoạt cộng đồng, khu cho người cao tuổi, phòng tắm hơi giúp tái tạo năng lượng, chăm sóc sức khỏe và thư giãn cho cộng đồng cư dân...

Tại tầng Rooftop của dự án là không gian thư giãn, giải trí riêng tư cho cư dân với quầy bar ngoài trời, rạp chiếu phim ngoài trời, đồi thư giãn, sàn ngắm cảnh, vườn sinh thái, vườn chiêm tinh, vườn võng, sân tập Yoga, thể dục ngoài trời, sân golf mini, đường dạo và chạy bộ, sân chơi trẻ em.

The Fibonan cũng trang bị hệ thống an ninh 6 lớp từ ngoài vào trong bao gồm bảo vệ 24/7, hệ thống camera an ninh được bố trí lắp đặt quanh tòa nhà, nhận diện khuôn mặt, cửa kiểm soát cảm biến vân tay tới từng hộ gia đình, hệ thống phân quyền thang máy, hệ thống thẻ ra vào sảnh và lễ tân. Bên cạnh đó Lady Parking - khu vực đậu xe ưu tiên dành cho phái nữ cũng là một trong những điểm nhấn tiện ích mới lạ.

Đại diện chủ đầu tư cho biết, với tổ hợp tiện ích nội khu được chú trọng đầu tư, The Fibonan mang đến một không gian sống cân bằng, nơi mỗi vị chủ nhân trở về nhà là về với "trạm sạc" cho sức khỏe và tinh thần, giữa thiên nhiên và tiện nghi, giữa kết nối và an toàn riêng tư.

Hiện dự án đang được mở bán với chính sách bán hàng ưu đãi. Khách hàng bỏ ra từ 2,9 tỷ sở hữu căn hộ 2 phòng ngủ, chiết khấu lên tới 9%, ngân hàng hỗ trợ lãi suất 0% tới 24 tháng và quà tặng đặc biệt tới 45 triệu. Dự án dự kiến được bàn giao vào quý IV/2025.

', N'/img/Image-ExtractWord-1-Out-1402-1716864561.png', CAST(N'2024-05-28T19:47:42.000' AS DateTime), N'hoang@gmail.com               ', 2)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (45, N'Những email khắc nghiệt của CEO công nghệ', N'Mark Zuckerberg, Elon Musk, Tim Cook có những cách viết email khác nhau để chấn chỉnh nhân viên khi họ làm việc không vừa ý.

Theo Business Insider, nhiều ông chủ tại Thung lũng Silicon được đánh giá nghiêm khắc khi những email họ gửi đi khiến nhân viên cảm thấy "toát mồ hôi", nhưng có thể mang lại kết quả tích cực cho công ty sau đó.

Mark Zuckerberg

Trong tài liệu tòa án liên quan đến vụ kiện Meta có hành vi phản cạnh tranh hồi tháng 3 có đề cập đến việc năm 2016, Mark Zuckerberg yêu cầu nhóm của mình tìm hiểu đối thủ, với mục tiêu chính là Snapchat. Ông gửi email nhắc nhở người đứng đầu bộ phận tăng trưởng của Facebook là Javier Olivan phải có "tư duy đột phá" và tăng tốc làm việc để tạo ra tính năng vượt đối thủ càng sớm càng tốt.


Từ email này, Olivan cùng Guy Rosen, người sáng lập Onavo - ứng dụng phân tích lưu lượng truy cập được Facebook mua lại vào năm 2013 - đẩy nhanh quá trình tìm hiểu. Hai tháng sau, Facbook trình làng tính năng Stories với nội dung biến mất sau 24 tiếng tương tự Snapchat.

New York Times hồi tháng 3/2023 cũng đưa tin vào năm 2010, Zuckerberg đã rất tức giận khi nhân viên tuồn thông tin sản phẩm chưa ra mắt cho báo chí. Ông đã gửi thư với tiêu đề "Từ chức đi". Trong thư nêu: "Tôi yêu cầu bất cứ ai làm rò rỉ thông tin này phải từ chức lập tức. Nếu không, tôi gần như chắc chắn sẽ tìm ra đó là ai".

Elon Musk

Sau đại dịch năm 2022, nhiều doanh nghiệp vẫn cho phép nhân viên làm việc từ xa, nhưng Musk yêu cầu nhân viên Tesla đến văn phòng công ty, theo CNN. Ông viết trong email: "Bất kỳ ai muốn làm từ xa đều phải có mặt ở văn phòng tối thiểu (tôi nhấn mạnh là tối thiểu) 40 giờ một tuần, hoặc rời Tesla. Con số này vẫn ít hơn những gì tôi yêu cầu với công nhân nhà máy. Do đó, nếu vắng mặt, tôi sẽ cho rằng người đó đã nghỉ việc".

Musk thường ngủ lại văn phòng công ty và mong muốn nhân viên cũng như vậy. Khi tiếp quản Twitter, nay là X, năm 2022, ông thẳng tay sa thải hơn nửa số nhân viên và yêu cầu số còn lại làm việc chăm chỉ.

Jeff Bezos

Người sáng lập Amazon có thói quen gửi email cho nhân viên. Khi gặp vấn đề không hài lòng, ông thêm vỏn vẹn một dấu chấm hỏi. Theo Business Insider, rất nhiều nhân viên Amazon đã lo sợ khi thấy dấu hỏi xuất hiện trong thư của mình.

Năm 2018, Bezos chia sẻ: "Tôi đọc hầu hết email và chuyển tiếp chúng cho các giám đốc phụ trách khu vực kèm một dấu chấm hỏi. Đó là cách truyền đạt ý: Anh đã xem kỹ điều này chưa? hay Sao vấn đề này lại xảy ra?".

Tim Cook


CEO Apple Tim Cook cũng có thái độ gay gắt với cấp dưới nếu không hài lòng với những gì họ làm. Trong email được The Verge thu thập năm 2021, ông đã chỉ trích nhân viên vì nội dung cuộc họp nội bộ bị rò rỉ cho báo chí.

"Như đã biết, công ty không chấp nhận việc bị lộ thông tin bí mật", Cook viết. "Chúng ta biết rằng những người làm rò rỉ thông tin chỉ chiếm số ít, và họ không thuộc về nơi này".

Andy Jassy


Tương tự Bezos, Andy Jassy, CEO Amazon, cũng có quan điểm cứng rắn với nhân viên kém hiệu quả. Ông đưa ra những chỉ dẫn nghiêm ngặt, đồng thời ngầm cảnh báo vị trí của họ đang bị đe dọa.

Chẳng hạn năm 2023, khi yêu cầu nhân viên trở lại văn phòng, ông cho rằng đã qua giai đoạn có thể lựa chọn làm từ xa. "Mọi người cần quay lại văn phòng ít nhất ba ngày một tuần. Những người từ chối có thể sẽ không làm việc suôn sẻ được nữa", ông nói.', N'/img/103433353-gettyimages-51225181-8934-5344-1716869226.png', CAST(N'2024-05-28T19:48:53.000' AS DateTime), N'hoang@gmail.com               ', 2)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (46, N'Great Wall Souo - môtô Trung Quốc dùng công nghệ ôtô', N'Thương hiệu mới của Great Wall Motors (GWM) vừa ra mắt sản phẩm đầu tiên thuộc dòng touring, với động cơ 8 xi-lanh và nhiều đặc điểm giống ôtô.

Ngày 17/5, tại triển lãm môtô quốc tế Bắc Kinh (Motor China), chiếc môtô 8 xi-lanh. Trước đó, GWM chưa từng tham gia lĩnh vực môtô và mới thành lập Great Wall Souo vào năm 2021.

Động cơ 8 xi-lanh đặt nằm ngang và đối xứng nhau (phong cách boxer), dung tích 2.000 phân khối. Cỗ máy này gây chú ý bởi thường được sử dụng trên ôtô thay vì môtô.


Động cơ 8 xi-lanh đặt nằm ngang và đối xứng nhau (phong cách boxer), dung tích 2.000 phân khối.


Mẫu môtô 8 xi-lanh là sản phẩm đầu tiên của Great Wall Souo.


Chiều dài xe 2.660 mm, rộng 950 mm, cao 1.540 mm và trục cơ sở 1.810 mm, với chiều cao yên 740 mm.


Phanh trước và sau Brembo với kẹp phanh 4 piston.


Màn hình cảm ứng LCD 12,3 inch, chip xử lý giống trên ôtô, nâng cấp phần mềm từ xa (OTA) và điều khiển bằng giọng nói.


Những tính năng an toàn gồm hệ thống cảnh báo va chạm phía sau, phanh tay điện tử và điều khiển hành trình.


Động cơ 8 xi-lanh đặt nằm ngang và đối xứng nhau (phong cách boxer), dung tích 2.000 phân khối.


Mẫu môtô 8 xi-lanh là sản phẩm đầu tiên của Great Wall Souo.


Lý do Great Wall Souo dùng động cơ 8 xi-lanh cho môtô có thể vì trọng tâm của động cơ thấp, giúp tối ưu khả năng vận hành ở tốc độ thấp, phù hợp với dòng xe touring thường rất nặng. Ở tốc độ cao, xe cũng ổn định hơn và giảm sự tác động của những yếu tố bên ngoài như khi chạy qua ổ gà hay gặp gió lớn thổi ngang.

Tuy nhiên, cách bố trí xi-lanh dạng này cũng khiến thân xe rộng hơn. Chiều rộng của toàn bộ khối động cơ bằng tổng chiều dài của 2 xi-lanh đối xứng, thêm thanh truyền. Ngoài ra, phần nhô của động cơ do xi-lanh nằm ngang cũng tiềm ẩn nguy cơ hư hỏng cao hơn nếu xảy ra va chạm.

Hệ thống treo trước của chiếc môtô cũng có thiết lập giống ôtô, với treo tay đòn kép. Xe trang bị hộp số tự động ly hợp kép 8 cấp và có cả số lùi giống ôtô. Trọng lượng xe 400 kg. Chiều dài xe 2.660 mm, rộng 950 mm, cao 1.540 mm và trục cơ sở 1.810 mm, với chiều cao yên 740 mm.

Great Wall Souo còn sử dụng hệ thống trục truyền động (shaft drive) giống ôtô thay vì dây đai hay dây xích thường có ở môtô. Phanh trước và sau Brembo với kẹp phanh 4 piston.

Chiếc touring có một màn hình cảm ứng LCD 12,3 inch, chip xử lý giống trên ôtô, nâng cấp phần mềm từ xa (OTA) và điều khiển bằng giọng nói. Nút bấm nâng hạ kính chắn gió, tay nắm và yên xe có sưởi. Cốp xe có dung tích 64 lít, kèm hai hộp đồ hai bên 27 lít.

Những tính năng an toàn gồm hệ thống cảnh báo va chạm phía sau, phanh tay điện tử và điều khiển hành trình.

Theo Autohome, với những đặc điểm như trên, Great Wall Souo định vị ở phân khúc cao cấp, với mức giá không rẻ. Dòng môtô này vốn được thiết kế dành cho những hành trình dài và chạy tốc độ cao. Nhưng ở Trung Quốc, cũng giống nhiều nơi khác trên thế giới, môtô thường bị cấm chạy vào đường cao tốc. Giá xe dự kiến 20.800-27.700 USD. Hãng từng có kế hoạch sản xuất 10.000 chiếc môtô mỗi năm với tổng đầu tư khoảng 76 triệu USD.', N'/img/Great-Wall-Souo-2-9918-1716006-6657-1731-1716046849.jpg', CAST(N'2024-05-28T19:50:12.000' AS DateTime), N'hoang@gmail.com               ', 2)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (47, N'Hà Nội muốn có gần 100 km đường sắt đô thị đến năm 2030', N'UBND TP Hà Nội đặt mục tiêu đến năm 2030 xây dựng xong 96,8 km đường sắt đô thị và hoàn thành mạng lưới 550 km đến năm 2045.

UBND TP Hà Nội vừa xin ý kiến Bộ Giao thông Vận tải về dự thảo Đề án tổng thể đầu tư hệ thống đường sắt đô thị của Thủ đô. Trong đó, đường sắt đô thị được xác định là trục xương sống của hạ tầng giao thông vận tải.

Cụ thể, đến năm 2030, UBND TP Hà Nội phấn đấu xây dựng, đưa vào khai thác khoảng 96,8 km đường sắt đô thị; lập đề xuất chủ trương đầu tư xây dựng các tuyến đường sắt đô thị có lộ trình đầu tư trước năm 2035.

Đến năm 2035, Hà Nội sẽ hoàn thành xây dựng, đưa vào khai thác khoảng 301 và đến năm 2045 sẽ hoàn thành toàn bộ 14 tuyến đường sắt đô thị với tổng chiều dài khoảng 550 km theo quy hoạch chung Thủ đô.
Trên cơ sở mục tiêu đầu tư, UBND TP Hà Nội đề xuất "một kế hoạch, ba phân kỳ" để hoàn thiện mạng lưới đường sắt đô thị.

Theo đó, giai đoạn đầu đến năm 2030, UBND TP Hà Nội cần khoảng 14,6 tỷ USD để xây dựng 96,8 km đường sắt. Nếu hoàn thành, đường sắt đô thị sẽ đảm nhận 7-8% lượng hành khách công cộng và có thể vận chuyển 2,2-2,6 triệu chuyến đi mỗi ngày đêm.

Đến năm 2035, Hà Nội cần khoảng 22,5 tỷ USD để đầu tư 301 km đường sắt. Nếu đạt mục tiêu này, đường sắt đô thị sẽ đảm nhận 35-40% lượng khách và có thể vận chuyển được 9,7-11,8 triệu chuyến đi mỗi ngày đêm.

Đến năm 2045, Hà Nội phấn đấu hoàn thành hệ thống đường sắt đô thị được điều chỉnh, bổ sung theo Quy hoạch Thủ đô và Quy hoạch chung Thủ đô điều chỉnh.

Lãnh đạo UBND TP Hà Nội đánh giá phương án "một kế hoạch, ba phân kỳ" sẽ đáp ứng mục tiêu hoàn thành mạng lưới đường sắt đô thị vào năm 2035 và vận tải hành khách công cộng đạt 50-55%, nhưng khối lượng công việc lớn, đòi hỏi nguồn lực cao. Nhu cầu vốn lớn, thời gian thu xếp ngắn nên thành phố sẽ gặp khó khăn trong việc huy động, bố trí nguồn vốn, cộng với chi phí vận hành, bảo dưỡng sẽ gây áp lực lên ngân sách.

Để hoàn thành các mục tiêu trong dự thảo Đề án tổng thể Đầu tư xây dựng hệ thống đường sắt đô thị thủ đô là thách thức lớn, đòi hỏi thành phố cần tính đột phá trong việc huy động nguồn vốn và tổ chức triển khai.

Theo quy hoạch chung Thủ đô trước đây, Hà Nội có 10 tuyến đường sắt đô thị, gồm 9 tuyến chính và một tuyến nối các đô thị vệ tinh, tổng chiều dài 397 km. Quy hoạch chung Thủ đô điều chỉnh mới được thông qua, TP Hà Nội đã bổ sung 4 tuyến: Ngọc Hồi - Thường Tín - Cảng hàng không số 2; Mê Linh - Cổ Loa - Yên Viên - Dương Xá; Cát Linh - Lê Văn Lương - Vành đai 4 và Vĩnh Tuy - Minh Khai - Trường Chinh - Láng - Nhật Tân dài khoảng 150 km.

Tuy nhiên, đến nay thành phố mới hoàn thành được 13 km tuyến 2A Cát Linh - Hà Đông và sắp hoàn thành 12,5 km của tuyến số 3 đoạn Nhổn - ga Hà Nội.

Sau gần 3 năm vận hành, tàu điện Cát Linh - Hà Đông thu hút đông đảo người dân, mỗi ngày có khoảng 35.000 hành khách đi lại. Trong đó 47% là người đi làm, 45% là người đi học và 8% đi lại với các mục đích khác.', N'/img/va-n-ha-nh-thu-8155-1710242867-1536-1716869773.jpg', CAST(N'2024-05-28T19:52:00.000' AS DateTime), N'hoang@gmail.com               ', 1)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (48, N'Nhiều nhà bị tốc mái, cây gãy đổ trong mưa giông lốc', N'Mưa lớn kéo dài hơn hai giờ, kèm giông lốc làm 11 căn nhà tại Lâm Đồng, Bình Phước bị tốc mái, ngập úng, hàng loạt cây xanh gãy đổ, sáng 28/5.

6h, mưa lớn trút xuống nhiều địa bàn ở tỉnh Lâm Đồng và Bình Phước. Trận mưa kéo dài kèm giông lốc, gió giật mạnh đã làm 11 căn nhà tại xã Đức Phổ và thị trấn Cát Tiên, tỉnh Lâm bị tốc mái.

Hàng chục cây xanh trên đường Phạm Văn Đồng và nhiều tuyến khác qua thị trấn Cát Tiên bị gãy, đổ; một số cột điện hạ thế trên đường Trần Lê bị ngã, gây mất điện. Mưa lớn cũng gây sạt lở, ngập cục bộ nhiều tuyến đường, hẻm ở thị trấn Cát Tiên khiến việc đi lại khó khăn.

Chủ tịch UBND huyện Cát Tiên Nguyễn Hoàng Phúc cho biết địa phương đã huy động nhiều lực lượng phối hợp các xã, thị trấn nhanh chóng khắc phục hậu quả. Cơ quan chức năng cũng bố trí người điều tiết tại các tuyến đường bị ngập do mưa lớn để đảm bảo an toàn; đồng thời, kiểm tra những khu vực nguy cơ xảy ra sạt lở, lũ quét để có biện pháp dự phòng.

Giáp huyện Cát Tiên, tại thị trấn Đức Phong, xã Đăng Hà, huyện Bù Đăng, tỉnh Bình Phước mưa lớn kèm giông lốc cũng khiến nhiều khu vực ngập nặng, đất đá trên đồi bị sạt lở, nhiều cây xanh ngã, đổ.

Ở khu vực đồi dốc Đỏ, đất đá trên triền đồi sạt lở rơi xuống đường nối tỉnh Bình Phước và tỉnh Lâm Đồng trúng hai mẹ con đang đi xe máy, khiến nam sinh tiểu học bị thương nhẹ. UBND xã Đăng Hà đã huy động lực lượng cứu hộ cứu nạn, giải phóng đường.

Trong khi đó mưa lớn cũng khiến nước suối Đăk Woa đổ từ thượng nguồn về cuồn cuộn, gây ngập hơn 20 nhà dân từ 50 cm đến một mét, hư hại tài sản đồ đạc bên trong. Người dân được sơ cứu, đưa đến nơi an toàn.

Theo Trung tâm dự báo Khí tượng Thủy văn Trung ương, sáng nay khu vực các tỉnh Gia Lai, Đắk Nông, Lâm Đồng, Bình Thuận, Bình Phước có mưa lớn, có nơi mưa rất to. Lượng mưa đo được tại một số địa phương là 72-103,4 mm. Trưa và chiều nay các địa bàn trên sẽ tiếp tục có mưa. Nguy cơ xảy ra lũ quét trên các sông suối, sạt lở đất.', N'/img/A6-6898-1716871080.jpg', CAST(N'2024-05-28T19:53:24.000' AS DateTime), N'hoang@gmail.com               ', 1)
INSERT [dbo].[Posts] ([ID_Post], [Title], [Content_Post], [Image], [time_post], [Email], [ID_Category]) VALUES (49, N'Quận trung tâm TP HCM dự kiến thu 750 triệu đồng phí sử dụng vỉa hèn', N'Gần ba tuần thí điểm cho sử dụng một phần vỉa hè để kinh doanh ở 11 tuyến đường thuộc quận 1, gần 200 hộ đăng ký với tổng mức phí dự kiến đóng gần 750 triệu đồng.

Thông tin được đại diện UBND quận 1 cho biết chiều 28/5, khi cập nhật tình hình thu phí sử dụng một phần vỉa hè làm điểm kinh doanh, buôn bán ở 11 tuyến đường đang thí điểm trên địa bàn. Trong tổng mức phí nêu trên, địa phương đã thu gần 250 triệu đồng. Số còn lại là khoản tạm tính dựa trên diện tích các hộ đã đăng ký, sau khi chấp thuận mới thu phí.

Phường Bến Thành có số lượng đăng ký nhiều nhất với 126 trường hợp. Kế đến là các phường Đa Kao, Cầu Ông Lãnh, Nguyễn Cư Trinh, Bến Nghé, Cô Giang... Trong đó, tuyến "đắt khách" nhất là Lê Thánh Tôn với 71 trường hợp đã đăng ký sử dụng một phần vỉa hè. Nhiều đường khác, số hộ đăng ký cũng tăng nhanh so với vài ngày đầu thí điểm, như Phan Bội Châu (34 hộ), Phan Chu Trinh (23 hộ), Trần Hưng Đạo (21 hộ)... Thống kê ngày cao nhất có 20-23 hộ đăng ký.
Quận 1 là địa phương đầu tiên tại TP HCM thí điểm sử dụng một phần vỉa hè để tổ chức các hoạt động kinh doanh dịch vụ, mua bán hàng hóa có thu phí. Theo phương án của quận, phần diện tích kinh doanh ở vỉa hè bố trí về phía nhà dân và cho để xe máy tự quản sát mép đường. Phần giữa vỉa hè là lối cho người đi bộ với chiều rộng ít nhất 1,5 m.

Với 11 tuyến đang thí điểm, việc đăng ký sử dụng vỉa hè được quận triển khai qua phần mềm. Trên ứng dụng sẽ cung cấp chức năng hè phố, thủ tục đăng ký, mức phí... Khi đáp ứng các điều kiện, người dân sẽ được cấp phép và đóng phí tuỳ theo diện tích, thời gian. Hiện, chỉ chủ hộ hoặc người đang thuê nhà mới được xem xét cho sử dụng vỉa hè.

Trước đó, tháng 7 năm ngoái, TP HCM ra quyết định mới về quản lý và sử dụng tạm một phần lòng đường, hè phố, cho một số trường hợp được sử dụng một phần và đóng phí, như: tổ chức hoạt động văn hóa (thể thao, diễu hành, lễ hội) và điểm giữ ôtô phục vụ hoạt động văn hóa; điểm kinh doanh dịch vụ, mua - bán hàng hóa; giữ xe có thu tiền dịch vụ...

Vỉa hè thuộc diện cho sử dụng một phần phải rộng ít nhất 3 m, trong đó 1,5 m dành cho người đi bộ. Còn với lòng đường, sau khi chừa lại ít nhất hai làn ôtô cho một chiều đi, phần còn lại nếu đủ điều kiện mới tổ chức các hoạt động khác ngoài mục đích giao thông.

Trên cơ sở này, HĐND thành phố sau đó ban hành mức phí để áp dụng cho từng trường hợp sử dụng, hiệu lực từ đầu năm nay. Ngoài quận 1, nhiều quận huyện khác trên địa bàn cũng đang rà soát, lập danh mục các tuyến đủ điều kiện tổ chức các hoạt động có thu phí.

Hiện, mức phí được thành phố áp dụng dựa trên giá đất bình quân tại 5 khu vực, ở nội thành sẽ cao hơn ngoại ô. Trong đó, mức thấp nhất cho hoạt động giữ xe là 50.000 đồng, cao nhất 350.000 đồng/m2/tháng. Các hoạt động khác áp dụng 20.000-100.000 đồng/m2.', N'/img/zzz1-JPG-2347-1716897556.jpg', CAST(N'2024-05-28T19:54:42.000' AS DateTime), N'hoang@gmail.com               ', 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'banh@gmail.com                ', N'Kha Banh', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'hien@gmail.com                ', N'Hien', N'123456                                                                                              ', 1, N'ROLE_ADMIN     ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'hoang@gmail.com               ', N'Hoang', N'$2a$10$F228ISL41MNgugTpjCdcGOo294haBZCRllAr1wVWW7zgeradDoXUO                                        ', 1, N'ROLE_ADMIN     ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'huan@gmail.com                ', N'Huan Hoa Hong', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'lequanghien4u@gmail.com       ', N'hien1234', N'$2a$10$H64dfrL0t943B3d3QSwPueKyhpxVa3mtCyeZ57R6.1FGi1mCboUGi                                        ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'lubu@gmail.com                ', N'Lu Bo', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'phi@gmail.com                 ', N'Truong Phi', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'sieu@gmail.com                ', N'Ma Sieu', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'son@gmail.com                 ', N'Son', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'tai@gmail.com                 ', N'Tai Kon', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'test@gmail.com                ', N'test', N'$2a$10$F228ISL41MNgugTpjCdcGOo294haBZCRllAr1wVWW7zgeradDoXUO                                        ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'trung@gmail.com               ', N'Hoang Trung', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'van@gamil.com                 ', N'Trieu Tu Long', N'123456                                                                                              ', 1, N'ROLE_USER      ')
INSERT [dbo].[Users] ([Email], [user_name], [pass_word], [Active], [Role]) VALUES (N'vu@gmail.com                  ', N'Quan Vu', N'123456                                                                                              ', 1, N'ROLE_USER      ')
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_TimeCmt]  DEFAULT (getdate()) FOR [Time_Cmt]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Post_TimePost]  DEFAULT (getdate()) FOR [time_post]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_Role]  DEFAULT ('ROLE_USER') FOR [Role]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts1] FOREIGN KEY([ID_Post])
REFERENCES [dbo].[Posts] ([ID_Post])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts1]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([Email])
REFERENCES [dbo].[Users] ([Email])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[Categories] ([ID_Category])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([Email])
REFERENCES [dbo].[Users] ([Email])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_ROLE] CHECK  (([Role]='ROLE_ADMIN' OR [Role]='ROLE_USER'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_ROLE]
GO
USE [master]
GO
ALTER DATABASE [News] SET  READ_WRITE 
GO
