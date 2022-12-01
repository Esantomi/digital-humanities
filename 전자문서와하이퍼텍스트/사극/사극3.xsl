<?xml version="1.0" encoding="utf-8"?>
<!-- XSL for artwork 1.0 written by DHaein(https://github.com/Esantomi) 2022. 11 -->

<xsl:stylesheet version="1.0" 	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
	<html>
		<head>
			<style>
				body {font-family:나눔고딕}
				img {border:0}
				a {text-decoration:none}
			</style>
      	</head>
		<body>
			<xsl:apply-templates/>
      	</body>
    </html>
	</xsl:template>
	
  	<xsl:template match="데이터">
		사극 콘텐츠 (편찬자: <xsl:value-of select="@편찬자"/>)
		<xsl:apply-templates/>
	</xsl:template>
	
  	<xsl:template match="콘텐츠">
		<hr/>
		<p style="text-align:center;font-weight:bold;font-size:21pt"><xsl:value-of select="타이틀"/>	</p>
		<hr/>
		<table>
			<tr>
				<td width="80%">
					<xsl:apply-templates select="메타데이터"/>						
				</td>
				<td width="20%" style="padding:10 10 10 10" >
					<img width="200" src="{멀티미디어/사진/@url}"/>
				</td>
			</tr>
		</table>
		<hr/>
    	<xsl:apply-templates select="내용"/>
		<hr/>
    	<xsl:apply-templates select="멀티미디어"/>
		<br/><br/>	
  	</xsl:template>

	<xsl:template match="메타데이터">
		<ul>
			<li>유형: <xsl:value-of select="유형"/></li>
			<li>상영: <xsl:value-of select="상영"/></li>
			<li>방영: <xsl:value-of select="방영"/></li>
			<li>배급사: <xsl:value-of select="배급사"/></li>
			<li>방송사: <xsl:value-of select="방송사"/></li>
			<li>제작자:</li>			
			<xsl:for-each select="제작자/인명">
				<ul>
					<li><xsl:value-of select="."/>(<xsl:value-of select="@역할"/>)</li>
				</ul>
			</xsl:for-each>
			<li>출연자:</li>
			<xsl:for-each select="출연자/인명">
				<ul>
					<li><xsl:value-of select="."/>(<xsl:value-of select="@캐릭터"/> 役)</li>
				</ul>
			</xsl:for-each>
			<li>관련정보: 
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="//@url"/>
					</xsl:attribute>
					<xsl:attribute name="target">_blank</xsl:attribute>
					<xsl:value-of select="./홈페이지"/>
				</a>
			</li>
		</ul>
	</xsl:template>

	<xsl:template match="내용">
		<p style="color:black;font-weight:bold;font-size:13pt">⊙ 내용</p>	
		<xsl:apply-templates/>	
		<br/><br/>
	</xsl:template>
	
	<xsl:template match="멀티미디어">
		<p style="color:black;font-weight:bold;font-size:13pt">⊙ 멀티미디어</p>
		<xsl:for-each select="사진">
			<img width="150">
				<xsl:attribute name="src">
					<xsl:value-of select="@url"/>
				</xsl:attribute>
			</img>
			<span style="font-size:9pt"><xsl:value-of select="."/></span>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="인명|인물">
		<xsl:choose>
			<xsl:when test="@id">
				<a>
					<xsl:attribute name="href">http://encykorea.aks.ac.kr/Contents/Item/<xsl:value-of select="@id"/></xsl:attribute>
					<xsl:attribute name="target">_blank</xsl:attribute>
					<span style="color:green"><u><xsl:value-of select="."/></u></span>
				</a>
			</xsl:when>
			<xsl:otherwise>
					<span style="color:green"><xsl:value-of select="."/></span>		
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="text()">
		<span style="font-size:9pt"><xsl:value-of select="."/></span>
	</xsl:template>

</xsl:stylesheet>