
-- Testing_System_Assignment_3

-- =============>>> Question 1: Thêm ít nhất 10 record vào mỗi table ====================

DROP DATABASE IF EXISTS TESTINGMANAGEMENT;
CREATE DATABASE TESTINGMANAGEMENT;
USE TESTINGMANAGEMENT;

-- TABLE 1: Department
CREATE TABLE	 Department(
	DepartmentID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName				NVARCHAR(50) NOT NULL UNIQUE KEY
);
-- TABLE 2: Position
CREATE TABLE 	Position (
	PositionID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName				ENUM('Dev', 'Test','Scrum Master','PM') NOT NULL UNIQUE KEY
 
);

-- TABLE 3: Account
CREATE TABLE 	`Account`(
	AccountID					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email						VARCHAR(50) UNIQUE KEY,
	Username					VARCHAR(50) NOT NULL UNIQUE KEY, 
	FullName					NVARCHAR(50)NOT NULL ,
    DepartmentID				TINYINT UNSIGNED  NOT NULL,
    PositionID					TINYINT UNSIGNED NOT NULL ,
	CreateDate					DATETIME DEFAULT NOW() ,
	FOREIGN KEY (PositionID) REFERENCES Position (PositionID) ON DELETE CASCADE,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE 
);

-- TABLE 4: Group
CREATE TABLE 	`Group`(
	GroupID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName					NVARCHAR(50) NOT NULL UNIQUE KEY,
	CreatorID					INT UNSIGNED NOT NULL ,
	CreateDate					DATETIME ,
	FOREIGN KEY(CreatorID) REFERENCES`Account`(AccountID) ON DELETE CASCADE

	);

-- TABLE 5: GroupAccount
CREATE TABLE 	GroupAccount(
	GroupID						TINYINT UNSIGNED NOT NULL ,
	AccountID					INT UNSIGNED NOT NULL,
	JoinDate					DATETIME DEFAULT NOW(),
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE,
	FOREIGN KEY(AccountID)REFERENCES `Account`(AccountID) ON DELETE CASCADE
);    
    
-- TABLE 6: TypeQuestion
CREATE TABLE 	TypeQuestion(
	TypeID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName					ENUM('Essay', 'Multiple-Choice') UNIQUE KEY NOT NULL
);       
-- TABLE 7: CategoryQuestion
CREATE TABLE 	CategoryQuestion(
	CategoryID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName				VARCHAR(50)
); 
    -- TABLE 8: Question
CREATE TABLE 	Question(
	QuestionID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content						NVARCHAR(50),
	CategoryID					TINYINT UNSIGNED,
	TypeID						TINYINT UNSIGNED,
    CreatorID					INT UNSIGNED,
	CreateDate					DATETIME DEFAULT now(),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE,
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID) ON DELETE CASCADE,
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE

);
   -- TABLE 9: Answer
CREATE TABLE 	Answer(
	AnswerID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content						NVARCHAR(50),
	QuestionID					TINYINT UNSIGNED ,
	isCorrect					ENUM('true','false'),
   	FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID) ON DELETE CASCADE
);
	-- TABLE 10: Exam
