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

/*오라클 서버 입장에서는 접속되어 있는 서버가 2명이다. (자바와 오라클)*/







