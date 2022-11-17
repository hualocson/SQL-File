-- Update 17/11/2022 1:24 PM
CREATE PROC getRole AS (SELECT id, name FROM role)
GO

CREATE OR ALTER PROC getTeamLeadInCompany(@id int)
AS (SELECT Member.id, Member.name FROM Member, role WHERE is_deleted = 0 AND Member.role = role.id AND role.name = 'Team Lead' AND team_id is NULL AND company_id = @id)
GO
-- End update