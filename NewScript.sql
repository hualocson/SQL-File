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
	-- C�ch d�ng: SELECT * FROM dbo.searchCompanyByName({name})

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