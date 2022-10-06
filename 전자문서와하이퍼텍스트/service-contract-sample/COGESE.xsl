<?xml version="1.0" encoding="euc-kr"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cc="https://www.g2b.go.kr/schema/CC"
    xmlns:gb="https://www.g2b.go.kr/cogese"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="https://www.g2b.go.kr:8073/XlnWebServlet/exms/xsl/templates.xsl" />
    <xsl:output method="html" encoding="euc-kr"  doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        indent="yes" />
<xsl:template match="/">
<!--
********************************************************************************
*  XSL�� : Cogese.xsl (��ǰ) - ��ȸ��                                          *
*  �뵵  : 1. ����������                                                       *
********************************************************************************
*  ����         �ۼ���    �������                                             *
********************************************************************************
*  2012.06.01             1. ������ ���� �����������޽ý���  (ǥ��ȭ) ����     *
*                            - Templates.xsl ����                              */
********************************************************************************
-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title>�Ϲݿ뿪��༭(�Ϲ�): ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr/gov/koneps/co/css/body.css" />
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr/gov/koneps/co/css/width.css" />
    <xsl:comment><![CDATA[[if IE]>
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr/gov/koneps/co/css/ie.css" />
    <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if lte IE 8]>
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr/gov/koneps/co/css/ie8.css" />
    <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 7]>
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr/gov/koneps/co/css/ie7.css" />
    <![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 6]>
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr/gov/koneps/co/css/ie6.css" />
    <![endif]]]></xsl:comment>
    <link rel="stylesheet" type="text/css" href="https://www.g2b.go.kr:8071/gov/koneps/co/css/whitedoc.css" />
    <script type="text/javascript" charset="euc-kr" src="https://www.g2b.go.kr/gov/koneps/co/js/crossDomain.js"><xsl:comment><![CDATA[]]></xsl:comment></script>
	<style type="text/css">
	.info_h3 {line-height:1.2em; height:18px;}
	</style>
