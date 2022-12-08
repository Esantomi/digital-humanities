USE Class2022

-- DROP TABLE 사극_bulk
-- DROP TABLE 사극_xml


/* upload XML file */

CREATE TABLE 사극_bulk (xmltxt xml)

SELECT * FROM 사극_bulk

INSERT INTO 사극_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',  
   SINGLE_BLOB) AS x;  

/*
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\사극\xml\아무개.xml',
*/

SELECT * FROM 사극_bulk


/* create XML DB table */

CREATE TABLE 사극_xml (
	id	nvarchar(40) NOT NULL,
	xmltxt 	xml NOT NULL,
	primary key(id)
	)

	
/* create trigger */

CREATE TRIGGER 사극_getid ON 사극_xml INSTEAD OF INSERT
AS
	INSERT INTO 사극_xml(id, xmltxt)
	SELECT
		t.xmltxt.value('(/콘텐츠/@id)[1]', 'nvarchar(40)') AS id,
		t.xmltxt AS xmltxt	
	FROM inserted t
	
	
/* insert xml record from bulk-uploaded file */

SELECT node.query('.') 
	FROM   사극_bulk CROSS APPLY xmltxt.nodes('/데이터/콘텐츠') AS R(node) 

INSERT INTO 사극_xml(xmltxt)
	SELECT node.query('.') 
	FROM   사극_bulk CROSS APPLY xmltxt.nodes('/데이터/콘텐츠') AS R(node) 

SELECT * FROM 사극_xml