-- Testing_System_Assignment_3


-- Testing_System_Assignment_2

-- =============>>> Question 1: Tối ưu lại assignment trước ====================
-- =============>>> Question 2: Thêm các constraint vào assignment trước =======
 
DROP DATABASE IF EXISTS TestingManagement;
CREATE DATABASE TestingManagement;
USE TestingManagement;

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
	FullName					VARCHAR(50)NOT NULL ,
    DepartmentID				TINYINT UNSIGNED  NOT NULL,
    PositionID					TINYINT UNSIGNED NOT NULL ,
	CreateDate					DATETIME DEFAULT NOW(),
	FOREIGN KEY (PositionID) REFERENCES Position (PositionID),
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- TABLE 4: Group
CREATE TABLE 	`Group`(
	GroupID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName					VARCHAR(50) NOT NULL,
	CreatorID					INT UNSIGNED NOT NULL UNIQUE KEY,
	CreateDate					DATETIME DEFAULT NOW(),
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
	Content						VARCHAR(50),
	CategoryID					TINYINT UNSIGNED,
	TypeID						INT UNSIGNED,
    CreatorID					TINYINT UNSIGNED,
	CreateDate					DATE
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
INSERT INTO  Department(DepartmentName)
VALUES					(	'Giám đốc'		),
						(	'Phó giám đốc'	),
						(	'Thư kí'		),
						(	'Nhân sự'		),
						(	'Kỹ thuật' 	 	),
						(	'Tài chính' 	),
						(	'Marketing'	 	),
						(	'Sale'			),
						(	'CSKH'			),
						(	'Giám sát' 		),
						(	'Bảo vệ'		);
-- TABLE 2: Position
INSERT INTO Position (PositionName )
VALUES 					('Dev' ),
						('Test' ),
						('Scrum Master'),
						('PM' );
                        
-- -- table 3: `Account`	
INSERT INTO `Account`	(Email , 			Username, 				FullName , 		DepartmentID , PositionID,CreateDate)
VALUES 					('Email1@gmail.com'	 ,	'QuocViet'		,'Tạ Quốc Việt'			, 	'5'		, '1'	,'2021-03-05'),
						('Email2@gmail.com'	 ,	'ThuyDung'	 	,'Hoàng Thùy Dung' 		, 	'1'		, '2'	,'2021-03-05'),
						('Email3@gmail.com'	 ,	'TuanAnh'	 	,'Bùi Tuấn Anh '		, 	'2' 	, '2' 	,'2021-03-07'),
						('Email4@gmail.com'	 ,	'MinhHieu'	 	,'Phạm Minh Hiếu '		, 	'3' 	, '4' 	,DEFAULT),
						('Email5@gmail.com'	 , 	'HuyenTrang'	,'Phạm Thị Huyền Trang'	, 	'4' 	, '4' 	,'2021-03-10'),
						('Email6@gmail.com'	 , 	'ĐucManh'	 	,'Lê Đức Mạnh'			, 	'6' 	, '3' 	,'2021-04-05'),
						('Email7@gmail.com'	 , 	'BichThao'	 	,'Đỗ Thị Bích Thảo'		, 	'2' 	, '2' 	, NULL ),
						('Email8@gmail.com'	 , 	'LanAnh '	 	,'Chử Thị Lan Anh '		, 	'8' 	, '1' 	,'2021-04-07'),
						('Email9@gmail.com'	 , 	'VanHoa '	 	,'Trịnh Văn Hóa '		, 	'2' 	, '2' 	,'2021-04-07'),
						('Email10@gmail.com' , 	'MinhTrang'	 	,'Tặng Thị Minh Trang'	, 	'10' 	, '1' 	,DEFAULT),
						('Email11@gmail.com' , 	'ThiKhoe '	 	,'Lê Thị Khỏe '			, 	'10' 	, '1' 	,'2021-04-09' ),
						('Email12@gmail.com' , 	'HaiCuong'	 	,'Lại Hải Cường' 		, 	'10' 	, '1' 	, '2021-03-08');

-- TABLE 4: Group
INSERT INTO `Group`		( GroupName , CreatorID ,CreateDate)
VALUES 					('Nhật Bản'		, 5	 ,'2021-05-08'),
						('Hà nội' 		, 1	 ,'2021-03-07'),
						('VTI Sale' 	, 2	 ,'2021-03-09'),
						('Hải Phòng' 	, 3	 ,'2021-03-10'),
						('Thái Bình' 	, 4	 ,'2021-03-28'),
						('VTI Creator' 	, 6	 ,'2021-04-06'),
						('VTI Marketing', 7	 ,'2021-04-07'),
						('Management' 	, 8	 ,'2021-04-08'),
						('Độ Mixi' 		, 9	 ,'2021-04-09'),
						('Railway ' 	, 10 ,'2021-04-10');
                        

 -- TABLE 5: GroupAccount
INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate )
VALUES 					( 	4 , 		1,		'2021-03-05'),
						(	2 , 		2,		'2021-03-07'),
						( 	3 , 		3,		'2021-03-09'),
						(	3 , 		4,		'2021-03-10'),
                        ( 	5 , 		3,		'2021-04-06'),
                        ( 	1 , 		7,		'2021-04-07'),
                        ( 	4 ,			9,		'2021-04-09'),
                        ( 	6 , 		5,		'2021-04-10');
