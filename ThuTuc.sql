USE ProjectManager_Real
GO
--Start Member
CREATE PROC getAllMember
AS SELECT * FROM Member Where is_deleted = 0
GO

CREATE PROC addMember(@name varchar(128), @gender bit, @role int, @team_id int, @username varchar(50), @password varchar(50), @company_id int)
AS INSERT INTO Member(name, gender, role, team_id, username, password, is_deleted, company_id) VALUES(@name,@gender,@role,@team_id,@username,@password, 0,@company_id)
GO

CREATE PROC updateMember(@id int, @name varchar(128), @gender bit, @role int, @team_id int, @username varchar(50), @password varchar(50), @company_id int)
AS UPDATE Member SET name = @name, gender = @gender, role = @role, team_id = @team_id, username = @username, password = @password, company_id = @company_id WHERE id = @id
GO

CREATE PROC deleteMember(@id int)
AS UPDATE Member SET is_deleted = 1 where id = @id
GO
--End Member

--Start Tasks
CREATE PROC getAllTasks
AS SELECT * FROM Tasks
GO

CREATE PROC addTask(@name varchar(128), @description text, @created_at datetime, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int, @team_id int)
AS INSERT INTO Tasks(name, description, created_at, dueDate, progress, status_id, project_id, assignee_id, create_user, team_id) VALUES(@name,@description,@created_at,@dueDate,@progress,@status_id,@project_id,@assignee_id,@create_user,@team_id)
GO

CREATE PROC updateTask(@id int, @name varchar(128), @description text, @created_at datetime, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int, @team_id int)
AS UPDATE Tasks SET name = @name, description = @description,created_at = @created_at,dueDate = @dueDate,progress = @progress,status_id = @status_id,project_id = @project_id,assignee_id = @assignee_id,create_user = @create_user,team_id = @team_id WHERE id = @id
GO

CREATE PROC deleteTask(@id int)
AS DELETE FROM Tasks WHERE id = @id
GO
--End Tasks

--Start TaskStatus
CREATE PROC getAllTaskStatus
AS SELECT * FROM TaskStatus
GO

CREATE PROC addTaskStatus(@name varchar(18))
AS INSERT INTO TaskStatus(name) VALUES(@name)
GO

CREATE PROC updateTaskStatus(@id int, @name varchar(18))
AS UPDATE TaskStatus SET name  = @name WHERE id = @id
GO

CREATE PROC deleteTaskStatus(@id int)
AS DELETE FROM TaskStatus WHERE id = @id
GO
--End TaskStatus

--Start Project
CREATE PROC getAllProject
AS SELECT * FROM Project
GO

CREATE PROC addProject(@name varchar(128), @progress int , @deadline datetime, @created_at datetime, @key varchar(10))
AS INSERT INTO Project(name, progress, deadline, created_at, [key]) VALUES(@name,@progress,@deadline,@created_at,@key)
GO

CREATE PROC updateProject(@id int, @name varchar(128), @progress int , @deadline datetime, @created_at datetime, @key varchar(10))
AS UPDATE Project SET name = @name, progress = @progress,deadline = @deadline,created_at = @created_at,[key] = @key WHERE id = @id
GO

CREATE PROC deleteProject(@id int)
AS DELETE FROM Project WHERE id = @id
GO
--End Project

--Start Team
CREATE PROC getAllTeam
AS SELECT * FROM Team
GO

CREATE PROC addTeam(@name varchar(128),@abbreviation varchar(64),@team_lead int, @team_key varchar(10), @is_deleted bit, @company_id int)
AS INSERT INTO Team(name,abbreviation,team_lead,team_key,is_deleted,company_id) VALUES(@name,@abbreviation,@team_lead,@team_key,@is_deleted,@company_id)
GO

CREATE PROC updateTeam(@id int, @name varchar(128),@abbreviation varchar(64),@team_lead int, @team_key varchar(10), @is_deleted bit, @company_id int)
AS UPDATE Team SET name = @name, abbreviation = @abbreviation,team_lead = @team_lead,team_key = @team_key,is_deleted = @is_deleted,company_id = @company_id
GO

CREATE PROC deleteTeam(@id int)
AS DELETE FROM Team WHERE id = @id
GO
--End Team

--Start Role
CREATE PROC getAllRole
AS SELECT * FROM role
GO

CREATE PROC addRole(@name varchar(64), @abbreviation varchar(20))
AS INSERT INTO role(name, abbreviation) VALUES(@name,@abbreviation)
GO

CREATE PROC updateRole(@id int, @name varchar(64), @abbreviation varchar(20))
AS UPDATE role SET name = @name , abbreviation = @abbreviation WHERE id = @id
GO

CREATE PROC deleteRole(@id int)
AS DELETE FROM role WHERE id = @id
GO
--End Role

-- Company
create PROC getAllCompany
AS SELECT * FROM Company;
go
create proc addCompany(@name nvarchar(128), @abbreviation nvarchar(64), @company_details int) as INSERT into Company(name, abbreviation, company_details)
values (@name, @abbreviation, @company_details);
go
CREATE PROC updateCompany(@id int, @name varchar(128), @abbreviation nvarchar(64), @company_details int)
AS UPDATE Company SET name = @name, abbreviation = @abbreviation, company_details = @company_details WHERE id = @id;
go
CREATE PROC deleteCompany(@id int)
AS DELETE FROM Company WHERE id = @id
go
-- Company Details
create PROC getByCompanyId(@id int) AS SELECT * FROM Company_Details cd inner join Company c on c.company_details = cd.id WHERE c.id = @id ;
go
create PROC addCompanyDetails(@phone varchar(20), @address nvarchar(128))
as insert into Company_Details (phone, address) values (@phone, @address)
go
CREATE PROC updateCompanyDetails(@id int, @phone varchar(20), @address nvarchar(128))
AS UPDATE Company_Details SET phone = @phone, address  = @address WHERE id = @id
go
CREATE PROC deleteCompanyDetails(@id int)
AS DELETE FROM Member WHERE id = @id

EXec getAllMember