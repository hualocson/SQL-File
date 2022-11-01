USE ProjectManager_Real
GO

DROP PROC getAllMember;
DROP PROC addMember;
DROP PROC updateMember;
DROP PROC deleteMember;
DROP FUNCTION getMemberByUsername;
DROP PROC getAllTasks;
DROP PROC addTask;
DROP PROC updateTask;
DROP PROC deleteTask;
DROP PROC getAllTaskStatus;
DROP PROC addTaskStatus;
DROP PROC updateTaskStatus;
DROP PROC deleteTaskStatus;
DROP PROC getAllProject;
DROP PROC addProject;
DROP PROC updateProject;
DROP PROC deleteProject;
DROP PROC getAllTeam;
DROP PROC addTeam;
DROP PROC updateTeam;
DROP PROC deleteTeam;
DROP PROC getAllRole;
DROP PROC addRole;
DROP PROC updateRole;
DROP PROC deleteRole;
DROP PROC getAllCompany;
DROP PROC addCompany;
DROP PROC updateCompany;
DROP PROC deleteCompany;
DROP PROC getByCompanyId;
--DROP PROC getAllCompanyDetails;
DROP PROC addCompanyDetails;
DROP PROC updateCompanyDetails;
DROP PROC deleteCompanyDetails;
GO
--Start Member
CREATE VIEW AllMember AS SELECT id,name, gender, role, team_id, username, password, company_id FROM Member WHERE is_deleted = 0
GO

CREATE PROC getAllMember
AS 
	SELECT * FROM AllMember
GO

CREATE PROC addMember(@name varchar(128), @gender bit, @role int, @team_id int, @username varchar(50), @password varchar(50), @company_id int)
AS 
	BEGIN TRAN
		INSERT INTO Member(name, gender, role, team_id, username, password, is_deleted, company_id) VALUES(@name,@gender,@role,@team_id,@username,@password, 0,@company_id)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateMember(@id int, @name varchar(128), @gender bit, @role int, @team_id int, @username varchar(50), @password varchar(50), @company_id int)
AS 
	BEGIN TRAN
		UPDATE Member SET name = @name, gender = @gender, role = @role, team_id = @team_id, username = @username, password = @password, company_id = @company_id WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteMember(@id int)
AS 
	BEGIN TRAN
		UPDATE Member SET is_deleted = 1 where id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE FUNCTION getMemberByUsername (@username varchar(50), @password varchar(50)) RETURNS int
AS 
	BEGIN
		DECLARE @value int
		SELECT @value = COUNT(*) FROM Member WHERE is_deleted = 0 AND username = @username AND password = @password
		RETURN @value
	END
GO
--End Member

--Start Tasks

CREATE VIEW AllTasks AS SELECT * FROM Tasks
GO 

CREATE PROC getAllTasks
AS SELECT * FROM AllTasks
GO

CREATE PROC addTask(@name varchar(128), @description text, @created_at datetime, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int, @team_id int)
AS	
	BEGIN TRAN
		INSERT INTO Tasks(name, description, created_at, dueDate, progress, status_id, project_id, assignee_id, create_user, team_id) VALUES(@name,@description,@created_at,@dueDate,@progress,@status_id,@project_id,@assignee_id,@create_user,@team_id)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateTask(@id int, @name varchar(128), @description text, @created_at datetime, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int, @team_id int)
AS 
	BEGIN TRAN
		UPDATE Tasks SET name = @name, description = @description,created_at = @created_at,dueDate = @dueDate,progress = @progress,status_id = @status_id,project_id = @project_id,assignee_id = @assignee_id,create_user = @create_user,team_id = @team_id WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteTask(@id int)
AS 
	BEGIN TRAN
		DELETE FROM Tasks WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN	
GO
--End Tasks

--Start TaskStatus

CREATE VIEW AllTaskStatus
AS SELECT * FROM TaskStatus
GO

CREATE PROC getAllTaskStatus
AS SELECT * FROM AllTaskStatus
GO

CREATE PROC addTaskStatus(@name varchar(18))
AS 
	BEGIN TRAN
		INSERT INTO TaskStatus(name) VALUES(@name)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN	
GO

CREATE PROC updateTaskStatus(@id int, @name varchar(18))
AS 
	BEGIN TRAN
		UPDATE TaskStatus SET name  = @name WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteTaskStatus(@id int)
