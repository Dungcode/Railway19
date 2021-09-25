
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
    PositionName				ENUM('Dev', 'Test','Scrum Master','PM') NOT NULL
 
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
	FOREIGN KEY (PositionID) REFERENCES Position (PositionID),
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- TABLE 4: Group
CREATE TABLE 	`Group`(
	GroupID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName					NVARCHAR(50) NOT NULL,
	CreatorID					INT UNSIGNED NOT NULL UNIQUE KEY,
	CreateDate					DATETIME ,
	FOREIGN KEY(CreatorID) REFERENCES`Account`(AccountID)

	);

-- TABLE 5: GroupAccount
CREATE TABLE 	GroupAccount(
	GroupID						TINYINT UNSIGNED NOT NULL ,
	AccountID					INT UNSIGNED NOT NULL,
	JoinDate					DATETIME DEFAULT NOW(),
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
	FOREIGN KEY(AccountID)REFERENCES `Account`(AccountID)
);    
    
-- TABLE 6: TypeQuestion
CREATE TABLE 	TypeQuestion(
	TypeID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName					ENUM('Essay', 'Multiple-Choice')
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
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
     FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)

);
   -- TABLE 9: Answer
CREATE TABLE 	Answer(
	AnswerID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content						NVARCHAR(50),
	QuestionID					TINYINT UNSIGNED ,
	isCorrect					ENUM('true','false'),
   	FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
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
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
 	-- TABLE 11: ExamQuestion
CREATE TABLE 	ExamQuestion(
	ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	QuestionID					TINYINT UNSIGNED,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
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
INSERT INTO `Account`	(		Email		 , 	Username		,	FullName			,DepartmentID 	, PositionID	, CreateDate )
VALUES 					('Email1@gmail.com'	 ,	'QuocViet'		,N'Tạ Quốc Việt'		, 		5		,		 1		,'2021-03-05'),
						('Email2@gmail.com'	 ,	'ThuyDung'	 	,N'Hoàng Thùy Dung'		, 		8		,		 2		,'2021-03-05'),
						('Email3@gmail.com'	 ,	'TuanAnh'	 	,N'Bùi Tuấn Anh'		, 		1		,		 2	 	,'2021-03-07'),
						('Email4@gmail.com'	 ,	'MinhHieu'	 	,N'Phạm Minh Hiếu'		, 		4		,		 4	 	, DEFAULT    ),
						('Email5@gmail.com'	 , 	'HuyenTrang'	,N'Phạm Thị Huyền Trang', 		2		,		 4	 	,'2021-03-10'),
						('Email6@gmail.com'	 , 	'ĐucManh'	 	,N'Lê Đức Mạnh'			, 		3		,		 3	 	,'2021-04-05'),
						('Email7@gmail.com'	 , 	'BichThao'	 	,N'Đỗ Thị Bích Thảo'	, 		10		,		 2	 	, NULL		 ),
						('Email8@gmail.com'	 , 	'LanAnh '	 	,N'Chử Thị Lan Anh'		, 		9		,		 1	 	,'2021-04-07'),
						('Email9@gmail.com'	 , 	'VanHoa '	 	,N'Trịnh Văn Hóa'		, 		7		,		 2	 	,'2021-04-07'),
						('Email10@gmail.com' , 	'MinhTrang'	 	,N'Tặng Thị Minh Trang'	, 		3 		,		 1		, DEFAULT 	 ),
						('Email11@gmail.com' , 	'ThiKhoe '	 	,N'Lê Thị Khỏe'			, 		2	 	,		 1	 	,'2021-04-09'),
						('Email12@gmail.com' , 	'HaiCuong'	 	,N'Lại Hải Cường'		, 		5 		,		 1	 	,'2021-03-08');

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
								(N'Câu hỏi về Ruby'			, 		6 	,	2		, 		1	,'2021-04-05'),
                                (N'Câu hỏi về C#'			, 		5 	,	1 		, 		5	,'2021-04-06'),                       
                                (N'Câu hỏi về C++'	 		, 		10 	,	1 		, 		7	,'2021-04-07'),
								(N'Câu hỏi về JavaScript'	, 		3 	,	2 		, 		5	,'2021-04-08'),
                                (N'Câu hỏi về C'	 		, 		9 	,	1 		, 		2	,'2021-04-09'),
                                (N'Câu hỏi về Swift'		, 		8 	,	2 		, 		3	,'2021-04-07'),
                                (N'Câu hỏi về PHP'	 		, 		3 	,	2		, 		5	,'2021-04-06'),
                                (N'Câu hỏi về SQL' 			, 		5 	,	1		,		6	,'2021-04-03'),
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
-- SELECT		DepartmentID
-- FROM			Department
-- WHERE 		DepartmentName = 'Sale'
-- ;

-- =============>>> Question 4: lấy ra thông tin account có full name dài nhất ===========

-- SELECT 		*
-- FROM 		account 
-- ;

-- SELECT 		*
-- FROM 		Account 
-- WHERE 		length(FullName) = (SELECT max(length(FullName)) FROM Account)
-- ;
-- SAI ????
SELECT 	*
FROM			Account 
WHERE		length(FullName) = (SELECT min(length(FullName)) FROM Account)
;

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
-- SELECT		*
-- FROM			Question
-- WHERE		QuestionID >= 4
-- ;

-- ======>>>>> Question 8: Lấy ra các mã đề thi có thời gian thi >= 50 phút và được tạo trước ngày 06/09/2021
-- SELECT		*
-- FROM			Exam

-- SELECT		ExamID
-- FROM			Exam
-- WHERE		Duration >= '70' AND  CreateDate < '2021-09-06'
-- ;


