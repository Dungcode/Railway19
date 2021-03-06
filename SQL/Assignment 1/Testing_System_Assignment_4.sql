
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
    -- =================>>> Question 3: Chu???n b??? data cho b??i 3 <<<=======================
    -- ============================= INSERT D??? LI???U ======================================

-- INSERT INTO  Department (DepartmentID, DepartmentName)
-- VALUES

-- TABLE 1:   Department  
INSERT INTO  Department	(	DepartmentName	)
VALUES					(	N'Gi??m ?????c'		),
						(	N'Th?? k??'		),
						(	N'Nh??n s???'		),
						(	N'H??nh Ch??nh'  	),
						(	N'T??i ch??nh' 	),
						(	N'Marketing'	),
						(	N'Sale'			),
						(	N'CSKH'			),
						(	N'Gi??m s??t' 	),
						(	N'B???o v???'		);
-- TABLE 2: Position
INSERT INTO Position 	(PositionName	)
VALUES 					('Dev' 			),
						('Test' 		),
						('Scrum Master'	),
						('PM' 			);
                        
-- -- table 3: `Account`	
INSERT INTO `Account`	(		Email			, 	Username		,	FullName			,DepartmentID 	, PositionID	, CreateDate )
VALUES 					('QuocViet@gmail.com'	,	'QuocViet'		,N'T??? Qu???c Vi???t'		, 		5		,		 1		,'2021-03-05'),
						('ThuyDung@gmail.com'	,	'ThuyDung'	 	,N'Ho??ng Th??y Dung'		, 		8		,		 2		,'2021-03-05'),
						('TuanAnh@gmail.com'	,	'TuanAnh'	 	,N'B??i Tu???n Anh'		, 		1		,		 2	 	,'2021-03-07'),
						('MinhHieu@gmail.com'	,	'MinhHieu'	 	,N'Ph???m Minh Hi???u'		, 		4		,		 4	 	, DEFAULT    ),
						('HuyenTrang@gmail.com'	, 	'HuyenTrang'	,N'Ph???m Th??? Huy???n Trang', 		2		,		 4	 	,'2021-03-10'),
						('??ucManh@gmail.com'	, 	'??ucManh'	 	,N'L?? ?????c M???nh'			, 		3		,		 3	 	,'2021-04-05'),
						('BichThao@gmail.com'	, 	'BichThao'	 	,N'????? Th??? B??ch Th???o'	, 		10		,		 2	 	, NULL		 ),
						('LanAnh@gmail.com'	 	, 	'LanAnh '	 	,N'Ch??? Th??? Lan Anh'		, 		9		,		 1	 	,'2021-04-07'),
						('VanHoa@gmail.com'	 	, 	'VanHoa '	 	,N'Tr???nh V??n H??a'		, 		7		,		 2	 	,'2021-04-07'),
						('MinhTrang@gmail.com' 	, 	'MinhTrang'	 	,N'T???ng Th??? Minh Trang'	, 		3 		,		 1		, DEFAULT 	 ),
						('ThiKhoe@gmail.com' 	, 	'ThiKhoe '	 	,N'L?? Th??? Kh???e'			, 		5	 	,		 4	 	,'2021-04-09'),
						('HaiCuong@gmail.com' 	, 	'HaiCuong'	 	,N'L???i H???i C?????ng'		, 		6 		,		 1	 	,'2021-03-08');

-- TABLE 4: Group
INSERT INTO `Group`		( GroupName		, CreatorID	 ,	CreateDate	)
VALUES 					(N'Tokyo'		, 	5		 ,	'2021-08-08'),
						(N'H?? n???i' 		, 	1		 ,	'2021-08-07'),
						(N'H?? T??nh' 	, 	2		 ,	'2021-08-09'),
						(N'H???i Ph??ng' 	, 	3		 ,	'2021-08-10'),
						(N'Th??i B??nh' 	, 	4		 ,	'2021-08-28'),
						(N'Qu???ng Ninh' 	, 	6		 ,	'2021-09-06'),
						(N'H??a B??nh'	, 	7		 ,	'2021-09-07'),
						(N'H?? Nam' 		, 	8		 ,	'2021-09-08'),
						(N'osaka ' 		, 	9		 ,	'2021-09-09'),
						(N'C?? Mau ' 	, 	10		 ,	'2021-09-10'); 
                        

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
VALUES 							(N'C??u h???i v??? Java'			, 		1 	,	1 		,		4	,'2021-04-05'),
								(N'Question v??? Ruby'		, 		10 	,	2		, 		1	,'2021-04-05'),
                                (N'C??u h???i v??? C#'			, 		5 	,	1 		, 		5	,'2021-04-06'),                       
                                (N'Question v??? C++'	 		, 		4 	,	1 		, 		7	,'2021-04-07'),
								(N'C??u h???i v??? JavaScript'	, 		6 	,	2 		, 		5	,'2021-04-08'),
                                (N'Question v??? C'	 		, 		7 	,	1 		, 		2	,'2021-04-09'),
                                (N'Question v??? C'	 		, 		7 	,	1 		, 		2	,'2021-04-09'),
                                (N'C??u h???i v??? PHP'	 		, 		9 	,	2		, 		5	,'2021-04-06'),
                                (N'Question v??? SQL' 		, 		2 	,	1		,		6	,'2021-04-03'),
                                (N'C??u h???i v??? Postman,'		, 		3 	,	2		, 		8	,'2021-04-04');
                                
