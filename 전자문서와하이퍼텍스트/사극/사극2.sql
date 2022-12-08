USE Class2022


/* browse xml data */

select * from 사극_xml

select xmltxt.value('(/콘텐츠/@id)[1]', 'nchar(80)') from 사극_xml                                        

select xmltxt.query('//인명') from 사극_xml


/* create metadata view */

--drop view 사극_meta

create view 사극_meta as
select id,
xmltxt.value('(/콘텐츠/메타데이터/유형)[1]', 'nvarchar(40)') as 유형,
xmltxt.value('(/콘텐츠/메타데이터/상영)[1]', 'nvarchar(40)') as 상영,
xmltxt.value('(/콘텐츠/메타데이터/방영)[1]', 'nvarchar(40)') as 방영,
xmltxt.value('(/콘텐츠/메타데이터/배급사)[1]', 'nvarchar(40)') as 배급사,
xmltxt.value('(/콘텐츠/메타데이터/방송사)[1]', 'nvarchar(40)') as 방송사,
xmltxt.value('(/콘텐츠/타이틀)[1]', 'nvarchar(80)') as 타이틀,
xmltxt.value('(/콘텐츠/메타데이터/홈페이지/@url)[1]', 'nvarchar(40)') as 홈페이지,
xmltxt.value('(/콘텐츠/멀티미디어/사진/@url)[1]', 'nvarchar(255)') as 사진,
xmltxt.value('(/콘텐츠/내용)[1]', 'nvarchar(max)') as 내용
from 사극_xml

select * from 사극_meta

/* create 콘텐츠-캐릭터-연기자 관계 데이터 view

	<콘텐츠 id="개국">
	  <메타데이터>
		<출연자>
		  <인명 캐릭터="조선_태조">임동진</인명>
		</출연자>
	  <메타데이터>
	</콘텐츠>

*/

create view 사극_character AS
  select id, actor.value('./@캐릭터', 'nchar(40)' ) as 캐릭터, actor.value('.', 'nchar(40)' ) as 연기자
  from  사극_xml cross apply xmltxt.nodes('/콘텐츠/메타데이터/출연자/인명') as actorList(actor) 

select * from 사극_character


/* 활용 예시 */

-- 1) 드라마나 영화에는 어떤 역사인물 캐릭터가 많이 등장했나?

select 캐릭터, count(*) as 횟수 from 사극_character
group by 캐릭터 order by count(*) desc

-- 2) 드라마나 영화에서 조선시대 왕 영조의 역할을 했던 배우들 

select * from 사극_character where 캐릭터 in ('조선_영조', '조선_영조(아역)' )

-- 3) 조선시대 왕 정조가 등장한 영화, 드라마

select a.캐릭터, a.연기자, b.* from 사극_character as a
join 사극_meta as b on a.id=b.id
where a.캐릭터='조선_정조'