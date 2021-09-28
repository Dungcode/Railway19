
-- Testing_System_Assignment_4

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
						('BichThao@gmail.com'	, 	'BichThao'	 	,N'Đỗ Thị Bích Thảo'	, 		10		,		 2	 	, NULL		 ),
						('LanAnh@gmail.com'	 	, 	'LanAnh '	 	,N'Chử Thị Lan Anh'		, 		9		,		 1	 	,'2021-04-07'),
						('VanHoa@gmail.com'	 	, 	'VanHoa '	 	,N'Trịnh Văn Hóa'		, 		7		,		 2	 	,'2021-04-07'),
						('MinhTrang@gmail.com' 	, 	'MinhTrang'	 	,N'Tặng Thị Minh Trang'	, 		3 		,		 1		, DEFAULT 	 ),
						('ThiKhoe@gmail.com' 	, 	'ThiKhoe '	 	,N'Lê Thị Khỏe'			, 		5	 	,		 4	 	,'2021-04-09'),
						('HaiCuong@gmail.com' 	, 	'HaiCuong'	 	,N'Lại Hải Cường'		, 		6 		,		 1	 	,'2021-03-08');

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
								( 	1 		,		9	,'2021-10-05'),
								( 	1		, 		7	,'2021-10-07'),
								( 	2 		,		9	,'2021-10-09'),
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
								(N'Question về Ruby'		, 		10 	,	2		, 		1	,'2021-04-05'),
                                (N'Câu hỏi về C#'			, 		5 	,	1 		, 		5	,'2021-04-06'),                       
                                (N'Question về C++'	 		, 		4 	,	1 		, 		7	,'2021-04-07'),
								(N'Câu hỏi về JavaScript'	, 		6 	,	2 		, 		5	,'2021-04-08'),
                                (N'Question về C'	 		, 		7 	,	1 		, 		2	,'2021-04-09'),
                                (N'Question về C'	 		, 		7 	,	1 		, 		2	,'2021-04-09'),
                                (N'Câu hỏi về PHP'	 		, 		9 	,	2		, 		5	,'2021-04-06'),
                                (N'Question về SQL' 		, 		2 	,	1		,		6	,'2021-04-03'),
                                (N'Câu hỏi về Postman,'		, 		3 	,	2		, 		8	,'2021-04-04');
                                
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
                                ( 		8 	  ),
                                ( 		8 	  ),
                                ( 		1	  );
--                                
-- =========================== Exercise 1: Join =======================================
-- ====================================================================================

--  Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
-- SELECT			A.AccountID, A.FullName, D.DepartmentName 
-- FROM			Account A
-- JOIN			Department D on d.DepartmentID  = A.DepartmentID
-- ORDER BY		AccountID;

--  Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 04/04/2021
-- SELECT			*
-- FROM			Account
-- WHERE			CreateDate > '2021-04-04'
-- ;

-- SELECT			A.*	,DE.DepartmentName , po.PositionName, G.GroupName
-- FROM			Account A
-- JOIN			Department DE on DE.DepartmentID  = A.DepartmentID
-- JOIN			Position po on po.PositionID = A.PositionID
-- JOIN			`Group` G on G.CreatorID = A.AccountID
-- WHERE			A.CreateDate > '2021-04-04'	
-- ;

-- Question 3: Viết lệnh để lấy ra tất cả các developer
-- SELECT			A.AccountID, A.FullName ,po.PositionName
-- FROM			Position Po
-- JOIN			Account A on A.PositionID = po.PositionID
-- WHERE			PositionName = 'Dev'
-- ;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên
-- SELECT 			de.DepartmentID, De.DepartmentName , count(1)
-- FROM			Department De
-- JOIN			Account A on A.DepartmentID = De.DepartmentID
-- GROUP BY		DepartmentID
-- HAVING			count(1)>1
-- ;
--  Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
-- SELECT			Q.QuestionID, Q.Content ,  count(1) as 'SO_LAN_SU_DUNG'
-- FROM			ExamQuestion EQ
-- JOIN			Question Q on Q.QuestionID = EQ.QuestionID
-- GROUP BY		Q.Content
-- HAVING			count(Q.Content) = ( SELECT		MAX(countQ)
-- 									 FROM  (SELECT	COUNT(Q.QuestionID) as CountQ
-- 											FROM	ExamQuestion EQ
--                                             JOIN	Question Q on Q.QuestionID = EQ.QuestionID
--                                             GROUP BY	Q.QuestionID) as MaxContent);

-- SELECT 			E.QuestionID, Q.Content, count(1) as 'LAN_SU_DUNG' FROM examquestion E
-- INNER JOIN 		question Q ON Q.QuestionID = E.QuestionID
-- GROUP BY 		E.QuestionID
-- HAVING 			count(E.QuestionID) = (SELECT MAX(countQues) as maxcountQues 
-- 										FROM (	SELECT 			COUNT(E.QuestionID) AS countQues 
--                                         FROM examquestion E
-- 												GROUP BY 		E.QuestionID) AS countTable);

--  Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
-- 	SELECT		Q.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID) as SO_QUESTION
--     FROM		CategoryQuestion CQ
--     JOIN		Question Q on CQ.CategoryID = Q.CategoryID
--     GROUP BY	Q.CategoryID
-- 	;
    
--  Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

-- SELECT			Q.QuestionID, Q.Content, count(EQ.QuestionID) as SO_Exam
-- FROM			ExamQuestion EQ
-- JOIN			Question Q on EQ.QuestionID = Q.QuestionID
-- GROUP BY		Q.QuestionID;

