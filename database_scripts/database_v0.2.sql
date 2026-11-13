drop database if exists taskflow;
create database taskflow;
use taskflow;

create table users (
  user_id bigint unsigned primary key AUTO_INCREMENT,
  user_name varchar(100) NOT NULL,
  user_email varchar(100) NOT NULL UNIQUE,
  user_password_hash varchar(255) NOT NULL
);

create table projects (
  project_id bigint unsigned primary key AUTO_INCREMENT,
  project_ownwer_id bigint unsigned NOT NULL,
  project_name varchar(255) NOT NULL,
  project_description varchar(255) NULL,
  project_creation_date datetime DEFAULT CURRENT_TIMESTAMP(),
  constraint fk_owner_id
  foreign key (project_ownwer_id)
  references users(user_id)
);

create table tasks (
  task_id bigint unsigned primary key AUTO_INCREMENT,
  task_project_id bigint unsigned NOT NULL,
  task_title varchar(255) NOT NULL,
  task_description varchar(255) NULL,
  task_status varchar(11) NOT NULL DEFAULT 'todo',
  task_creation_date datetime DEFAULT CURRENT_TIMESTAMP(),
  task_update_date datetime DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  constraint fk_project_id
  foreign key (task_project_id)
  references projects(project_id)
  on delete cascade,
  constraint chk_taskStatusValues
  check (task_status like '%todo%' OR task_status like '%in_progress%' or task_status like'%completed%')
);

insert into users (user_name, user_email, user_password_hash)
values ("Daniil Malinen", "test@test.com", "example_hash1"),
("John Johnes", "test2@test.com", "example_hash2");

insert into projects (project_ownwer_id, project_name, project_description)
values (1, "Project 1", "Description 1"),
(2, "Project 2", "Description 2");

insert into tasks (task_project_id, task_title, task_description)
values (1, "Task 1", "Description 1"),
(2, "Task 2", "Description 2");





