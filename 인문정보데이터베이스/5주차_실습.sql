--5주차. SQL 실습
use s_haein


--출력 양식 편집
select * from 서명
select 서명 + '(' + 한문서명 + ')' from 서명            --서명, 한문서명을 한 컬럼으로 병합 (열 이름 없음)
select 서명 , '(' + 한문서명 + ')' from 서명            --,는 컬럼으로 분리 (열 이름 없음)
select 서명 + '(' + 한문서명 + ')' as 책이름 from 서명  --컬럼명을 '책이름'으로 설정


--cast() : 형 변환 함수
--select 이름 + '(' + 한자 + ',' + 생년 from 저자                                                             --nvarchar 값 '이곡(李穀,'을(를) 데이터 형식 int(으)로 변환하지 못했습니다.
select 이름 + '(' + 한자 + ',' + cast(생년 as char(4)) + '~' + cast(몰년 as char(4)) + ')' from 저자          --생년, 몰년을 4자리 수 문자(char)로 형 변환(cast) (열 이름 없음)
select 이름 + '(' + 한자 + ',' + cast(생년 as char(4)) + '~' + cast(몰년 as char(4)) + ')' as 저자 from 저자
select 이름 + '(' + 한자 + ',' + cast(생년 as nvarchar) + '~' + cast(몰년 as nvarchar) + ')' from 저자        --생년, 몰년을 가변 길이 문자(nvarchar)로 형 변환(cast) (열 이름 없음)
select 이름 + '(' + 한자 + ',' + cast(생년 as nvarchar) + '~' + cast(몰년 as nvarchar) + ')' as 저자 from 저자


--convert() : 형 변환 함수
select 이름 + 한자 + cast(생년 as nvarchar) + 왕조 + 왕 + cast(재위년 as nvarchar) from 저자 inner join 연도 on 저자.생년 = 연도.서력
select 이름 + 한자 + convert(nvarchar, 생년) + 왕조 + 왕 + convert(nvarchar, 재위년) from 저자 inner join 연도 on 저자.생년 = 연도.서력  --위와 동일


--문자형
--CHAR[(N)] : 고정 길이 문자형
--NCHAR[(N)] : 유니코드 고정 길이 문자형 (0~4000자)
--VARCHAR[(N | MAX)] : 가변 길이 문자형. N을 사용하면 1~8000까지 크기를 지정 가능, MAX로 지정하면 최대 2GB 크기를 지정 가능 
--NVARCHAR[(N | MAX)] : 유니코드 가변 길이 문자형. N을 사용하면 1~4000까지 크기를 지정 가능, MAX를 지정하면 최대 2GB 크기를 지정 가능
--우리는 데이터 크기가 작으므로 varchar를 쓰는 게 편함


--출력 양식 편집 실습
select 이름 + '(' + 한자 + ',' + cast(생년 as char(4)) + '(' + 왕조 + 왕 + cast(재위년 as char(2)) + ')' + ')'
as 이름한자생년왕력 from 저자, 연도 where 저자.생년=연도.서력

select 이름 + '(' + 한자 + ', ' + convert(nvarchar, 생년) + '(' + 왕조 + 왕 + convert(nvarchar, 재위년) + ')' + ')'
as 이름한자생년왕력 from 저자 inner join 연도 on 저자.생년 = 연도.서력


--view 문
--view는 데이터 변동을 실시간으로 반영함
create view 고서목록 as 
	select 서명 + '(' + 한문서명 + ')' as 서명,                                                    --서명 컬럼
	이름 + '(' + 한자 + ', ' + cast(생년 as char(4)) + '-' + cast(몰년 as char(4)) + ')' as 저자,  --저자 컬럼
	간행년                                                                                         --간행년 컬럼
	from 저자 inner join 서명 on 서명.저자 = 저자.이름
	--from 저자, 서명 where 서명.저자 = 저자.이름
select * from 고서목록


--view 삭제
drop view 고서목록


--insert 응용
insert into 저자 (이름, 한자, 생년, 몰년)
	select * from 저자 where 생년 > 1500
select * from 저자


--update 문
--NULL 값 예시를 위해 간재집 행 2개 삽입
insert into 서명(서명, 간행년) values ('간재집', 1928)  --간재집 행 삽입
insert into 서명(서명, 간행년) values ('간재집', 1766)  --간재집 행 삽입
select * from 서명                                      --한문서명, 저자 NULL값 

--시대, 세기 컬럼 추가 후 업데이트
select * from 서명
alter table 서명 add 시대 nvarchar(50)  --서명 테이블에 시대 컬럼 추가
alter table 서명 add 세기 nvarchar(50)  --서명 테이블에 세기 컬럼 추가
update 서명 set 서명.세기 = 간행년/100+1  --서명 테이블의 세기 컬럼을 간행년/100+1로 update
update 서명 set 시대 = cast(간행년/100+1 as char(2)) + '세기'  --서명 테이블의 시대 컬럼을 '간행년/100+1 + 세기'로 update

--NULL 값 마저 채우기
update 서명 set 한문서명 = '艮齋集' where 서명 = '간재집'  --간재집의 한문서명 update
update 서명 set 저자 = '최연' where 간행년 = 1928          --1928 간행된 행의 저자는 최연
update 서명 set 저자 = '이덕홍' where 간행년 = 1766        --1766 간행된 행의 저자는 이덕홍
select * from 서명


--alter 문


--delete 문


--drop 문


--퀴즈
--문제 : 저자 테이블과 연도 테이블을 조인하라.
select * from 저자 inner join 연도 on 저자.생년 = 연도.서력
--select * from 저자 inner join 연도 on 저자.생년=연도.서력 OR 저자.몰년 = 연도.서력
select * from 저자 as a inner join 연도 as b on a.생년 = b.서력  --as 사용
select * from 저자, 연도 where 저자.생년 = 연도.서력             --slang

--문제 : [연도] 테이블의 모든 정보를 이용하여 [연도_03] view을 만드시오.
create view 연도_03 as select * from 연도
select * from 연도
select * from 연도_03

--문제 : [연도] 테이블에 (1418, 조선, 세종, 1)을 입력하시오.
insert into 연도 values(1418, '조선', '세종', 1)
--insert into 연도(서력, 왕조, 왕, 재위년) values(1418, '조선', '세종', 1)
select * from 연도
--delete from 연도 where 연도.왕='세종'  --왕=세종인 행 삭제

--문제 : [연도] 테이블에 [시대] 컬럼을 추가하고, 서력을 시대값으로 입력하시오.

--문제 : [연도] 테이블에서 [왕조]가 고려인 모든 데이터를 삭제하시오.

--문제 : [연도_01] table을 삭제하시오.

--문제 : [연도_03] view을 삭제하시오.


--과제 : create view 구문 만들어서 제출
	--5주차_과제.sql 확인