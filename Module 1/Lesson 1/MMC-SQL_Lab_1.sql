DROP DATABASE IF EXISTS 		Testing_System_Db;
CREATE DATABASE IF NOT EXISTS 	Testing_System_Db;
USE 							Testing_System_Db;

DROP TABLE IF EXISTS 	_Department;
CREATE TABLE 			_Department
(
	DepartmentID 	TINYINT AUTO_INCREMENT PRIMARY KEY,
	DepartmentName 	NVARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS 	_Position;
CREATE TABLE 			_Position
(
	PositionID 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    PositionName 	ENUM('Dev','Test','Scrum Master','PM')
);

DROP TABLE IF EXISTS 	_Account;
CREATE TABLE 			_Account
(
	AccountID 		SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Email 			VARCHAR(30),
    Username 		VARCHAR(30),
    FullName 		NVARCHAR(30),
    DepartmentID 	TINYINT,
	PositionID 		TINYINT,
    CreateDate 		DATE NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES _Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES _Position(PositionID)
);

DROP TABLE IF EXISTS 	_Group;
CREATE TABLE 			_Group
(
	GroupID 	SMALLINT PRIMARY KEY AUTO_INCREMENT,
    GroupName 	NVARCHAR(255) NOT NULL,
    CreatorID 	SMALLINT,
    CreateDate 	DATE,
    FOREIGN KEY (CreatorID) REFERENCES _Account(AccountID)
);

DROP TABLE IF EXISTS 	_GroupAccount;
CREATE TABLE 			_GroupAccount
(
	GroupID 	SMALLINT,
    AccountID 	SMALLINT,
    JoinDate 	DATE NOT NULL,
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (GroupID) REFERENCES _Group(GroupID),
	FOREIGN KEY (AccountID) REFERENCES _Account(AccountID)
);
-- Đoạn này em muốn thêm ràng buộc _Account(CreateDate) < _GroupAccount(JoinDate) thì phải làm thế nào ạ? Em dùng ChatGPT thì được gợi ý là dùng TRIGGER nhưng em không hiểu lắm ạ :<

DROP TABLE IF EXISTS 	_TypeQuestion;
CREATE TABLE 			_TypeQuestion
(
	TypeID 		TINYINT PRIMARY KEY AUTO_INCREMENT,
    TypeName 	ENUM('Essay','Multiple-Choice')
);

DROP TABLE IF EXISTS 	_Category;
CREATE TABLE 			_Category
(
	CategoryID 		TINYINT PRIMARY KEY AUTO_INCREMENT,
    CategoryName 	VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS 	_Question;
CREATE TABLE 			_Question
(
	QuestionID 	SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Content 	NVARCHAR(255) NOT NULL,
    CategoryID 	TINYINT,
    TypeID 		TINYINT,
    CreatorID 	SMALLINT,
    CreateDate 	DATE,
    FOREIGN KEY (CategoryID) REFERENCES _Category(CategoryID),
	FOREIGN KEY (TypeID) REFERENCES _TypeQuestion(TypeID),
	FOREIGN KEY (CreatorID) REFERENCES _Account(AccountID)
);

DROP TABLE IF EXISTS 	_Answer;
CREATE TABLE 			_Answer
(
	AnswerID 	SMALLINT PRIMARY KEY AUTO_INCREMENT,
    Content 	NVARCHAR(2000) NOT NULL,
    QuestionID 	SMALLINT,
    isCorrect 	ENUM('Đúng', 'Sai'),
    FOREIGN KEY (QuestionID) REFERENCES _Question(QuestionID)
);

DROP TABLE IF EXISTS 	_Exam;
CREATE TABLE 			_Exam
(
	ExamID 		TINYINT PRIMARY KEY AUTO_INCREMENT,
    CodeExam 	VARCHAR(2) NOT NULL,
    Title 		NVARCHAR(255) NOT NULL,
    CategoryID 	TINYINT,
    Duration	NVARCHAR(8), -- vd: "120 phút", "90 phút", ...
    CreatorID	SMALLINT,
    CreateDate	DATE,
	FOREIGN KEY (CreatorID) REFERENCES _Account(AccountID)
);

DROP TABLE IF EXISTS 	_ExamQuestion;
CREATE TABLE 			_ExamQuestion
(
	ExamID 		TINYINT,
    QuestionID 	SMALLINT,
	FOREIGN KEY (ExamID) REFERENCES _Exam(ExamID),
	FOREIGN KEY (QuestionID) REFERENCES _Question(QuestionID)
);