</head>
<body>
<div id="content_wrap">
    <div id="content_h1" style="height:30px; margin-bottom:10px;">
        <h1>
           
            <xsl:choose>
               <xsl:when test="//Header.Details/cc:Message.Name/Text.Content[.!='']">
                <xsl:value-of select="//Header.Details/cc:Message.Name/Text.Content"/>
               </xsl:when>
               <xsl:otherwise>�Ϲݿ뿪��༭(�Ϲ�)
              </xsl:otherwise>
            </xsl:choose>            
        </h1>   
    </div>

	<xsl:if test="//LongTerm.Classificatin.Code/Code.Content[.='2']">		
		<div style="text-align:center; font-weight:bold;  line-height:1.4em; font-size:1.4em;  margin:20px 0; ">
			(�����  <xsl:value-of select="//LongTerm.SequenceNumber.Value/Numeric.Content"/>��)
		</div>
	</xsl:if>


    <xsl:variable name="contKindLen" select="string-length(//Header.Details/cc:Document.Number.Text/Text.Content)"/>    
    <xsl:variable name="contModSeq" select="substring(//Header.Details/cc:Document.Number.Text/Text.Content, ($contKindLen - 2) +1 , 2)" />


    <div id="container">        
            <table class="contract">
                <caption>
                <span>��÷</span>
                </caption>
                <colgroup>
                <col class="w97p" />
                <col class="w2p" />
                </colgroup>
                <tbody>
                    <tr>
                        <td class="tl">
                            <div id="freeText2F" class="tl">
                                <xsl:call-template name="newLineBr">
                                    <xsl:with-param name="text" select="//cc:Free.Text2.Text/Text.Content" />
                                </xsl:call-template>
                            </div>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">
                            <xsl:if test="//Contract.Information/cc:Contract.Date/DateTime.Content[.!='']">
                            ������� : <xsl:apply-templates select="//Contract.Information/cc:Contract.Date/DateTime.Content[.!='']" />
                            </xsl:if>
                        </td>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
       

        <div id="tab"></div>

        <div class="basic">
            <table>
                <caption>
                <span>�����</span>
                </caption>
                <colgroup>
                <col class="w100p" />
                </colgroup>
                <tbody>
                    <tr>
                        <th class="thead tc">                        
                            &lt;�����&gt;                        
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="basic">
            <table>
                <caption>
                <span>����ó, �������, ������</span>
                </caption>
                <colgroup>
                <col class="w16p" />
                <col class="w34p" />
                <col class="w16p" />
                <col class="w34p" />
                </colgroup>
                <thead>
                    <tr>
                        <th colspan="2" class="thead">&lt;����ó&gt;</th>
                        <th colspan="2" class="thead">&lt;�������&gt;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th colspan="2"><xsl:value-of select="//Contract.Delegate.Party/PublicProcurementService.Name/Text.Content"/></th>                    
                        <th>�� ǥ �� :</th>
                        <td><xsl:value-of select="//OrgList/OrgItem/Organization.Details/cc:Organization.CEO.Name/Text.Content"/></td>
                    </tr>
                    <tr>
                        <th colspan="2"><xsl:value-of select="//Contract.Delegate.Party/OfficialInPartialCharge.Classification.Name/Text.Content"/></th>
                        <th>�� ȣ :</th>
                        <td><xsl:value-of select="//OrgList/OrgItem/Organization.Details/cc:Organization.Name/Text.Content"/></td>
                    </tr>
                    <tr>
                        <th colspan="2"><xsl:value-of select="//Contract.Delegate.Party/OfficialInPartialCharge.Name/Text.Content"/></th>
                        <th>�� �� : </th>
                        <td><xsl:value-of select="//OrgList/OrgItem/Address.Details/cc:Address.Line1.Text/Text.Content"/>
                            <xsl:value-of select="//OrgList/OrgItem/Address.Details/cc:Address.Line2.Text/Text.Content"/>
                        </td>
                    </tr>
                     <tr>
                        <th colspan="2"></th>
                        <th>����ڵ�Ϲ�ȣ  :</th>
                        <td><xsl:value-of select="//OrgList/OrgItem/Organization.Details/cc:Organization.Identifier/Identifier.Content"/></td>
                    </tr>
                    <tr>
                        <th>��   �� :</th>
                        <td><xsl:value-of select="//Contract.Delegate.Party/SectionChief.Name/Text.Content"/></td>
                        <th>�ֹ� ��� ��ȣ :</th>
                        <td>
                            <xsl:value-of select="substring(//OrgList/OrgItem/Organization.Details/cc:Organization.CEO.Identifier/Identifier.Content, 0, 7)"/>********
                        </td>
                    </tr>
                    <tr>
                        <th>�繫��/����� :</th>
                        <td><xsl:value-of select="//Contract.Delegate.Party/AssistantJuniorOfficial.Name/Text.Content"/></td>
                        <th>�� ȭ �� ȣ :</th>
                        <td><xsl:value-of select="//OrgList/OrgItem/Contact.Details/cc:Telephone.Number.Text/Text.Content"/></td>
                    </tr>
                    <tr>
                        <th>��� :</th>
                        <td><xsl:value-of select="//Contract.Delegate.Party/OfficialInCharge.Name/Text.Content"/></td>
                        <th>�� �� �� ȣ :</th>
                        <td><xsl:value-of select="//OrgList/OrgItem/Contact.Details/cc:Fax.Number.Text/Text.Content"/></td>
                    </tr>
		    <xsl:if test="//Official.Code.Details/cc:PublicOrganization.List.Text/Text.Content[.!='']">
		    <tr>
                        <th colspan="4" class="thead">&lt;������&gt;</th>
                    </tr>
		    <tr>
                        <td colspan="4"><xsl:value-of select="//Official.Code.Details/cc:PublicOrganization.List.Text/Text.Content"/></td>
                    </tr>
		    </xsl:if>
                </tbody>
            </table>
        </div>

        <xsl:if test="//Message.Response.Details/cc:Response.Type.Code/Code.Content[. != ''] and contains(//Header.Details/cc:Message.Name/Text.Content,'����') ">
            <div class="contract">
                <table>
                    <caption><span>��������,�ݷ�����</span></caption>
                    <colgroup>
                    <col class="w16p"/>
                    <col class="w34p"/>
                    <col class="w16p"/>
                    <col class="w34p"/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>�������� :</th>
                        <td colspan='3'>
                            <xsl:value-of select="//Message.Response.Details/cc:Response.Type.Code/Code.Name"/>
                        </td>
                    </tr>
					<xsl:if test="//Message.Response.Details/cc:Response.Type.Code/Code.Content[. = 'RE']">
                    <tr>
                        <th>�ݷ����� :</th>
                        <td colspan='3'>
                            <xsl:call-template name="newLineBr"><xsl:with-param name="text" select="//Message.Response.Details/cc:Reject.Reason.Text/Text.Content" />
                            </xsl:call-template>
                        </td>
                    </tr>
					</xsl:if>
                    </tbody>
                </table>
            </div>
        </xsl:if>

        <div class="contract">
            <table class="fix">
            <caption><span>��ǰ��༭ ����</span></caption>
                <colgroup>
                <col class="w21p" />
                <col class="w19p" />
                <col class="w21p" />
                <col class="w17p" />
                <col class="w10p" />
                <col class="w12p" />
                </colgroup>
                <tbody>
                <tr>
                    <th class="tl">����� :</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/cc:Contract.Means.Code/Code.Name"/>
                    </td>
                    <th class="tl">����(����)��������� :</th>
                    <td class="tl" colspan="3">
			<xsl:choose>
			    <xsl:when test="//Basis.Law.Details/cc:Basis.Law.Text/Text.Content[.='002�� 01�� 01ȣ 0-��']">
				��2����2 ��1�� 1ȣ
			    </xsl:when>
			    <xsl:when test="//Basis.Law.Details/cc:Basis.Law.Text/Text.Content[.='002�� 01�� 02ȣ 0-��']">
				��2����2 ��1�� 2ȣ
			    </xsl:when>
			    <xsl:otherwise>
				<xsl:value-of select="//Basis.Law.Details/cc:Basis.Law.Text/Text.Content"/>
			    </xsl:otherwise>
			</xsl:choose>
                    </td>
                </tr>

                <tr>
                    <th class="tl">����ȣ :</th>
                    <td class="tl">
                        <xsl:if test="//Contract.Information/Changed.ContractNumber.Text/Text.Content[.!='']">
                            <xsl:value-of select="//Contract.Information/Changed.ContractNumber.Text/Text.Content"/>
                        </xsl:if>
                        <xsl:if test="//Contract.Information/Changed.ContractNumber.Text/Text.Content[.='']">
                            <xsl:value-of select="//Contract.Information/cc:Contract.Number.Text/Text.Content"/>
                        </xsl:if>
                    </td>
                    <th class="tl">���Ű�����ȣ :</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/cc:Purchase.ControlNumber.Text/Text.Content"/>
                    </td>
                    <th></th>
                    <td>
                        
                    </td>
                </tr>

                <tr>
                    <th class="tl">���Ǹ� :</th>
                    <td class="tlb" colspan="5">
                        <xsl:value-of select="//Contract.Information/cc:Contract.Name.Text/Text.Content"/>
                    </td>                    
                </tr>

                <tr>
                    <th class="tl">����������� :</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/cc:Contract.cancellation.Indicator/Indicator.Content"/>
                    </td>
		    <th class="tl">����������� :</th>
                    <td class="tl" colspan="3">
			<xsl:if test="//Contract.Information/cc:Contract.cancellation.Indicator/Indicator.Content[. = 'Y']">
				<xsl:apply-templates select="//Contract.Information/cc:Contract.cancellation.Date/DateTime.Content[.!='']" />
			</xsl:if>
                    </td>
                </tr>

                <tr>
                    <th class="tl">ǰ�� :</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/cc:Item.Name/Text.Content"/>
                    </td>
                    <th class="tl">���� :</th>
                    <td class="tl">
                        <xsl:if test="$contModSeq = '00'">
                            <xsl:for-each select="//Contract.Information/cc:Total.Quantity/Quantity.Content[.!='']"> 
                                <xsl:value-of select="format-number(., '###,###,###,###,###,##0.###')"/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="$contModSeq != '00'">
                            <xsl:for-each select="//Contract.Information/Changed.Total.Quantity/Quantity.Content[.!='']"> 
                                <xsl:value-of select="format-number(., '###,###,###,###,###,##0.###')"/>
                            </xsl:for-each>
                        </xsl:if>
                    </td>
                    <th class="tl">���� :</th>
                    <td class="tl">
                        <xsl:if test="$contModSeq = '00'">
                            <xsl:value-of select="//Contract.Information/cc:Total.Quantity/Quantity.Unit.Code"/>
                        </xsl:if>
                        <xsl:if test="$contModSeq != '00'">
                            <xsl:value-of select="//Contract.Information/Changed.Total.Quantity/Quantity.Unit.Code"/>
                        </xsl:if>
                    </td>
                </tr>

                <tr>
                    <th class="tl">���ݾ� :</th>
                    <td class="tlb">
                        <xsl:if test="$contModSeq = '00'">
                            <xsl:apply-templates select="//Contract.Information/cc:Contract.Amount/Amount.Content[.!='']" /> ��
                        </xsl:if>
                        <xsl:if test="$contModSeq != '00'">
                            <xsl:apply-templates select="//Contract.Information/Changed.Contract.Amount/Amount.Content[.!='']" /> ��
                        </xsl:if>
                    </td>
                    <th></th>
                    <td>
                        
                    </td>
                    <th class="tl">������ :</th>
                    <td class="tl">
                        <xsl:if test="$contModSeq = '00'">
                            <xsl:apply-templates select="//Contract.Information/cc:Fee.Amount/Amount.Content[.!='']" /> ��
                        </xsl:if>
                        <xsl:if test="$contModSeq != '00'">
                            <xsl:apply-templates select="//Contract.Information/Changed.Charge.Amount/Amount.Content[.!='']" /> ��
                        </xsl:if>
                    </td>
                </tr>

                <tr>
                    <th class="tl">���Ⱓ :</th>
                    <td class="tl" colspan="3">
                        <xsl:value-of select="//Contract.Information/Contract.Period.Date/DateTime.Content"/>
                    </td>                    
                    <th class="tl">��ü����� :</th>
                    <td>
                        <xsl:for-each select="//Contract.Information/cc:Delay.Penalty.Rate/Numeric.Content[.!='']"> 
                            <xsl:value-of select="//Contract.Information/cc:Delay.Penalty.Rate/Numeric.Content"/> %/��
                        </xsl:for-each>
                    </td>
                </tr>

                <tr>
                    <th class="tl">��ǰ���� :</th>
                    <td class="tl">
                        <xsl:for-each select="//Contract.Information/Present.DeliveryDue.Date/DateTime.Content[.!='']">
                            <xsl:if test="string-length(translate(translate(. ,'0123456789', '          '), ' ', '')) = 0">
                                <xsl:choose>
                                    <xsl:when test="string-length(.)= 8">
                                        <xsl:apply-templates select="." />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/> ��
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="string-length(translate(translate(. ,'0123456789', '          '), ' ', '')) > 0">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>                        
                    </td>
                    <th class="tl">���ҳ�ǰ:</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/cc:Partial.Delivery.Indicator/Indicator.Format.Text"/>
                    </td>
                    <th class="tl">�ε����� :</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/cc:Delivery.Terms.Code/Code.Name"/>
                    </td>
                </tr>

                <tr>
                    <th class="tl">������ :</th>
                    <td class="tl">
                        <xsl:value-of select="//Contract.Information/Public.Organization.Name/Text.Content"/>
                    </td>
                    <th></th>
                    <td>
                        
                    </td>
                    <th class="tl"> ��ǰ��� :</th>
                    <td>
                        <xsl:value-of select="//Contract.Information/cc:Delivery.Place.Text/Text.Content"/>
                    </td>
                </tr>

                <tr>
                    <th class="tl">�˻��� :</th>
                    <td class="tl" colspan="2">
                        <xsl:value-of select="//Inspector.Party/Organization.Identifier/IdentificationScheme.Name"/> 
                        (<xsl:value-of select="//Inspector.Party/Employee.Identifier/Identifier.Content"/>)
                    </td>
                    <th class="tl"> �˼���� :</th>
                    <td class="tl" colspan="2">
                        <xsl:value-of select="//Examiner.Party/Organization.Identifier/IdentificationScheme.Name"/> 
                        (<xsl:value-of select="//Examiner.Party/Employee.Identifier/Identifier.Content"/>)
                    </td>
                </tr>

                <tr>
                    <th class="tl">���޹�� :</th>
                    <td class="tl" colspan="2">
                        <xsl:value-of select="//cc:Payment.Classification.Code/Code.Name"/>
                        <xsl:if test="//LongDivPxpay.Indicator/Indicator.Content[.='Y']">
                        (�����Ҵ�����)
                        </xsl:if>
                    </td>
                    <th class="tl">��౸�� :</th>
                    <td class="tl" colspan="2">
                        <xsl:value-of select="//cc:Contract.Classification.Code/Code.Name"/>
                    </td>
                </tr>

                <tr>
                    <th class="tl">���ڴ㺸å�ӱⰣ(���) :</th>
                    <td colspan="2" class="tl">
                        <xsl:if test="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:Year.Value/Numeric.Content[.!= '' and .!= '0']">
                            <xsl:value-of select="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:Year.Value/Numeric.Content"/>��
                            <xsl:if test="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:Month.Value/Numeric.Content[.= '' or .= '0']">
                                ��
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:Month.Value/Numeric.Content[.!= '' and .!= '0']">
                            <xsl:value-of select="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:Month.Value/Numeric.Content"/>���� ��
                        </xsl:if>
                        <xsl:if test="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:General.Note.Text/Text.Content[.!= '']">
                            (<xsl:value-of select="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:General.Note.Text/Text.Content"/>)
                        </xsl:if>
                    </td>
		    <th class="tl">���ں����������� :</th>
                    <td class="tl" colspan="2">
                        <xsl:value-of select="//Contract.Information/WarrantyResponsibilityPeriod.Details/cc:Rate.Value/Numeric.Content"/> %
                    </td>
                </tr>
		 <tr>
                    <th class="tl">���Ư�� :</th>
                    <td colspan="5" class="tl">
                        <xsl:value-of select="//Contract.Information/cc:DelayPenalty.Classification.Text/Text.Content"/>
                     </td>			
                </tr>

                <xsl:if test="$contModSeq != '00'">
                <tr>
                    <th class="tl">���������� :</th>
                    <td class="tl" colspan="5">
                        <xsl:value-of select="//Contract.Information/Changed.ContractReason.Text/Text.Content"/>
                    </td>
                </tr>

                <tr>
                    <th class="tl">������������� :</th>
                    <td class="tl" colspan="2">
                        <xsl:apply-templates select="//Contract.Information/Changed.ContractIncreaseDecrease.Amount/Amount.Content[.!='']" /> ��
                        (������ : <xsl:apply-templates select="//Contract.Information/cc:Contract.Amount/Amount.Content[.!='']" /> ��)
                    </td>
                    <th class="tl">������������������ :</th>
                    <td class="tl" colspan="2">
                        <xsl:apply-templates select="//Contract.Information/Changed.ChargeIncreaseDecrease.Amount/Amount.Content[.!='']" /> ��
                        (������ : <xsl:apply-templates select="//Contract.Information/cc:Fee.Amount/Amount.Content[.!='']" /> ��)
                    </td>
                </tr>
                </xsl:if>

                <xsl:if test="//LongTerm.Classificatin.Code/Code.Content[.='2']">
                <tr>
                    <th class="tl">�ѿ뿪�α�ݾ� :</th>
                    <td class="tl">
                        <xsl:apply-templates select="//Contract.Information/cc:Contract.Total.Amount/Amount.Content[.!='']" /> ��
                    </td>
                    <th class="tl">������ǰ���� :</th>
                    <td class="tl">
                        <xsl:apply-templates select="//Contract.Information/Present.DeliveryDue.Date/DateTime.Content[.!='']" />
                    </td>
                    <th class="tl">�ѳ�ǰ���� :</th>
                    <td class="tl">
                        <xsl:for-each select="//Contract.Information/TotalGoods.DeliveryDue.Date/DateTime.Content[.!='']">
                            <xsl:choose>
                            <xsl:when test="string-length(.)= 8  and string-length(translate(translate(. ,'0123456789', '          '), ' ', '')) = 0">
                                <xsl:apply-templates select="." />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </td>
                </tr>
                </xsl:if>
                </tbody>
            </table>
        </div>

         <div class="detail">
            <div class="info_h3 fl"><h3>[ �ΰ����� ]</h3></div>

            <table class="fix">
                <caption><span>�ΰ�����</span></caption>
                <colgroup>
                <col class="w21p" />
                <col class="w14p" />
                <col class="w21p" />
                <col class="w14p" />
                <col class="w12p" />
                <col class="w14p" />
                </colgroup>
                <tbody>
                <tr>
                    <th class="tl">��������(������󿩺�) :</th>
                    <td class="tl"> <xsl:apply-templates select="//cc:StampTax.Amount/Amount.Content[.!='']" /> �� 
                    (<xsl:value-of select="//cc:StampTax.Taxation.Indicator/Indicator.Content" />)
                    </td>
                    <th class="tl">��������/����ö��ä�� :</th>
                    <td class="tl"> <xsl:apply-templates select="//cc:Buying.Amount/Amount.Content[.!='']" /> ��
                        (<xsl:value-of select="//cc:Bond.Classification.Code/Code.Name" />)
                    </td>
                    <th class="tl">��ຸ���� :</th>
                    <td class="tl"> <xsl:apply-templates select="//Contract.Information/cc:Contract.Guarantee.Amount/Amount.Content[.!='']" /> ��
                    </td>
                </tr>
				<xsl:if test="//cc:Contract.Classification.Code/Code.Content[.= '2' or .= '3']">
					<tr>
						<th class="tl">��ȸ�ִ볳ǰ�䱸�ݾ� :</th>
						<td colspan="5" class="tl"> <xsl:apply-templates select="//Contract.Information/cc:OnceGreate.DeliveryRequest.Amount/Amount.Content[.!='']" /> ��
						</td>
					</tr>
				</xsl:if>
		<xsl:if test="//LineList/LineItem/Public.Organization/cc:Outside.Connection.Text/Text.Content[.!='']">
		<tr>
		     <th class="tl">�ܺ��������� :</th>
		     <td class="tl" colspan="3"> <xsl:value-of select="//LineList/LineItem/Public.Organization/cc:Outside.Connection.Text/Text.Content" /></td>
		</tr>
		</xsl:if>
                </tbody>
            </table>
        </div>

        <div class="detail">
            <table class="fix">
                <caption><span>Ư�����</span></caption>
                <colgroup>
                <col class="w100p" />
                </colgroup>
                <tbody>
                <tr>
                    <th>Ư����� : </th>
                </tr>
                <tr>
                    <td>
                        <div id="noteF" class="pre">
                            <xsl:call-template name="newLineBr">
                                <xsl:with-param name="text" select="//cc:Special.Note.Text/Text.Content" />
                            </xsl:call-template>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>


        <div class="detail" id="AttachList_id">
             <xsl:apply-templates select="//AttachList"/>    
        </div>
        
    </div>

    <xsl:if test="//Cooperation.Contract.Code/Code.Content[.!='2']">
        <div class="detail" id="OrgList_id">
            <div class="info_h3"><h3>[ ����ü ]</h3></div>
            <xsl:apply-templates select="//OrgList"/>
        </div>
    </xsl:if>

    <div style="margin-top:50px">
        <div style="margin-bottom:20px">
            <div class="tc"><h1> ��๰ǰ���� </h1></div>
        </div>
        <div class="detail" id="LineList_id">
            <xsl:apply-templates select="//LineList"/>
        </div>
    </div>