-- TABLE 9: Answer                                
INSERT INTO Answer 				( Content		, QuestionID, 	isCorrect 	)
VALUES							(N'Tr??? l???i 01'	,	 5		,	 'false'	),
								(N'Tr??? l???i 02' 	,	 1		,	 'true'		),                          
								(N'Tr??? l???i 03'	,	 5		,	 'false'	),
                                (N'Tr??? l???i 04'	,	 1 		,	 'true' 	),
                                (N'Tr??? l???i 05'	,	 3		,	 'true' 	),
                                (N'Tr??? l???i 06'	,	 1 		,	 'false' 	),
                                (N'Tr??? l???i 07'	,	 5 		,	 'true' 	),
                                (N'Tr??? l???i 08'	,	 1 		,	 'false' 	),
                                (N'Tr??? l???i 09'	,	 2 		,	 'true' 	),
                                (N'Tr??? l???i 10'	,	 3	 	,	 'true' 	);
                               
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

--  Question 1: Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
-- SELECT			A.AccountID, A.FullName, D.DepartmentName 
-- FROM			Account A
-- JOIN			Department D on d.DepartmentID  = A.DepartmentID
-- ORDER BY		AccountID;

--  Question 2: Vi???t l???nh ????? l???y ra th??ng tin c??c account ???????c t???o sau ng??y 04/04/2021
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

-- Question 3: Vi???t l???nh ????? l???y ra t???t c??? c??c developer
-- SELECT			A.AccountID, A.FullName ,po.PositionName
-- FROM			Position Po
-- JOIN			Account A on A.PositionID = po.PositionID
-- WHERE			PositionName = 'Dev'
-- ;

-- Question 4: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >2 nh??n vi??n
-- SELECT 			de.DepartmentID, De.DepartmentName , count(1)
-- FROM			Department De
-- JOIN			Account A on A.DepartmentID = De.DepartmentID
-- GROUP BY		DepartmentID
-- HAVING			count(1)>1
-- ;
--  Question 5: Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u nh???t
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

--  Question 6: Th??ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question
-- 	SELECT		Q.CategoryID, CQ.CategoryName, COUNT(Q.CategoryID) as SO_QUESTION
--     FROM		CategoryQuestion CQ
--     JOIN		Question Q on CQ.CategoryID = Q.CategoryID
--     GROUP BY	Q.CategoryID
-- 	;
    
--  Question 7: Th??ng k?? m???i Question ???????c s??? d???ng trong bao nhi??u Exam

-- SELECT			Q.QuestionID, Q.Content, count(EQ.QuestionID) as SO_Exam
-- FROM			ExamQuestion EQ
-- JOIN			Question Q on EQ.QuestionID = Q.QuestionID
-- GROUP BY		Q.QuestionID;

-- SELECT			Q.QuestionID, Q.Content, count(EQ.QuestionID) as SO_Exam
-- FROM			ExamQuestion EQ
-- RIGHT JOIN		Question Q on EQ.QuestionID = Q.QuestionID
-- GROUP BY		Q.QuestionID;

--  Question 8: L???y ra Question c?? nhi???u c??u tr??? l???i nh???t

-- SELECT			Q.QuestionID, Q.Content , count(AnswerID) as SO_ANSWER
-- FROM			Question Q
-- JOIN			Answer A on A.QuestionID = Q.QuestionID
-- GROUP BY		QuestionID 
-- HAVING			count(AnswerID) = (SELECT max(countQ)
-- 									FROM (SELECT		Q.QuestionID, Q.Content , count(AnswerID) as countQ
-- 										FROM			Question Q
-- 										JOIN			Answer A on A.QuestionID = Q.QuestionID
-- 										GROUP BY		QuestionID ) as CountAnswer)                                                
                                                    
