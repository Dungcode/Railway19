-- Testing_System_Assignment_1
   
DROP DATABASE IF EXISTS TestingManagement;
CREATE DATABASE TestingManagement;
USE TestingManagement;

-- TABLE 1
CREATE TABLE	 Department(
	DepartmentID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName				VARCHAR(50)
);
-- TABLE 2 : Position
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
	TypeName					ENUM('Essay', 'Multiple-Choice')
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
 
    
    
    
    