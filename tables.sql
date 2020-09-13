create table if not exists work_experience
(
	wexp_id uuid not null
		constraint work_experience_pkey
			primary key,
	start_date timestamp not null,
	end_date timestamp not null,
	name text not null,
	avatar text
);

create table if not exists work_duties
(
	wdut_id uuid not null
		constraint work_duties_pkey
			primary key,
	wexp_id uuid not null
		constraint fk_work_duties_work_exp_wexp_id
			references work_experience
				on update cascade on delete cascade,
	start_date timestamp not null,
	end_date timestamp not null,
	title text not null,
	description text not null
);

create table if not exists account
(
	account_id uuid not null
		constraint account_pkey
			primary key,
	username text not null,
	password text not null,
	salt text not null,
	create_date timestamp not null,
	first_name text not null,
	last_name text not null,
	avatar text not null
);

create table if not exists article
(
	article_id uuid not null
		constraint article_pkey
			primary key,
	account_id uuid not null
		constraint fk_article_account_account_id
			references account
				on update cascade on delete restrict,
	create_date timestamp not null,
	publish_date timestamp not null,
	title text not null,
	summary text not null,
	content text not null
);

create table if not exists project
(
	project_id uuid not null
		constraint project_pkey
			primary key,
	name text not null,
	summary text not null,
	repository text not null,
	avatar text not null,
	start_date timestamp not null
);

create table if not exists technology
(
	tech_id uuid not null
		constraint technology_pkey
			primary key,
	name text not null,
	avatar text not null
);

create table if not exists project_technology
(
	project_id uuid not null
		constraint fk_project_technology_project_id
			references project
				on update cascade on delete restrict,
	tech_id uuid not null
		constraint fk_project_technology_tech_id
			references technology
				on update cascade on delete restrict,
	constraint project_technology_pkey
		primary key (project_id, tech_id)
);