--  Question 9: Th???ng k?? s??? l?????ng account trong m???i group
-- SELECT			G.GroupID, G.GroupName, count(GA.AccountID) as SL_Account
-- FROM			`Group` G
-- LEFT JOIN		GroupAccount GA  on GA.GroupID = G.GroupID 
-- GROUP BY		G.GroupName
-- ;


--  Question 10: T??m ch???c v??? c?? ??t ng?????i nh???t
-- SELECT			P.PositionID, P.PositionName, count(AccountID) as MinAccount
-- FROM			Position P
-- JOIN			Account A on A.PositionID = P.PositionID
-- GROUP BY		P.PositionName
-- HAVING			count(AccountID) = (SELECT min(countA) 
-- 									FROM (SELECT			P.PositionID, P.PositionName, count(AccountID) as countA
-- 											FROM			Position P
-- 											JOIN			Account A on A.PositionID = P.PositionID
-- 											GROUP BY		P.PositionName) as countP);


--  Question 11: Th???ng k?? m???i ph??ng ban c?? bao nhi??u dev, test, scrum master, PM
-- SELECT			D.DepartmentID, D.DepartmentName, PO.PositionName , count(Po.PositionName) As so_Luong
-- FROM			Account A
-- JOIN			Department D on A.DepartmentID = D.DepartmentID
-- JOIN			Position PO on PO.PositionID =  A.PositionID
-- GROUP BY		DepartmentName,PositionName

--  Question 12: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m: th??ng tin c?? b???n c???a question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i, c??u tr??? l???i l?? g??, ...
-- SELECT			Q.QuestionID, Q.Content,TQ.TypeName, A.FullName, AN.Content
-- FROM			Question Q
-- LEFT JOIN			TypeQuestion TQ on TQ.TypeID = Q.TypeID
-- LEFT JOIN			Answer AN on AN.QuestionID = Q.QuestionID
-- LEFT JOIN			Account A on A.AccountID = Q.CreatorID

-- ;
-- SELECT *
-- FROM Account;

--  Question 13: L???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m
-- SELECT			TQ.TypeID, TQ.TypeName, count(TQ.TypeID)
-- FROM			TypeQuestion TQ
-- JOIN			Question Q on Q.TypeID = TQ.TypeID
-- GROUP BY		TypeID
-- ;
--  Question 14:L???y ra group kh??ng c?? account n??o
-- SELECT			G.GroupID, G.GroupName, GA.AccountID
-- FROM			GroupAccount GA
-- RIGHT JOIN		`Group` G on GA.GroupID = G.GroupID
-- GROUP BY		GroupID
-- HAVING			count(GA.AccountID) = 0
-- ;

--  Question 15: L???y ra group kh??ng c?? account n??o
--  Question 16: L???y ra question kh??ng c?? answer n??o           
-- SELECT			Q.QuestionID, Q.Content , AN.AnswerID
-- FROM			Question Q
-- LEFT JOIN		Answer AN on An.QuestionID = Q.QuestionID
-- GROUP BY		QuestionID
-- HAVING			count(AN.AnswerID) = 0
-- ;


-- ==============Exercise 2: Union=====================================
-- ====================================================================
--   =====>>>>>> Question 17:=======================================================

-- a) L???y c??c account thu???c nh??m th??? 1

-- SELECT			 GA.GroupID , A.*
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- WHERE			GroupID = 1
-- ;

-- -- b) L???y c??c account thu???c nh??m th??? 2

-- SELECT			 GA.GroupID , A.*
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- WHERE			GroupID = 2 
-- ;
-- c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b) sao cho kh??ng c?? record n??o tr??ng nhau

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

-- a) L???y c??c group c?? l???n h??n 1 th??nh vi??n

-- SELECT			 GA.GroupID , A.AccountID, count(A.AccountID) as SO_LUONG_ACC
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- GROUP BY		GroupID 
-- HAVING			count(A.AccountID) > 1
-- ;

--  b) L???y c??c group c?? nh??? h??n 7 th??nh vi??n
-- SELECT			 GA.GroupID , A.AccountID, count(A.AccountID) as SO_LUONG_ACC
-- FROM			Account A
-- JOIN			GroupAccount GA on GA.AccountID = A.AccountID
-- GROUP BY		GroupID 
-- HAVING			count(A.AccountID) < 2
-- ;
--  c) Gh??p 2 k???t qu??? t??? c??u a) v?? c??u b)        
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