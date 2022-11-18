-- Update 17/11/2022 1:24 PM
CREATE PROC getRole AS (SELECT id, name FROM role)
GO

CREATE OR ALTER PROC getTeamLeadInCompany(@id int)
AS (SELECT Member.id, Member.name FROM Member, role WHERE is_deleted = 0 AND Member.role = role.id AND role.name = 'Team Lead' AND team_id is NULL AND company_id = @id)
GO
-- End update

-- Update 17/11/2022 2:03 PM
CREATE OR ALTER FUNCTION getMemberByUsername (@username varchar(50), @password varchar(50)) RETURNS int
AS 
	BEGIN
		DECLARE @value int
		SELECT @value = id FROM Member WHERE is_deleted = 0 AND username = @username AND password = @password
		IF (@value is NULL)
			BEGIN
				SET @value = 0
			END
		RETURN @value
	END
GO
-- End update

-- Update 17/11/2022 2:29 PM
CREATE OR ALTER FUNCTION checkExistUserAndTeamCompanyRoleIsNull(@username varchar(50))RETURNS int AS
BEGIN
	DECLARE @id int
	SELECT @id = id FROM Member WHERE is_deleted = 0 AND username = @username AND team_id is NULL AND company_id is null AND role is null
	IF (@id is null)
		SET @id = 0
	RETURN @id
END
GO
-- End update

-- Update 17/11/2022 2:43 PM
CREATE OR ALTER PROC getMemberById(@id int)
AS (SELECT id,name,gender,role,team_id,username,password,company_id FROM Member WHERE is_deleted = 0 AND id = @id)
GO
-- End update

-- Update 17/11/2022 3:50 PM
ALTER PROC updateMember(@id int, @name varchar(128), @gender bit, @role int, @team_id int, @username varchar(50), @password varchar(50), @company_id int)
AS 
	BEGIN TRAN
		UPDATE Member SET name = @name, gender = @gender, role = @role, team_id = @team_id, username = @username, password = @password, company_id = @company_id WHERE id = @id
		IF (@role = 2)
			UPDATE Team SET team_lead = @id WHERE id = @team_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
-- End update

-- Update 17/11/2022 6:16
CREATE PROC getCompanyById(@id int)
AS (SELECT * FROM Company WHERE id = @id)
GO
-- End update

-- Update 17/11/2022 10:03 PM
CREATE OR ALTER FUNCTION searchCompanyByName(@name varchar(50)) RETURNS TABLE
AS RETURN (SELECT * FROM AllCompany WHERE name LIKE '%'+@name+'%')
GO
	-- Cách dùng: SELECT * FROM dbo.searchCompanyByName({name})

CREATE OR ALTER FUNCTION searchProjectByName(@name varchar(50)) RETURNS TABLE
AS RETURN (SELECT * FROM AllProject WHERE name LIKE '%'+@name+'%')
GO
-- End update

-- Update 10:26 PM
CREATE OR ALTER FUNCTION searchMemberByName(@name varchar(50)) RETURNS TABLE
AS RETURN (SELECT Q1.id, Q1.name, Q1.gender, Q1.role_id, Q1.role, Q1.team_id, Q1.team_name, Q1.username, Q1.password, Q1.company_id, dbo.Company.name AS company_name, Q1.abbreviation
FROM   (SELECT dbo.Member.id, dbo.Member.name, dbo.Member.gender, dbo.Member.role AS role_id, dbo.Member.team_id, dbo.Member.username, dbo.Member.password, dbo.Member.company_id, dbo.role.name AS role, dbo.role.abbreviation, dbo.Team.name AS team_name
             FROM    dbo.Member LEFT JOIN
                           dbo.role ON dbo.Member.role = dbo.role.id LEFT JOIN
                           dbo.Team ON dbo.Member.team_id = dbo.Team.id
             WHERE  (dbo.Member.is_deleted = 0)) AS Q1 LEFT JOIN
             dbo.Company ON Q1.company_id = dbo.Company.id WHERE Q1.name LIKE '%'+@name+'%')
GO
-- End update

-- Update 11:52 PM
CREATE OR ALTER FUNCTION searchMemberByName(@name varchar(50)) RETURNS TABLE
AS RETURN (SELECT * FROM AllMember WHERE name LIKE '%'+@name+'%')
GO
-- End update

-- Update 18/11/2022 10:34 AM
CREATE OR ALTER PROC updateTaskStatus(@task_id int, @status_id int)
AS 
	BEGIN TRAN
		UPDATE Tasks SET status_id = @status_id WHERE id = @task_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

