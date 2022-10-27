<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<html:html>
			<html:head>
				<html:title>작품 소개</html:title>
				<html:style>
					body {font-family:나눔고딕}
					img {border:0}
					a {text-decoration:none}
				</html:style>
			</html:head>
			<html:body>
				<xsl:apply-templates/>
			</html:body>
		</html:html>
	</xsl:template>

	<xsl:template match="미술관">
		<html:hr/>
		한국 현대미술 가상 미술관
		<html:hr/>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="전시실">
		<html:div style="float:left;width:50%">
			<xsl:value-of select="전시실명" /> 전시실
			<html:br/>
			<xsl:apply-templates />
		</html:div>
	</xsl:template>

	<xsl:template match="전시실명">
	</xsl:template>

	<xsl:template match="작품">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="항목명">
		<html:font style="color:black;font-weight:bold;font-size:18pt">
			<html:p style="text-align:left;"></html:p>
			<xsl:value-of select="."/>	
		</html:font>
		<html:br/>
	</xsl:template>

	<xsl:template match="메타데이터">
		<xsl:apply-templates/>
		<html:br/>
	</xsl:template>

	<xsl:template match="작가">
		<html:font style="color:black;font-weight:bold;font-size:11pt">□ 작가:</html:font>
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>

	<xsl:template match="창작년도">
		<html:font style="color:black;font-weight:bold;font-size:11pt">□ 창작년도:</html:font>
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>
	
	<xsl:template match="재질">
		<html:font style="color:black;font-weight:bold;font-size:11pt">□ 재질:</html:font>
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>
	
	<xsl:template match="크기">
		<html:font style="color:black;font-weight:bold;font-size:11pt">□ 크기:</html:font>
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>	

	<xsl:template match="본문">
		<html:div style="padding-right:10px">
			<xsl:apply-templates/>
		</html:div>
		<html:br/>
	</xsl:template>

	<xsl:template match="내용">
		<html:font style="color:black;font-weight:bold;font-size:11pt">□ 내용</html:font>
		<html:br/>	
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>
	
	<xsl:template match="사진">
		<html:br/>
		<html:br/>	
		<html:img width="300" src="{./@url}" />
		<html:br/>
		<html:font size="-1"><xsl:value-of select="."/></html:font>
		<html:br/>
	</xsl:template>

	<xsl:template match="text()">
		<xsl:value-of select="."/>
	</xsl:template>

</xsl:stylesheet>

