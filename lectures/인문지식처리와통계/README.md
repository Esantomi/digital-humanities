# 인문지식처리와통계
### 목차
- [1주차. 언어분석개론](#1주차-언어분석개론)
  - [인공지능](#인공지능)
- [2주차. Colab과 Python](#2주차-Colab과-Python)
  - [Colab](#Colab)
  - [Python](#Python)
- [2주차. 형태소 분석 개론](#2주차-형태소-분석-개론)
### 강의 계획서
![image](https://user-images.githubusercontent.com/61646760/157179687-1790f976-9cf4-4b0c-800f-6a986b615d5a.png)

## 1주차. 언어분석개론
- **자연어처리(natural language processing, NLP)**
  - 자연어이해(natural language understanding, NLU)
    - DH에서 특히 중요
  - 자연어생성(natural language generation, NLG)
    - DH에서 잠정적으로 중요할 수 있음
- 언어 분석의 핵심은 "찾기"와 "바꾸기"
  - 이순신을 검색하면 충무공은 누락됨
    - `이순신 = 충무공`의 의미 관계를 파악할 수 있어야 함
  - 정규 표현식(regular expression)은 고급진 찾기와 바꾸기
- **N-gram**
  - a contiguous sequence of n items from a given sample of text or speech  
    ![image](https://user-images.githubusercontent.com/61646760/157184572-3dcb4afe-5bb3-49f2-a30d-8808897b2309.png)
  - `예) 행복은 너의 마음에 있다.`
    - 1-gram(unigrams) : “행복은”, “너의”, “마음에”, “있다”
    - 2-gram(bigrams) : “행복은 너의”, “너의 마음에”, “마음에 있다”
    - 3-gram(trigrams) : “행복은 너의 마음에”, “너의 마음에 있다”
  - 교착어로서 조사, 어미의 빈도가 높은 한국어에는 적용하기 어려운 점이 있음
    - 중문을 n 단위로 나누는 경우, 각각의 token이 독립적 의미가 없는 경우가 많음
    - 고전 텍스트 연구에서는 많이 사용됨
- **형태소 분석(morphological analysis)**
  ![image](https://user-images.githubusercontent.com/61646760/157186526-1ac3d255-b01d-456b-9be5-4b9a9556e00c.png)
  - 사전과 어법은 코퍼스(corpus)를 통해 얻음
    - 코퍼스 구축은 까다로운 작업이므로 WPM 고안
    - **Word Piece Model(WPM)**
      - 하나의 단어를 내부 단어(Subword Unit)들로 분리하는 단어 분리 모델
        - sentencepiece
      - 언어 분석의 미래
  - `예) 나는 은이 좋아.`
    - [('나', 'Noun'), ('는', 'Josa'), ('은', 'Noun'), ('이', 'Josa'), ('좋아', 'Adjective'), ('.', 'Punctuation')]
  - 형태소 분석의 문제점 - 한국말은 끝까지
    - `예) 나는 선배 앞에서 멋있는 척 하는 그대를 사랑으로 감싸줄 수 없다.`
      - 부정적인 문장인데 형태소 분석은 긍정으로 판단함
  - **감정 분석(sentiment analysis)**
    - 감정 사전, 형태소 분석기를 통한 텍스트의 감정 분석
    - 문장의 감정 판단은 주관적이라는 비판이 존재
- **공기어 분석(co-occurrence analysis)**
  - 공기어(co-occurrence word) : 같은 문맥 안에서 함께 나타나 서로 밀접한 의미 관계를 갖는 단어
  - 개념사 연구에 중요  
    ![image](https://user-images.githubusercontent.com/61646760/157191227-0cd908d5-41e1-4255-99f2-90a6139224ad.png)
### 인공지능
- 인공지능의 양대 흐름
  - Symbolic (Ontology) : 인간의 지식을 기호로 표시하고, 이를 바탕으로 논리, 검색, 문제 표현 등을 처리
    - **시맨틱 데이터(semantic data)**
      - **RDF(Resource Description Framework)**
      - **온톨로지(ontology)**
      - **LOD(Linked Open Data)** : 정해진 규칙에 따라 구조화한 데이터를 웹상에 발행한 데이터
  - Subsymbolic (Machine Learning) : 지식의 표현 없이 기계 학습과 같은 방법을 이용하여 학습, 패턴 인식과 같은 분야에 활용
    - **딥러닝(deep learning)**
      - 지도 학습(Supervised Learning) : 정해진 답 有
        - `예) seq2seq`
      - 비지도 학습(Unsupervised Learning) : 정해진 답 無
        - `예) Word2Vec`
      - 강화 학습(Reinforcement Learning) : 반복을 통해 목표 달성
        - 인문학에서의 활용 방안은 낮은 편
      - **설명 가능한 AI(XAI, Explainable Artificial Intelligence)**
        - 머신러닝 알고리즘으로 작성된 결과와 출력을 인간인 사용자가 이해하고 이를 신뢰할 수 있도록 해주는 일련의 프로세스와 방법론
- **임베딩(embedding)**
  - 이미지
    - 이미지 → 숫자 → 알고리즘 → 숫자 →이미지
    - 컴퓨터가 보는 이미지 = 숫자의 조합(RGB)
  - 문자
    - 문자 → 숫자 → 알고리즘 → 숫자 → 문자
    - **One-Hot Encoding**
      - 문장이 증가하면 할수록 열(단어)도 많아진다.
      - 무의미한 랜덤 숫자를 배정하는 것이 아니라, 유의미한 숫자를 배정할 수는 없을까? Word2Vec!
    - **Word2Vec**
      - 단어 벡터 간 유의미한 유사도를 계산  
        ![image](https://user-images.githubusercontent.com/61646760/157194789-7c5838df-bb7d-4634-b57a-3c04cf8684ee.png)
          - king-man과 queen-woman 사이의 위치 관계는 의미 관계를 반영함
      - 학습 방식
        - CBOW(Continuous Bag of Words) : 주변에 있는 단어들을 입력으로 중간에 있는 단어들을 예측하는 방법
        - Skip-Gram : 중간에 있는 단어들을 입력으로 주변 단어들을 예측하는 방법
- **seq2seq**
  - 한 문장(시퀀스)을 다른 문장(시퀀스)으로 변환하는 모델
  - `예) 번역기, 챗봇`
  - 인문학에서의 활용도는 낮은 편
- **전이 학습(transfer learning)**
  - 하나의 작업을 위해 훈련된 모델(Pre-training Model)을 유사 작업 수행 모델의 시작점으로 활용하는 딥러닝 접근법
    - `예) Bert / KoBert / KR-BERT /  ERNIE /  gpt-3 / gpt-2 / KoGPT2`
  - **Pre-training Model**
    - 사전에 학습되는 모델
    - 이를 활용하여 새로운 모델을 학습하는 과정은 Fine-tuning

## 2주차. Colab과 Python
### Colab
- **Colab (Colaboratory)**
  - 무료로 파이썬(python) 프로그래밍을 위한 주피터 노트북(Jupyter Notebook)을 사용할 수 있는 환경을 제공해 주는 서비스
    - 로컬에 주피터 노트북 환경을 구축하기 위해서는 복잡한 과정이 필요. Colab에서는 간단한 클릭만으로 주피터 노트북 환경 구축 가능
    - 연속 사용 시간이 제한되어 있음 (대략 6시간)
  - [`예) Colab으로 ipynb 파일 열어 보기`](https://drive.google.com/file/d/1pSrt7ly3U2icS_vrjWUY07SlqsBtl2fx/edit)
    - 읽기 권한만 있음
    - `드라이브로 복사` 버튼을 눌러 구글 드라이브에 사본 저장 가능
      - `내 드라이브 - Colab Notebooks` 경로에 저장
      - [github에 사본 저장](https://colab.research.google.com/drive/1dkjZT0Jy3y6xv2shOpxScp3BH1N6YjMn)
    - 우측 상단의 `연결` 버튼을 눌러 프로그래밍을 위한 주피터 노트북 클라우드 환경을 구축
      - 셀에서 `ctrl + Enter`를 누르면 실행하고 해당 셀에 머물고, `shift + Enter`를 누르면 실행하고 다음 셀로 이동함
    - `런타임 - 런타임 유형 변경`으로 들어가 GPU 이용 가능
    - 소스 코드를 손쉽게 공유 가능하다는 장점이 있음
      - 로우 데이터셋은 '링크가 있는 모든 사용자로 변경'으로 공유하는 것이 편함
    - `SEARCH STACK OVERFLOW` 버튼을 통해 스택오버플로우에 검색해 주는 기능을 제공
  - 구글 드라이브와 연동하기
    ```
    # 구글 드라이브 연결을 위한 기본 세팅
    !pip install -U -q PyDrive
 
    from pydrive.auth import GoogleAuth
    from pydrive.drive import GoogleDrive
    from google.colab import auth
    from oauth2client.client import GoogleCredentials
 
    #  Authenticate and create the PyDrive client.
    auth.authenticate_user()
    gauth = GoogleAuth()
    gauth.credentials = GoogleCredentials.get_application_default()
    drive = GoogleDrive(gauth)
    ```
    - 링크 타고 들어가서 verification code를 복사한 뒤 입력창에 넣어 줌
  - id로 실제 파일 불러오기
    ```
    # 문서 ID로 실제 파일 불러오는 법
    ## https://drive.google.com/open?id=1VBre-j1bHeQ4uvTTygVzuEO0sKcZGmy6

    ## https://drive.google.com/file/d/    19DhEWDDjHja98ciElpIMM8r05Ye-Z2Np    /view?usp=sharing

    rawdata_downloaded = drive.CreateFile({'id': '1CIdStWHTYS0k_ZH_miY2vlHHQHO82MWc'})
    rawdata_downloaded.GetContentFile('testko00.csv')
    ```
### Python
- **Python**
  - 1991년 프로그래머인 귀도 반 로섬(Guido van Rossum)이 발표한 고급 프로그래밍 언어
    - 플랫폼에 독립적이며 인터프리터식, 객체지향적, 동적 타이핑(dynamically typed) 대화형 언어
  - 패키지(package)
    - 각종 변수, 함수, 클래스를 포함하는 파일인 모듈(module)의 집합
    - 간단한 명령어로 다양한 오픈소스 패키지를 불러와 활용이 가능함
    - `예) 데이터 관리 툴인 pandas, 한국어 분석 패키지인 konlpy, 중국어 분석 패키지인 jieba, 딥러닝 패키지인 TensorFlow`
  - 변수, 조건, 반복을 조합하는 것이 프로그래밍
- **konlpy**
  - 한국어 정보 처리를 위한 파이썬 패키지 [#](https://konlpy.org/ko/latest/)
    ```
    # konlpy 설치
    !pip install konlpy
    ```
    ```
    from konlpy.tag import Kkma
    kkma = Kkma()

    # 문장 단위 분리
    print(kkma.sentences(u'네, 안녕하세요. 반갑습니다. 다음에 또 만나요.'))
    # 명사만 추출
    print(kkma.nouns(u'질문이나 건의사항은 깃헙 이슈 트래커에 남겨주세요.'))
    # 품사 태깅 (POS tagging)
    print(kkma.pos(u'여러분 이 수업이 너무 어렵지는 않나요? 이해가 되시나요?'))
    
    # ['네, 안녕하세요.', '반갑습니다.', '다음에 또 만나요.']
    # ['질문', '건의', '건의사항', '사항', '깃헙', '이슈', '트래커']
    # [('여러분', 'NP'), ('이', 'MDT'), ('수업', 'NNG'), ('이', 'JKS'), ('너무', 'MAG'), ('어렵', 'VA'), ('지', 'ECD'), ('는', 'JX'), ('않', 'VXV'), ('나요', 'EFQ'), ('?', 'SF'), ('이해', 'NNG'), ('가', 'JKC'), ('되', 'VV'), ('시', 'EPH'), ('나요', 'EFQ'), ('?', 'SF')]
    ```
### 과제 제출
- 실습 파일 교수님께 공유하고 구글 드라이브 과제 폴더에 개인 폴더 만들어 업로드하기

## 2주차. 형태소 분석 개론
- KoNLPy
  - 한국어 정보 처리를 위한 파이썬 패키지
  - 5종의 형태소 분석기 내장
    - Hannanum
      - KAIST Semantic Web Research Center 개발한 형태소 분석기
    - **Kkma (꼬꼬마)**
      - 서울대학교 IDS(Intelligent Data Systems) 연구실에서 개발한 형태소 분석기
      - `ntags = 56`
      - 딕셔너리 업데이트가 잘 안 되어 있음 (~2007)
    - Komoran
      - 최근에는 잘 안 씀
    - **Mecab**
      - 일본어 형태소 분석기를 개량한 Mecab-ko
      - `ntags = 43`
      - 성능이 전체적으로 무난함
    - **Okt** (Open Korean Text = **Twitter**)
      - 트위터를 분석하기 위해 만들어진, 요즘 핫한 형태소 분석기
        - 트위터에서 만든 오픈소스 한국어 처리기인 twitter-korean-text를 이어받아 만들고 있는 프로젝트
      - 사전마다 품사를 나누는 기준(품사 분류 체계)이 다른데, Okt가 가장 이질적임
      - `ntags = 19`로, 까다로운 품사 분류는 간소하게 뭉뚱그림
  - 형태소 분석기 비교  
    ![image](https://user-images.githubusercontent.com/61646760/158337128-5ec14ed0-eadf-4180-ae25-34f2edff97ac.png)
- N-gram 분석 맛보기
  ```
  #@title N-Gram - 띄어쓰기 기준 분리
  문장 = ''  #@param {type: "string"}
  NGram크기 = "" #@param ["1", "2", "3", "4", "5", "6"] {allow-input: true}

  from nltk import ngrams

  ngrams = ngrams(문장.split(), int(NGram크기))

  for grams in ngrams:
    print(grams)
  ```
- 형태소 분석 맛보기 (kkma)
  ```
  #@title 한국어 형태소 분석 - konlpy(kkma)
  한국어문장 = '\uB098\uB294 \uC544\uBA54\uB9AC\uCE74\uB178\uAC00 \uC88B\uC544.'  #@param {type: "string"}


  # konlpy 설치하기 ## https://data1000.tistory.com/33
  !pip3 install jpype1==0.7.0
  !pip3 install konlpy

  from IPython.display import clear_output
  clear_output()

  from konlpy.tag import Kkma
  from konlpy.utils import pprint
  kkma = Kkma()

  print("  ")
  print("###문장 분리###")
  print(kkma.sentences(한국어문장))

  print("  ")
  print("###명사 추출###")
  print(kkma.nouns(한국어문장))

  print("  ")
  print("###형태소 분리###")
  print(kkma.morphs(한국어문장))

  print("  ")
  print("###품사 태깅###")
  print(kkma.pos(한국어문장))
  ```
- 형태소 분석 맛보기 (okt)
  ```
  #@title 한국어 형태소 분석 - konlpy(okt=twitter)
  한국어문장 = '\uB098\uB294 \uC544\uBA54\uB9AC\uCE74\uB178\uAC00 \uC88B\uC544.'  #@param {type: "string"}


  # konlpy 설치하기 ## https://data1000.tistory.com/33
  !pip3 install jpype1==0.7.0
  !pip3 install konlpy

  from IPython.display import clear_output
  clear_output()

  from konlpy.tag import Okt
  from konlpy.utils import pprint
  okt = Okt()

  print("  ")
  print("###명사 추출###")
  print(okt.nouns(한국어문장))

  print("  ")
  print("###형태소 분리###")
  print(okt.morphs(한국어문장))

  print("  ")
  print("###품사 태깅###")
  print(okt.pos(한국어문장))
  ```
### 과제 제출
- 문장을 바꿔서 실행해 보고 공유 및 업로드
