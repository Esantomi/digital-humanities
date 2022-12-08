--��� ������ ���ε�� SQL��
USE s_haein

--historyContents_bulk ���̺� ����
CREATE TABLE historyContents_bulk (xmltxt xml)
SELECT * FROM historyContents_bulk

--DROP TABLE historyContents_bulk


--������ xml ������ historyContents_bulk ���̺� ����
INSERT INTO historyContents_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\���\2022-201_���_������_����.xml',  
   SINGLE_BLOB) AS x;  

SELECT * FROM historyContents_bulk


--historyContents_xml ���̺� ����
CREATE TABLE historyContents_xml (
	id	nvarchar(40) NOT NULL,
	xmltxt 	xml NOT NULL,
	primary key(id)
	)

SELECT * FROM historyContents_xml

--DROP TABLE historyContents_xml


--historyContents_getid Ʈ���� ����
CREATE TRIGGER historyContents_getid ON historyContents_xml INSTEAD OF INSERT
AS
	INSERT INTO historyContents_xml(id, xmltxt)
	SELECT
		t.xmltxt.value('(/������/@id)[1]', 'nvarchar(40)') AS id,
		t.xmltxt AS xmltxt	
	FROM inserted t

--DROP TRIGGER historyContents_getid;


--CROSS APPLY �����Ͽ� ��ȸ
SELECT node.query('.') 
	FROM   historyContents_bulk CROSS APPLY xmltxt.nodes('/���������/������') AS R(node) 


--historyContents_xml ���̺� ����
INSERT INTO historyContents_xml(xmltxt)
	SELECT node.query('.') 
	FROM   historyContents_bulk CROSS APPLY xmltxt.nodes('/���������/������') AS R(node) 

SELECT * FROM historyContents_xml