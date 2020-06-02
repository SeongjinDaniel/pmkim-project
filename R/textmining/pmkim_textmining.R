##################################################################################################
### gs25 분석 ###

#분석할 파일 읽고
gs25<-read.csv("./data/insta_gs25.csv")
cu<-read.csv("./data/insta_cu.csv")[c(1:10000),]
emart24<-read.csv("./data/insta_emart24.csv")
mini<-read.csv("./data/insta_ministop.csv")[c(1:10000),]
seven<-read.csv("./data/insta_seven.csv")[c(1:10000),]

#중복 제거
insta_cu<-unique(cu)
insta_emart24<-unique(emart24)
insta_mini<-unique(mini)
insta_gs25<-unique(gs25)
insta_seven<-unique(seven)

#결측치 제거
insta_cu %>% filter(!is.na(article))->insta_cu 
insta_emart24 %>% filter(!is.na(article))->insta_emart24 
insta_mini %>% filter(!is.na(article))->insta_mini
insta_gs25 %>% filter(!is.na(article))->insta_gs25
insta_seven %>% filter(!is.na(article))->insta_seven

#tibble 객체로 변경
insta_gs25<-tibble(
  text = as.vector(insta_gs25$article)
)
insta_cu<-tibble(
  text = as.vector(insta_cu$article)
  )
insta_emart24<-tibble(
  text = as.vector(insta_emart24$article)
)
insta_mini<-tibble(
  text = as.vector(insta_mini$article)
)
insta_seven<-tibble(
  text = as.vector(insta_seven$article)
)

#unnest 컬럼으로 정렬, pos 형태소로 나누기 실행
insta_gs25.pos<-insta_gs25 %>% 
  mutate(pos_gs25 = pos(text)) %>% 
  unnest(pos_gs25)
insta_cu.pos<-insta_cu %>% 
  mutate(pos_cu = pos(text)) %>% 
  unnest(pos_cu)
insta_emart24.pos<- insta_emart24 %>% 
  mutate(pos_emart24 = pos(text)) %>% 
  unnest(pos_emart24)
insta_mini.pos<-insta_mini %>% 
  mutate(pos_mini = pos(text)) %>% 
  unnest(pos_mini)
insta_seven.pos<-insta_seven %>% 
  mutate(pos_seven = pos(text)) %>% 
  unnest(pos_seven)

##명사만 뽑기 class(gs25_noun) head(gs25_noun)
gs25_noun<- insta_gs25.pos %>% 
  filter(str_detect(pos_gs25,"NNG")) %>% 
  mutate(gs25_noun=str_replace_all(pos_gs25,"/NNG",""))
cu_noun<-insta_cu.pos %>% 
  filter(str_detect(pos_cu,"NNG")) %>% 
  mutate(cu_noun = str_replace_all(pos_cu,"/NNG",""))
emart24_noun<-insta_emart24.pos %>% 
  filter(str_detect(pos_emart24,"NNG")) %>% 
  mutate(emart24_noun = str_replace_all(pos_emart24,"/NNG",""))
mini_noun<-insta_mini.pos %>% 
  filter(str_detect(pos_mini,"NNG")) %>% 
  mutate(mini_noun = str_replace_all(pos_mini,"/NNG",""))
seven_noun<-insta_seven.pos %>% 
  filter(str_detect(pos_seven,"NNG")) %>% 
  mutate(seven_noun = str_replace_all(pos_seven,"/NNG",""))


##자음 및 불필요한 데이터 지우기
remove.char  <- c("편의점","그램","스타","앤+JX","신상","구매","본점","스타일","할인","맛집","라이프","푸드","카페","신상","음식","오늘","먹방","추천","간식","일상"
                  ,"ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"
                  ,"ㅏ","ㅑ","ㅓ","ㅕ","ㅗ","ㅛ","ㅜ","ㅡ","ㅣ","ㅒ","ㅠ")
gs25_noun <- gs25_noun %>% 
  filter(!(gs25_noun %in% remove.char))
cu_noun<-cu_noun %>% 
  filter(!(cu_noun %in% remove.char))
emart24_noun<-emart24_noun %>% 
  filter(!(emart24_noun %in% remove.char))
mini_noun<-mini_noun %>% 
  filter(!(mini_noun %in% remove.char))
seven_noun<-seven_noun %>% 
  filter(!(seven_noun %in% remove.char))


##vec 로 정제
#gs25.n.vec<-gs25_noun$gs25_noun

