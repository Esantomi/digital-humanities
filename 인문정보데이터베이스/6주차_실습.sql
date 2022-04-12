--6주차. SQL 실습
use s_haein


--top : 부분 출력 (데이터 구조 확인)
select * from 연도
select top 5 * from 연도   --상단의 5개만 출력
select top 10 * from 연도  --상단의 5개만 출력

--as : 컬럼 이름 변경
select * from 저자
select 이름, 이름 as '한글이름' from 저자

--수식 : +-*/
select 이름, 몰년, 생년, 몰년-생년 as 수명, 생년/몰년 from 저자  --뺄셈

--cast
select 이름, cast(생년 as nchar(4)) + '년' from 저자
select 이름, cast(생년 as nchar(4)) + '년' as 생년 from 저자


--where : 조건 지정
select * from 저자
select * from 저자 where 생년 > 1700
Select * from 저자 where 생년 <= 1795
Select * from 연도 where 왕 = '선조'
select * from 연도 where 왕조 != '조선'
select * from 연도 where 왕조 is null      --null 값 검색
select * from 연도 where 왕조 is not null  --null 값 아닌 것 검색


--like : 데이터 조합 (유사한 문자열 검색 시)
select * from 저자 where 이름 = '이%'      --이름이 '이%'
select * from 저자 where 이름 LIKE '이%'   --'이'로 시작
select * from 저자 where 이름 LIKE '%이%'  --'이'가 삽입 (정규 표현식으로 치면 *이*, 즉 0개 이상의 임의의 문자)
--정규표현식 : +(1 이상), *(0 이상), ?(0 또는 1), .(임의의 1개 문자)

select * from 저자 where 이름 LIKE '이__'  --'이'로 시작하고 3글자
select * from 저자 where 생년 like '15%'
select * from 연도 where 왕 like '%조'


--in : 데이터 조합 (특정 조건 중 선택)
select * from 연도 where 왕 in ('충렬', '연산', '광해')
select * from 서명 where 저자 in ('이곡', '하항')


--and or not : 논리 연산
select * from 저자 where 이름 LIKE '이%' and 생년 > 1500  --이름이 이로 시작하고, 생년이 1500 초과하는 데이터 검색
select * from 저자 where 이름 LIKE '이%' or 생년 > 1500   --이름이 이로 시작하거나, 생년이 1500 초과하는 데이터 검색

--select * from 저자 where 이름 LIKE '이%' not 생년 > 1500  --비문
select * from 저자 where not 이름 LIKE '이%' and 생년 > 1500  --이름이 '이'로 시작하고, 생년이 1500초과가 아닌 데이터 검색

select * from 서명 where 저자 = '최립'  --실제로 많이 쓰는 형식
					or 저자 = '조임도'
					or 저자 = '하항'


--order by : 결과의 순차 정렬
select * from 저자
select * from 저자 order by 생년       --default가 오름차순
select * from 저자 order by 생년 asc   --오름차순
select * from 저자 order by 생년 desc  --내림차순 (우리는 desc로 많이 검색)


--where ... order by ... : 조건 검색 결과의 순차 정렬
select * from 저자 where 생년 < 1700 order by 이름 asc     --저자 테이블에서 생년이 1700 미만인 데이터를 이름을 기준으로 오름차순 정렬
select * from 서명 where 간행년 > 1700 order by 서명 desc  --서명 테이블에서 간행년이 1700 초과인 데이터를 서명을 기준으로 내림차순 정렬


--통계 정보의 생산
--distinct() : 중복 제거
select 왕 from 연도              --왕 컬럼 전체 출력
select distinct(왕) from 연도    --왕 컬럼 중복 제거
select distinct(왕조) from 연도  --고려, 조선 2항목
select distinct 왕, 왕조 from 연도  --왕 컬럼을 distinct하고 왕조 컬럼을 붙여 줌

--group by : 그룹화 (Excel의 Pivot과 유사함)
select 왕, count(왕) as 출현수 from 연도 group by 왕                       --왕을 기준으로 그룹화하여 검색
select 왕, count(왕) as 출현수 from 연도 group by 왕 order by 출현수 desc  --그룹화 검색을 출현수를 기준으로 내림차순 정렬

--많이 쓰는 형식. 위와 상동
select 왕, count(왕) as 출현수
	from 연도
	group by 왕
	order by count(왕) desc

--having : 그룹화 조건 (having은 group by 된 이후 그룹화된 새로운 테이블에 조건을 줄 수 있음)
select 왕, COUNT(왕) as 출현수, MIN(서력) as 최초출현, MAX(서력) as 최후출현 from 연도 group by 왕
select 왕, COUNT(왕) as 출현수,
	MIN(서력) as 최초출현,
	MAX(서력) as 최후출현
	from 연도
	group by 왕
	having COUNT(왕) > 1

--COUNT(), MIN(), MAX(), AVG(), SUM()
select 왕, COUNT(왕) as 출현수,
	MIN(서력) as 최초출현,
	MAX(서력) as 최후출현,
	avg(서력) as 평균값,
	SUM(서력) as 총합
	from 연도
	group by 왕
	having COUNT(왕) > 1


