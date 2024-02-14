
create database class

use class

create table Students(
	Id int primary key identity,
	[Name] nvarchar(50) not null,
	Surname nvarchar(55) not null default 'XXXXXX'

)

create table Subjects(
	Id int primary key identity,
	[Name] nvarchar(50) not null,

)

create table Exams(
	Id int primary key identity,
	[Date] date, 
	SubjectId int foreign key references Subjects(id)
)

create table StudentExams(
	Id int primary key identity,
	ExamResult decimal(4,1),
	StudentId int foreign key references Students(Id),
	ExamsId int foreign key references Exams(Id)

)

SELECT st.Name, st.Surname, su.Name as 'Subject', e.Date, se.ExamResult
from StudentExams AS se
JOIN Students AS st
ON se.StudentId = st.Id
JOIN Exams AS e
ON se.ExamsId = e.Id
JOIN Subjects AS su
ON e.SubjectId = su.Id