CREATE TABLE 	Exam(
	ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code`						VARCHAR(50) NOT NULL,
	Title						VARCHAR(50) NOT NULL,
	CategoryID					TINYINT UNSIGNED,
    Duration					TINYINT NOT NULL,
	CreatorID					INT UNSIGNED,
	CreateDate					DATETIME DEFAULT NOW(),
    
	FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE,
	FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);
 	-- TABLE 11: ExamQuestion
CREATE TABLE 	ExamQuestion(
	ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	QuestionID					TINYINT UNSIGNED,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE
);   
           
    -- ===================================================================================
    -- =================>>> Question 3: Chuẩn bị data cho bài 3 <<<=======================
    -- ============================= INSERT DỮ LIỆU ======================================

-- INSERT INTO  Department (DepartmentID, DepartmentName)
-- VALUES

-- TABLE 1:   Department  
INSERT INTO  Department	(	DepartmentName	)
VALUES					(	N'Giám đốc'		),
						(	N'Thư kí'		),
						(	N'Nhân sự'		),
						(	N'Hành Chính'  	),
						(	N'Tài chính' 	),
						(	N'Marketing'	),
						(	N'Sale'			),
						(	N'CSKH'			),
						(	N'Giám sát' 	),
						(	N'Bảo vệ'		);
-- TABLE 2: Position
INSERT INTO Position 	(PositionName	)
VALUES 					('Dev' 			),
						('Test' 		),
						('Scrum Master'	),
						('PM' 			);
                        
-- -- table 3: `Account`	
INSERT INTO `Account`	(		Email			, 	Username		,	FullName			,DepartmentID 	, PositionID	, CreateDate )
VALUES 					('QuocViet@gmail.com'	,	'QuocViet'		,N'Tạ Quốc Việt'		, 		5		,		 1		,'2021-03-05'),
						('ThuyDung@gmail.com'	,	'ThuyDung'	 	,N'Hoàng Thùy Dung'		, 		8		,		 2		,'2021-03-05'),
						('TuanAnh@gmail.com'	,	'TuanAnh'	 	,N'Bùi Tuấn Anh'		, 		1		,		 2	 	,'2021-03-07'),
						('MinhHieu@gmail.com'	,	'MinhHieu'	 	,N'Phạm Minh Hiếu'		, 		4		,		 4	 	, DEFAULT    ),
						('HuyenTrang@gmail.com'	, 	'HuyenTrang'	,N'Phạm Thị Huyền Trang', 		2		,		 4	 	,'2021-03-10'),
						('ĐucManh@gmail.com'	, 	'ĐucManh'	 	,N'Lê Đức Mạnh'			, 		3		,		 3	 	,'2021-04-05'),
						('BichThao@gmail.com'	, 	'BichThao'	 	,N'đỗ Thị Bích Thảo'	, 		10		,		 2	 	, NULL		 ),
						('LanAnh@gmail.com'	 	, 	'LanAnh '	 	,N'Chử Thị Lan Ánh'		, 		9		,		 1	 	,'2021-04-07'),
						('VanHoa@gmail.com'	 	, 	'VanHoa '	 	,N'Trịnh Văn Hóa'		, 		7		,		 2	 	,'2021-04-07'),
						('MinhTrang@gmail.com' 	, 	'MinhTrang'	 	,N'Tặng Thị Minh Trang'	, 		3 		,		 1		, DEFAULT 	 ),
						('ThiKhoe@gmail.com' 	, 	'ThiKhoe '	 	,N'LÊ Thị Khỏe'			, 		2	 	,		 1	 	,'2021-04-09'),
						('HaiCuong@gmail.com' 	, 	'HaiCuong'	 	,N'lại hải cường'		, 		5 		,		 1	 	,'2021-03-08');

-- TABLE 4: Group
INSERT INTO `Group`		( GroupName		, CreatorID	 ,	CreateDate	)
VALUES 					(N'Tokyo'		, 	5		 ,	'2021-08-08'),
						(N'Hà nội' 		, 	1		 ,	'2021-08-07'),
						(N'Hà Tĩnh' 	, 	2		 ,	'2021-08-09'),
						(N'Hải Phòng' 	, 	3		 ,	'2021-08-10'),
						(N'Thái Bình' 	, 	4		 ,	'2021-08-28'),
						(N'Quảng Ninh' 	, 	6		 ,	'2021-09-06'),
						(N'Hòa Bình'	, 	7		 ,	'2021-09-07'),
						(N'Hà Nam' 		, 	8		 ,	'2021-09-08'),
						(N'osaka ' 		, 	9		 ,	'2021-09-09'),
						(N'Cà Mau ' 	, 	10		 ,	'2021-09-10'); 
                        

 -- TABLE 5: GroupAccount
INSERT INTO `GroupAccount`		( GroupID 	, AccountID , JoinDate	 )
VALUES 							( 	4 		, 		1	,'2021-09-05'),
								(	2 		, 		2	,'2021-09-07'),
								( 	3		, 		3	,'2021-09-09'),
								(	3		, 		4	,'2021-09-10'),
								( 	5 		, 		3	,'2021-10-06'),
								( 	4 		,		9	,'2021-10-05'),
								( 	1		, 		7	,'2021-10-07'),
								( 	4 		,		9	,'2021-10-09'),
								( 	5 		,		1	,'2021-10-11'),
								( 	6 		, 		5	,'2021-10-10');
-- TABLE 6: TypeQuestion                        
INSERT INTO TypeQuestion 		(		TypeName 	)
VALUES 							('Essay'			),
								('Multiple-Choice'	);
-- TABLE 7: CategoryQuestion                        
INSERT INTO CategoryQuestion	(  CategoryName )
VALUES 							(	'Java' 		),
                                (	'SQL' 		),
                                (	'Postman' 	),
                                (	'C++' 		),
                                (	'C #' 		), 
                                (	'JavaScript'),   
                                (	'C' 		),
                                (	'Swift' 	),
                                (	'PHP' 		),
                                (	'Ruby' 		);
-- TABLE 8: Question 					
INSERT INTO Question 			(		Content 			, CategoryID, TypeID 	,CreatorID	, CreateDate )
VALUES 							(N'Câu hỏi về Java'			, 		1 	,	1 		,		4	,'2021-04-05'),
								(N'Question về Ruby'		, 		6 	,	2		, 		1	,'2021-04-05'),
                                (N'Câu hỏi về C#'			, 		5 	,	1 		, 		5	,'2021-04-06'),                       
                                (N'Question về C++'	 		, 		10 	,	1 		, 		7	,'2021-04-07'),
								(N'Câu hỏi về JavaScript'	, 		3 	,	2 		, 		5	,'2021-04-08'),
                                (N'Question về C'	 		, 		9 	,	1 		, 		2	,'2021-04-09'),
                                (N'Question về Swift'		, 		8 	,	2 		, 		3	,'2021-04-07'),
                                (N'Câu hỏi về PHP'	 		, 		3 	,	2		, 		5	,'2021-04-06'),
                                (N'Question về SQL' 		, 		5 	,	1		,		6	,'2021-04-03'),
                                (N'Câu hỏi về Postman,'		, 		7 	,	2		, 		8	,'2021-04-04');
                                
-- TABLE 9: Answer                                
INSERT INTO Answer 				( Content		, QuestionID, 	isCorrect 	)
VALUES							(N'Trả lời 01'	,	 5		,	 'false'	),
								(N'Trả lời 02' 	,	 1		,	 'true'		),                          
								(N'Trả lời 03'	,	 5		,	 'false'	),
                                (N'Trả lời 04'	,	 1 		,	 'true' 	),
                                (N'Trả lời 05'	,	 3		,	 'true' 	),
                                (N'Trả lời 06'	,	 1 		,	 'false' 	),
                                (N'Trả lời 07'	,	 5 		,	 'true' 	),
                                (N'Trả lời 08'	,	 1 		,	 'false' 	),
                                (N'Trả lời 09'	,	 2 		,	 'true' 	),
                                (N'Trả lời 10'	,	 3	 	,	 'true' 	);
                               
-- TABLE 10: Exam
INSERT INTO Exam 				(	`Code`	 , 	Title 			, CategoryID	, Duration	, CreatorID , 	CreateDate	)
VALUES							('Railway01' , 'Exam C#' 		,		1 		,	60	 	, 	5		,	'2021-08-05'),
								('Railway02' , 'Exam Ruby' 		,		6 		,	60		, 	2		,	'2021-08-05'),
                                ('Railway03' , 'Exam C++' 		,		5 		,	120 	, 	2		,	'2021-08-07'),
                                ('Railway04' , 'Exam Java' 		,		6 		,	60		, 	3		,	'2021-08-08'),
                                ('Railway05' , 'Exam PHP' 		,		2 		,	90 		, 	7		,	'2021-08-03'),
                                ('Railway06' , 'Exam C' 		,		2 		,	60 		, 	9		,	'2021-08-06'),
                                ('Railway07' , 'Exam Swift' 	,		2 		,	120 	, 	1		,	'2021-09-09'),
                                ('Railway08' , 'Exam JavaScript',		2 		,	60 		, 	10		,	'2021-09-10'),
                                ('Railway09' , 'Exam SQL' 		,		2 		,	90 		, 	4		,	'2021-09-11'),                            
                                ('Railway10' , 'Exam Postman,'	,		3 		,	90 		, 	8		,	'2021-09-07');                           

-- TABLE 11: ExamQuestion
INSERT INTO ExamQuestion		( QuestionID )
VALUES 							(	 	6	  ),
								( 		5	  ),
                                ( 		4     ),
                                ( 		3 	  ),
                                ( 		8 	  ),
                                ( 		3 	  ),
                                ( 		10 	  ),
                                ( 		9 	  ),
                                ( 		8 	  ),
                                ( 		1	  );
                               
    
-- =============>>> Question 2: Lấy ra tất cả các phòng ban	 ===========
  
-- SELECT		DepartmentName
-- FROM			Department;
--     
-- =============>>> Question 3: Lấy ra id của phòng ban "Sale" ===========
--    
-- SELECT		DepartmentID, DepartmentName
-- FROM			Department
-- WHERE 		DepartmentName = 'Sale'
-- ;

-- =============>>> Question 4: lấy ra thông tin account có full name dài nhất ===========
-- SELECT 		Username, FullName, concat(Username,FullName)  te
-- FROM 		Account 
-- WHERE 		length(concat(Username,FullName)) = (SELECT MAX(length(concat(Username,FullName))) FROM Account)
-- ORDER BY 	length(concat(Username,FullName)) DESC
-- ;
	
-- ;
-- SAI ????
-- SELECT 	*
-- FROM			Account 
-- WHERE		length(FullName) = (SELECT  min(length(FullName)) FROM Account);

-- SELECT  FullName, (length(FullName)) FROM Account   Dấu nặng 2 kí tự  

-- SELECT 		*
-- FROM 		Account 
-- WHERE 		length(FullName) = (SELECT MAX(length(FullName)) FROM Account)
-- ORDER BY 	length(FullName) DESC
-- ;
--  ======>>>>  Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3 =======
-- SELECT 		*
-- FROM 		Account 
-- WHERE 		length(FullName) = (SELECT( max(length(FullName) )) FROM Account)and DepartmentID = 3
-- ;

--  ======>>>> Question 6: Lấy ra tên group đã tham gia trước ngày 07/09/2021 >>>

-- SELECT 		GroupName
-- FROM 		`Group`
-- WHERE		CreateDate < '2021-09-07'
-- ;


-- =====>>>> Question 7: Lấy ra ID của question có >= 4 câu trả lời ==========
-- SELECT			QuestionID
-- FROM			Answer
-- GROUP BY		QuestionID
-- HAVING			count(QuestionID) >= 2
-- ;

-- ================>>>>> Question 8: Lấy ra các mã đề thi có thời gian thi >= 50 phút và được tạo trước ngày 06/09/2021
-- SELECT			*
-- FROM			Exam;

-- SELECT			Code
-- FROM			Exam
-- WHERE			Duration >= '90' AND  CreateDate < '2021-09-06'
-- ;

-- =================>>> Question 9: Lấy ra 5 group được tạo gần đây nhất =========================
-- SELECT			*
-- FROM			`Group`
-- ;
-- SELECT			GroupID, GroupName ,CreateDate
-- FROM			`Group`
-- ORDER BY		CreateDate DESC
-- LIMIT			5
-- ;
-- ================>>>>> Question 10: Đếm số nhân viên thuộc department có id = 2==================
-- SELECT			count(1) as `SonhanvienID = 2` 
-- FROM			`Account`
-- WHERE			departmentID = 2 
-- ;
-- ===============>>>>> Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
-- SELECT			AccountID, FullName
-- FROM			`Account`
-- WHERE			FullName LIKE 'Đ%o'
-- ===============>>>>>> Question 12: Xóa tất cả các exam được tạo trước ngày 2021-08-06
-- SELECT			*
-- FROM			Exam 
-- ;

-- DELETE FROM		Exam
-- WHERE			CreateDate < '2021-08-06 00:00:00';

-- SELECT			*
-- FROM			Exam 
-- ;

-- =================>>>>>>> Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
-- SELECT			*
-- FROM			Question
-- ;
-- DELETE			FROM		Question
-- WHERE			Content	like 'Câu hỏi%';

-- SELECT			*
-- FROM			Question
-- ;

-- =================>>>>>>Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" 
-- =================>>>>>>       và email thành loc.nguyenba@vti.com.vn
-- SELECT			*
-- FROM			Account
-- ;

-- UPDATE			Account
-- SET				FullName	= 'Nguyễn Bá Lộc',
-- 				Username	= 'BaLoc',
-- 				Email		= 'loc.nguyenba@vti.com.vn'
-- WHERE			AccountID = 5
-- ;

-- SELECT			*
-- FROM			Account
-- ;

-- =================>>>>> Question 15: update account có id = 5 sẽ thuộc group có id = 4
-- SELECT			 *
-- FROM			 
-- ;

-- UPDATE			 `GroupAccount`
-- SET				GroupID	= 4 
-- WHERE			AccountID = 5
-- ;
-- SELECT			*
-- FROM			 `GroupAccount`
-- ;

