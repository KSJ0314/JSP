select * from member;
select * from board;

alter table member add phone varchar(20);
alter table member add address varchar(100);

select * from board where id like '%%';

select * from membership where member_id="java";