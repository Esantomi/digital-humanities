USE s_haein

/* browse xml data */

SELECT * FROM seongnam_xml

--'대표항목명'의 첫 번째 것을 80자로 보기
select xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nchar(80)') from seongnam_xml

--위치 무관(//)하게 '인명'만 보기
select xmltxt.query('//인명') from seongnam_xml

--대표명칭, 한자명칭, 분야, 유형, 소재지를 xml 형식으로, 각각의 열로 만들어 보기
select 
xmltxt.query('/항목/항목명/대표항목명'),
xmltxt.query('/항목/항목명/한자항목명'),
xmltxt.query('/항목/메타데이터/대표분야'),
xmltxt.query('/항목/메타데이터/대표유형'),
xmltxt.query('/항목/메타데이터/표준지역')
from seongnam_xml

--위의 쿼리문과 상동 (아래 view문의, value 메소드를 사용한 select와 비교해 보자.)
select 
xmltxt.query('/항목/항목명/대표항목명') as 대표명칭,
xmltxt.query('/항목/항목명/한자항목명') as 한자명칭,
xmltxt.query('/항목/메타데이터/대표분야') as 분야,
xmltxt.query('/항목/메타데이터/대표유형') as 유형,
xmltxt.query('/항목/메타데이터/표준지역') as 소재지
from seongnam_xml


/* create metadata view */

--drop view seongnam_meta

--뷰(view) 만들기
create view seongnam_meta as
---대표명칭, 한자명칭, 분야, 유형, 소재지를 xml 형식이 아닌 텍스트 데이터로, 각각의 열로 만들어 보기
select 
id, 
xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nchar(40)' ) as 대표명칭,
xmltxt.value('(/항목/항목명/한자항목명)[1]', 'nchar(40)') as 한자명칭,
xmltxt.value('(/항목/메타데이터/대표분야)[1]', 'nchar(80)') as 분야,
xmltxt.value('(/항목/메타데이터/대표유형)[1]', 'nchar(40)') as 유형,
xmltxt.value('(/항목/메타데이터/표준지역)[1]', 'nchar(80)') as 소재지
from seongnam_xml

--뷰 전체 내용 보기
select * from seongnam_meta

--뷰에서 유형이 '유적/건물'인 데이터만 보기
select * from seongnam_meta
where 유형='유적/건물'

--뷰에서 소재지가 '금토동'인 데이터만 보기
select * from seongnam_meta
where 소재지 like '%금토동%'


/* insert new xml data */

--seongnam_xml 테이블의 xmltxt 컬럼에 값을 삽입하는 템플릿
---N은 유니코드 깨짐 방지를 위해 삽입
INSERT INTO  seongnam_xml(xmltxt) VALUES(
N'

') 

--seongnam_xml 테이블의 xmltxt 컬럼에 '낙생습지.xml' 전체를 삽입
---트리거는 이전 세팅으로 인해 자동으로 적용됨
INSERT INTO  seongnam_xml(xmltxt) VALUES(
N'
<항목 ID="GC00100528" 레벨="6" 유형="일반항목">
  <항목명>
    <대표항목명>
      <지명 검색="1" 검색어="낙생습지">낙생습지</지명>
    </대표항목명>
    <한글항목명>낙생습지</한글항목명>
    <한자항목명>樂生濕地</한자항목명>
    <영문항목명>
      <공식명칭 />
    </영문항목명>
    <중국어항목명></중국어항목명>
    <중문항목명></중문항목명>
  </항목명>
  <메타데이터>
    <이칭별칭 />
    <키워드 />
    <대표분야>지리/자연 지리</대표분야>
    <대표유형>지명/자연 지명</대표유형>
    <표준지역>경기도 성남시 분당구 대장동</표준지역>
    <표준시대>현대/현대</표준시대>
    <분야>지리/자연 지리</분야>
    <유형>지명/자연 지명</유형>
    <지역>경기도 성남시 분당구 대장동<공간 식별자="성남:낙생습지" 연관="직접" /></지역>
    <시대>현대/현대</시대>
    <집필자>김성환</집필자>
    <의견 작업="템플릿작업" 작업일시="20041025" 작업자="김윤희" />
    <의견 작업="윤문교열" 작업일시="20041205" 작업자="유경희" />
    <의견 작업="윤문교열검수" 작업자="이재열;20041215" />
    <의견 작업="교정" 작업일시="20041217" 작업자="염지영" />
    <의견 작업="태깅1.2" 작업일시="20041226" 작업자="김도형" />
    <의견 작업="태깅3.4" 작업일시="20050111" 작업자="김도형" />
    <상세정보 유형="성격">습지</상세정보>
    <상세정보 유형="면적">25,000㎡</상세정보>
    <상세정보 유형="깊이">1m</상세정보>
  </메타데이터>
  <본문>
    <소표제>[정의]</소표제>
    <문단>
      <지명 검색="1" 검색어="대장동">경기도 성남시 분당구 대장동</지명> <지명 검색="1" 검색어="낙생저수지">낙생저수지</지명> 상류부에 형성된 습지.</문단>
    <소표제>[개설]</소표제>
    <문단>
      <지명 검색="1" 검색어="낙생습지">낙생습지</지명>는 <지명 검색="1" 검색어="대장동">경기도 성남시 분당구 대장동</지명>과 <지명>용인시 고기동</지명> 사이에 위치하는 <지명 검색="1" 검색어="낙생저수지">낙생저수지</지명>의 상류부에 형성된 습지이다.</문단>
    <소표제>[명칭유래]</소표제>
    <문단>
      <지명 검색="1" 검색어="낙생저수지">낙생저수지</지명>의 상류부에 형성된 습지이므로 <지명 검색="1" 검색어="낙생습지">낙생습지</지명>라고 한다. ‘낙생’이란 명칭은 병자호란 때 충청감사 <인명 검색="1" UCI="G002+AKS-KHF_13C815C138ADDCB1583X0" 검색어="정세규">정세규</인명>가 <지명 검색="1" 검색어="남한산성">남한산성</지명>에 포위된 <인명 검색="1" UCI="G002+AKS-KHF_12C778C870FFFFB1595X0" 검색어="인조">인조</인명>를 구하기 위하여 북상하였다가 <지명>판교</지명> 남쪽 <지명 검색="1" 검색어="험천">험천</지명>[<지명>머내</지명>]에서 <지명>청</지명>나라 군사에게 크게 패하자, 임금이 성을 나와 <지명>청</지명> <인명 검색="0">태종</인명>에게 항복하였으므로 ‘성이 떨어졌다’는 뜻의 ‘낙성(落城)’이 ‘낙생(樂生)’으로 변했다고 한다.</문단>
    <소표제>[자연환경]</소표제>
    <문단>
      <지명 검색="1" 검색어="낙생습지">낙생습지</지명>는 해발 고도 약 90m 상에 형성되어 있으며 평균 수심은 1m, 면적은 25,000㎡ 정도이다. <지명 검색="1" 검색어="탄천">탄천</지명>으로 합류하는 <지명 검색="1" 검색어="동막천|험천">동막천</지명>의 유역에 형성된 인공 습지로서 <지명 검색="1" 검색어="낙생저수지">낙생저수지</지명>의 축조에 따라 저수지의 상류 호숫가를 따라 습지가 형성되었다.</문단>
    <소표제>[현황]</소표제>
    <문단>주요 식생으로 갈대군락을 비롯하여 줄, 고마리, 소리쟁이, 쇠뜨기, 애기부들이 서식하고 있다. 인공제방 축조로 인하여 식생의 인위적 교란을 겪고 있는 <지명 검색="1" 검색어="탄천">탄천</지명> 유역의 다른 습지들에 비하면 자연 상태의 보전이 비교적 양호한 편이다.</문단>
    <참고문헌>
      <문헌>
        <서명 검색어="성남시사">『성남시사』</서명>(<출판사항>성남시사편찬위원회, 1993</출판사항>)</문헌>
      <문헌>
        <저자>김기빈</저자> 외, <서명 검색어="분당의 땅이름 이야기">『분당의 땅이름 이야기』</서명>(<출판사항>한국토지공사 토지박물관, 1999</출판사항>)</문헌>
      <문헌>
        <서명 검색어="성남시의 역사와 문화유적">『성남시의 역사와 문화유적』</서명>(<출판사항>한국토지공사 토지박물관, 성남시, 2001</출판사항>)</문헌>
      <문헌>
        <서명 검색어="성남시의 역사와 문화유산">『성남의 역사와 문화유산』</서명>(<출판사항>성남문화원, 2001</출판사항>)</문헌>
      <문헌>
        <서명 검색어="2002 전국내륙습지 자연환경 조사보고서">『2002 전국내륙습지 자연환경조사 보고서』</서명>-한강유역(<출판사항>환경부, 2003</출판사항>)</문헌>
    </참고문헌>
  </본문>
</항목>
') 

select * from seongnam_xml   --낙생습지 삽입 여부 확인
select * from seongnam_meta  --낙생습지 삽입 여부 확인

--seongnam_xml 테이블에서 대표항목명이 '정일당 강씨 사당'인 데이터의 id, 항목명, xmltxt 보기
select id, xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nvarchar(80)' ), xmltxt from seongnam_xml
where xmltxt.value('(/항목/항목명/대표항목명)[1]', 'nvarchar(80)' )='정일당 강씨 사당'  

--seongnam_meta 뷰에서 대표명칭이 '정일당 강씨 사당'인 데이터의 id, 대표명칭, xmltxt를 두 테이블의 id값이 같은 것만 병합하여 보기 
---join : on 이하의 조건에 맞춰 두 테이블을 합쳐 줌
select seongnam_meta.id, 대표명칭, xmltxt from seongnam_meta
join  seongnam_xml on seongnam_meta.id = seongnam_xml.id
where 대표명칭='정일당 강씨 사당'

--위의 조건에서 대표명칭이 낙생습지인 것 보기
select seongnam_meta.id, 대표명칭, xmltxt from seongnam_meta
join  seongnam_xml on seongnam_meta.id = seongnam_xml.id
where 대표명칭='낙생습지'


/* create keyword index view: 인명 */

--seongnam_person 뷰 만들기
---id, 인명을 포괄
CREATE VIEW seongnam_person AS
  SELECT id, node.value('.', 'nchar(80)' ) AS 인명
  FROM  seongnam_xml CROSS APPLY xmltxt.nodes('//인명') AS R(node) 

--seongnam_person 뷰 보기
SELECT * FROM seongnam_person

--인명으로 묶어 인물당 언급 횟수 세기
SELECT 인명, count(*) as 빈도
  FROM  seongnam_person
  GROUP BY 인명
 
--seongnam_meta 테이블과 seongnam_person 테이블의 id 값이 같은 것끼리 묶어서 인명이 '정일당 강씨'인 데이터를 보기
select * from seongnam_person as sp
  join seongnam_meta as sm on sp.id = sm.id
  where 인명='정일당 강씨'
  

/* create keyword index view: 지명 */
  
--seongnam_place 뷰 만들기
---id, node의 value 포괄
CREATE VIEW seongnam_place AS
  SELECT id, node.value('.', 'nchar(80)' ) AS 지명
  FROM  seongnam_xml CROSS APPLY xmltxt.nodes('//지명') AS R(node) 

--seongnam_place 뷰 보기
SELECT * FROM seongnam_place

--지명으로 묶어 지명당 언급 횟수 세기
SELECT 지명, count(*) as 빈도
  FROM  seongnam_place
  GROUP BY 지명

--seongnam_meta 테이블과 seongnam_person 테이블의 id 값이 같은 것끼리 묶어서 지명이 '동막천', '청계산'인 것 중 '지명', seongnam_meta의 모든 데이터를 보기
select 지명, sm.* from seongnam_place as sp
  join seongnam_meta as sm on sp.id=sm.id
  where 지명 in ('동막천', '청계산')