##카운팅하기
gs25_noun %>% 
  count(gs25_noun,sort=T)->gs.counting
cu_noun %>% 
  count(cu_noun,sort=T)->cu.counting
emart24_noun %>% 
  count(emart24_noun,sort=T)->emart24.counting
mini_noun %>% 
  count(mini_noun,sort=T)->mini.counting
seven_noun %>% 
  count(seven_noun,sort=T)->seven.counting
seven.counting[11:20,]
##펭 한글자 나온거 펭수로 변경
###원하는 문자 들어가있는 행 찾아서 데이터 바꿔주기..어려웟음 데이터프레임에서
gs.index<-which(gs.counting$gs25_noun=="펭")
gs.counting$gs25_noun[gs.index]<-"펭수"
cu.index<-which(cu.counting$cu_noun=="펭")
cu.counting$cu_noun[cu.index]<-"펭수"
cu.counting$cu_noun[which(cu.counting$cu_noun=="만시")]<-"깔라만시"
cu.counting$cu_noun[which(cu.counting$cu_noun=="라만")]<-"라면"
emart24.index<-which(emart24.counting$emart24_noun=="펭")
emart24.counting$emart24_noun[emart24.index]<-"펭수"
emart24.counting$emart24_noun[which(emart24.counting$emart24_noun=="쌀")]<-"이천쌀"
mini.index<-which(mini.counting$mini_noun=="펭")
mini.counting$mini_noun[mini.index]<-"펭수"

##한글자 지우기 및 한글자중 필요한거 살리기
gs.counting %>% 
  filter(gs25_noun=="차"|gs25_noun=="면"|gs25_noun=="술"|gs25_noun=="떡"|gs25_noun=="콘"|gs25_noun=="빵"|gs25_noun=="쌀"|!nchar(gs25_noun)==1)->insta.gs25
cu.counting %>% 
  filter(cu_noun=="차"|cu_noun=="면"|cu_noun=="술"|cu_noun=="떡"|cu_noun=="콘"|cu_noun=="빵"|cu_noun=="쌀"|!nchar(cu_noun)==1)->insta.cu
emart24.counting %>% 
  filter(emart24_noun=="차"|emart24_noun=="면"|emart24_noun=="술"|emart24_noun=="떡"|emart24_noun=="콘"|emart24_noun=="빵"|emart24_noun=="쌀"|!nchar(emart24_noun)==1)->insta.emart24
mini.counting %>% 
  filter(mini_noun=="차"|mini_noun=="면"|mini_noun=="술"|mini_noun=="떡"|mini_noun=="콘"|mini_noun=="빵"|mini_noun=="쌀"|!nchar(mini_noun)==1)->insta.mini
seven.counting %>% 
  filter(seven_noun=="차"|seven_noun=="면"|seven_noun=="술"|seven_noun=="떡"|seven_noun=="콘"|seven_noun=="빵"|seven_noun=="쌀"|!nchar(seven_noun)==1)->insta.seven
#컬럼명 바꿔주기
names(insta.gs25)<-c("word","freq")
names(insta.cu)<-c("word","freq")
names(insta.emart24)<-c("word","freq")
names(insta.mini)<-c("word","freq")
names(insta.seven)<-c("word","freq")

