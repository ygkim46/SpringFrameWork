CREATE table mbr_info (
	id varchar(30) not null,
	password varchar(30) not null,
	name varchar(12) not null,
	primary key(id)
);

commit;

ALTER table mbr_info ADD name varchar(12) not null default '0';
commit;

insert into mbr_info values ('ygkim46','1234','�Ϸ�')
commit;

select * from mbr_info where id = 'ygkim46';

update mbr_info
  set name = '�Ϸ�'
 where id = 'ygkim46'
 commit;
 
 drop table mbr_info