--use문
use s_haein


--create문
create table 저자 ( 
        이름     	nvarchar(50)  	NOT NULL, 
        한자     	nvarchar(50)  	NULL, 
        생년     	int           	NULL, 
        몰년     	int           	NULL 
)

create table 연도 ( 
        서력       int              NOT NULL,
        왕조       nvarchar(10)  	NULL, 
        왕         nvarchar(10)  	NULL, 
        재위년     int           	NULL 
)

create table 서명 ( 
        서명       nvarchar(10)     NOT NULL,
        한문서명   nvarchar(10)  	NULL, 
        저자       nvarchar(10)  	NULL, 
        간행년     int           	NULL 
)


--insert문
insert into 서명(서명, 한문서명, 저자, 간행년) values ('가정집', '稼亭集', '이곡',  1662)
insert into 서명 values ('가주집', '家州集', '이상질', 1718) 
insert into 서명 values ('각재집', '覺齋集', '하항', 1813)
insert into 서명 values ('간송집', '澗松集', '조임도', 1744)
insert into 서명 values ('간옹집', '艮翁集', '이헌경', 1795)
insert into 서명 values ('간이집', '簡易集', '최립', 1631)

insert into 저자(이름, 한자, 생년, 몰년) values ('이곡', '李穀', 1298, 1351) 
insert into 저자 values ('이상질', '李尙質', 1597, 1635) 
insert into 저자 values ('하항', '河沆', 1538, 1590) 
insert into 저자 values ('조임도', '趙任道', 1585, 1664) 
insert into 저자 values ('이헌경', '李獻慶', 1719, 1791)
insert into 저자 values ('최립', '崔岦', 1539, 1612)

insert into 연도(서력, 왕조, 왕, 재위년) values (1298, '고려', '충렬', 24) 
insert into 연도 values (1351, '고려', '충정',  3) 
insert into 연도 values (1503, '조선', '연산', 9) 
insert into 연도 values (1538, '조선', '중종', 33) 
insert into 연도 values (1539, '조선', '중종', 34) 
insert into 연도 values (1541, '조선', '중종', 36) 
insert into 연도 values (1549, '조선', '명종', 4) 
insert into 연도 values (1585, '조선', '선조', 18) 
insert into 연도 values (1590, '조선', '선조', 23) 
insert into 연도 values (1596, '조선', '선조', 29) 
insert into 연도 values (1597, '조선', '선조', 30) 
insert into 연도 values (1612, '조선', '광해', 4) 
insert into 연도 values (1627, '조선', '인조', 5) 
insert into 연도 values (1635, '조선', '인조', 13) 
insert into 연도 values (1650, '조선', '효종', 1) 
insert into 연도 values (1664, '조선', '현종', 5) 
insert into 연도 values (1704, '조선', '숙종', 30) 
insert into 연도 values (1719, '조선', '숙종', 45) 
insert into 연도 values (1735, '조선', '영조', 11) 
insert into 연도 values (1791, '조선', '정조', 15)


--delete문
delete from 저자


--select문
select * from 서명
select * from 저자
select * from 연도

select 서명.서명, 서명.한문서명 from 서명
select 서명, 한문서명 from 서명


--join문
--join 기본
select * from 서명
select * from 저자
-- 서명.저자와 저자.이름은 동일한 정보이므로 join 가능
select * from 서명, 저자 where 서명.저자=저자.이름
select * from 서명 inner join 저자 on 서명.저자=저자.이름

--order by (오름차순 default)
select 서명, 한문서명, 저자, 생년, 몰년, 간행년
  from 서명, 저자
  where 서명.저자=저자.이름

select 서명, 한문서명, 저자, 생년, 몰년, 간행년
  from 서명, 저자
  where 서명.저자=저자.이름
  order by 서명.간행년 asc --desc는 내림차순

--where [조건1] and [조건2]
select 서명, 저자, 몰년, 왕조, 왕, 재위년
  from 서명, 저자, 연도
  where 서명.저자=저자.이름 and 저자.몰년=연도.서력

--출력 양식 편집
select 서명+'('+한문서명+')' from 서명 --(열 이름 없음)
select 서명+'('+한문서명+')' as 책이름 from 서명
select 이름+ '(' + 한자 + ',' + cast(생년 as char(4))+'~'+cast(몰년 as char(4))+')' as 저자 from 저자
select 이름+ '(' + 한자 + ',' + cast(생년 as char(4))+'~'+cast(몰년 as char(4))+')' as 저자 from 저자


--퀴즈
--문제 : 저자 한글이름과 생년과 몰년을 보고 싶다면? 예) 이곡, 1298, 1351
select a.이름, a.생년, a.몰년 from 저자 as a
select 이름, 생년, 몰년 from 저자

--문제 : 서명, 저자, 간행년을 보고 싶다면? 예) 가정집, 이곡, 1662
select a.서명, a.저자, a.간행년 from 서명 as a
select 서명, 저자, 간행년 from 서명

--문제 : 서명테이블의 간행년과 연도테이블의 서력을 조인하라.
select * from 서명
select * from 연도
--join 명령어를 올바르게 썼어도 매칭되는 데이터가 없다면 올바른 결과를 얻을 수 없다.
select * from 서명, 연도 where 서명.간행년 = 연도.서력
select * from 서명 inner join 연도 on 서명.간행년=연도.서력