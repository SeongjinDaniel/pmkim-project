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

######unnest test 
pb.file.new<-tibble(
  text1 = as.vector(pb.file$eventGood)##as.vector 로 바꿔줘야한다다
)
class(pb.file.new)

pb.file.new %>% 
  mutate(pos_eventGood = pos(text1)) %>% 
  unnest(pos_eventGood)


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


##https://mrchypark.github.io/textR/#32 참고
install.packages("tidytext") #unnest_tokens 사용하기 위한 패키지
library(tidytext)

##오류남
unnest_tokens(
  tbl = pb.file, #텍스트 데이터
  input = eventGood, #목표 텍스트 열
  output = eventGood, # 결과열의 이름
  token="words" #형태소 분석
)




#################################################
### gs25 분석 ###

#분석할 파일 읽고
gs25<-read.csv("insta_gs25.csv")
#tibble 객체로 변경
insta_gs25<-tibble(
  text = as.vector(gs25$article)
)
#unnest 실행
insta_gs25.pos<-insta_gs25 %>% 
  mutate(pos_gs25 = pos(text)) %>% 
  unnest(pos_gs25)

##명사만 뽑기 class(gs25_noun) head(gs25_noun)
gs25_noun<- insta_gs25.pos %>% 
  filter(str_detect(pos_gs25,"NNG")) %>% 
  mutate(gs25_noun=str_replace_all(pos_gs25,"/NNG",""))

##자음 지우기
remove.char  <- c("편의점","그램","ㄱ", "ㅅ", "ㅁ", "ㅈ", "ㅣ", "ㄷ", "ㄴ", "ㅂ", "ㄹ")
gs25_noun <- gs25_noun %>% 
  filter(!(gs25_noun %in% remove.char))

##vec 로 정제
#gs25.n.vec<-gs25_noun$gs25_noun

##카운팅하기
gs25_noun %>% 
  count(gs25_noun,sort=T)->counting

##펭 한글자 나온거 펭수로 변경
counting$gs25_noun[3]<-"펭수"

##한글자 지우기
counting %>% 
  filter(!nchar(gs25_noun)==1)->gs25.cnt


#### 표 만들기
theme_set(theme_bw(base_family = "AppleGothic"))
ggplot(gs25.cnt %>% filter(n > 280), aes(reorder(gs25_noun, n), n)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

####워드클라우드
library(wordcloud)
library(showtext)
font_add_google("Noto Sans", "notosans")
pal = redmonder.pal(6, "sPBIRdPu") #색 파레트 
showtext_auto()
gs25.cnt %>% 
  filter(n>150) %>% 
  with(wordcloud(gs25_noun
                 , n
                 , family = "notosans"
                 ,colors = pal))


###감성분석###
##군산대 감성사전 사용
senti_words_kr <- readr::read_delim("C:/SEHO/Rstudy/data/SentiWord_Dict.txt", delim='\t', col_names=c("term", "score"))
head(senti_words_kr)

#사전 재정의
x <- duplicated(senti_words_kr$term) #중복 확인 제거
#중복 제거
senti_words_kr$term[duplicated(senti_words_kr$term)]
senti_words_kr<-unique(senti_words_kr)
#감성 단어 나누기
senti_words_kr2 <- senti_words_kr[!x, ]
senti_dic_kr <- SentimentDictionaryWeighted(words = senti_words_kr2$term, 
                                            scores = senti_words_kr2$score)
senti_dic_kr <- SentimentDictionary(senti_words_kr2$term[senti_words_kr2$score > 0], 
                                    senti_words_kr2$term[senti_words_kr2$score < 0])
#head(senti_dic_kr) summary(senti_dic_kr) 확인

#data.frame to corpus
corp <- VCorpus(VectorSource(gs25$article)) #inspect(corp)
res_sentiment <- analyzeSentiment(corp, #대신에 corpus,
                                  language="korean",
                                  rules=list("KoreanSentiment"=list(ruleSentiment, senti_dic_kr)),
                                  removeStopwords = F, stemming = F)

df2 <- data.frame(round(res_sentiment, 3), gs25) #head(df2)
theme_set(theme_minimal(base_family = "AppleGothic"))
## 긍정인지 부정인지 알려줌
df3 <- df2 %>% 
  mutate(pos_neg = if_else(KoreanSentiment >= 0, "Positive", "Negative")) %>%
  select(pos_neg, everything()) # head(df3)
## 데이터 테이블로 변환
DT::datatable(head(df3 %>% select(article, KoreanSentiment, pos_neg), n = 200), 
              class = 'cell-border stripe', 
              options = list(pageLength = 5, autoWidth = TRUE, scrollX = TRUE))

df3 %>% filter(!is.na(df3$pos_neg))->df3

##막대 그래프로 표현
ggplot(df3, aes(x = factor(pos_neg))) + 
  geom_bar(stat = "count", width = 0.7, fill = "steelblue") + 
  theme_minimal()



###tf_idf 출력 값 나오는데 이게 뭔의미인지 모르겠음
insta_gs25 %>% 
  mutate(id=as.numeric(1:n())) %>% 
  unnest_tokens(pos,text,token=pos) %>% 
  select(id,pos) %>% 
  filter(str_detect(pos,"/n/v(v|a)")) %>% 
  mutate(pos = str_remove_all(pos,"/.*$")) %>% 
  filter(nchar(pos)>1) %>% 
  group_by(id) %>% 
  count(pos)->testing

testing %>% 
  bind_tf_idf(pos,id,n) %>% 
  arrange(desc(tf_idf))

####tf-idf 실패코드###
library(tm) # Text Mining에 필요한 패키지
library(readr) # 파일작성에 필요한 패키지
# 2. 코퍼스 기반으로 DTM을 생성, 이때 weighting 파라미터에 TF-IDF 함수 추가
kwdDTM_TF = DocumentTermMatrix(Corpus(VectorSource(as.list(insta_gs25))) , control=list(wordLengths=c(2,Inf),
                                                    weighting = function(x) weightTfIdf(x, normalize = TRUE)))
# 3. removeSparseTerms 수행
kwdDTM_TF = removeSparseTerms(kwdDTM_TF, as.numeric(0.999))
# 4. 단어별 발생빈도 구하기
kwdFreq_TF = colSums(as.matrix(kwdDTM_TF))
# 5. 단어-빈도 형태로 dataframe에 담기
wordDf_TF <- data.frame(word=names(kwdFreq_TF),TF-IDF =kwdFreq_TF)
# 6. 내용 파일 생성
write_csv(x = wordDf_TF, path = "./result/word_freq_HRConsulting_high_0620_TF.txt")
####tf-idf 실패코드 끝###

#################################################

