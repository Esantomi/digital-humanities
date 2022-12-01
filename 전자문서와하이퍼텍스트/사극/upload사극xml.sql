/* upload XML file */

USE Class2022

-- DROP TABLE ���_bulk
-- DROP TABLE ���_xml

CREATE TABLE ���_bulk (xmltxt xml)

SELECT * FROM ���_bulk

INSERT INTO ���_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\���\xml\�̷ܽ�.xml',  
   SINGLE_BLOB) AS x;  

/*
������, ������ ���ڰ� �ۼ��Ͽ� ���� 7-8�� �պ��� �ϳ��� ��ü ���Ϸ� �������� �ʰ� ���� INSERT��
*/

SELECT * FROM ���_bulk


/* create XML DB table */

CREATE TABLE ���_xml (
   id   nvarchar(40) NOT NULL,
   xmltxt    xml NOT NULL,
   primary key(id)
   )

   
/* create trigger */

CREATE TRIGGER ���_getid ON ���_xml INSTEAD OF INSERT
AS
   INSERT INTO ���_xml(id, xmltxt)
   SELECT
      t.xmltxt.value('(/������/@id)[1]', 'nvarchar(40)') AS id,
      t.xmltxt AS xmltxt   
   FROM inserted t
   
   
/* insert xml record from bulk-uploaded file */

SELECT node.query('.') 
   FROM   ���_bulk CROSS APPLY xmltxt.nodes('/������/������') AS R(node) 

INSERT INTO ���_xml(xmltxt)
   SELECT node.query('.') 
   FROM   ���_bulk CROSS APPLY xmltxt.nodes('/������/������') AS R(node) 

SELECT * FROM ���_xml