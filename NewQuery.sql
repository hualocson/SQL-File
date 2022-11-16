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

-- UPDATE 12/11/2002
create trigger validate_datetime_projects on dbo.Project
AFTER INSERT, UPDATE AS BEGIN
	DECLARE @beforeDate datetime, @afterDate datetime, @current_id int
	select @beforeDate = i.created_at, @afterDate = i.deadline, @current_id = i.id
	from inserted i

	if(@beforeDate > @afterDate)
		update Project set created_at = @afterDate, deadline = @beforeDate
		where id = @current_id;
END

CREATE trigger update_project_key on Project
after insert AS BEGIN
	DECLARE @exist_key int, @current_key varchar(10), @current_id int, @current_company_id int
	SELECT @current_key = i.[key], @current_id = i.id, @current_company_id = i.company_id from inserted i
	SELECT @exist_key = COUNT(*) from dbo.Project p WHERE p.[key] = @current_key and p.company_id = @current_company_id
	if(@exist_key > 0)
		UPDATE dbo.Project set [key] = CONCAT([key], SUBSTRING([key],1,1))
		WHERE id = @current_id
END

drop function if exists getTeamByProjectId
Create or ALTER Proc getTeamByProjectId(@id int)
as
select Q.team_id, Q.project_id, m.id team_lead_id, Q.name, Q.abbreviation, m.name team_lead_name
FROM
	(SELECT *
	FROM Project_Team, Team
	WHERE Team.id = Project_Team.team_id AND Project_Team.project_id = @id) Q inner JOIN [Member] m
on m.id = Q.team_lead
-- End hualocson

-- Update 16/11/2022
Create or ALTER proc getTeamByCompanyId(@id int)
as
SELECT t.id, t.name FROM Team t, Company c WHERE t.company_id = c.id and c.id = @id
-- End hualocson 16/11/2022