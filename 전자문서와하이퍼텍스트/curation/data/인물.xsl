<?xml version="1.0" encoding="utf-8"?>
<!-- XSL for 양화진:인물정보 1.0 written by Hyeon Kim 2012. 12. 10. -->


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


  <xsl:template match="인물정보">

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
      	<TR>	
		<TD align="center">생몰</TD>
		<TD>	
			<xsl:value-of select="생몰년/출생"/>&#00032;
			<xsl:value-of select="생몰지/출생지"/>에서 출생 /
			<xsl:value-of select="생몰년/사망"/>&#00032;
			<xsl:value-of select="생몰지/사망지"/>에서 사망
		</TD>
	</TR>
      	<TR>
		<TD align="center">국적</TD>
		<TD>	
			<xsl:value-of select="국적"/>
		</TD>
	</TR>
      	<TR>
		<TD align="center">교단</TD>
		<TD>	
			<xsl:value-of select="교단"/>
		</TD>
	</TR>
      	<TR>
		<TD align="center">한국 사역</TD>
		<TD>	
			<xsl:value-of select="한국사역/시작"/> ~
			<xsl:value-of select="한국사역/종료"/>
		</TD>
	</TR>
           <xsl:if test="묘지">
      	<TR>
		<TD align="center">묘지</TD>
		<TD>
			양화진 외국인 선교사 묘원 <xsl:value-of select="묘지/@id"/>
			<A>
            			<xsl:attribute name="HREF">https://yanghwajin.net/</xsl:attribute>
            			<xsl:attribute name="TARGET">_blank</xsl:attribute>
            			<IMG src="http://digerati.aks.ac.kr/VR/style/church.png" width="80" alt="묘역 지도"/>
          			</A>	
		</TD>
	</TR>
           </xsl:if>

    </TABLE>
    <BR/>

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

  <xsl:template match="이력사항">

	<xsl:apply-templates />

  </xsl:template>


  <xsl:template match="학력정보">
    <CENTER><HR width="95%"/><B>학  력</B><HR width="95%"/></CENTER>
    <TABLE border="0" width="95%" align="center" >

	<xsl:for-each select="학력">
		<TR>
			<TD  width="10%"><xsl:value-of select="./@연도"/></TD>
			<TD><xsl:apply-templates/></TD>
		</TR>
	</xsl:for-each>
    </TABLE>
  </xsl:template>

  <xsl:template match="경력정보">
    <CENTER><HR width="95%"/><B>경  력</B><HR width="95%"/></CENTER>
    <TABLE border="0" width="95%" align="center" >
	<xsl:for-each select="경력">
		<TR>
			<TD width="10%"><xsl:value-of select="./@연도"/></TD>
			<TD><xsl:apply-templates/></TD>
		</TR>
	</xsl:for-each>
    </TABLE>
  </xsl:template>

  <xsl:template match="가족정보">
    <CENTER><HR width="95%"/><B>가  족</B><HR width="95%"/></CENTER>
    <TABLE border="0" width="95%" align="center" >
	<xsl:for-each select="가족">
		<TR>
			<TD width="10%"><xsl:value-of select="./@관계"/></TD>
			<TD><xsl:apply-templates/></TD>
		</TR>
	</xsl:for-each>
    </TABLE>
  </xsl:template>

  <xsl:template match="관련인물정보">
    <CENTER><HR width="95%"/><B>관련 인물</B><HR width="95%"/></CENTER>
    <TABLE border="0" width="95%" align="center" >
	<xsl:for-each select="관계자">
		<TR>
			<TD width="10%"><xsl:apply-templates select="대상"/></TD>
			<TD><xsl:apply-templates select="관계"/></TD>
		</TR>
	</xsl:for-each>
    </TABLE>
  </xsl:template>

  <xsl:template match="대상|관계">
	<xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="관련유물정보">
    <CENTER><HR width="95%"/><B>유  품</B><HR width="95%"/></CENTER>
    <TABLE border="0" width="95%" align="center" >
	<TR>
		<xsl:for-each select="유품">
			<TD>
				<xsl:apply-templates select="시각"/>
				<BR/>
				<FONT size="-1">
					<xsl:apply-templates select="유물"/>
				</FONT>
        <FONT size="-1">
          <xsl:apply-templates select="기록물"/>
        </FONT>
			</TD>
		</xsl:for-each>
	</TR>
    </TABLE>
  </xsl:template>

  <xsl:template match="관련공간정보">
    <CENTER><HR width="95%"/><B>유  적</B><HR width="95%"/></CENTER>
    <TABLE border="0" width="95%" align="center" >
	<TR>
		<xsl:for-each select="유적">
			<TD>
				<xsl:apply-templates select="시각"/>
				<BR/>
				<FONT size="-1">
					<xsl:apply-templates select="공간"/>
				</FONT>
			</TD>
		</xsl:for-each>
	</TR>
    </TABLE>
  </xsl:template>

  <xsl:template match="인물">
	<A>
		<xsl:if test="@id">
            		<xsl:attribute name="HREF"><xsl:value-of select="@id"/>.xml</xsl:attribute>
            		<xsl:attribute name="TARGET">_self</xsl:attribute>
		</xsl:if>
    
    <xsl:if test="@url">
      <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
      <xsl:attribute name="target">_blank</xsl:attribute>
    </xsl:if>
		
    <FONT color="darkgreen">
			<xsl:value-of select="."/>
			<xsl:if test="@id|@url"><IMG src="http://digerati.aks.ac.kr/VR/style/text.png" width="30"/></xsl:if>
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

  <xsl:template match="기록물">
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

