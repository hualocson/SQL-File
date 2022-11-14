-- UPDATE 12/11/2002 5:40 PM
CREATE OR ALTER FUNCTION getTeamByProjectId(@project_id int) RETURNS table
AS RETURN (SELECT id, name, abbreviation, team_lead, project_id FROM Project_Team, Team WHERE Team.id = Project_Team.team_id AND Project_Team.project_id = @project_id)
GO

CREATE OR ALTER FUNCTION getTeamByCompanyId(@company_id int) RETURNS table
AS RETURN (SELECT id, name, abbreviation, team_lead, company_id FROM Team WHERE company_id = @company_id)
GO

CREATE OR ALTER FUNCTION getMemberNameById(@id int) RETURNS varchar(128)
AS
BEGIN
	DECLARE @name varchar(128)
	SELECT @name = name FROM Member WHERE id = @id
	RETURN @name
END
GO
-- END UPDATE

-- UPDATE 12/11/2002 10:15 PM
CREATE OR ALTER PROC addTeamToProject(@team_id int, @project_id int, @created_at datetime)
AS 
	BEGIN TRAN
		INSERT INTO Project_Team VALUES(@team_id,@project_id,@created_at)
		IF (@@ERROR <> 0)
			BEGIN
				ROLLBACK
				RETURN
			END
	COMMIT TRAN
GO
-- END UPDATE