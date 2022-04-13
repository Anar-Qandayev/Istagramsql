CREATE DATABASE INSTAGRAM
USE INSTAGRAM

CREATE TABLE Post
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Content nvarchar(255),
SharedTime date , 
UserId int references [User](Id),
LikeCount int,
IsDeleted BIT
)

INSERT INTO Post(Content,SharedTime,UserId,LikeCount)
VALUES('STUDENT','2022-04-12' ,1,1000)
SELECT*FROM Post

CREATE TABLE [User]
(
Id INT IDENTITY(1,1) PRIMARY KEY,
[Login] NVARCHAR(60),
[Password] NVARCHAR(50),
Mail NVARCHAR(60)
)

INSERT INTO [User](Login,Password,Mail)
VALUES('anar_ilqaroglu','anar123','anar@gmail.com')
SELECT*FROM [User]

CREATE TABLE Comment
(
Id INT IDENTITY(1,1) PRIMARY KEY,
UserId int references [User](Id),
PostId int references Post(Id),
LikeComent int ,
IsDeleted bit
)

INSERT INTO Comment(UserId,PostId,LikeComent)
VALUES(1,1,200)
SELECT*FROM Comment
CREATE VIEW dbo.uv_Comment

AS

 SELECT LikeComent

 FROM dbo.Comment

 WHERE IsDeleted = 0

CREATE TABLE People
(
Id INT IDENTITY(1,1) PRIMARY KEY,
 Name nvarchar(50),
 SurName nvarchar(50),
 Age int
)

INSERT INTO People(Name,SurName,Age)
VALUES('Elvin', 'Mirzeyev',21)
SELECT*FROM People

CREATE VIEW GetFullPostInfo
AS
SELECT u.[Login],c.LikeComent,e.Name as 'People'
FROM Post AS p
JOIN [User] AS u
ON p.UserId=u.Id
JOIN Comment as c
On p.Id=c.Id
JOIN People as e
On p.Id=e.Id

SELECT*FROM GetFullPostInfo