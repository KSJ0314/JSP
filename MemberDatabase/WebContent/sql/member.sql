drop table mem;


create table mem (
	id varchar(20),
	name varchar(20),
	pass varchar(20),
	tel varchar(20),
	email varchar(100),
	message varchar(20),
	path varchar(100),
	day datetime default now(),
	primary key (id)
);


select * from mem;