#### 표 만들기
theme_set(theme_bw(base_family = "AppleGothic"))
ggplot(gs25.cnt %>% filter(freq > 280), aes(reorder(word, freq), freq)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
ggplot(insta.cu %>% filter(freq > 2000), aes(reorder(word, freq), freq)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
ggplot(insta.emart24 %>% filter(freq > 500), aes(reorder(word, freq), freq)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
ggplot(insta.mini %>% filter(freq > 800), aes(reorder(word, freq), freq)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))


###워드클라우드 참고
wordcloud(words$keyword, words$freq, 
          min.freq = 2, 
          random.order = F,
          rot.per = 0.3, scale = c(3, 1), 
          colors = rainbow(7)) 
# min.freq = 최소값 이 이상 출력
# rot.per = 세로로 출력되는 %
# random.order = 색깔, 사이즈, 가장 큰수의 센터


##figpath 위한 패키지 로딩  htmlwidgets, htmltools, jsonlite, yaml, base64enc
library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
library(base64enc)
head(insta.cu)
insta.cu %>% 
  filter(freq>158) %>% 
  with(wordcloud2(.
                 , size=0.5
                 ,col = "random-dark"))->wc.cu
saveWidget(wc.cu,"cu.html",selfcontained = F)
insta.emart24 %>% 
  filter(freq>92) %>% 
  with(wordcloud2(.
                  , size=0.5
                  ,col = "random-dark"))->wc.emart24
saveWidget(wc.emart24,"emart24.html",selfcontained = F)
insta.mini %>% 
  filter(freq>121) %>% 
  with(wordcloud2(.
                  , size=0.5
                  ,col = "random-dark"))->wc.mini
saveWidget(wc.mini,"ministop.html",selfcontained = F)
insta.gs25 %>% 
  filter(freq>121) %>% 
  with(wordcloud2(.
                  , size=0.5
                  ,col = "random-dark"))->wc.gs25
saveWidget(wc.gs25,"gs25.html",selfcontained = F)
insta.seven %>% 
  filter(freq>121) %>% 
  with(wordcloud2(.
                  , size=0.5
                  ,col = "random-dark"))->wc.seven
saveWidget(wc.seven,"seven.html",selfcontained = F)

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
##cu
corp.cu <- VCorpus(VectorSource(insta_cu$article[1:5000])) #inspect(corp)
res_sentiment.cu <- analyzeSentiment(corp.cu, #대신에 corpus,
                                  language="korean",
                                  rules=list("KoreanSentiment"=list(ruleSentiment, senti_dic_kr)),
                                  removeStopwords = F, stemming = F)
cu.df_1 <- data.frame(round(res_sentiment.cu, 3), insta_cu[1:5000,]) #head(df2)


##emart24
corp.emart24 <- VCorpus(VectorSource(insta_emart24$article[1:5000])) #inspect(corp)
res_sentiment.emart24 <- analyzeSentiment(corp.emart24, #대신에 corpus,
                                  language="korean",
                                  rules=list("KoreanSentiment"=list(ruleSentiment, senti_dic_kr)),
                                  removeStopwords = F, stemming = F)

emart24.df_1 <- data.frame(round(res_sentiment.emart24, 3), insta_emart24[1:5000,]) #head(df2)


##ministop
corp.mini <- VCorpus(VectorSource(insta_mini$article[1:5000])) #inspect(corp)
res_sentiment.mini <- analyzeSentiment(corp.mini, #대신에 corpus,
                                  language="korean",
                                  rules=list("KoreanSentiment"=list(ruleSentiment, senti_dic_kr)),
                                  removeStopwords = F, stemming = F)

mini.df_1 <- data.frame(round(res_sentiment.mini, 3), insta_mini[1:5000,]) #head(df2)

##theme setting
theme_set(theme_minimal(base_family = "AppleGothic"))
### 긍정인지 부정인지 알려줌
##cu
cu.df_2 <- cu.df_1 %>% 
  mutate(pos_neg = if_else(KoreanSentiment >= 0, "Positive", "Negative")) %>%
  select(pos_neg, everything()) # head(cu.df)
cu.df_2 %>% filter(is.na(cu.df_2$pos_neg))->cu.df_3
##emart24
emart24.df_2 <- emart24.df_1 %>% 
  mutate(pos_neg = if_else(KoreanSentiment >= 0, "Positive", "Negative")) %>%
  select(pos_neg, everything()) # head(emart24.df)
emart24.df_2 %>% filter(!is.na(emart24.df_2$pos_neg))->emart24.df_3
##ministop
mini.df_2 <- mini.df_1 %>% 
  mutate(pos_neg = if_else(KoreanSentiment >= 0, "Positive", "Negative")) %>%
  select(pos_neg, everything()) # head(mini.df)
mini.df_2 %>% filter(!is.na(mini.df_2$pos_neg))->mini.df_3
###막대 그래프로 표현
##cu
ggplot(cu.df_3, aes(x = factor(pos_neg))) + 
  geom_bar(stat = "count", width = 0.7, fill = "steelblue") + 
  theme_minimal()
##emart24
ggplot(emart24.df_3, aes(x = factor(pos_neg))) + 
  geom_bar(stat = "count", width = 0.7, fill = "steelblue") + 
  theme_minimal()
##ministop
ggplot(mini.df_3, aes(x = factor(pos_neg))) + 
  geom_bar(stat = "count", width = 0.7, fill = "steelblue") + 
  theme_minimal()
##XXXX 데이터 테이블로 변환(여기선 필요 없을듯)
DT::datatable(head(cu.df %>% select(article, KoreanSentiment, pos_neg), n = 200), 
              class = 'cell-border stripe', 
              options = list(pageLength = 5, autoWidth = TRUE, scrollX = TRUE))


##################################################################################################