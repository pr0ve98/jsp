show tables;

create table schedule (
	idx int not null auto_increment,/* 스케줄관리 고유번호 */
	mid varchar(20) not null,		/* 회원 아이디(일정검색시 필요) */
	sDate datetime not null,		/* 일정 날짜 */
	part varchar(10) not null,		/* 일정분류(1.모임, 2.업무, 3.학습, 4.여행, 5.기타) */
	content text not null,			/* 일정 상세내역 */
	primary key(idx),
	foreign key(mid) references member(mid)
);

desc schedule;

insert into schedule values (default, 'admin', '2024-05-24', '모임', '여고추리반 보기');
insert into schedule values (default, 'admin', '2024-05-24', '모임', '유튜브 보기');
insert into schedule values (default, 'admin', '2024-05-24', '기타', '식당 방문');
insert into schedule values (default, 'admin', '2024-05-24', '학습', '프로젝트 학습');
insert into schedule values (default, 'admin', '2024-05-03', '업무', '프로젝트 회의');
insert into schedule values (default, 'admin', '2024-05-07', '학습', '자바 공부');
insert into schedule values (default, 'admin', '2024-05-15', '학습', '데이터베이스 공부');
insert into schedule values (default, 'admin', '2024-05-20', '학습', 'jsp 공부');
insert into schedule values (default, 'admin', '2024-05-21', '모임', '게임 정기 모임');
insert into schedule values (default, 'admin', '2024-06-03', '여행', '대전여행');
insert into schedule values (default, 'admin', '2024-06-05', '학습', '학원 프로젝트 끝내기');
insert into schedule values (default, 'admin', '2024-06-06', '기타', '게임 하루종일 하기');
insert into schedule values (default, 'karina1', '2024-05-18', '모임', '친구랑 데이트');
insert into schedule values (default, 'karina1', '2024-05-25', '학습', '노래연습');
insert into schedule values (default, 'karina1', '2024-05-30', '업무', '실장님 미팅');
insert into schedule values (default, 'karina1', '2024-06-09', '모임', '에스파 모임');
insert into schedule values (default, 'winter1', '2024-05-18', '여행', '혼자 강릉여행');
insert into schedule values (default, 'winter1', '2024-05-20', '학습', '춤연습');
insert into schedule values (default, 'winter1', '2024-05-05', '여행', '닝닝이랑 부산여행');
insert into schedule values (default, 'winter1', '2024-06-09', '모임', '에스파 모임');
insert into schedule values (default, 'hangangcat', '2024-05-11', '기타', '끝내주게 자기');
insert into schedule values (default, 'hangangcat', '2024-05-15', '학습', '요즘 밈 공부');
insert into schedule values (default, 'hangangcat', '2024-05-20', '모임', '한강조깅모임');
insert into schedule values (default, 'hangangcat', '2024-05-23', '업무', '생선가시 바르기');
insert into schedule values (default, 'hangangcat', '2024-05-24', '모임', '여고추리반 보기');
insert into schedule values (default, 'ohw1234', '2024-05-19', '업무', '이사님 미팅');
insert into schedule values (default, 'ohw1234', '2024-05-22', '모임', '여고동창모임');

select * from schedule where mid='winter1' and substring(sDate, 1, 10)='2024-05-20' order by sDate;
select * from schedule where mid='admin' and date_format(sDate, '%Y-%m-%d') = '2024-05-24' order by sDate;
select *, count(*) as cnt from schedule where mid='admin' and date_format(sDate, '%Y-%m') = '2024-05' group by sDate order by sDate, part;
select *, count(*) as cnt from schedule where mid='admin' and date_format(sDate, '%Y-%m') = '2024-05' group by sDate, part order by sDate, part;

select * from schedule where mid='admin' and date_format(sDate, '%Y-%m-%d') = '2024-05-24' order by sDate, part;
select *, count(*) as cnt from schedule where mid='admin' and date_format(sDate, '%Y-%m-%d') = '2024-05-24' order by sDate, part;
select *, count(*) as cnt from schedule where mid='admin' and date_format(sDate, '%Y-%m-%d') = '2024-05-24' group by part order by sDate, part;

