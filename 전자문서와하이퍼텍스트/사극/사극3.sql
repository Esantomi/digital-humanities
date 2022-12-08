/* 시맨틱 네트워크 데이터로 변환 */

USE Class2022


/* create Node List */

--drop table 사극Data
--delete 사극Data

create table 사극Data (
	id	nvarchar(40) Not Null,
	class	nvarchar(40) Null,
	groupName	nvarchar(40) Null,
	partName	nvarchar(40) Null,
	label	nvarchar(160) Null,
	hangeul	nvarchar(80) Null,
	hanja	nvarchar(80) Null,
	english	nvarchar(160) Null,
	infoUrl	nvarchar(255) Null,
	iconUrl	nvarchar(255) Null,
	note	nvarchar(255) Null,
	remark	nvarchar(max) Null,
	primary key(id)
)

select distinct 유형 from 사극_meta
-- 드라마, 영화

insert into 사극Data(id, class, groupName, partName, label, infoUrl, iconUrl, note, remark)
select id, '콘텐츠', 유형, 방송사, 타이틀, 홈페이지, 사진, 방영, 내용
from 사극_meta
where 유형='드라마'
-- 74

insert into 사극Data(id, class, groupName, partName, label, infoUrl, iconUrl, note, remark)
select id, '콘텐츠', 유형, 배급사, 타이틀, 홈페이지, 사진, 상영, 내용
from 사극_meta
where 유형='영화'
-- 15

select * from 사극Data


/* data cleaning */

-- 공백 문자의 정체 파악 

select id, remark, unicode(substring(remark, 1, 1)), unicode(substring(remark, 2, 1)),  unicode(substring(remark, 3, 1))
from 사극Data

-- 문제의 문자 처리: char(10), char(9), char(32)

update 사극Data
set label = replace(id,'_', ' '),
remark = replace(replace(remark, char(10), ''), char(9), '')

update 사극Data
set remark = ltrim(rtrim(remark))

select * from 사극Data

-- Single Quotation 문자 char(39) 존재 여부 확인/수정

select remark from 사극Data
where remark like '%'+char(39)+'%'

update 사극Data
set remark = replace(remark, char(39), char(34))
where remark like '%'+char(39)+'%'

select remark from 사극Data
where remark like '%'+char(34)+'%'

update 사극Data
set note=NULL
where note='NULL'

select * from 사극Data