<?xml version="1.0" encoding="utf-8"?>
<!-- XSL for 항목_Display 1.0 written by Hyeon Kim 2018. 5. 2. -->


<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
	<html:html>
		<html:head>
			<html:title>Site Scene</html:title>
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


  	<xsl:template match="항목">
    		<xsl:apply-templates />
  	</xsl:template>

	<xsl:template match="항목명">
		<html:font style="color:red;font-weight:bold;font-size:18pt;">
		<html:p style="text-align:center;">
		<xsl:value-of select="."/>	
		</html:p>
		</html:font>
		<html:br/><html:br/>
	</xsl:template>

	<xsl:template match="메타데이터">
		<xsl:apply-templates/>
		<html:br/>
	</xsl:template>

	<xsl:template match="분야">
		<html:font style="color:grey;font-weight:bold">o 분야: </html:font>
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>

	<xsl:template match="성격">
		<html:font style="color:grey;font-weight:bold">o 성격: </html:font>
		<xsl:value-of select="."/>
		<html:br/>	
	</xsl:template>

	<xsl:template match="본문">
		<xsl:apply-templates/>
		<html:br/>
	</xsl:template>

	<xsl:template match="지명">
		<html:font style="color:blue;font-weight:bold">
		<xsl:value-of select="."/>
		</html:font>
	</xsl:template>

	<xsl:template match="인명">
		<html:font style="color:green;font-weight:bold">
		<xsl:value-of select="."/>
		</html:font>
	</xsl:template>

	<xsl:template match="사진">
		<html:br/>
		<html:br/>	
		<html:img>
			<xsl:attribute name="width">300</xsl:attribute>
           	<xsl:attribute name="src"><xsl:value-of select="./@url" /></xsl:attribute>
		</html:img>
		<html:br/>
		<html:font size="-1"><xsl:value-of select="."/></html:font>
		<html:br/>
	</xsl:template>

	<xsl:template match="text()">
		<xsl:value-of select="."/>
	</xsl:template>

</xsl:stylesheet>