DROP PROC addCompanyDetails
DROP PROC addRole
DROP PROC addTaskStatus
DROP PROC deleteCompanyDetails
DROP PROC deleteRole
DROP PROC deleteTaskStatus
DROP PROC getAllTaskStatus
DROP PROC getAllRole
DROP PROC [dbo].[updateCompanyDetails]
DROP PROC [dbo].[updateRole]
DROP VIEW AllRole
DROP VIEW AllTaskStatus
GO
-- End update

-- Update 18/11/2022 11:07 AM
CREATE OR ALTER PROC getTaskByStatusAndProjectId(@status_id int, @project_id int)
AS (SELECT * FROM AllTasks WHERE status_id = @status_id AND project_id = @project_id)
GO
-- End update

-- Update 18/11/2022 4:48 PM
CREATE OR ALTER PROC getTaskByStatusAndProjectAndTeamId(@status_id int, @project_id int, @team_id int)
AS (SELECT * FROM AllTasks WHERE status_id = @status_id AND project_id = @project_id AND team_id = @team_id)
GO

CREATE OR ALTER PROC getTaskByStatusAndProjectAndMemberId(@status_id int, @project_id int, @member_id int)
AS (SELECT * FROM AllTasks WHERE status_id = @status_id AND project_id = @project_id AND assignee_id = @member_id)
GO
-- End update

-- Update 18/11/2022 4:52 PM
CREATE OR ALTER PROC [dbo].[addTask](@name varchar(128), @description text, @created_at datetime, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int, @team_id int)
AS	
	BEGIN TRAN
		INSERT INTO Tasks(name, description, created_at, dueDate, progress, status_id, project_id, assignee_id, create_user, team_id) VALUES(@name,@description,@created_at,@dueDate,@progress,@status_id,@project_id,@assignee_id,@create_user,@team_id)
		EXEC addMemberToProject @project_id, @assignee_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE OR ALTER PROC [dbo].[updateTask](@id int, @name varchar(128), @description text, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int)
AS 
	BEGIN TRAN
		DECLARE @old_assignee_id int
		DECLARE @team_id int
		SELECT @old_assignee_id = assignee_id FROM Tasks WHERE id = @id
		SELECT @team_id = team_id FROM Member WHERE id = @assignee_id
		UPDATE Tasks SET name = @name, description = @description,dueDate = @dueDate,progress = @progress,status_id = @status_id,project_id = @project_id,assignee_id = @assignee_id,create_user = @create_user,team_id = @team_id WHERE id = @id
		UPDATE Project_Member SET member_id = @assignee_id WHERE project_id = @project_id AND member_id = @old_assignee_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
-- End update

-- Update 18/11/2022 5:40 PM
CREATE OR ALTER PROC [dbo].[addTask](@name varchar(128), @description text, @dueDate datetime, @project_id int, @assignee_id int, @create_user int)
AS	
	BEGIN TRAN
		DECLARE @created_at datetime
		DECLARE @team_id int
		SET @created_at = GETDATE()
		SELECT @team_id = team_id FROM Member WHERE id = @assignee_id
		INSERT INTO Tasks(name, description, created_at, dueDate, progress, status_id, project_id, assignee_id, create_user, team_id) VALUES(@name,@description,@created_at,@dueDate,0,3,@project_id,@assignee_id,@create_user,@team_id)
		EXEC addMemberToProject @project_id, @assignee_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO

CREATE OR ALTER PROC [dbo].[updateTask](@id int, @name varchar(128), @description text, @dueDate datetime, @progress float, @status_id int, @project_id int, @assignee_id int, @create_user int)
AS 
	BEGIN TRAN
		DECLARE @old_assignee_id int
		DECLARE @team_id int
		SELECT @old_assignee_id = assignee_id FROM Tasks WHERE id = @id
		SELECT @team_id = team_id FROM Member WHERE id = @assignee_id
		UPDATE Tasks SET name = @name, description = @description,dueDate = @dueDate,progress = @progress,status_id = @status_id,project_id = @project_id,assignee_id = @assignee_id,create_user = @create_user,team_id = @team_id WHERE id = @id
		UPDATE Project_Member SET member_id = @assignee_id WHERE project_id = @project_id AND member_id = @old_assignee_id
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
-- End update

-- Update 18/11/2022 6:42 PM
CREATE FUNCTION [dbo].[searchMemberInCompanyByName](@id int, @name varchar(50)) RETURNS TABLE
AS RETURN (SELECT * FROM AllMember WHERE company_id = @id AND name LIKE '%'+@name+'%')
GO

CREATE FUNCTION [dbo].[searchProjectInCompanyByName](@id int, @name varchar(50)) RETURNS TABLE
AS RETURN (SELECT * FROM AllProject WHERE company_id = @id AND name LIKE '%'+@name+'%')
-- End update

