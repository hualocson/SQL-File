Create Database ProjectManager_Real
GO
Use ProjectManager_Real
GO
create table ProjectMemberRole(
	id int IDENTITY(1,1) not null constraint ProjectMemberRole_id PRIMARY KEY,
	name varchar(64) not null,
	abbreviation varchar(20) not null,
);
GO

CREATE TABLE TaskStatus (
	id int IDENTITY(1,1) not null constraint TaskStatus_id primary key,
	name varchar(15)
);
GO

INSERT into dbo.TaskStatus (name) values ('IN PROGRESS');
INSERT into dbo.TaskStatus (name) values ('DONE');
INSERT into dbo.TaskStatus (name) values ('TO DO');
INSERT into dbo.TaskStatus (name) values ('PENDING');

go
CREATE table Project(
	id int identity(1,1) constraint Project_id primary key,
	name varchar(128) not null,
	progress int,
	deadline datetime,
	created_at datetime default getdate()
);
go

CREATE TABLE Team (
	id int IDENTITY(1,1) not null constraint ProjectTeam_id PRIMARY KEY,
	name varchar(128) not null,
	abbreviation varchar(64)
);

go
CREATE table Member(
	id int IDENTITY(1,1) not null constraint member_id PRIMARY KEY,
	name varchar(128) not null,
	gender BIT,
	role int constraint Member_role_id_fk references ProjectMemberRole(id),
	team_id int constraint Member_team_id_fk references Team(id)
);
alter table Team add team_lead int;
alter table Team add constraint team_team_lead_id_fk Foreign key (team_lead) references Member(id);
go

CREATE TABLE Tasks (
	id int identity(1,1) constraint tasks_id_pk primary key,
	name nvarchar(128) not null,
	description text,
	created_at datetime default getdate(),
	dueDate datetime,
	progress float,
	status_id int constraint tasks_status_id_fk references TaskStatus(id),
	project_id int constraint tasks_project_id_fk references Project(id),
	assignee_id int constraint tasks_assignee_id_fk references Member(id),
	create_user int constraint tasks_create_user_id_fk references Member(id),
	team_id int constraint tasks_team_id_fk references Team(id)
);
go

CREATE table Project_Team(
	team_id int constraint ProjectAssignTeam_team_id_fk references Team(id),
	project_id int constraint ProjectAssignTeam_project_id_fk references Project(id),
	created_at datetime default getdate()
);
go
alter table Team add team_key varchar(10)
go
insert into ProjectMemberRole(name, abbreviation) values('Project Manager', 'PM');
insert into ProjectMemberRole(name, abbreviation) values('Team Lead', 'TL');
insert into ProjectMemberRole(name, abbreviation) values('Team Member', 'TM');
go
alter table [Member] add username varchar(50);
alter table [Member] add password varchar(50);
go
alter table [Member] add is_deleted bit default 0;
alter table Team add is_deleted bit default 0;
alter table Project add is_deleted bit default 0;
go
CREATE table Project_Member(
	id int identity(1,1) constraint Project_Member_id_pk primary key,
	project_id int constraint Project_Member_project_id_fk references Project(id),
	member_id int constraint Project_Member_member_id_fk references Member(id),
	is_deleted bit default 0
);
go
CREATE table Company(
	id int identity(1,1) constraint company_id_pk primary key,
	name nvarchar(50) not null,
	abbreviation nvarchar(50) not null
);
go
create table Company_Details (
	id int IDENTITY(1,1) not null constraint Company_Details_id_pk PRIMARY KEY,
	address nvarchar(128),
	phone varchar(20)
);
ALTER TABLE Company add company_details int;
ALTER TABLE Company add constraint Company_company_details_fk FOREIGN KEY (company_details) REFERENCES Company(id);
Go
exec sp_rename 'ProjectMemberRole', 'role'
go
ALTER table Project add company_id int;
ALTER table Project add constraint project_company_id_fk FOREIGN KEY (company_id) references Company(id);
go
ALTER table [Member] add company_id int;
ALTER table [Member] add constraint member_company_id_fk FOREIGN KEY (company_id) references Company(id);
go
ALTER table Team add company_id int;
ALTER table Team add constraint team_company_id_fk FOREIGN KEY (company_id) references Company(id);
go
INSERT into [role] (name, abbreviation) values('System Admin', 'SA');
go
CREATE view project_company AS
	select p.name as project_name, c.name as company_name
	from Project p inner join Company c on p.company_id = c.id ;
go
alter table Tasks add [key] varchar(10) unique;
go
ALTER table Project add [key] varchar(10) unique not null;
GO

CREATE TRIGGER generate_task_key on Tasks
AFTER INSERT AS 
BEGIN 
	DECLARE @number_of_tasks int
	DECLARE @task_key varchar(100) = ''
	SELECT @task_key = inserted.[key] FROM inserted 
	SELECT @number_of_tasks = COUNT(*) FROM inserted i inner join Project p 
	on p.id = i.id
	UPDATE Tasks SET Tasks.[key] = CONCAT(@task_key , '-', @number_of_tasks)
	FROM inserted
	WHERE Tasks.[id] = inserted.[id];
END
go
INSERT into Company(name, abbreviation) values ('XperC', 'XC')
INSERT into Project(name, progress, deadline, is_deleted, [key]) values ('Xcorp',10,'2022-09-09', 0, 'EXC');
update Project set company_id = 1 where id = 1;
go
ALTER TRIGGER generate_task_key on Tasks
AFTER INSERT AS 
BEGIN 
	DECLARE @number_of_tasks int
	DECLARE @task_key varchar(MAX) = ''
	DECLARE @current_task_project_id int
	SELECT @task_key = p2.[key] FROM inserted i inner join Project p2 
		on i.project_id = p2.id 
	SELECT @current_task_project_id = t.project_id FROM inserted, Tasks t WHERE t.id = inserted.[id]
	SELECT @number_of_tasks = COUNT(*)
		FROM Tasks t2 WHERE t2.project_id = @current_task_project_id
	UPDATE Tasks SET Tasks.[key] = CONCAT(@task_key , '-', @number_of_tasks)
		FROM inserted
			WHERE Tasks.[id] = inserted.[id];
END
GO
INSERT into [Member](name, username, password, [role], gender, is_deleted) values (N'Pham Dung', 'dung.pham@xperc.com','1234567890',4,1,0);
GO
create table Company_Details (
	id int IDENTITY(1,1) not null constraint Company_Details_id_pk PRIMARY KEY,
	address nvarchar(128),
	phone varchar(20)
);
ALTER TABLE Company add company_details int;
ALTER TABLE Company add constraint Company_company_details_fk FOREIGN KEY (company_details) REFERENCES Company_Details(id);

