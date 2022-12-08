--荤必 能刨明 诀肺靛侩 SQL巩
USE s_haein

--historyContents_bulk 抛捞喉 积己
CREATE TABLE historyContents_bulk (xmltxt xml)
SELECT * FROM historyContents_bulk

--DROP TABLE historyContents_bulk


--辑滚狼 xml 颇老阑 historyContents_bulk 抛捞喉俊 火涝
INSERT INTO historyContents_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\荤必\2022-201_荤必_能刨明_秒钦.xml',  
   SINGLE_BLOB) AS x;  

SELECT * FROM historyContents_bulk


--historyContents_xml 抛捞喉 积己
CREATE TABLE historyContents_xml (
	id	nvarchar(40) NOT NULL,
	xmltxt 	xml NOT NULL,
	primary key(id)
	)

SELECT * FROM historyContents_xml

--DROP TABLE historyContents_xml


--historyContents_getid 飘府芭 积己
CREATE TRIGGER historyContents_getid ON historyContents_xml INSTEAD OF INSERT
AS
	INSERT INTO historyContents_xml(id, xmltxt)
	SELECT
		t.xmltxt.value('(/能刨明/@id)[1]', 'nvarchar(40)') AS id,
		t.xmltxt AS xmltxt	
	FROM inserted t

--DROP TRIGGER historyContents_getid;


--CROSS APPLY 利侩窍咯 炼雀
SELECT node.query('.') 
	FROM   historyContents_bulk CROSS APPLY xmltxt.nodes('/荤必能刨明/能刨明') AS R(node) 


--historyContents_xml 抛捞喉俊 火涝
INSERT INTO historyContents_xml(xmltxt)
	SELECT node.query('.') 
	FROM   historyContents_bulk CROSS APPLY xmltxt.nodes('/荤必能刨明/能刨明') AS R(node) 

SELECT * FROM historyContents_xml