<?xml version="1.0" encoding="utf-8"?>
<!-- XSL for 양화진:유물정보 1.0 written by Hyeon Kim 2012. 12. 10. -->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl"-->

  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>Site Scene</TITLE>
        <STYLE>
          body {font-family:함초롬바탕}
          img {border:0}
          a {text-decoration: none}
        </STYLE>
      </HEAD>
      <BODY>
        <xsl:apply-templates/>
      </BODY>
    </HTML>
  </xsl:template>


  <xsl:template match="유물정보">

    <xsl:apply-templates />

  </xsl:template>


  <xsl:template match="기본사항">

    <CENTER>
      <FONT size="7" >
        <xsl:value-of select="명칭/이름[1]"/>
      </FONT>
    </CENTER>
    <BR/>

    <TABLE border="1" width="95%" align="center" >
	<TR>
		<TD align="center">이름</TD>
		<TD>	
			<xsl:for-each select="명칭/이름">
				(<xsl:value-of select="./@표기"/>)	<xsl:value-of select="."/>
			</xsl:for-each>
		</TD>
		<TD align="center" rowspan="6" style="padding:20 5 5 5" >
            		<IMG>
              			<xsl:attribute name="width">250</xsl:attribute>
              			<xsl:attribute name="src">../images/<xsl:value-of select="사진/시각/@id" />.jpg</xsl:attribute>
            		</IMG>
			<BR/>
			<xsl:value-of select="사진/시각" />
		</TD>
	</TR>

	<xsl:if test="명칭/이칭">
      	<TR>	
		<TD align="center">이칭</TD>
		<TD>	
			<xsl:for-each select="명칭/이칭">
				(<xsl:value-of select="./@관계"/>)	<xsl:value-of select="."/>
			</xsl:for-each>
		</TD>
	</TR>
	</xsl:if>
      	<TR>
		<TD align="center">분류</TD>
		<TD>	
			<xsl:value-of select="분류"/>
		</TD>
	</TR>
      	<TR>
		<TD align="center">제작연도</TD>
		<TD>	
			<xsl:value-of select="제작연도"/>
		</TD>
	</TR>
      	<TR>
		<TD align="center">제작처</TD>
		<TD>	
			<xsl:value-of select="제작처"/>
		</TD>
	</TR>
      	<TR>
		<TD align="center">소장처</TD>
		<TD>	
			<xsl:apply-templates select="소장처"/>
		</TD>
	</TR>

    </TABLE>
    <BR/>

  </xsl:template>

  <xsl:template match="소장처">
		<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="설명">
    <TABLE border="0" width="95%" align="center" >
	<TR>
		<TD>	
			<xsl:apply-templates />
		</TD>
	</TR>
    </TABLE>
  </xsl:template>

  <xsl:template match="문단">
	<P>
		<xsl:apply-templates/>
	</P>
  </xsl:template>
  
  <xsl:template match="인물">
	<A>
		<xsl:if test="@id">
            		<xsl:attribute name="HREF"><xsl:value-of select="@id"/>.xml</xsl:attribute>
            		<xsl:attribute name="TARGET">_self</xsl:attribute>
		</xsl:if>
		<FONT color="darkgreen">	
			<xsl:value-of select="."/>
			<xsl:if test="@id"><IMG src="http://digerati.aks.ac.kr/VR/style/text.png" width="30"/></xsl:if>
		</FONT>
          	</A>
  </xsl:template>

  <xsl:template match="공간">
	<A>
		<xsl:if test="@id">
            		<xsl:attribute name="HREF"><xsl:value-of select="@id"/>.xml</xsl:attribute>
            		<xsl:attribute name="TARGET">_self</xsl:attribute>
		</xsl:if>	
		<FONT color="darkcyan">
			<xsl:value-of select="."/>
			<xsl:if test="@id"><IMG src="http://digerati.aks.ac.kr/VR/style/text.png" width="30"/></xsl:if>
		</FONT>
          	</A>
  </xsl:template>

  <xsl:template match="유물">
	<A>
		<xsl:if test="@id">
            		<xsl:attribute name="HREF"><xsl:value-of select="@id"/>.xml</xsl:attribute>
            		<xsl:attribute name="TARGET">_self</xsl:attribute>
		</xsl:if>	
		<FONT color="darkorange">
			<xsl:value-of select="."/>
			<xsl:if test="@id"><IMG src="http://digerati.aks.ac.kr/VR/style/text.png" width="30"/></xsl:if>
		</FONT>
          	</A>
  </xsl:template>

  <xsl:template match="시각">
	<IMG>
		<xsl:attribute name="height">120</xsl:attribute>
      		<xsl:attribute name="alt"><xsl:value-of select="." /></xsl:attribute>
           		<xsl:attribute name="src">../images/<xsl:value-of select="./@id" />.jpg</xsl:attribute>
           	</IMG>
	&#00032;
	<FONT size="-1" color="darkblue">
		<xsl:value-of select="." />
	</FONT>
  </xsl:template>

  <xsl:template match="text()">
	<xsl:value-of select="."/>
  </xsl:template>


</xsl:stylesheet>

