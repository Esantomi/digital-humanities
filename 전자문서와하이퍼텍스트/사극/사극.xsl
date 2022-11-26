<?xml version="1.0" encoding="utf-8"?>
<!-- XSL for artwork 1.0 written by DHaein(https://github.com/Esantomi) 2022. 11 -->


<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml">
  
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
	<html:html>
		<html:head>
			<html:h2>사극 콘텐츠</html:h2>
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

  	<xsl:template match="콘텐츠">
		<html:hr/>
		<html:font style="color:black;font-weight:bold;font-size:21pt">
			<html:p style="text-align:center;">사극 콘텐츠</html:p>
		</html:font>
		<html:hr/>
    		<xsl:apply-templates />
  	</xsl:template>
	
	<xsl:template match="타이틀">
		<html:font style="color:black;font-weight:bold;font-size:18pt">
			<html:p style="text-align:left;"></html:p>
			<xsl:value-of select="."/>	
		</html:font>
		<html:br/>
	</xsl:template>
	
	<xsl:template match="메타데이터">
		<html:ul>
			<html:li>유형 : <xsl:value-of select="./유형"/></html:li>
			<html:li>상영 : <xsl:value-of select="./상영"/></html:li>
			<html:li>방영 : <xsl:value-of select="./방영"/></html:li>
			<html:li>배급사 : <xsl:value-of select="./배급사"/></html:li>
			<html:li>방송사 : <xsl:value-of select="./방송사"/></html:li>
			<html:li>제작자</html:li>
			<html:ul>
				<html:li>극본 : <xsl:value-of select=".//인명[@역할='극본']"/></html:li>
				<html:li>연출 : <xsl:value-of select=".//인명[@역할='연출']"/></html:li>
			</html:ul>
			<html:li>출연자</html:li>
			<xsl:for-each select="./출연자/인명">
				<html:ul>
					<html:li><xsl:value-of select="."/>(<xsl:value-of select="@캐릭터"/> 役)</html:li>
				</html:ul>
			</xsl:for-each>
			<html:li>홈페이지 : 
				<html:a>
					<xsl:attribute name="href">
						<xsl:value-of select="//@url"/>
					</xsl:attribute>
					<xsl:attribute name="target">_blank</xsl:attribute>
					<xsl:value-of select="./홈페이지"/>
				</html:a>
			</html:li>
		</html:ul>
		<html:hr/>
		<html:br/>
	</xsl:template>

	<xsl:template match="내용">
		<html:font style="color:black;font-weight:bold;font-size:13pt">⊙ 내용</html:font>
		<html:br/>	
		<html:br/>
		<xsl:value-of select="."/>
		<html:br/>
		<html:br/>
		<html:hr/>
		<html:br/>
	</xsl:template>
	
	<xsl:template match="멀티미디어">
		<html:font style="color:black;font-weight:bold;font-size:13pt">⊙ 멀티미디어</html:font>
		<html:br/>
		<html:br/>
		<xsl:for-each select="사진">
			<html:img width="300">
				<xsl:attribute name="src">
					<xsl:value-of select="@url"/>
				</xsl:attribute>
			</html:img>
		</xsl:for-each>
		<html:br/>
		<html:font size="-1"><xsl:value-of select="."/></html:font>
		<html:br/>
	</xsl:template>

	<xsl:template match="text()">
		<xsl:value-of select="."/>
	</xsl:template>

</xsl:stylesheet>