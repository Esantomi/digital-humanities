USE s_haein

/* �� ��ȭ��ȭ����_xml ���̺� ���� */

/* upload XML file */

-- DROP TABLE ��ȭ��ȭ����_bulk
-- DROP TABLE ��ȭ��ȭ����_xml

CREATE TABLE ��ȭ��ȭ����_bulk (xmltxt xml)

SELECT * FROM ��ȭ��ȭ����_bulk

INSERT INTO ��ȭ��ȭ����_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\student\s08\final\Haein_��ȭ.xml',  
   SINGLE_BLOB) AS x;  

SELECT * FROM ��ȭ��ȭ����_bulk

/* create XML DB table */

CREATE TABLE ��ȭ��ȭ����_xml (
   id   nvarchar(40) NOT NULL,
   xmltxt    xml NOT NULL,
   primary key(id)
   )


/* �� ��ȭ��ȭ����_xml ���̺� ��� ���� ���� */
   
/* create trigger */

CREATE TRIGGER ��ȭ����_getid ON ��ȭ��ȭ����_xml INSTEAD OF INSERT
AS
   INSERT INTO ��ȭ��ȭ����_xml(id, xmltxt)
   SELECT
      t.xmltxt.value('(/��ȭ����/@id)[1]', 'nvarchar(40)') AS id,
      t.xmltxt AS xmltxt
   FROM inserted t
   
/* insert xml record from bulk-uploaded file */

SELECT node.query('.') 
   FROM   ��ȭ��ȭ����_bulk CROSS APPLY xmltxt.nodes('/��ȭ��ȭ����/��ȭ����') AS R(node) 

INSERT INTO ��ȭ��ȭ����_xml(xmltxt)
   SELECT node.query('.') 
   FROM   ��ȭ��ȭ����_bulk CROSS APPLY xmltxt.nodes('/��ȭ��ȭ����/��ȭ����') AS R(node) 

SELECT * FROM ��ȭ��ȭ����_xml


/* �� ��ȭ��ȭ����_meta �� ���̱� */

/* create metadata view */

--drop view ��ȭ��ȭ����_meta

create view ��ȭ��ȭ����_meta as
select 
id, 
xmltxt.value('(/��ȭ����/��ǥ��Ī)[1]', 'nchar(40)' ) as ��ǥ��Ī,
xmltxt.value('(/��ȭ����/��Ÿ������/������Ī)[1]', 'nchar(40)') as ������Ī,
xmltxt.value('(/��ȭ����/��Ÿ������/�ѹ���Ī)[1]', 'nchar(40)') as ����,
xmltxt.value('(/��ȭ����/��Ÿ������/�ּ�)[1]', 'nchar(80)') as �ּ�,
xmltxt.value('(/��ȭ����/��Ÿ������/������ȣ)[1]', 'nchar(40)') as ������ȣ,
xmltxt.value('(/��ȭ����/��Ÿ������/������Ʈ/@url)[1]', 'nchar(40)') as ��������
from ��ȭ��ȭ����_xml

select * from ��ȭ��ȭ����_meta