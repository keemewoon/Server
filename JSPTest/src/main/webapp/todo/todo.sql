drop table tblTodo;
drop sequence seqTodo;

create table tblTodo (
	seq number primary key,					--번호(PK)
	todo varchar2(300) not null, 			--할일
	complete char(1) not null,				--완료유무. 완료(1), 미완료(0)
	regdate date default sysdate not null	--등록시각
);

create sequence seqTodo;

select * from tblTodo;

insert into tblTodo(seq, todo, complete, regdate) values(seqTodo.nextVal, '강아지 산책시키기','1', to_char(sysdate,'yyyy.mm.dd hh24:mi'));


select * from tblTodo order by seq asc;

select * from tblTodo;

delete from tblTodo;

commit;




select * from tblAddress;

delete from tblAddress;