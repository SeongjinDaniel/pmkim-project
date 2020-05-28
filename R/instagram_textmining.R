#### 형태소분석 및 감정 분석을 위한 패키지들
library(wordcloud)
library(wordcloud2)
library(dplyr)

##tidyverse 는 전처리 시각화에 특화된 패키지
install.packages("tidyverse")
library(tidyverse)
library(rlang)#tidyverse 설치를 위해 버전 업데이트 필요했음

##stringr 문자열 전처리 하기위한 패키지
library(stringr)

##SentimentAnalysis 감정 분석을 위한 패키지
install.packages("SentimentAnalysis")
library(SentimentAnalysis)

###자연어 분석 패키지 : RmecabKo, RccpMeCab, KoNLP
##RmecabKo
install.packages("RmecabKo")
library(RmecabKo)
install_mecab("C:/SEHO/Rstudy/mecab")#mecab 다운로드 위치


##RccpMeCab
install.packages("RcppMeCab")
library(RcppMeCab)


##KoNLP 자연어 분석 패키지
install.packages("KoNLP")
# 아래 먼저 다운로드 후 KoNLP
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("Rcpp")
# KoNLP 로드
library(KoNLP)

## googleLanguageR 구글 클라우드 제공 자연어 처리 API
install.packages("googleLanguageR")
library(googleLanguageR)
gl_auth("C:/SEHO/Rstudy/logintest-269204-f4e6353f1be7.json")



####여기까지 패키지 추가

##google API 사용
gl_nlp() #google natural language API
gl_translate() 

#예시
gl_text <- c("Norma is a small constellation in the Southern Celestial Hemisphere between Ara and Lupus, one of twelve drawn up in the 18th century by French astronomer Nicolas Louis de Lacaille and one of several depicting scientific instruments.", 
           "Solomon Wariso (born 11 November 1966 in Portsmouth) is a retired English sprinter who competed primarily in the 200 and 400 metres.")


nlp_result <- gl_nlp(gl_text, nlp_type = "analyzeSentiment", language = "en")

nlp_result <- gl_nlp(sample_text, language = "ko", encodingType = "UTF8")
str(nlp_result)
nlp_result$tokens
nlp_result$entities

# 사전 추가
useSystemDic()
useSejongDic()
useNIADic()

#working directory 설정
setwd("C:/SEHO/Rstudy")

##테스트 시작
sentence<-"아버지가 방에 스르륵 들어가신다"

#명사 뽑아주는 함수
extractNoun(sentence)

#형태소 분석해주는 함수
MorphAnalyzer(sentence)

#품사 확정 및 태그 붙여주는 함수
#return : list
SimplePos09(sentence)
SimplePos22(sentence)
?SimplePos22()



############RmecabKo####################

## pos() : 품사 확정 및 태그 붙여주는 함수
#return : list 한줄 벡터로 보여줌

pos(sentence) 
#결과값
# $`아버지가 방에 들어가신다`
# [1] "아버지/NNG" "가/JKS"     "방/NNG"     "에/JKB"     "들어가/VV"  "신다/EP+EC"

pos(sentence)[[1]][1] 
#결과값 : [1] "아버지/NNG"

# nouns() : 명사 추출 함수
nouns(sentence)
nouns(sample_text) %>% 
  unlist()->st_test
st_test %>% 
  count(V1, sort=T)

## [sample test]
sample_text <- c("부실 대출로 인해서 은행은 벌금을 지불하는데 동의했다",
                 "은행에 대출을 늦게 갚은 경우, 부실 부실 은행에서 지연에 대해 이자를 물릴 것이다.", 
                 "시내에 새로운 식당이 생겼습니다.",
                 "테헤란로에 맛집 식당이 있습니다.",
                 "새로 개장하려고 하는 식당 대출을 어떻게 상환할 계획입니까?")

## col1 : document (문서12345), col2 : text(내용들)
### tiblle 의 기능?
sample_df <- tibble::tibble(
  document = paste0("문서", 1:5),
  text = sample_text
)
class(sample_df)

## 새로운 행 추가 : 형태소 첨부한 단어
### unnest 의 기능은?
ds_df <- sample_df %>% 
  mutate(text_pos = pos(text)) %>% 
  unnest(text_pos)

### DT::의 기능?
ds_df %>% 
  DT::datatable()

## 명사만 뽑기
ds_noun_df <- ds_df %>% 
  filter(str_detect(text_pos, "/NNG")) %>% 
  mutate(text_no_pos = str_replace_all(text_pos, "/NNG", ""))

ds_noun_df %>% 
  DT::datatable()

class(ds_noun_df)

#명사만 추려내기
ds_vec<- ds_noun_df$text_no_pos 

##명사 카운팅
#무조건 'data.table' 을 데이터로 주고 다음 변수명에 그룹지을 '컬럼명'
ds_noun_df %>% 
  count(text_no_pos,sort=T)->wn

## wordcloud 만들기
#install.packages("showtext") // install.packages("Redmonder")
library(Redmonder)
library(wordcloud)
library(showtext)
font_add_google("Noto Sans", "notosans")
showtext_auto()
pal = redmonder.pal(6, "sPBIRdPu")
wn %>% 
  with(wordcloud(text_no_pos, n, family = "notosans", colors = pal))




