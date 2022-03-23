# 인문정보데이터베이스
### 목차
- [1주차. 인문데이터개론](#1주차-인문데이터개론)
- [2주차. 정규 표현식](#2주차-정규-표현식)
- [3주차. 공공 데이터](#3주차-공공-데이터)
- [3주차. RDB 개론](#3주차-RDB-개론)

### 강의 계획서
![image](https://user-images.githubusercontent.com/61646760/157179820-242fb286-96eb-4e2d-86f8-81ef96c8b8ae.png)
- 학습 전략
  - 석사 필수 : 1학기 RDB + 2학기 XML + 3학기 온톨로지(RDF)
  - 박사 필수 : 석사필수 + 자신만의 "것" 개발
- 기본 교육 내용
  - 설계 + 구축 : RDB, XML, RDF, WIKI
  - 분석 : 언어분석, 사회네트워크분석(SNA), 딥러닝분석
  - 시각화 : VR 파노라마, 드론, 메타버스

## 1주차. 인문데이터개론
### Digital humanities
인문학은 텍스트를 연구하는 학문이 아니다. 인문학은 인간을 연구하는 학문이다. 종이라는 매체를 고집할 이유가 없다.
### Data
- **DIKW pyramid**  
  ![image](https://user-images.githubusercontent.com/61646760/158280218-fbf2e00e-14ef-460b-a05b-34ac82a709bf.png)
- **문자 인코딩(character encoding)**
  - ASCII(American Standard Code for Information Interchange)
  - 한글
    - 완성형 : 2,350자, '믜'의 문제
    - 조합형 : 이론상 모든 한글, 리소스 과다 점유
  - 유니코드(Unicode)
- 단계별 파일 포맷 종류  
    ![image](https://user-images.githubusercontent.com/61646760/157156777-040cb945-e230-4f26-ae11-7d9d7040366b.png)
    - 컴퓨터에게 얼마나 많은 정보를 알려줄 수 있는가(데이터 구조화)에 따른 단계 구분
    - 저단계의 데이터 포맷은 특정 소프트웨어에 귀속됨
- **인간 가독형 데이터(human readable data)**
  - pdf, word, 한글
  - `예) 이순신을 검색하면 충무공은 안 나옴`
- **기계 가독형 데이터(machine readable data)**
  - 종류
    - Semantic model
    - Relation model
    - Markup model
  - **CSV (Comma-separated values)**  
    ![image](https://user-images.githubusercontent.com/61646760/158282371-a62d5b93-951c-478b-965a-165876bd3279.png)
    - 필드를 `,`로 구분
    - 인문학에서는 `,`를 자주 사용하니 혼동의 여지가 있음
  - **TSV (tab-separated values)**  
    ![image](https://user-images.githubusercontent.com/61646760/158282421-fe539adf-9993-45b5-a7d8-5e39dd7be5f9.png)
    - 필드를 `tab`으로 구분
    - 인문학에서는 TSV를 많이 사용함
  - `예) 이순신을 검색하면 충무공이 나오도록 할 수 있음`
### Database
- **계층형 데이터베이스**
  - hierarchy는 분류의 문제를 가짐
    - `예) 디지털 불경은 종교학 섹션? 정보공학 섹션?`
  - 서로 다른 폴더에 같은 파일을 저장하면?
    - 둘 중 하나만 버전 업되는 경우가 빈번
    - 즉, 데이터 일관성 훼손의 위험이 있음
- **관계형 데이터베이스(RDB, Relational Database)**  
  ![image](https://user-images.githubusercontent.com/61646760/158283638-af907e0e-0eb2-4a92-8cb4-b78a9fbf1e72.png)
  - RDB의 구조
    - 릴레이션(relation)
      - 행(Row)과 열(Column)로 이루어진 2차원 테이블(Table)
      - 튜플들의 집합
    - 튜플(tuple)
      - 릴레이션의 행(row)
      - record, entity
    - 어트리뷰트(attribute)
      - 릴레이션의 열(column)
      - 엔티티(entity)가 보유하는 특성 표현
      - field
  - **SQL (Structured Query Language)**
    - 데이터베이스 시스템에서 자료를 처리하는 용도로 사용되는 구조적 데이터 질의 언어
    - `select 표시 열 from 테이블 where 행 제약 조건 order by 기준 열`
  - `예) CBDB(China Biographical Database Project, 중국 역대 인물 데이터베이스)`
    - 인물 간 관계는 다대다(n:m) 관계이므로, 엑셀에 작성하기 어려움
### XML
- **XML (eXtensible Markup Language)**
  - 특수한 목적을 갖는 마크업 언어를 만드는 데 사용하도록 권장하는 다목적 마크업 언어
    - 비정형 데이터의 특정한 요소를 컴퓨터가 식별할 수 있도록 하는 데 사용
      - 말하자면, 컴퓨터가 이해할 수 있는 형광펜 칠
    - 비정형 데이터를 다루는 데 뛰어남
      - 말뭉치(corpus)
    - [TEI : Text Encoding Initiative](https://en.wikipedia.org/wiki/Text_Encoding_Initiative)
      - 디지털 인문학 연구 커뮤니티 (a text-centric community of practice in the academic field of digital humanities) [#](https://tei-c.org/)
      - TEI Guidelines를 통해 XML 포맷 정의 [#](https://tei-c.org/release/doc/tei-p5-doc/en/html/ND.html)
    - `예) <인명>이순신</인명>은 <지명>한산도</지명>에서 왜나라 수군과 싸웠다.`
      - 동명이인 이순신은? 속성을 이용해 구분 가능
      - `<인물 id="001">이순신</인물>`
  - XML의 구성 요소  
    ![image](https://user-images.githubusercontent.com/61646760/158285509-4b081c3c-3ee9-4409-9667-2e34aa062a52.png)
  - XML 문서 설계
    - **문서 형식 정의(Document Type Definition, DTD)** : 예전 방식
    - **XML 스키마 정의(XML Schema Definition, XSD)** : 최근 방식
### RDF & LOD
- **RDF(Resource Description Framework)**
  - 메타 데이터 교환을 위해 명확하고 구조화된 의미 표현을 제공해 주는 공통의 기술 언어
  - 웹상에 존재하는 기계 해독형(machine-understandable) 정보를 교환하기 위하여 월드 와이드 웹 컨소시엄에서 제안
  - 메타 데이터 간의 효율적인 교환 및 상호 호환 목적
- **LOD(Linked Open Data)** : 시맨틱 데이터의 궁극

## 2주차. 정규 표현식
notepad++ : 가볍고 실습하기 좋은 프로그램이므로 권장
- **정규 표현식(regular expression)**
  - 특정한 규칙을 가진 문자열의 집합을 표현하는 데 사용하는 형식 언어
  - 목록
    ![image](https://user-images.githubusercontent.com/61646760/158290590-c5adb6d8-dcf4-4f4b-a6bb-db607d482eec.png)
    - 개행
      - `\n` : unix
      - `\r` : mac
      - `\r\n` : windows
    - `()`는 변수 기능이 있어 `\1`, `\2`로 불러올 수 있음
      ```
      # 복붙 결과
      1	1	가나이다 가이다 小臣 도라 가이다
      忠臣도 려니와 養親인 마오릿가
      구틔여 오라 시면 다시 도라 오오리다
      
      # 원하는 형식
      1	1	가나이다 가이다 小臣 도라 가이다
      1	1	忠臣도 려니와 養親인 마오릿가
      1	1	구틔여 오라 시면 다시 도라 오오리다
      ```
      ```
      (^.*?\t.*?\t)(.*?\t)(.*?\t)(.*?$)
      \1\2\n\1\3\n\1\4
      ```
      - `\1`은 `(^.*?\t.*?\t)`를 불러옴
      - `\2`는 `(.*?\t)`를 불러옴
  - [W3C regex](https://www.w3schools.com/python/python_regex.asp) 참고
<details>
<summary>정규 표현식 연습</summary>
  
  - 개행 문자 찾고 띄어쓰기 제거하기  
    ![image](https://user-images.githubusercontent.com/61646760/158291427-95b6c9df-51bd-4eec-a285-f3cc288e5069.png)
    ![image](https://user-images.githubusercontent.com/61646760/158292191-80b5c7e2-3d7c-4bc7-9fa4-0d0dc78e6cd1.png)
  - `.` 단위로 줄바꿈  
    ![image](https://user-images.githubusercontent.com/61646760/158292870-5a6655dd-3b5f-458c-9d2b-58e9e68d3040.png)
    ![image](https://user-images.githubusercontent.com/61646760/158293460-c4e8a45e-bbab-4e7e-a5cc-c34bbe2a26e8.png)
    - 시작 공백 제거
  - 대화(`""`) 텍스트 처리  
    ![image](https://user-images.githubusercontent.com/61646760/158294870-8c02c342-d506-4f14-8a39-245755a7f5fc.png)
    ![image](https://user-images.githubusercontent.com/61646760/158294977-70a89a96-0088-4089-8a2d-bfcd76dc5c3c.png)
    ![image](https://user-images.githubusercontent.com/61646760/158295177-e404e5fe-a1ae-4480-91f4-8376f2e4dfa6.png)
  - `.`을 `tab`으로 변경  
    ![image](https://user-images.githubusercontent.com/61646760/158295452-2911515c-8712-48b4-b7a5-06a32aeebcae.png)
  - 대본 처리  
    ![image](https://user-images.githubusercontent.com/61646760/158296054-deda0b7f-c05a-4bc9-b86c-7eb8a76a74b8.png)
    ![image](https://user-images.githubusercontent.com/61646760/158296449-d107840b-ebed-4d17-951d-770860d2ee46.png)
    - 권장은 `?`를 붙이는 것 : '그 뒤에 나오는 문자까지'라는 의미의 한정자  
      ![image](https://user-images.githubusercontent.com/61646760/158296903-46a0df97-4438-4731-ba3c-3c301abaf1ea.png)
  - 나머지는 각자 연습해 보기
</details>

## 3주차. 공공 데이터
- **공공 데이터(public data)**
  - 공공기관이 전자적으로 생성 또는 취득하여 관리하고 있는 모든 데이터베이스(DB), 전자화된 파일
  - 한국의 경우, 대부분의 인문 데이터는 공공기관에 귀속
    - 해외의 경우, 사기업이 인문 데이터를 소유한 경우도 많음
  - 정부 3.0
    - 정보의 능동적 공개, 사전 공표 확대
      - 정부 2.0의 경우, 정보의 청구 중심 공개
    - `예) 버스도착정보조회 서비스`
- **공공데이터법**
  - **공공데이터의 제공 및 이용 활성화에 관한 법률 (약칭: 공공데이터법)**
    - [시행 2020. 12. 10.] [법률 제17344호, 2020. 6. 9., 타법개정]
    - 제1조(목적) 이 법은 공공기관이 보유ㆍ관리하는 데이터의 제공 및 그 이용 활성화에 관한 사항을 규정함으로써 국민의 공공데이터에 대한 이용권을 보장하고, 공공데이터의 민간 활용을 통한 삶의 질 향상과 국민경제 발전에 이바지함을 목적으로 한다.
    - 제2조(정의) 이 법에서 사용하는 용어의 뜻은 다음과 같다. <개정 2016. 1. 6., 2020. 6. 9.>
      - 3 “**기계 판독이 가능한 형태**”란 소프트웨어로 데이터의 개별내용 또는 내부구조를 확인하거나 수정, 변환, 추출 등 가공할 수 있는 상태를 말한다.
    - 제3조(기본원칙) ① 공공기관은 누구든지 공공데이터를 편리하게 이용할 수 있도록 노력하여야 하며, 이용권의 보편적 확대를 위하여 필요한 조치를 취하여야 한다.
      - 공공 데이터 제공은 공공기관의 의무
    - [법령 보기](https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B3%B5%EA%B3%B5%EB%8D%B0%EC%9D%B4%ED%84%B0%EC%9D%98%EC%A0%9C%EA%B3%B5%EB%B0%8F%EC%9D%B4%EC%9A%A9%ED%99%9C%EC%84%B1%ED%99%94%EC%97%90%EA%B4%80%ED%95%9C%EB%B2%95%EB%A5%A0)
  - **공공기관의 운영에 관한 법률 (약칭: 공공기관운영법)**
    - [시행 2021. 1. 1.] [법률 제17128호, 2020. 3. 31., 일부개정]
  - **데이터 3법**
    - 「개인정보 보호법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률(약칭 : 정보통신망법)」, 「신용정보의 이용 및 보호에 관한 법률(약칭 : 신용정보법)」
      - 상업 통계 작성, 연구, 공익적 기록 보존 등을 위해 **가명 정보를 신용 정보 주체의 동의 없이 이용·제공**하는 것이 핵심
      - '비식별 조치'로 가능  
        ![image](https://user-images.githubusercontent.com/61646760/159384209-6901e4f1-82d0-4030-8431-88dc723e2b0a.png)
    - 개인정보 보호법 개정안 : 추가정보 사용 없이는 특정 개인을 식별할 수 없도록 처리한 가명정보에 대해서는 통계작성, 과학적 연구, 공익적 기록보존의 목적으로 처리해 활용
    - 신용정보의 이용 및 보호에 관한 법률 개정안 : 가명처리한 개인신용정보를 통계작성, 과학적 연구, 공익적 기록보존 등의 목적으로 신용정보주체의 동의 없이 이용하거나 제공
    - 정보통신망 이용촉진 및 정보보호 등에 관한 법률 개정안 : 방송통신위원회 소관 개인정보 규제권한을 모두 ‘개인정보 보호법’으로 이관해 불필요한 중복 규제를 해소
- **Creative Commons license(CCL)**
  - 크리에이티브 커먼즈가 만든 특정 조건에 따라 저작물 배포를 허용하는 저작권 라이선스 중 하나
  - 조합  
    ![image](https://user-images.githubusercontent.com/61646760/159385268-a5980e98-4e21-45ea-91f4-71ca5757128f.png)
    - **CC0** : 퍼블릭 도메인
- **공공데이터포털**
  - 1차사료 = 공공데이터 / 2차사료 = 웹서비스
    - Raw data보다 XML이 연구에 도움이 됨
  - 공공 데이터 제공 제외 사항
    - 인문 데이터는 <개인정보보호법>, <저작권법>만 신경 쓰면 됨
      - 개인정보 보호법 제2조(정의) 제1항에서는 “**개인정보란 살아있는 개인에 관한 정보**”로 대상이 생존해있는 경우로 한정하고 있다.
        - 설령 현재 생존해 있는 인물이라도 **공적인 존재에 대해서는 공공성이 있는 정보**로서 “알권리”를 비롯한 법적 이익이 그와 같은 정보처리를 막음으로써 얻을 수 있는 정보주체의 인격적 법익에 비하여 우월하다.
        - 특히 **해당 개인정보가 해당 기관의 웹서비스로 제공되고 있다면** 더욱더 제공 불가 사유가 되지 못한다.
      - 저작권법 제39조(보호기간의 원칙)에 따라서 **저작권은 저작자가 생존하는 동안과 사망한 후 70년간 존속**한다.
        - 공공기관이 제공하는 대다수의 서비스는 국비를 토대로 편찬되기에 **공공데이터로 공개할 수 있는 저작권 계약**이 되어 있는 경우가 많다.
        - 그러나 **2012년 공공데이터법이 제정되기 이전에는 공공데이터로서 제공 관련 사항이 명문화되어 있지 않아서 문제가 되는 경우**도 분명 존재하며, 2012년 이후라고 하더라도 다양한 사정에 의해서 저작권을 온전히 확보하지 못하는 경우도 생긴다.
  - 필요한 데이터가 있으면, 먼저 [공공데이터포털](https://www.data.go.kr/)에 검색해 볼 것
    - 혹은 교수님께 여쭙기
  - 참고 사이트
    - [AI Hub](https://aihub.or.kr/)
      - 다양한 개방 데이터
    - [모두의 말뭉치](https://corpus.korean.go.kr/)
      - 언어 쪽 특화
    - [데이터 바우처](https://kdata.or.kr/datavoucher/index.do)
      - 혼자 데이터 작업하기 어려울 경우 알아볼 것
    - [공공데이터분쟁조정위원회](https://www.odmc.or.kr/home/homeIndex.do?menuCode=mediation)
      - 공공 데이터 분쟁 조정 기능
      - 데이터 제공 거부 시 거부 사유가 타당한지 검증
      - 신청은 조언을 구하고 신중히 할 것 (문헌 권력)

## 3주차. RDB 개론
- **데이터베이스(database)**
  - 다수의 응용 시스템들이 사용하기 위해 체계적으로 편성, 저장된 데이터의 집합
    - An organized collection of information records that can be accessed electronically.
    - A collection of data organized so that various programs can access and update the information.
  - 데이터베이스 구축의 목적
    - 데이터 관리의 편리성
    - 데이터 무결성 유지
      - 데이터의 물리적 & 논리적 독립성 유지
      - 데이터 중복의 최소화
    - 데이터 공유 / 보안
- **데이터베이스 관리 시스템(DBMS: Database Management System)**
  - 응용 프로그램과 데이터의 중재자로서 모든 응용 프로그램들이 데이터베이스에 접근하여 공동으로 활용할 수 있게끔 관리해 주는 소프트웨어
    - 편리하고 효율적인 데이터베이스 검색, 저장을 위한 환경 제공
  - A collection of software that manages, manipulates and retrieves data in a database.
    - A collection of software for organizing the information in a database that might contain routines for data input, verification, storage, retrieval, and combination.
  - DBMS의 기능
    - 정의 기능(definition facility) : 여러 사용자들이 요구하는 대로 데이터를 기술해 줄 수 있도록 데이터를 조직하는 기능
    - 조작 기능(manipulation facility) : 데이터의 검색, 갱신, 삽입, 삭제 등의 데이터베이스 연산을 지원하기 위한 기능
    - 제어 기능(control facility) : 공용 목적으로 관리하는 데이터베이스의 내용을 항상 정확하게 유지할 수 있는 기능
- **SQL(Structured Query Language)**
  - 데이터베이스의 검색과 조작을 쉽고 빠르게 하기 위해 개발된 데이터베이스 언어
    - 1970년대 초반 IBM사의 관계형 데이터베이스 질의어로 개발
    - DBMS마다 상이한 형태의 질의어를 제공하는 데서 오는 사용자의 불편 해소 필요성 대두 ⇒ 데이터베이스 질의어 표준화 요구 발생
      - 1986년 ANSI와 ISO가 공동으로 SQL의 표준화 작업을 진행(SQL-86)
      - 관계형 DB를 위한 SQL2(1992년), 객체지향형 DB를 위한 SQL3(1999), XML 데이터를 처리하기 위한 SQL4(2003), 멀티미디어 정보를 위한 SQL/MM 등 표준화 작업이 계속 진행
  - SQL의 구성
    - **데이터 정의어(DDL : Data Definition Language)**
      - 테이블 생성 기능(create table)
      - 테이블 변경 기능(alter table)
      - 테이블 삭제 기능(drop table)
      - 뷰 생성 기능(create view)
      - 뷰 삭제 기능(drop view)
    - **데이터 조작어(DML : Data Manipulation Language)**
      - 데이터 검색 기능(select)
      - 데이터 삽입 기능(insert)
      - 데이터 삭제 기능(delete)
      - 데이터 수정 기능(update)
  - SQL 문의 기본 구조 : **`select 표시 열 from 테이블 where 행 제약 조건 order by 기준 열`**
    - `예) select 이름, 생년, 몰년 from 인명 where 생년 >1700 and 몰년 < 1900  order by 생년`
      - ‘인명’ 테이블에서 1700년 이후에 태어나고 1900년 이전에 죽은 사람을 찾아 그들의 ‘이름’, ‘생년’, ‘몰년’을 ‘생년’ 순서대로 보여라.
- **스키마(schema)**
  - 데이터베이스의 논리적 정의
    - The logical definition of an entire database.
  - 데이터베이스를 구성하는 데이터 개체(entity), 이들의 속성(attribute), 관계(relation), 그리고 데이터 조작 및 데이터 값의 제약 조건에 대한 정의의 총칭
    - A conceptual model of the structure of a database that defines the data contents and relationships.
    - A pattern that represents the data's model defining the elements (or objects), their attributes (or properties), and the relationships between the different elements.
  - RDB의 스키마  
    ![image](https://user-images.githubusercontent.com/61646760/159392846-fb029011-5d05-4568-98bc-a2baf28327fd.png)
- **키(key)**
  - **후보 키(Candidate Key)**
    - 한 릴레이션의 특정 튜플을 유일하게 구별할 수 있는 애트리뷰트들의 집합
    - 릴레이션에 있는 모든 튜플에 대해 유일성(uniqueness)과 최소성(minimality)을 만족시켜야 함
  - **기본 키(PK: Primary Key)**
    - 후보 키 중에서 데이터베이스 관리자가 선택한 주 키(Main Key)
    - Null 값을 가질 수 없음.
    - 기본 키로 정의된 애트리뷰트에는 동일한 값이 중복 저장될 수 없다.
  - **대체 키(Alternate Key)**
    - 기본 키를 제외한 나머지 후보 키
  - **슈퍼 키(Super Key)**
    - 두 개 이상의 애트리뷰트의 집합으로 구성되는 키
    - 유일성(uniqueness)은 만족시키지만 최소성(minimality)은 만족시키지 않는 애트리뷰트의 집합
  - **외래 키(FK: Foreign Key)**
    - 관계를 맺고 있는 릴레이션의 기본 키에 해당하는 애트리뷰트
    - 외래 키로 지정된 애트리뷰트는 참조된 릴레이션의 기본 키에 없는 값을 가질 수 없다.
- MSSQL 실습은 `03_03_MSSQL_데이터 import+export.pptx` 참고
  - **SSMS(SQL Server Management Studio)**
    - [다운로드 링크](https://docs.microsoft.com/ko-kr/sql/ssms/download-sql-server-management-studio-ssms)
  - 자세한 것은 `03_03_MSSQL_데이터 import+export` 파일 참고
    - 참고로 access를 적극 사용할 것
### 과제
- [X] 본인 쿼리문 교수님께 메일로 전달 드리기
  ```
  use s_haein
  
  select * from 입력샘플
  select * from 엑셀입력
  ```
