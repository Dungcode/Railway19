-- Testing_System_Assignment_3
DROP DATABASE IF EXISTS TestingManagement;
CREATE DATABASE TestingManagement;
USE TestingManagement;

-- TABLE 1
CREATE TABLE	 Department(
	DepartmentID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName				VARCHAR(50)
);
-- TABLE 2
CREATE TABLE 	Position (
	PositionID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName				ENUM('Dev', 'Test','Scrum Master','PM')
);

-- TABLE 3
CREATE TABLE 	`Account`(
	AccountID					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email						VARCHAR(50),
	Username					VARCHAR(50)  CHECK (LENGTH(Username) >= 6),
	FullName					VARCHAR(50),
    DepartmentID				TINYINT UNSIGNED,
    PositionID					TINYINT UNSIGNED,
	CreateDate					DATETIME DEFAULT NOW(),
	FOREIGN KEY (PositionID) REFERENCES Position (PositionID),
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- TABLE 4
CREATE TABLE 	`Group`(
	GroupID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName					VARCHAR(50),
	CreatorID					INT UNSIGNED,
	CreateDate					DATETIME,
    FOREIGN KEY(CreatorID) REFERENCES`Account`(AccountID)
	);

-- TABLE 5
CREATE TABLE 	GroupAccount(
	GroupID						TINYINT UNSIGNED ,
	AccountID					INT UNSIGNED,
	JoinDate					DATE,
	FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
	FOREIGN KEY(AccountID)REFERENCES `Account`(AccountID)
);    
    
-- TABLE 6
CREATE TABLE 	TypeQuestion(
	TypeID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName					ENUM("Essay", "Multiple-Choice")
);       
    -- TABLE 7
CREATE TABLE 	CategoryQuestion(
	CategoryID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName				VARCHAR(50)
); 
    -- TABLE 8
CREATE TABLE 	Question(
	QuestionID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content						VARCHAR(50),
	CategoryID					TINYINT UNSIGNED,
	TypeID						INT UNSIGNED,
    CreatorID					TINYINT UNSIGNED,
	CreateDate					DATE
);
   -- TABLE 9
CREATE TABLE 	Answer(
	AnswerID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content						VARCHAR(50),
	QuestionID					TINYINT UNSIGNED,
	isCorrect					ENUM("true","false"),
   	FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);
	-- TABLE 10
CREATE TABLE 	Exam(
	ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code`						VARCHAR(50),
	Title						VARCHAR(50),
	CategoryID					INT UNSIGNED,
    Duration					INT,
	CreatorID					INT,
	CreateDate					DATE
);
 	-- TABLE 11
CREATE TABLE 	ExamQuestion(
	ExamID						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	QuestionID					TINYINT UNSIGNED,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
	FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);   
    
    -- Question 3: Chuẩn bị data cho bài 3
    
-- INSERT INTO  Department (DepartmentID, DepartmentName)
-- VALUES
    
    
INSERT INTO  Department(DepartmentID,DepartmentName)
VALUES					(1	,		N'Marketing'	 ),
						(2	,		N'Sale' 		 ),
						(3	,		N'Bảo vệ'		 ),
						(4	,		N'Nhân sự'		 ),
						(5	,		N'Kỹ thuật' 	 ),
						(6	,		N'Tài chính' 	 ),
						(7	,		N'Phó giám đốc'	 ),
						(8	,		N'Giám đốc'		 ),
						(9	,		N'Thư kí'		 ),
						(10	,		N'No person' 	 ),
						(11	,		N'Bán hàng'		 );
INSERT INTO Position (PositionName )
VALUES 					('Dev' ),
						('Test' ),
						('Scrum Master'),
						('PM' );
INSERT INTO `Account`	(Email , 			Username, 		FullName , DepartmentID , PositionID,CreateDate)
VALUES 					('Email1@gmail.com'	 ,'Username1'	 ,'Fullname1'	, 	'5'		, '1'	,'2020-03-05'),
						('Email2@gmail.com'	 ,'Username2'	 ,'Fullname2' 	, 	'1'		, '2'	,'2020-03-05'),
						('Email3@gmail.com'	 ,'Username3'	 ,'Fullname3'	, 	'2' 	, '2' 	,'2020-03-07'),
						('Email4@gmail.com'	 , 'Username4'	 ,'Fullname4'	, 	'3' 	, '4' 	,'2020-03-08'),
						('Email5@gmail.com'	 , 'Username5'	 ,'Fullname5'	, 	'4' 	, '4' 	,'2020-03-10'),
						('Email6@gmail.com'	 , 'Username6'	 ,'Fullname6'	, 	'6' 	, '3' 	,'2020-04-05'),
						('Email7@gmail.com'	 , 'Username7'	 ,'Fullname7'	, 	'2' 	, '2' 	, NULL ),
						('Email8@gmail.com'	 , 'Username8'	 ,'Fullname8'	, 	'8' 	, '1' 	,'2020-04-07'),
						('Email9@gmail.com'	 , 'Username9'	 ,'Fullname9'	, 	'2' 	, '2' 	,'2020-04-07'),
						('Email10@gmail.com' , 'Username10'	 ,'Fullname10'	, 	'10' 	, '1' 	,'2020-04-09'),
						('Email11@gmail.com' , 'Username11'	 ,'Fullname11'	, 	'10' 	, '1' 	, DEFAULT),
						('Email12@gmail.com' , 'Username12'	 ,'Fullname12' 	, 	'10' 	, '1' 	, DEFAULT);
INSERT INTO `Group`		( GroupName , CreatorID , CreateDate)
VALUES 					(N'Testing System'	, 5	 ,'2019-03-05'),
						(N'Development' 	, 1	 ,'2020-03-07'),
						(N'VTI Sale 01' 	, 2	 ,'2020-03-09'),
						(N'VTI Sale 02' 	, 3	 ,'2020-03-10'),
						(N'VTI Sale 03' 	, 4	 ,'2020-03-28'),
						(N'VTI Creator' 	, 6	 ,'2020-04-06'),
						(N'VTI Marketing 01', 7	 ,'2020-04-07'),
						(N'Management' 		, 8	 ,'2020-04-08'),
						(N'Chat with love' 	, 9	 ,'2020-04-09'),
						(N'Vi Ti Ai' 		, 10 ,'2020-04-10');
INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate )
VALUES 					( 1 , 	1,	'2019-03-05'),
						( 1 , 	2,	'2020-03-07'),
						( 3 , 	3,	'2020-03-09'),
						( 3 , 	4,	'2020-03-10'),
						( 5 , 	5,	'2020-03-28'),
                        ( 1 , 	3,	'2020-04-06'),
                        ( 1 , 	7,	'2020-04-07'),
                        ( 8 ,	3,	'2020-04-08'),
                        ( 1 ,	9,	'2020-04-09'),
                        ( 10 , 	10,	'2020-04-10');
                        
INSERT INTO TypeQuestion (TypeName )
VALUES 					('Essay' ),
						('Multiple-Choice' );
INSERT INTO CategoryQuestion	(CategoryID,	CategoryName )
VALUES 							(1		,		'Java' ),
								(2		,		'ASP.NET' ),
                                (3		,		'ADO.NET' ),
                                (4		,		'SQL' ),
                                (5		,		'Postman' ),
                                (6		,		'Ruby' ),
                                (7		,		'Python' ),
                                (8		,		'C++' ),
                                (9		,		'C Sharp' ),
                                (10		,		'PHP' );
INSERT INTO Question (Content , CategoryID, TypeID , CreatorID, CreateDate )
VALUES 							(N'Câu hỏi về Java'	, 1 	,'1' , '2' ,'2020-04-05'),
								(N'Câu Hỏi về PHP'	, 10 	,'2' , '2' ,'2020-04-05'),
                                (N'Hỏi về C#'		, 9 	,'2' , '3' ,'2020-04-06'),                       
								(N'Hỏi về Ruby' 	, 6		,'1' , '4' ,'2020-04-06'),
                                (N'Hỏi về Postman' 	, 5 	,'1' , '5' ,'2020-04-06'),
                                (N'Hỏi về ADO.NET' 	, 3 	,'2' , '6' ,'2020-04-06'),
                                (N'Hỏi về ASP.NET' 	, 2 	,'1' , '7' ,'2020-04-06'),
                                (N'Hỏi về C++' 		, 8 	,'1' , '8' ,'2020-04-07'),
                                (N'Hỏi về SQL' 		, 4 	,'2' , '9' ,'2020-04-07'),
                                (N'Hỏi về Python' 	, 7 	,'1' , '10' ,'2020-04-07');
INSERT INTO Answer 			( Content		 , QuestionID , 	isCorrect )
VALUES							(N'Trả lời 01'	, 1		, "true"),
								(N'Trả lời 02' 	, 1		, "true"),                          
								(N'Trả lời 03'	, 1		, "false"),
                                (N'Trả lời 04'	, 1 	, "true" ),
                                (N'Trả lời 05'	, 2 	, "true" ),
                                (N'Trả lời 06'	, 3	 	, "true" ),
                                (N'Trả lời 07'	, 4 	, "false" ),
                                (N'Trả lời 08'	, 8		,"false" ),
                                (N'Trả lời 09'	, 9 	, "true" ),
                                (N'Trả lời 10'	, 10 	, "true"  );
INSERT INTO Exam (`Code` , Title , CategoryID, 		Duration , 		CreatorID , 		CreateDate )
VALUES							('VTIQ001' ,	N'Đề thi C#' 		,1 	,	60	 	, '5'	,'2019-04-05'),
								('VTIQ002' , 	N'Đề thi PHP' 		,10 ,	60		, '2'	,'2019-04-05'),
                                ('VTIQ003' ,	N'Đề thi C++' 		, 9 ,	120 	, '2'	,'2019-04-07'),
                                ('VTIQ004' , 	N'Đề thi Java' 		, 6 ,	60		, '3'	,'2020-04-08'),
                                ('VTIQ005' ,	N'Đề thi Ruby'		, 5 ,	120		, '4'	,'2020-04-10'),
                                ('VTIQ006' , 	N'Đề thi Postman' 	, 3 ,	60 		, '6'	,'2020-04-05'),
                                ('VTIQ007' , 	N'Đề thi SQL' 		, 2 ,	60 		, '7'	,'2020-04-05'),
                                ('VTIQ008' , 	N'Đề thi Python' 	, 8 ,	60 		, '8'	,'2020-04-07'),                               
								('VTIQ009' , 	N'Đề thi ADO.NET' 	, 4 ,	90 		, '9'	,'2020-04-07'),
                                ('VTIQ010' , 	N'Đề thi ASP.NET' 	, 7 ,	90 		, '10'	,'2020-04-08');

INSERT INTO ExamQuestion		(ExamID , QuestionID )
VALUES 							( 1 , 	5	),
								( 2 , 	10	),
                                ( 3 , 	4	),
                                ( 4 , 	3 	),
                                ( 5 , 	7 	),
                                ( 6 , 	10 	),
                                ( 7 , 	2 	),
                                ( 8 , 	10 	),
                                ( 9 ,	9 	),
                                ( 10 ,	8 	);
    
    
    
    
    
    
    
    
    
    
    
    
    