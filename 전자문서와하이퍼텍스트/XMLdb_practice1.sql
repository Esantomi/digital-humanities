--남한산성 데이터 조회
select * from common.dbo.남한산성_xml

select xmltxt.query('//인명') from common.dbo.남한산성_xml
select xmltxt.query('//지명') from common.dbo.남한산성_xml
select xmltxt.query('/항목/메타데이터/집필자') from common.dbo.남한산성_xml


--회화 데이터 조회
select * from common.dbo.paintings

select xmltxt.query('/') from common.dbo.paintings where id='w01'  --/ : 최상위 노드
select xmltxt.query('/개체/속성/작가') from common.dbo.paintings where id='w01'
select xmltxt.query('/개체/표제'), xmltxt.query('/개체/속성/작가') from common.dbo.paintings where id='w05'

select xmltxt.value('(/개체/속성/@틀)[1]', 'nvarchar(max)') from common.dbo.paintings where id='w01'  --@ : attributeselect xmltxt.value('(/개체/표제/이름)[1]', 'nvarchar(max)') as 작품명,
	xmltxt.value('(/개체/속성/작가)[1]', 'nvarchar(max)') as 작가
	from common.dbo.paintings


--재귀적 내림 연산자 //
select xmltxt.query('//인명') from common.dbo.paintings where id='w05'

select id, 
	xmltxt.value('(/개체/표제/이름)[1]', 'nvarchar(max)') as 작품명, 
	xmltxt.value('(/개체/속성/작가)[1]', 'nvarchar(max)') as 작가,
	xmltxt.query('//인명') as 출현인명, 
	xmltxt.query('//지명') as 출현지명
	from common.dbo.paintings


--필터 []
select xmltxt.query('/개체/설명/문단[./지명]') from common.dbo.paintings           --문단 안의 지명 데이터select xmltxt.query('/개체/설명/문단[./지명="황룡사"]') from common.dbo.paintings  --문단 안의 지명이 황룡사인 데이터select xmltxt.query('/개체/표제/이름[./@표기="한자"]') from common.dbo.paintings   --표기는 attribute이므로 @를 사용select id,
	xmltxt.value('(/개체/표제/이름)[1]', 'nvarchar(max)') as 작품명, 
	xmltxt.value('(/개체/속성/작가)[1]', 'nvarchar(max)') as 작가,
	xmltxt.value('(/개체/표제/이름[./@표기="국문"])[1]', 'nvarchar(max)') as 국문,
	xmltxt.value('(/개체/표제/이름[./@표기="한자"])[1]', 'nvarchar(max)') as 한자 
	from common.dbo.paintings


--XPath 함수
---count : 개수 세기
select xmltxt.query('count(/개체/설명/문단/인명)') from common.dbo.paintings where id='w05'
---node() : 그 밑에 있는 임의의 노드 전체
select xmltxt.query('/개체/표제/node()') from common.dbo.paintings where id='w03'---text() : 텍스트 데이터select xmltxt.query('/개체/설명/문단/text()') from common.dbo.paintings where id='w03'---position() : 위치 지정select xmltxt.query('(//인명)[position()=1]') from common.dbo.paintings where id='w05'  --id w05의 인명 3개 중 1번째 데이터---last() : 마지막 위치 설정select xmltxt.query('(//인명)[last()]') from common.dbo.paintings where id='w05'