/*
§ XPath란?
	• XML 문서 내의 특정 부분(element, attribute)을 찾아가기 위해 사용하는 경로 표기 언어
§ XPath의 용도
	• 스타일 쉬트 ☞ 스타일을 적용할 요소를 찾아가는 경로 표시자로 사용
	  ※ xsl:template 요소의 match 속성 혹은 xsl:apply-templates, xsl:value-of 요소의 select 속성에 사용. 
	• 데이터베이스 ☞ 데이터 상에서 검색 대상 요소를 찾아내는 경로 표시자로 사용
	  ※ XML data type method에서 사용
*/

declare @xmltxt xml
set @xmltxt =N'
<항목 ID="10001332">
	<항목명>
		수내동 가옥
	</항목명>
	<메타데이터>
		<분야>생활·민속</분야>
		<유형>건물</유형>
	</메타데이터>
	<본문>
		<지명>분당</지명> 신도시 개발 전 이곳에 세거하였던 <인명 유형="성씨">한산이씨(韓山李氏)</인명>의 살림집 중 한 채로 <인명>이택구</인명>씨가 거주하였던 집이다.
		<사진 url="house_a.jpg">수내동 가옥</사진>
		<사진 url="house_b.jpg">수내동 가옥</사진>
	</본문>
</항목>
'

/* Xpath 노드 사용 예시 */
--select @xmltxt.query('/항목/메타데이터/유형')
--select @xmltxt.query('//인명')
--select @xmltxt.value('(//인명)[1]', 'nvarchar(40)')

/* Xpath 함수 사용 예시 */
--select @xmltxt.query('count(/항목/본문/사진)')
--select @xmltxt.value('(/항목/본문/사진/@url)[1]', 'nvarchar(40)')
--select @xmltxt.value('(/항목/본문/사진/@url)[2]', 'nvarchar(40)')

/* Xpath 필터 사용 예시 */
--select @xmltxt.query('/항목/본문/사진[.="수내동 가옥"]') 
--select @xmltxt.query('/항목/본문/사진[./@url="house_a.jpg"]') 
--select @xmltxt.query('//인명[./@유형="성씨"]') 