-- TABLE 6: TypeQuestion                        
INSERT INTO TypeQuestion (TypeName )
VALUES 					('Essay' ),
						('Multiple-Choice' );
-- TABLE 7: CategoryQuestion                        
INSERT INTO CategoryQuestion	(	CategoryName )
VALUES 							(	'Java' ),
                                (	'SQL' ),
                                (	'Python' ),
                                (	'C++' ),
                                (	'C #' ),
                                (	'PHP' );
-- TABLE 8: Question 					
INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )
VALUES 							('Câu hỏi về Java'	, 1 	,1 , 2	,'2021-04-05'),
								('Câu Hỏi về PHP'	, 10 	,2 , 2	,'2021-04-05'),
                                ('Hỏi về C#'		, 9 	,2 , 3	,'2021-04-06'),                       
                                ('Hỏi về C++' 		, 8 	,1 , 8	,'2021-04-07'),
                                ('Hỏi về SQL' 		, 4 	,2 , 9	,'2021-04-07'),
                                ('Hỏi về Python' 	, 7 	,1 , 10 ,'2021-04-07');
-- TABLE 9: Answer                                
INSERT INTO Answer 			( Content		 , QuestionID , 	isCorrect )
VALUES							('Trả lời 01'	, 1		, 'true'),
								('Trả lời 02' 	, 1		, 'true'),                          
								('Trả lời 03'	, 1		, 'false'),
                                ('Trả lời 04'	, 1 	, 'true' ),
                                ('Trả lời 05'	, 2 	, 'true' ),
                                ('Trả lời 06'	, 3	 	, 'true' );
-- TABLE 10: Exam
INSERT INTO Exam 				(`Code`	   , 	Title , 		CategoryID, Duration , CreatorID , 	CreateDate )
VALUES							('VTIQ001' ,	'Đề thi C#' 		,1 	,	60	 	, 5		,'2019-04-05'),
								('VTIQ002' , 	'Đề thi PHP' 		,6 ,	60		, 2		,'2019-04-05'),
                                ('VTIQ003' ,	'Đề thi C++' 		, 5 ,	120 	, 2		,'2019-04-07'),
                                ('VTIQ004' , 	'Đề thi Java' 		, 6 ,	60		, 3		,'2020-04-08'),
                                ('VTIQ007' , 	'Đề thi SQL' 		, 2 ,	60 		, 7		,'2020-04-05'),
                                ('VTIQ008' , 	'Đề thi Python' 	, 3 ,	60 		, 8		,'2020-04-07');                           


-- TABLE 11: ExamQuestion
INSERT INTO ExamQuestion		(ExamID , QuestionID )
VALUES 							( 1 , 	6	),
								( 2 , 	5	),
                                ( 3 , 	4	),
                                ( 4 , 	3 	),
                                ( 5 , 	3 	),
                                ( 6 , 	6 	);
                               
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    