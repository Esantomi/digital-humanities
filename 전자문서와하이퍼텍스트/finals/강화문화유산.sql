USE s_haein

/* ① 강화문화유산_xml 테이블 생성 */

/* upload XML file */

-- DROP TABLE 강화문화유산_bulk
-- DROP TABLE 강화문화유산_xml

CREATE TABLE 강화문화유산_bulk (xmltxt xml)

SELECT * FROM 강화문화유산_bulk

INSERT INTO 강화문화유산_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\student\s08\final\Haein_강화.xml',  
   SINGLE_BLOB) AS x;  

SELECT * FROM 강화문화유산_bulk

/* create XML DB table */

CREATE TABLE 강화문화유산_xml (
   id   nvarchar(40) NOT NULL,
   xmltxt    xml NOT NULL,
   primary key(id)
   )


/* ② 강화문화유산_xml 테이블 기사 단위 적재 */
   
/* create trigger */

CREATE TRIGGER 문화유산_getid ON 강화문화유산_xml INSTEAD OF INSERT
AS
   INSERT INTO 강화문화유산_xml(id, xmltxt)
   SELECT
      t.xmltxt.value('(/문화유산/@id)[1]', 'nvarchar(40)') AS id,
      t.xmltxt AS xmltxt
   FROM inserted t
   
/* insert xml record from bulk-uploaded file */

SELECT node.query('.') 
   FROM   강화문화유산_bulk CROSS APPLY xmltxt.nodes('/강화문화유산/문화유산') AS R(node) 

INSERT INTO 강화문화유산_xml(xmltxt)
   SELECT node.query('.') 
   FROM   강화문화유산_bulk CROSS APPLY xmltxt.nodes('/강화문화유산/문화유산') AS R(node) 

SELECT * FROM 강화문화유산_xml


/* ③ 강화문화유산_meta 뷰 보이기 */

/* create metadata view */

--drop view 강화문화유산_meta

create view 강화문화유산_meta as
select 
id, 
xmltxt.value('(/문화유산/대표명칭)[1]', 'nchar(40)' ) as 대표명칭,
xmltxt.value('(/문화유산/메타데이터/영문명칭)[1]', 'nchar(40)') as 영문명칭,
xmltxt.value('(/문화유산/메타데이터/한문명칭)[1]', 'nchar(40)') as 한자,
xmltxt.value('(/문화유산/메타데이터/주소)[1]', 'nchar(80)') as 주소,
xmltxt.value('(/문화유산/메타데이터/지정번호)[1]', 'nchar(40)') as 지정번호,
xmltxt.value('(/문화유산/메타데이터/웹사이트/@url)[1]', 'nchar(40)') as 웹페이지
from 강화문화유산_xml

select * from 강화문화유산_meta