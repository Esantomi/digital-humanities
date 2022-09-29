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
	<html:table style="border:1px solid grey" width="90%" align="center">
	<html:tr>
		<html:td width="20%">성명:</html:td><html:td><xsl:value-of select="이름"/>(<xsl:value-of select="한자이름"/>)</html:td>
		<html:td width="120px" rowspan="4" align="center"><html:img width="100px" src="{사진/@파일}" /></html:td>
	</html:tr>
	<html:tr><html:td>생년월일:</html:td><html:td><xsl:value-of select="생년월일"/></html:td></html:tr>
		<html:tr><html:td>주소:</html:td><html:td><xsl:value-of select="주소"/></html:td></html:tr>
	<html:tr><html:td>연락처:</html:td><html:td><xsl:value-of select="전화"/>, <xsl:value-of select="휴대전화"/>, <xsl:value-of select="e-mail"/></html:td></html:tr>
	</html:table>
</xsl:template>


<xsl:template match="학력사항">
<html:br/>
<html:center><html:h3>학력 사항</html:h3></html:center>
<html:table width="90%" align="center">
	<xsl:for-each select="학력">
		<html:tr>
			<html:td width="20%"><xsl:value-of select="기간"/></html:td>
			<html:td><xsl:apply-templates select="내용"/></html:td>
		</html:tr>
	</xsl:for-each>
</html:table>
</xsl:template>


<xsl:template match="경력사항">
<html:br/>
<html:center><html:h3>경력 사항</html:h3></html:center>
<html:table width="90%" align="center">
	<xsl:for-each select="경력">
		<html:tr>
			<html:td width="20%"><xsl:value-of select="기간"/></html:td>
			<html:td><xsl:apply-templates select="내용"/></html:td>
		</html:tr>
	</xsl:for-each>
</html:table>
</xsl:template>


<xsl:template match="학회활동">
<html:br/>
<html:center><html:h3>학회 활동</html:h3></html:center>
<html:table width="90%" align="center">
	<xsl:for-each select="학회">
		<html:tr>
			<html:td width="20%"><xsl:value-of select="기간"/></html:td>
			<html:td><xsl:apply-templates select="내용"/></html:td>
		</html:tr>
	</xsl:for-each>
</html:table>
</xsl:template>

<xsl:template match="내용">
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="기관명">
	<html:a>
		<xsl:attribute name="HREF"><xsl:value-of select="@url"/></xsl:attribute>	
		<html:font style="COLOR:BLUE"><xsl:value-of select="."/></html:font>
	</html:a>
</xsl:template>


<xsl:template match="주요논문">
<html:br/>
<html:center><html:h3>주요 논문</html:h3></html:center>
<html:table width="90%" align="center">
	<xsl:for-each select="논저">
		<html:tr>
			<html:td width="55%">
				<html:a>
					<xsl:attribute name="HREF"><xsl:value-of select="제목/@원문"/></xsl:attribute>
					<html:font style="COLOR:OLIVE;font-WEIGHT:BOLD"><xsl:value-of select="제목"/></html:font>
				</html:a>
			</html:td>
			<html:td width="20%"><html:font style="COLOR:PURPLE"><xsl:value-of select="학술지"/></html:font></html:td>
			<html:td width="10%"><xsl:value-of select="간행일"/></html:td>
			<html:td width="15%"><html:font style="COLOR:BLUE"><xsl:value-of select="간행처"/></html:font></html:td>
		</html:tr>
	</xsl:for-each>
</html:table>
</xsl:template>


<xsl:template match="text()">
	<xsl:value-of select="."/>
</xsl:template>


</xsl:stylesheet>
