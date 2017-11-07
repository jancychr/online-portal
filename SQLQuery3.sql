USE [NPU]
GO
/****** Object:  Table [dbo].[tblstudentmarks]    Script Date: 03/20/2016 20:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblstudentmarks](
	[sno] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [bigint] NULL,
	[MarksSno] [int] NULL,
	[Marks] [int] NULL,
	[courseCode] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblstudent]    Script Date: 03/20/2016 20:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblstudent](
	[studentId] [bigint] IDENTITY(10000,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Pasword] [nvarchar](50) NULL,
	[statusbit] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblmarks]    Script Date: 03/20/2016 20:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblmarks](
	[Sno] [int] IDENTITY(1,1) NOT NULL,
	[Activity] [nvarchar](50) NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFaculty]    Script Date: 03/20/2016 20:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFaculty](
	[FacultyId] [bigint] IDENTITY(20000,1) NOT NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[pasword] [nvarchar](50) NULL,
	[statusbit] [bit] NULL,
	[courseCode] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcourses]    Script Date: 03/20/2016 20:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcourses](
	[sno] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](20) NULL,
	[CourseName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Student_save]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Student_save]  
@fname nvarchar(50) ,  
@lname nvarchar(50) ,  
@Gender  nvarchar(50) ,  
@Email  nvarchar(50) ,  
@Pasword  nvarchar(50) ,  
@studentId bigint out  
as  
declare @count int
select @count = COUNT(*) from tblstudent where Email = @Email 
if @count = 0
begin  
insert into tblstudent (fname,lname,Gender,Email,Pasword)values(@fname,@lname,@Gender,@Email,@Pasword)  
select @studentId = SCOPE_IDENTITY()  
end
else
begin
select 'Email Id Already Exist..!'
end
GO
/****** Object:  StoredProcedure [dbo].[Student_profile]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Student_profile]
@StudentId int
as
select * from tblstudent  where studentId = @StudentId
GO
/****** Object:  StoredProcedure [dbo].[Student_marks_Insert]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Student_marks_Insert]    
@StudentID bigint ,     
@MarksSno int ,    
@Marks int ,
@courseCode nvarchar(30)  
as    
begin    
declare @count int  
select @count = COUNT(*) from tblstudentmarks where StudentID = @StudentID and MarksSno = @MarksSno and courseCode = @courseCode
if @count = 0  
begin  
 insert into tblstudentmarks (StudentID,MarksSno,Marks,courseCode)values(@StudentID,@MarksSno,@Marks,@courseCode)    
end  
else   
begin  
 update tblstudentmarks set MarksSno = @MarksSno  where StudentID = @StudentID and MarksSno = @MarksSno   and courseCode = @courseCode
end   
end
GO
/****** Object:  StoredProcedure [dbo].[Student_Marks_Getall_sno]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Student_Marks_Getall_sno]    
@StudentID bigint ,     
@MarksSno int  ,
@courseCode nvarchar(30)  
as    
select isnull(marks,0) from tblstudentmarks where StudentID = @StudentID and MarksSno = @MarksSno and courseCode = @courseCode
GO
/****** Object:  StoredProcedure [dbo].[Student_Marks_AVG]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Student_Marks_AVG]      
@StudentID bigint ,       
@courseCode nvarchar(30)    
as      
select AVG(Marks) from tblstudentmarks where studentid = @StudentId and courseCode = @courseCode
GO
/****** Object:  StoredProcedure [dbo].[Student_login]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Student_login]
@studentId bigint,
@pasword nvarchar(50)
--@count int out
as
begin
select COUNT(*) from tblstudent where studentId = @studentId and Pasword = @pasword 
end
GO
/****** Object:  StoredProcedure [dbo].[Student_getall]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Student_getall]
as
select * from tblstudent
GO
/****** Object:  StoredProcedure [dbo].[student_changepassword]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[student_changepassword]
@studentID int,
@oldpwd nvarchar(50),
@newpwd nvarchar(50)
as
begin
declare @count int
select @count = COUNT(*) from  tblstudent where studentId = @studentID and Pasword =@oldpwd
if @count <> 0
	begin
		update tblstudent set Pasword =@newpwd   where studentId = @studentID 
	end

end
GO
/****** Object:  StoredProcedure [dbo].[Marks_save]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Marks_save]
@Activity nvarchar(50),
@Total int
as
begin
insert into tblmarks(Activity,Total)values(@Activity,@Total)
end
GO
/****** Object:  StoredProcedure [dbo].[Marks_Getall_stu]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Marks_Getall_stu]  
@StudentID int,
@courseCode nvarchar(30)  
as    
select a.Sno,a.Activity,a.Total,b.Marks from tblmarks as a left join tblstudentmarks as b on a.Sno = b.MarksSno where b.StudentID = @StudentID and b.courseCode = @courseCode
GO
/****** Object:  StoredProcedure [dbo].[Marks_Getall]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Marks_Getall]
as
select * from tblmarks
GO
/****** Object:  StoredProcedure [dbo].[Faculty_profile]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Faculty_profile]  
@FacultyId bigint   
as  
begin  
select a.FacultyId,a.fname,a.lname,a.gender,a.email,b.CourseCode,b.CourseName from tblfaculty as a join tblcourses as b on a.courseCode = b.CourseCode  where FacultyId =@FacultyId   
end
GO
/****** Object:  StoredProcedure [dbo].[Faculty_Login]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Faculty_Login]
@FacultyId bigint ,
@pasword nvarchar(50)
as
begin
select COUNT(*) from tblfaculty where FacultyId = @FacultyId and pasword =@pasword
end
GO
/****** Object:  StoredProcedure [dbo].[Faculty_Insert]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Faculty_Insert]    
@fname nvarchar(50),    
@lname nvarchar(50),    
@gender nvarchar(50),    
@email nvarchar(50),    
@pasword nvarchar(50),  
@courseCode nvarchar(50),  
@FacultyId bigint out    
as   
declare @count int
select @count = COUNT(*) from tblFaculty where Email = @Email 
if @count = 0 
begin    
insert into tblFaculty(fname,lname,gender,email,pasword,courseCode)values(@fname,@lname,@gender,@email,@pasword,@courseCode)    
select @FacultyId = SCOPE_IDENTITY()    
end 
else
begin
select 'Email Id Already Exist..!'
end
GO
/****** Object:  StoredProcedure [dbo].[faculty_changepassword]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[faculty_changepassword]
@facultyID int,
@oldpwd nvarchar(50),
@newpwd nvarchar(50)
as
begin
declare @count int
select @count = COUNT(*) from  tblFaculty where FacultyId = @facultyID and Pasword =@oldpwd
if @count <> 0
	begin
		update tblFaculty set Pasword =@newpwd   where FacultyId = @facultyID 
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Courses_getall]    Script Date: 03/20/2016 20:56:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Courses_getall]
as
begin
select * from tblcourses
end
GO
/****** Object:  Default [DF__tblFacult__statu__0425A276]    Script Date: 03/20/2016 20:56:28 ******/
ALTER TABLE [dbo].[tblFaculty] ADD  DEFAULT ((1)) FOR [statusbit]
GO
/****** Object:  Default [DF__tblstuden__statu__7E6CC920]    Script Date: 03/20/2016 20:56:28 ******/
ALTER TABLE [dbo].[tblstudent] ADD  DEFAULT ((1)) FOR [statusbit]
GO
