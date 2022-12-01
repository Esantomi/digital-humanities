/* upload XML file */

USE Class2022

-- DROP TABLE 荤必_bulk
-- DROP TABLE 荤必_xml

CREATE TABLE 荤必_bulk (xmltxt xml)

SELECT * FROM 荤必_bulk

INSERT INTO 荤必_bulk ( xmltxt )
SELECT * FROM OPENROWSET(  
   BULK 'e:\inetpub\wwwroot\DhLab\2022\201\workshop\荤必\xml\儡教氛.xml',  
   SINGLE_BLOB) AS x;  

/*
困俊辑, 荐碍积 阿磊啊 累己窍咯 焊辰 7-8俺 钦夯阑 窍唱狼 傈眉 颇老肺 秒钦窍瘤 臼绊 阿阿 INSERT窃
*/

SELECT * FROM 荤必_bulk


/* create XML DB table */

CREATE TABLE 荤必_xml (
   id   nvarchar(40) NOT NULL,
   xmltxt    xml NOT NULL,
   primary key(id)
   )

   
/* create trigger */

CREATE TRIGGER 荤必_getid ON 荤必_xml INSTEAD OF INSERT
AS
   INSERT INTO 荤必_xml(id, xmltxt)
   SELECT
      t.xmltxt.value('(/能刨明/@id)[1]', 'nvarchar(40)') AS id,
      t.xmltxt AS xmltxt   
   FROM inserted t
   
   
/* insert xml record from bulk-uploaded file */

SELECT node.query('.') 
   FROM   荤必_bulk CROSS APPLY xmltxt.nodes('/单捞磐/能刨明') AS R(node) 

INSERT INTO 荤必_xml(xmltxt)
   SELECT node.query('.') 
   FROM   荤必_bulk CROSS APPLY xmltxt.nodes('/单捞磐/能刨明') AS R(node) 

SELECT * FROM 荤必_xml