AS 
	BEGIN TRAN
		DELETE FROM TaskStatus WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
--End TaskStatus

--Start Project
CREATE VIEW AllProject
AS SELECT * FROM Project
GO

CREATE PROC getAllProject
AS SELECT * FROM AllProject
GO

CREATE PROC addProject(@name varchar(128), @progress int , @deadline datetime, @created_at datetime, @key varchar(10))
AS 
	BEGIN TRAN
		INSERT INTO Project(name, progress, deadline, created_at, [key]) VALUES(@name,@progress,@deadline,@created_at,@key)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateProject(@id int, @name varchar(128), @progress int , @deadline datetime, @created_at datetime, @key varchar(10))
AS 
	BEGIN TRAN
		UPDATE Project SET name = @name, progress = @progress,deadline = @deadline,created_at = @created_at,[key] = @key WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteProject(@id int)
AS 
	BEGIN TRAN
		DELETE FROM Project WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN	
GO
--End Project

--Start Team
CREATE VIEW AllTeam
AS SELECT id,name,abbreviation,team_lead,team_key,company_id FROM Team WHERE is_deleted = 0
GO
CREATE PROC getAllTeam
AS SELECT * FROM AllTeam
GO

CREATE PROC addTeam(@name varchar(128),@abbreviation varchar(64),@team_lead int, @team_key varchar(10), @company_id int)
AS 
	BEGIN TRAN
		
		INSERT INTO Team(name,abbreviation,team_lead,team_key,is_deleted,company_id) VALUES(@name,@abbreviation,@team_lead,@team_key,0,@company_id)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateTeam(@id int, @name varchar(128),@abbreviation varchar(64),@team_lead int, @team_key varchar(10), @company_id int)
AS 
	BEGIN TRAN
		UPDATE Team SET name = @name, abbreviation = @abbreviation,team_lead = @team_lead,team_key = @team_key,company_id = @company_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteTeam(@id int)
AS 
	BEGIN TRAN
		UPDATE Team SET is_deleted = 1 WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
--End Team

--Start Role
CREATE VIEW AllRole
AS SELECT * FROM role
GO

CREATE PROC getAllRole
AS SELECT * FROM AllRole
GO

CREATE PROC addRole(@name varchar(64), @abbreviation varchar(20))
AS 
	BEGIN TRAN
		INSERT INTO role(name, abbreviation) VALUES(@name,@abbreviation)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateRole(@id int, @name varchar(64), @abbreviation varchar(20))
AS 
	BEGIN TRAN
		UPDATE role SET name = @name , abbreviation = @abbreviation WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteRole(@id int)
AS 
	BEGIN TRAN
		DELETE FROM role WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
--End Role

-- Start Company
CREATE VIEW AllCompany
AS SELECT * FROM Company;
GO

CREATE PROC getAllCompany
AS SELECT * FROM AllCompany;
GO

CREATE PROC addCompany(@name nvarchar(128), @abbreviation nvarchar(64), @company_details int) 
AS 
	BEGIN TRAN
		INSERT INTO Company(name, abbreviation, company_details) VALUES (@name, @abbreviation, @company_details);
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateCompany(@id int, @name varchar(128), @abbreviation nvarchar(64), @company_details int)
AS 
	BEGIN TRAN
		UPDATE Company SET name = @name, abbreviation = @abbreviation, company_details = @company_details WHERE id = @id;
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteCompany(@id int)
AS 
	BEGIN TRAN
		DELETE FROM Company WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
-- End Company

-- Company Details
		-- create PROC getByCompanyId(@id int) AS SELECT * FROM Company_Details cd inner join Company c on c.company_details = cd.id WHERE c.id = @id ;
		--go
CREATE VIEW AllCompanyDetails
AS SELECT * FROM Company_Details
GO

CREATE PROC getAllCompanyDetails
AS SELECT * FROM AllCompanyDetails
GO

CREATE PROC addCompanyDetails(@phone varchar(20), @address nvarchar(128))
AS 
	BEGIN TRAN
		INSERT INTO Company_Details (phone, address) values (@phone, @address)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC updateCompanyDetails(@id int, @phone varchar(20), @address nvarchar(128))
AS 
	BEGIN TRAN
		UPDATE Company_Details SET phone = @phone, address  = @address WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE PROC deleteCompanyDetails(@id int)
AS 
	BEGIN TRAN
		DELETE FROM Member WHERE id = @id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
