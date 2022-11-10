/* upload XML file */

USE s_haein

-- DROP TABLE seongnam_bulk
-- DROP TABLE seongnam_xml

--seongnam_bulk 테이블 생성 (column 1개, 형식 xml)
CREATE TABLE seongnam_bulk (xmltxt xml)

--seongnam_bulk 보기
SELECT * FROM seongnam_bulk

--SELECT 결과를 seongnam_bulk에 삽입
---경로는 digerati 서버상의 위치
---하나의 Binary Large Object(BLOB)로 처리
INSERT INTO seongnam_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\성남문화대전\성남문화대전.xml',  
   SINGLE_BLOB) AS x;  

--seongnam_bulk 보기
SELECT * FROM seongnam_bulk
--이제 seongnam_bulk column의 내용물을 여러 column으로 나눠야 함


/* create XML DB table */

--seongnam_xml 테이블 생성 (column 2개, 형식 nvarchar, xml)
CREATE TABLE seongnam_xml (
	id	nvarchar(40) NOT NULL,
	xmltxt 	xml NOT NULL,
	primary key(id)
	)

	
/* create trigger */

--TRIGGER는 table에 종속된 함수
---INSERT를 실행하면 INSERT 대신 아래의 복잡한 INSERT를 실행하게 하는 설정
---seongnam_bulk 테이블의 내용물을 seongnam_xml 테이블에 나눠 담기 위한 명령
CREATE TRIGGER seongnam_getid ON seongnam_xml INSTEAD OF INSERT
AS
	INSERT INTO seongnam_xml(id, xmltxt)
	SELECT
		t.xmltxt.value('(/항목/@ID)[1]', 'nvarchar(40)') AS id,
		t.xmltxt AS xmltxt	
	FROM inserted t
	
	
/* insert xml record from bulk-uploaded file */

--항목을 찾아서 노드로 추출
---node.query('.') : node 그 자신을 보기
---CROSS APPLY : INNER JOIN과 동일
SELECT node.query('.') 
	FROM   seongnam_bulk CROSS APPLY xmltxt.nodes('/향토문화백과/항목') AS R(node) 

--추출한 노드를 seongnam_xml 테이블에 삽입
INSERT INTO seongnam_xml(xmltxt)
	SELECT node.query('.') 
	FROM   seongnam_bulk CROSS APPLY xmltxt.nodes('/향토문화백과/항목') AS R(node) 

--seongnam_xml 보기
SELECT * FROM seongnam_xml