</div>
</body>
</html>
</xsl:template>


<!-- ����ü -->
<xsl:template match="OrgList">
    <table class="fix" summary="��ǥ�� �ֹε�Ϲ�ȣ ��ȣ �ּ� ����ڵ�Ϲ�ȣ ��ȭ��ȣ ������ �ѽ���ȣ ���бݾ� �ΰ������Կ���">
        <colgroup>
        <col class="w10p" />
        <col class="w14p" />
        <col class="w31p" />
        <col class="w14p" />
        <col class="w31p" />
        </colgroup>
    <xsl:for-each select="OrgItem">
        <xsl:if test="Organization.Details/cc:Organization.Identifier/Identifier.Content[.!='']">
        <tr>
            <td class="tc" rowspan="6">
                <xsl:if test="cc:Representative.Indicator/Indicator.Content[.= 'Y']">��ǥ</xsl:if>
                <xsl:if test="cc:Representative.Indicator/Indicator.Content[.= 'N']">����</xsl:if>
                <xsl:if test="cc:Representative.Indicator/Indicator.Content[.= 'R']">���뺸����</xsl:if>
            </td>
            <td class="tc">��ǥ�� :</td>
            <td class="tl"><xsl:value-of select="Organization.Details/cc:Organization.CEO.Name/Text.Content"/></td>
            <td class="tc">�ֹε�Ϲ�ȣ :</td>
            <td class="tl">
                <xsl:value-of select="substring(Organization.Details/cc:Organization.CEO.Identifier/Identifier.Content, 0, 7)"/>********
            </td>
        </tr>
        <tr>
            <td class="tc">��ȣ:</td>
            <td class="tl" colspan="3"><xsl:value-of select="Organization.Details/cc:Organization.Name/Text.Content"/></td>
        </tr>
        <tr>
            <td class="tc">�ּ�</td>
            <td class="tl" colspan="3">
                <xsl:value-of select="Address.Details/cc:Address.Line1.Text/Text.Content"/>
                <xsl:value-of select="Address.Details/cc:Address.Line2.Text/Text.Content"/>
            </td>
        </tr>
        <tr>
            <td class="tc">����ڵ�Ϲ�ȣ:</td>
            <td class="tl"><xsl:value-of select="Organization.Details/cc:Organization.Identifier/Identifier.Content"/></td>
            <td class="tc">��ȭ��ȣ:</td>
            <td class="tl"><xsl:value-of select="Contact.Details/cc:Telephone.Number.Text/Text.Content"/></td>
        </tr>
        <tr>
            <td class="tc">������:</td>
            <td class="tl"><xsl:value-of select="cc:Share.Rate/Numeric.Content"/></td>
            <td class="tc">�ѽ���ȣ:</td>
            <td class="tl"><xsl:value-of select="Contact.Details/cc:Fax.Number.Text/Text.Content"/></td>
        </tr>
        <tr>
            <td class="tc">���бݾ�:</td>
            <td class="tl"><xsl:value-of select="cc:Share.Amount/Amount.Content"/></td>
            <xsl:choose>
               <xsl:when test="cc:Surtax.Indicator/Indicator.Content[.!='']">
                <td class="tc">�ΰ������Կ���:</td>
		<td class="tl"><xsl:value-of select="cc:Surtax.Indicator/Indicator.Content"/></td>
               </xsl:when>
               <xsl:otherwise>
		<td class="tc"></td>
		<td class="tl"></td>
	       </xsl:otherwise>
            </xsl:choose> 
        </tr>
        </xsl:if>
    </xsl:for-each>
    <xsl:if test="sum(//OrgList/OrgItem/Organization.Details/cc:Organization.Identifier/Identifier.Content[.!='']) &lt; 1">
      <tr><td colspan="5">�ش� ��ü������ �����ϴ�.</td>
      </tr>
    </xsl:if>
    </table>
