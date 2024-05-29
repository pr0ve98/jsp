show tables;

/* 입출금액 거래 내역 테이블 */
create table bankBook (
  idx   int  not null  auto_increment,  /* 입출금 고유번호 */
  mid  varchar(20)  not null,			/* 입출금자 아이디 */
  balance int,							/* 입출금액 */
  primary key(idx)
);

/* 입출금 내역 테이블 */
create table bankBookHistory (
  idx   int  not null  auto_increment,  /* 입출금내역 고유번호 */
  bankBookIdx int not null,				/* 입출금액 사용자의 고유번호 */
  content varchar(50) not null,			/* 입출금액 내역서 */
  primary key(idx)
  /*foreign key(bankBookIdx) references bankBook(idx)*/
);

desc bankBook;
delete from bankBook;
drop table bankBook;

desc bankBookHistory;
delete from bankBookHistory;
drop table bankBookHistory;

insert into bankBook values(default, 'hkd1234', 100000);

select * from bankBook;