-- SELECT			Q.QuestionID, Q.Content, count(EQ.QuestionID) as SO_Exam
-- FROM			ExamQuestion EQ
-- RIGHT JOIN		Question Q on EQ.QuestionID = Q.QuestionID
-- GROUP BY		Q.QuestionID;

--  Question 8: Lấy ra Question có nhiều câu trả lời nhất

-- SELECT			Q.QuestionID, Q.Content , count(AnswerID) as SO_ANSWER
-- FROM			Question Q
-- JOIN			Answer A on A.QuestionID = Q.QuestionID
-- GROUP BY		QuestionID 
-- HAVING			count(AnswerID) = (SELECT max(countQ)
-- 									FROM (SELECT		Q.QuestionID, Q.Content , count(AnswerID) as countQ
-- 										FROM			Question Q
-- 										JOIN			Answer A on A.QuestionID = Q.QuestionID
-- 										GROUP BY		QuestionID ) as CountAnswer)                                                
                                                    
--  Question 9: Thống kê số lượng account trong mỗi group
-- SELECT			G.GroupID, G.GroupName, count(GA.AccountID) as SL_Account
-- FROM			`Group` G
-- LEFT JOIN		GroupAccount GA  on GA.GroupID = G.GroupID 
-- GROUP BY		G.GroupName
-- ;


--  Question 10: Tìm chức vụ có ít người nhất
-- SELECT			P.PositionID, P.PositionName, count(AccountID) as MinAccount
-- FROM			Position P
-- JOIN			Account A on A.PositionID = P.PositionID
-- GROUP BY		P.PositionName
-- HAVING			count(AccountID) = (SELECT min(countA) 
-- 									FROM (SELECT			P.PositionID, P.PositionName, count(AccountID) as countA
-- 											FROM			Position P
-- 											JOIN			Account A on A.PositionID = P.PositionID
-- 											GROUP BY		P.PositionName) as countP);


--  Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- SELECT			D.DepartmentID, D.DepartmentName, PO.PositionName , count(Po.PositionName) As so_Luong
-- FROM			Account A
-- JOIN			Department D on A.DepartmentID = D.DepartmentID
-- JOIN			Position PO on PO.PositionID =  A.PositionID
-- GROUP BY		DepartmentName,PositionName

--  Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
-- SELECT			Q.QuestionID, Q.Content,TQ.TypeName, A.FullName, AN.Content
-- FROM			Question Q
-- LEFT JOIN			TypeQuestion TQ on TQ.TypeID = Q.TypeID
-- LEFT JOIN			Answer AN on AN.QuestionID = Q.QuestionID
-- LEFT JOIN			Account A on A.AccountID = Q.CreatorID

-- ;
-- SELECT *
-- FROM Account;

--  Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
-- SELECT			TQ.TypeID, TQ.TypeName, count(TQ.TypeID)
-- FROM			TypeQuestion TQ
-- JOIN			Question Q on Q.TypeID = TQ.TypeID
-- GROUP BY		TypeID
-- ;
--  Question 14:Lấy ra group không có account nào
-- SELECT			G.GroupID, G.GroupName, GA.AccountID
-- FROM			GroupAccount GA
-- RIGHT JOIN		`Group` G on GA.GroupID = G.GroupID
-- GROUP BY		GroupID
-- HAVING			count(GA.AccountID) = 0
-- ;

--  Question 15: Lấy ra group không có account nào
--  Question 16: Lấy ra question không có answer nào           
-- SELECT			Q.QuestionID, Q.Content , AN.AnswerID
-- FROM			Question Q
-- LEFT JOIN		Answer AN on An.QuestionID = Q.QuestionID
-- GROUP BY		QuestionID
-- HAVING			count(AN.AnswerID) = 0
-- ;


-- ==============Exercise 2: Union=====================================
-- ====================================================================
--   =====>>>>>> Question 17:=======================================================

-- a) Lấy các account thuộc nhóm thứ 1

-- SELECT			 GA.GroupID , A.*
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- WHERE			GroupID = 1
-- ;

-- -- b) Lấy các account thuộc nhóm thứ 2

-- SELECT			 GA.GroupID , A.*
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- WHERE			GroupID = 2 
-- ;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

-- SELECT			A.*
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- WHERE			GroupID = 1

-- UNION

-- SELECT			A.*
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- WHERE			GroupID = 2 
-- ;

-- Question18: ======================================================

-- a) Lấy các group có lớn hơn 1 thành viên

-- SELECT			 GA.GroupID , A.AccountID, count(A.AccountID) as SO_LUONG_ACC
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- GROUP BY		GroupID 
-- HAVING			count(A.AccountID) > 1
-- ;

--  b) Lấy các group có nhỏ hơn 7 thành viên
-- SELECT			 GA.GroupID , A.AccountID, count(A.AccountID) as SO_LUONG_ACC
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- GROUP BY		GroupID 
-- HAVING			count(A.AccountID) < 2
-- ;
--  c) Ghép 2 kết quả từ câu a) và câu b)        
-- SELECT			 GA.GroupID , A.AccountID, count(A.AccountID) as SO_LUONG_ACC
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- GROUP BY		GroupID 
-- HAVING			count(A.AccountID) > 1

-- UNION ALL

-- SELECT			 GA.GroupID , A.AccountID, count(A.AccountID) as SO_LUONG_ACC
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- GROUP BY		GroupID 
-- HAVING			count(A.AccountID) < 2
-- ;