</xsl:template>

<!-- ��� ��ǰ  -->
<xsl:template match="LineList">
        <table class="fix" summary="��ǰ��������Ʈ : NO., G2B��ǰ�з���ȣ ,G2B��ǰ�ĺ���ȣ , ǰ��, �԰�,����,��������,�߷�,�ܰ�,�ݾ� ">
            <colgroup> 
            <col class="w6p" />
            <col class="w15p" />
            <col class="w15p" />
            <col class="w16p"/>
            <col class="w16p" />
            <col class="w16p" />
            <col class="w16p" />
            </colgroup>
            <thead>
            <tr> 
                <th class="tc" rowspan="2">No.</th>
                <th class="tc">��ǰ�з���ȣ</th>
                <th class="tc">��ǰ�ĺ���ȣ</th>
                <th class="tc">ǰ��</th>
                <th class="tc">�԰�</th>
                <th class="tc">����</th>
                <th class="tc">����</th>
            </tr>
            <tr> 
                <th class="tc">�ε�����</th>
                <th class="tc">����</th>
                <th class="tc">�ܰ�</th>
                <th class="tc">���ݾ�</th>
                <th class="tc">������</th>
                <th class="tc">��ǰ����</th>
            </tr>
            </thead>
            <tbody>
                <xsl:if test="sum(LineItem/cc:Line.Number.Value/Numeric.Content[.!='']) = 0">
                    <tr>
                        <td colspan="7" class="tc">�����Ͱ� �������� �ʽ��ϴ�.</td> 
                    </tr>
                </xsl:if>
                <xsl:for-each select="LineItem">
                    <xsl:if test="cc:Line.Number.Value/Numeric.Content[.!='']">
                        <tr> 
                            <td class="tc" rowspan="2">
                                <xsl:value-of select="position()" />
                            </td>
                            <td class="tc">
                                <xsl:value-of select="cc:Item.Classification.Identifier/Identifier.Content"/>
                            </td>
                            <td class="tc">
                                <xsl:value-of select="cc:Item.Identifier/Identifier.Content"/>
                            </td>
                            <td class="tl">
                                <xsl:value-of select="cc:Item.Name/Text.Content"/>
                            </td>
                            <td class="tl">
                                <xsl:value-of select="cc:Item.Description.Text/Text.Content"/>
                            </td>
                            <td class="tl">
                                <xsl:value-of select="cc:LineItem.Note.Text/Text.Content"/>
                            </td>
                            <td class="tl">
                                <xsl:choose>
                                    <xsl:when test="Changed.Item.Quantity/Quantity.Unit.Code[.!='']">
                                        <xsl:value-of select="Changed.Item.Quantity/Quantity.Unit.Code"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="cc:Item.Quantity/Quantity.Unit.Code"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <tr> 
                            <td class="tl">
                                <xsl:value-of select="Delivery.Details/cc:Delivery.Terms.Code/Code.Name"/>
                            </td>
                            <td class="tr">
                                <xsl:choose>
                                    <xsl:when test="Changed.Item.Quantity/Quantity.Content[.!='']">
                                        <xsl:for-each select="Changed.Item.Quantity/Quantity.Content[.!='']">
                                            <xsl:if test=".">
                                                <xsl:value-of select="format-number(., '###,###,###,###,###,##0.###')"/> 
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each select="cc:Item.Quantity/Quantity.Content[.!='']">
                                            <xsl:if test=".">
                                                <xsl:value-of select="format-number(., '###,###,###,###,###,##0.###')"/> 
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td class="tr">                                
                                <xsl:choose>
                                    <xsl:when test="Changed.UnitPrice.Details/cc:UnitPrice.Amount/Amount.Content[.!='']">
                                        <xsl:for-each select="Changed.UnitPrice.Details/cc:UnitPrice.Amount/Amount.Content[.!='']">
                                            <xsl:if test=".">
                                                <xsl:value-of select="format-number(., '###,###,###,###,###,##0.###')"/> 
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:for-each select="UnitPrice.Details/cc:UnitPrice.Amount/Amount.Content[.!='']">
                                            <xsl:if test=".">
                                                <xsl:value-of select="format-number(., '###,###,###,###,###,##0.###')"/> 
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>                                
                            </td>
                            <td class="tr">
                                <xsl:choose>
                                    <xsl:when test="Changed.Item.Amount/Amount.Content[.!='']">
                                        <xsl:apply-templates select="Changed.Item.Amount/Amount.Content[.!='']" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="cc:Item.Amount/Amount.Content[.!='']" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td class="tl">
                                <xsl:value-of select="Public.Organization/Organization.Details/cc:Organization.Name/Text.Content"/>
                            </td>
                            <td class="tc">
                                <xsl:for-each select="Delivery.Details/cc:Delivery.Date/DateTime.Content[.!='']">
                                    <xsl:if test="string-length(translate(translate(. ,'0123456789', '          '), ' ', '')) = 0">
                                        <xsl:apply-templates select="." />
                                    </xsl:if>
                                    <xsl:if test="string-length(translate(translate(. ,'0123456789', '          '), ' ', '')) > 0">
                                        <xsl:value-of select="."/>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:if>    
                </xsl:for-each>
            </tbody>
        </table>

        <!--div class="detail">�հ� : </div-->
</xsl:template>

</xsl:stylesheet>