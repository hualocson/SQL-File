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