--LEN(컬럼) : 문자열 개수 추출
select 이름, LEN(이름) as 이름자수 from 저자
select * from 저자 where LEN(이름) > 2  --이름이 3자 이상인 데이터만 출력

--LTRIM, RTRIM = LTRIM(RTRIM(컬럼)) : 공백 제거 (대부분의 경우 둘을 같이 사용)
select 이름 from 저자
select LTRIM(RTRIM(이름)) as 이름 from 저자

--문자열 반환 : LEFT(문자, 자릿수), RIGHT(문자, 자릿수)
select * from 저자
select LEFT(이름, 1) as 성 from 저자            --왼쪽에서 문자 1개 (성만 추출)
select right(이름, 2) as 이름 from 저자         --왼쪽에서 문자 2개 (이름만 추출. 외자 이름은? Substring 사용!)
select substring(이름, 2, 2) as 이름 from 저자  --외자 이름도 무사히 추출

select * from 연도 where RIGHT(왕, 1) = '종'  --오른쪽에서 첫 번째 문자가 '종'이면 다 출력
select * from 연도 where 왕 like '%종'        --위와 사실상 동일한 결과

--문자열 반환 고급 : SUBSTRING(문자, 시작위치, 길이)
select * from 서명
select SUBSTRING(서명, 2, 1) from 서명  --서명 컬럼의 2번째 문자부터 1글자만큼 출력
select * from 연도 where SUBSTRING(왕, 2, 1) = '조'  --연도 테이블, 왕 컬럼의 2번째 글자부터 1글자가 '조'인 데이터 출력

--문자열 반환 고급 : PATINDEX(패턴, 컬럼)
select * from 연도
select 왕, PATINDEX('%종%', 왕) as 자리수 from 연도  --왕 컬럼에서 '%종%' 패턴이 나타나는 위치 반환

--문자열 반환 실무 : SUBSTRING + PATINDEX(패턴, 컬럼)
select * from 서명
select 서명, SUBSTRING(서명, PATINDEX('%간%', 서명), 1) from 서명  --서명 테이블, 서명 컬럼의 %간%부터 1글자만큼 반환
select 서명, PATINDEX('%간%', 서명), SUBSTRING(서명, PATINDEX('%간%', 서명), 1) from 서명


--함수 : 주어진 값에 따라 특정 결과를 반환하는 서브 프로그램
--문자열 함수 : upper(), lower(), replace(), quotename('문자열', '<>') 등
--날짜 함수 : getdate() 등
--시스템 함수
	--case 역할
	--    when '무신' then '무인'
	--    when '문신' then '문인'
	--    else '기타'
	--End

	--case
	--    when 생년 < 1600 then '조선전기'
	--    when 생년 >= 1600 then '조선후기'
	--    else '미상'
	--end
--계산 함수 : avg(), count(), max(), min(), sum()
--논리 연산자 : AND, OR, NOT, LIKE, IN
--비교 연산자 : =, !=, <>, >, !>, <, !<
--수치 연산자 : +, -, *, /, %
--할당 연산자
--와일드 카드 : %, _, [] 등


--퀴즈
--문제 : '연도' 테이블에서 '서력'과 '왕' 이름만 10개 출력하시오.
select * from 연도
select top 10 서력, 왕 from 연도

--문제 : 간행년이 1700년 이전인 책의 서명과 간행년을 모두 출력하라. 예) 가정집, 1662
select * from 서명
select 서명, 간행년 from 서명 where 간행년 < 1700

--문제 : 중종대의 서력와 해당 재위년을 출력하라. 예) 중종, 1541년, 36년
select * from 연도
select 서력, 재위년 from 연도 where 왕 = '중종'

--문제 : “간”으로 시작하는 모든 서명과 저자를 출력하라. 예) 간송집, 조임도
select * from 서명
select 서명, 저자 from 서명 where 서명 like '간%'
select 서명, 저자 from 서명 where 서명 like '간%' or 저자 like '간%'

--문제 : “조”씨가 만든 모든 서명과 간행년을 출력하라. 예) 간송집, 1744
select * from 서명
select 서명, 간행년 from 서명 where 저자 like '조%'

--문제 : 최립이나 이헌경이 쓴 책의 이름과 저자명을 출력하시오. 예) 간이집(簡易集), 최립
select * from 서명
select 서명 + '(' + 한문서명 + ')' as 서명, 저자 from 서명 where 저자 in ('최립', '이헌경')

--문제 : 조선의 왕이면서 1600년 이전이 아닌 왕의 이름과 서력을 출력하라. 예) 인조, 1935년
select * from 연도
select 왕, 서력 from 연도 where 왕조 = '조선' and 서력 !< 1600

--문제: 저자들의 이름을 기준으로 내림차순 정렬하여 출력하라.
select * from 저자
select * from 저자 order by 이름 desc


--과제 : 지금까지 배운 문법을 기초로 문제를 출제하고 정답과 같이 제출하시오. (월요일 오전 9시까지 메일 제출)
--여러 개 가능, 남들 괴롭게, 가능한 한 어렵게, 데이터 추가 가능하나 create, insert문 같이 제출.