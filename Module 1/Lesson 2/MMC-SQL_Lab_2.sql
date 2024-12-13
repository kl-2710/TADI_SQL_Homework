USE testing_system_db;

INSERT INTO _Department(DepartmentID, DepartmentName)
VALUES
						(1, 'Nhân sự'),
                        (2, 'Kinh doanh'),
                        (3, 'Kế toán'),
                        (4, 'Marketing'),
                        (5, 'Tài chính');
                        
INSERT INTO _Position(PositionID, PositionName)
VALUES
						(1, 'Dev'),
                        (2, 'Test'),
                        (3, 'PM'),
                        (4, 'Scrum Master');
                        
INSERT INTO _Account(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate) 	
VALUES
						(1, 'clinton.jast@gmail.com', 'harry_clint', 'Harry Clinton', 1, 3, '2023-2-14'),
						(2, 'william53@gmail.com', 'will53', 'William Smith', 4, 2, '2024-1-10'),
                        (3, 'edmund_krajcik@gmail.com', 'eddie', 'Owen Rodriguez', 5, 1, '2015-3-23'),
                        (4, 'madelynn.miller69@gmail.com', 'madd1001', 'Madelyn Miller', 2, 4, '2020-6-30'),
                        (5, 'naomie_schowalter@gmail.com', 'naomiee', 'Naomi Morales', 3, 2, '2022-10-27');
                        
INSERT INTO _Group (GroupID, GroupName, CreatorID, CreateDate) 
VALUES 
						(1, 'Development Team', 1, '2024-06-01'),
						(2, 'Testing Team', 2, '2024-06-02'),
						(3, 'Scrum Team', 3, '2024-06-03'),
						(4, 'Project Management', 4, '2024-06-04'),
						(5, 'Sales Team', 5, '2024-06-05');
                        
INSERT INTO _GroupAccount (GroupID, AccountID, JoinDate) 
VALUES 
						(1, 1, '2024-06-10'),
						(1, 2, '2024-06-11'),
						(2, 3, '2024-06-12'),
						(3, 4, '2024-06-13'),
						(4, 5, '2024-06-14');

INSERT INTO _TypeQuestion (TypeID, TypeName) 
VALUES 
						(1, 'Essay'), 
						(2, 'Multiple-Choice');
                        
INSERT INTO _Category (CategoryID, CategoryName) 
VALUES 
						(1, 'Java'),
						(2, '.NET'),
						(3, 'SQL'),
						(4, 'Python'),
						(5, 'Ruby');
                        
INSERT INTO _Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate) 
VALUES 
						(1, 'What is JVM and its role in Java?', 1, 1, 1, '2024-06-01'),
						(2, 'Explain the difference between List and Tuple in Python.', 4, 1, 2, '2024-06-02'),
						(3, 'What is .NET primarily used for? A. For building web applications. B. For building mobile applications only. C. For building desktop applications. D. For building both web and desktop applications.', 2, 2, 3, '2024-06-03'),
						(4, 'Write an SQL query to find the second highest salary.', 3, 1, 4, '2024-06-04'),
						(5, 'Explain blocks and Procs in Ruby with examples.', 5, 1, 5, '2024-06-05');
    
INSERT INTO _Answer (AnswerID, Content, QuestionID, isCorrect) 
VALUES 
						(1, 'The JVM executes Java bytecode and ensures platform independence.', 1, 'Đúng'),
						(2, 'Tuples can hold only numeric values.', 2, 'Sai'),
						(3, 'B', 3, 'Sai'),
						(4, 'SELECT MAX(Salary) FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee);', 4, 'Đúng'),
						(5, 'Blocks and Procs are the same in Ruby.', 5, 'Sai');

INSERT INTO _Exam (ExamID, CodeExam, Title, CategoryID, Duration, CreatorID, CreateDate) 
VALUES 
    (1, 'E1', 'Java Basics', 1, '90 phút', 1, '2024-06-06'),
    (2, 'E2', 'Python Advanced', 4, '120 phút', 2, '2024-06-07'),
    (3, 'E3', 'SQL Queries', 3, '60 phút', 3, '2024-06-08'),
    (4, 'E4', '.NET Core Overview', 2, '90 phút', 4, '2024-06-09'),
    (5, 'E5', 'Ruby Programming', 5, '120 phút', 5, '2024-06-10');

INSERT INTO _ExamQuestion (ExamID, QuestionID) 
VALUES 
    (1, 5), 
    (2, 4), 
    (3, 3), 
    (4, 2), 
    (5, 1);