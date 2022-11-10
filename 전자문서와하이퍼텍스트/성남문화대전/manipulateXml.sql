USE Class2022

/* browse xml data */

SELECT * FROM seongnam_xml

select xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nchar(80)') from seongnam_xml

select xmltxt.query('//인명') from seongnam_xml

select 
xmltxt.query('/항목/항목명/대표항목명'),
xmltxt.query('/항목/항목명/한자항목명'),
xmltxt.query('/항목/메타데이터/대표분야'),
xmltxt.query('/항목/메타데이터/대표유형'),
xmltxt.query('/항목/메타데이터/표준지역')
from seongnam_xml

/* create metadata view */

--drop view seongnam_meta

create view seongnam_meta as
select 
id, 
xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nchar(40)' ) as 대표명칭,
xmltxt.value('(/항목/항목명/한자항목명)[1]', 'nchar(40)') as 한자명칭,
xmltxt.value('(/항목/메타데이터/대표분야)[1]', 'nchar(80)') as 분야,
xmltxt.value('(/항목/메타데이터/대표유형)[1]', 'nchar(40)') as 유형,
xmltxt.value('(/항목/메타데이터/표준지역)[1]', 'nchar(80)') as 소재지
from seongnam_xml

select * from seongnam_meta

/* insert new xml data */

INSERT INTO  seongnam_xml(xmltxt) VALUES(
N'

') 

select * from seongnam_xml
select * from seongnam_meta

select id, xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nvarchar(80)' ), xmltxt from seongnam_xml
where xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nvarchar(80)' )='정일당 강씨 사당'  

select seongnam_meta.id, 대표명칭, xmltxt from seongnam_meta
join  seongnam_xml on seongnam_meta.id = seongnam_xml.id
where 대표명칭='정일당 강씨 사당'

select seongnam_meta.id, 대표명칭, xmltxt from seongnam_meta
join  seongnam_xml on seongnam_meta.id = seongnam_xml.id
where 대표명칭='낙생습지'


/* create keyword index view: 인명 */

CREATE VIEW seongnam_person AS
  SELECT id, node.value('.', 'nchar(80)' ) AS 인명
  FROM  seongnam_xml CROSS APPLY xmltxt.nodes('//인명') AS R(node) 

SELECT * FROM seongnam_person

SELECT 인명, count(*) as 빈도
  FROM  seongnam_person
  GROUP BY 인명
  
  
/* create keyword index view: 지명 */
  
CREATE VIEW seongnam_xml_place AS
  SELECT id, node.value('.', 'nchar(80)' ) AS 지명
  FROM  seongnam_xml CROSS APPLY xmltxt.nodes('//지명') AS R(node) 

SELECT * FROM seongnam_xml_place

SELECT 지명, count(*) as 빈도
  FROM  seongnam_xml_place
  GROUP BY 지명