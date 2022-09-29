<?xml version="1.0" encoding="utf-8"?>
<!-- XSL for 항목_Display 1.0 written by Hyeon Kim 2018. 5. 2. -->


<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml">
  
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
	<html:html>
		<html:head>
			<html:title>이력서</html:title>
			<html:style>
          				body {font-family:함초롬바탕}
          				img {border:0}
          				a {text-decoration:none}
        			</html:style>
      		</html:head>
		<html:body>
        			<xsl:apply-templates/>
      		</html:body>
    	</html:html>
	</xsl:template>


<xsl:template match="이력서">
	<html:center><html:h1>이력서</html:h1></html:center>
	<xsl:apply-templates/> 
</xsl:template>


<xsl:template match="기본사항">
<html:br/>
	<html:table border="1" width="90%" align="center">
	<html:tr>
		<html:td width="20%" >성명:</html:td><html:td><xsl:value-of select="이름"/>(<xsl:value-of select="한자이름"/>)</html:td>
		<html:td width="20%" rowspan="4" align="center"><html:img width="100" src="{사진/@파일}" /></html:td>
	</html:tr>
	<html:tr><html:td>생년월일:</html:td><html:td><xsl:value-of select="생년월일"/></html:td></html:tr>
		<html:tr><html:td>주소:</html:td><html:td><xsl:value-of select="주소"/></html:td></html:tr>
	<html:tr><html:td>연락처:</html:td><html:td><xsl:value-of select="전화"/>, <xsl:value-of select="휴대전화"/>, <xsl:value-of select="e-mail"/></html:td></html:tr>
	</html:table>
</xsl:template>


<xsl:template match="text()">
</xsl:template>

</xsl:stylesheet>
