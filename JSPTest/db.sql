create table tblAddress (
    seq number primary key,
    name varchar2(30) not null,
    age number(2) not null,
    gender char(1) not null check (gender in('m','f')),
    address varchar2(500) not null
);

create sequence seqAddress;

insert into tblAddress(seq, name, age, gender, address) values(seqAddress.nextVal, '홍길동', 20, 'm', '서울시 강남구 역삼동');

select * from tblAddress;

delete from tblAddress where name = '김예운';

delete from tblAddress;

commit;

insert into tblAddress (seq, name, age, gender, address) values(seqAddress.nextVal, '홍길동', 20, 'm', '서울시 강남구 역''삼동')

/*오라클 서버 입장에서는 접속되어 있는 서버가 2명이다. (자바와 오라클)*/






--m1()
create or replace procedure proc_m1
is
begin
    delete from tblAddress;
end;

select * from tblAddress;


--m2()
create or replace procedure proc_m2 (
    pname in varchar2,
    page in number,
    pgender in varchar2,
    paddress in varchar2
)
is
begin

    insert into tblAddress (seq, name, age, gender, address) 
        values(seqAddress.nextVal, pname, page, pgender, paddress);

end proc_m2;

select * from tblAddress;


--m3()
create or replace procedure proc_m3 (
    pname in varchar2,
    page in number,
    pgender in varchar2,
    paddress in varchar2,
    presult out number
)
is
begin

    insert into tblAddress (seq, name, age, gender, address) 
        values(seqAddress.nextVal, pname, page, pgender, paddress);
        
        presult := 1;
exception
    when others then
        presult := 0;

end proc_m3;


select * from tblAddress;



--m4()
create or replace procedure proc_m4(
    pseq in number, 
    pname out varchar2,
    page out number,
    pgender out varchar2,
    paddress out varchar2
)
is
begin

    select name, age, gender, address into pname, page, pgender, paddress
        from tblAddress 
            where seq = pseq;
            
end proc_m4;

select * from tblAddress;



--m5()
create or replace procedure proc_m5(
    pgender in varchar2,
    pcursor out sys_refcursor
)
is
begin

    open pcursor for
        select * from tblAddress where gender = pgender;
        
end proc_m5;





insert into tblAddress (seq, name, age, gender, address) values(seqAddress.nextVal, '홍길동', 20, 'm', '서울시 강남구 역삼동');
insert into tblAddress (seq, name, age, gender, address) values(seqAddress.nextVal, '아무개', 22, 'm', '서울시 강남구 역삼동');
insert into tblAddress (seq, name, age, gender, address) values(seqAddress.nextVal, '하하하', 25, 'm', '서울시 강남구 역삼동');

commit;

select * from tblAddress;






-- 인증 테이블(계정)

select * from tbluser;
drop table tbluser;

create table tblaaa (
    id varchar2(30) primary key,            --아이디(PK)
    pw varchar2(30) not null,               -- 암호
    name varchar2(30) not null,             -- 이름
    lv number(1) default (1) not null,      -- 등급 (1,2,3)
    regdate date default sysdate not null   -- 가입일
);


insert into tblaaa values('hong','1111','홍길동', default, default);
insert into tblaaa values('test','1111','테스트', default, default);
insert into tblaaa values('admin','1111','관리자', 3, default);

commit;

delete * from tbluser where name='홍길동';

select * from aaa;


create table tblCard (
    seq number primary key,
    korname varchar2(50) not null,
    engname varchar2(50) not null,
    tel varchar2(50) not null,
    email varchar2(50) not null,
    company varchar2(50) not null,
    position varchar2(50) not null
);

create sequence seqCard;

insert into tblCard(seq, korname, engname, tel, email, company, position)
values (seqCard.nextVal, '홍길동', 'Hong gil dong', '010-1234-5678', 'hong.java@gmail.com','쌍용 OO 솔루션');



