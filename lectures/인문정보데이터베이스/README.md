# 인문정보데이터베이스
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
- 정규 표현식 연습
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
