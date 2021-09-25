-- Testing_System_Assignment_2

-- =============>>> Question 1: Tối ưu lại assignment trước ====================
-- =============>>> Question 2: Thêm các constraint vào assignment trước =======
 
DROP DATABASE IF EXISTS TESTINGMANAGEMENT;
CREATE DATABASE TESTINGMANAGEMENT;
USE TESTINGMANAGEMENT;

-- TABLE 1: Department
CREATE TABLE	 Department(
	DepartmentID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName				VARCHAR(50) NOT NULL UNIQUE KEY
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
	CreateDate					DATETIME  ,
	FOREIGN KEY (PositionID) REFERENCES Position (PositionID),
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- TABLE 4: Group
CREATE TABLE 	`Group`(
	GroupID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName					VARCHAR(50) NOT NULL,
	CreatorID					INT UNSIGNED NOT NULL UNIQUE KEY,
	CreateDate					DATETIME ,
	FOREIGN KEY(CreatorID) REFERENCES`Account`(AccountID)

	);

-- TABLE 5: GroupAccount
CREATE TABLE 	GroupAccount(
	GroupID						TINYINT UNSIGNED NOT NULL ,
	AccountID					INT UNSIGNED NOT NULL,
	JoinDate					DATETIME ,
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
	Content						VARCHAR(50),
	CategoryID					TINYINT UNSIGNED,
	TypeID						TINYINT UNSIGNED,
    CreatorID					INT UNSIGNED,
	CreateDate					DATE,
	FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);
   -- TABLE 9: Answer
CREATE TABLE 	Answer(
	AnswerID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content						VARCHAR(50),
	QuestionID					TINYINT UNSIGNED ,
	isCorrect					ENUM('true','false'),
   	FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);
	-- TABLE 10: Exam
CREATE TABLE 	Exam(
	ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code`						VARCHAR(50) NOT NULL,
	Title						VARCHAR(50) NOT NULL,
	CategoryID					INT UNSIGNED,
    Duration					TINYINT NOT NULL,
	CreatorID					TINYINT,
	CreateDate					DATETIME
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
VALUES					(	'Giám đốc'		),
						(	'Thư kí'		),
						(	'Nhân sự'		),
						(	'Hành Chính'  	),
						(	'Tài chính' 	),
						(	'Marketing'	 	),
						(	'Sale'			),
						(	'CSKH'			),
						(	'Giám sát' 		),
						(	'Bảo vệ'		);
-- TABLE 2: Position
INSERT INTO Position 	(PositionName	)
VALUES 					('Dev' 			),
						('Test' 		),
						('Scrum Master'	),
						('PM' 			);
                        
-- -- table 3: `Account`	
INSERT INTO `Account`	(		Email		 , 	Username		,	FullName			,DepartmentID 	, PositionID	, CreateDate )
VALUES 					('Email1@gmail.com'	 ,	'QuocViet'		,N'Tạ Quốc Việt'		, 		5		,		 1		,'2021-03-05'),
						('Email2@gmail.com'	 ,	'ThuyDung'	 	,N'Hoàng Thùy Dung' 	, 		8		,		 2		,'2021-03-05'),
						('Email3@gmail.com'	 ,	'TuanAnh'	 	,N'Bùi Tuấn Anh '		, 		1		,		 2	 	,'2021-03-07'),
						('Email4@gmail.com'	 ,	'MinhHieu'	 	,N'Phạm Minh Hiếu '		, 		4		,		 4	 	, DEFAULT    ),
						('Email5@gmail.com'	 , 	'HuyenTrang'	,N'Phạm Thị Huyền Trang', 		2		,		 4	 	,'2021-03-10'),
						('Email6@gmail.com'	 , 	'ĐucManh'	 	,N'Lê Đức Mạnh'			, 		3		,		 3	 	,'2021-04-05'),
						('Email7@gmail.com'	 , 	'BichThao'	 	,N'Đỗ Thị Bích Thảo'	, 		10		,		 2	 	, NULL		 ),
						('Email8@gmail.com'	 , 	'LanAnh '	 	,N'Chử Thị Lan Anh '	, 		9		,		 1	 	,'2021-04-07'),
						('Email9@gmail.com'	 , 	'VanHoa '	 	,N'Trịnh Văn Hóa '		, 		7		,		 2	 	,'2021-04-07'),
						('Email10@gmail.com' , 	'MinhTrang'	 	,N'Tặng Thị Minh Trang'	, 		4 		,		 1		, DEFAULT 	 ),
						('Email11@gmail.com' , 	'ThiKhoe '	 	,N'Lê Thị Khỏe '		, 		2	 	,		 1	 	,'2021-04-09'),
						('Email12@gmail.com' , 	'HaiCuong'	 	,N'Lại Hải Cường' 		, 		5 		,		 1	 	,'2021-03-08');

-- TABLE 4: Group
INSERT INTO `Group`		( GroupName		, CreatorID	 ,	CreateDate	)
VALUES 					('Tokyo'		, 	5		 ,	'2021-08-08'),
						('Hà nội' 		, 	1		 ,	'2021-08-07'),
						('Hà Tĩnh' 		, 	2		 ,	'2021-08-09'),
						('Hải Phòng' 	, 	3		 ,	'2021-08-10'),
						('Thái Bình' 	, 	4		 ,	'2021-08-28'),
						('Quảng Ninh' 	, 	6		 ,	'2021-09-06'),
						('Hòa Bình'		, 	7		 ,	'2021-09-07'),
						('Hà Nam' 		, 	8		 ,	'2021-09-08'),
						('osaka ' 		, 	9		 ,	'2021-09-09'),
						('Cà Mau ' 		, 	10		 ,	'2021-09-10'); 
                        

 -- TABLE 5: GroupAccount
INSERT INTO `GroupAccount`		( GroupID 	, AccountID , JoinDate	 )
VALUES 							( 	4 		, 		1	,'2021-09-05'),
								(	2 		, 		2	,'2021-09-07'),
								( 	3		, 		3	,'2021-09-09'),
								(	3		, 		4	,'2021-09-10'),
								( 	5 		, 		3	,'2021-10-06'),
								( 	1		, 		7	,'2021-10-07'),
								( 	4 		,		9	,'2021-10-09'),
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
                                (	'Ruby' 		);
-- TABLE 8: Question 					
-- TABLE 8: Question 					
INSERT INTO Question 			(		Content 		, CategoryID, TypeID 	,CreatorID	, CreateDate )
VALUES 							('Câu hỏi về Java'		, 		1 	,	1 		,		4	,'2021-04-05'),
								('Câu hỏi về Ruby'		, 		6 	,	2		, 		1	,'2021-04-05'),
                                ('Câu hỏi về C#'		, 		5 	,	1 		, 		5	,'2021-04-06'),                       
                                ('Câu hỏi về C++'	 	, 		6 	,	1 		, 		7	,'2021-04-07'),
                                ('Câu hỏi về SQL' 		, 		5 	,	1		,		6	,'2021-04-03'),
                                ('Câu hỏi về Postman,'	, 		4 	,	2		, 		8	,'2021-04-04');
                                
-- TABLE 9: Answer                                
INSERT INTO Answer 				( Content		, QuestionID, 	isCorrect 	)
VALUES							('Trả lời 01'	,	 5		,	 'true'		),
								('Trả lời 02' 	,	 1		,	 'true'		),                          
								('Trả lời 03'	,	 5		,	 'false'	),
                                ('Trả lời 04'	,	 1 		,	 'true' 	),
                                ('Trả lời 05'	,	 2 		,	 'true' 	),
                                ('Trả lời 06'	,	 3	 	,	 'true' 	);
                               
-- TABLE 10: Exam
INSERT INTO Exam 				(	`Code`	 , 	Title 			, CategoryID	, Duration	, CreatorID , 	CreateDate	)
VALUES							('Railway01' , 'Exam C#' 		,		1 		,	60	 	, 	5		,	'2021-04-05'),
								('Railway02' , 'Exam Ruby' 		,		6 		,	60		, 	2		,	'2021-04-05'),
                                ('Railway03' , 'Exam C++' 		,		5 		,	120 	, 	2		,	'2021-04-07'),
                                ('Railway00' , 'Exam Java' 		,		6 		,	60		, 	3		,	'2021-04-08'),
                                ('Railway05' , 'Exam SQL' 		,		2 		,	60 		, 	7		,	'2021-04-05'),
                                ('Railway06' , 'Exam Postman,'	,		3 		,	60 		, 	8		,	'2021-04-07');                           

-- TABLE 11: ExamQuestion
INSERT INTO ExamQuestion		(ExamID	 , QuestionID )
VALUES 							(	1	 ,	 	6	  ),
								( 	2	 , 		5	  ),
                                ( 	3	 , 		4     ),
                                ( 	4	 , 		3 	  ),
                                ( 	5	 , 		3 	  ),
                                ( 	6	 , 		6	  );
      