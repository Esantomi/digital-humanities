/* upload XML file */

USE Class2022

-- DROP TABLE seongnam_bulk
-- DROP TABLE seongnam_xml


CREATE TABLE seongnam_bulk (xmltxt xml)

SELECT * FROM seongnam_bulk

INSERT INTO seongnam_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\성남문화대전\성남문화대전.xml',  
   SINGLE_BLOB) AS x;  

SELECT * FROM seongnam_bulk

/* create XML DB table */

CREATE TABLE seongnam_xml (
	id	nvarchar(40) NOT NULL,
	xmltxt 	xml NOT NULL,
	primary key(id)
	)

	
/* create trigger */

CREATE TRIGGER seongnam_getid ON seongnam_xml INSTEAD OF INSERT
AS
	INSERT INTO seongnam_xml(id, xmltxt)
	SELECT
		t.xmltxt.value('(/항목/@ID)[1]', 'nvarchar(40)') AS id,
		t.xmltxt AS xmltxt	
	FROM inserted t
	
	
/* insert xml record from bulk-uploaded file */

SELECT node.query('.') 
	FROM   seongnam_bulk CROSS APPLY xmltxt.nodes('/향토문화백과/항목') AS R(node) 

INSERT INTO seongnam_xml(xmltxt)
	SELECT node.query('.') 
	FROM   seongnam_bulk CROSS APPLY xmltxt.nodes('/향토문화백과/항목') AS R(node) 

SELECT * FROM seongnam_xml