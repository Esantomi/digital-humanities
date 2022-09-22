<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ltt="letter.xsd"
  exclude-result-prefixes="ltt"
>
<xsl:template match="/">
  <html>
    <head>
      <title>편지</title> 
    </head>
    <body>
      <xsl:apply-templates/>
    </body>
  </html>
</xsl:template>

<xsl:template match="ltt:편지">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="ltt:수신">
	<p style="color:red; text-align:left"><xsl:value-of select="."/></p>
 </xsl:template>

<xsl:template match="ltt:본문">
	<p style="color:green; text-align:center"><xsl:value-of select="."/></p>
</xsl:template>

<xsl:template match="ltt:날짜">
	<p style="color:grey; text-align:center"><xsl:value-of select="."/></p>
</xsl:template>

<xsl:template match="ltt:발신">
	<p style="color:blue; text-align:right"><xsl:value-of select="."/></p>
</xsl:template>

</xsl:stylesheet>