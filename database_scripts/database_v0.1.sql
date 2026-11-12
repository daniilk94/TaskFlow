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
  task_update_date datetime NOT NULL,
  constraint fk_project_id
  foreign key (task_project_id)
  references projects(project_id),
  constraint chk_taskStatusValues
  check (task_status like '%todo%' OR '%in_progress%' or '%completed%')
);

insert into users (user_name, user_email, user_password_hash)
values ("Daniil Malinen", "test@test.com", "example_hash1"),
("John Johnes", "test2@test.com", "example_hash2");

insert into projects (project_ownwer_id, project_name, project_description)
values (1, "Project 1", "Description 1"),
(2, "Project 2", "Description 2");

