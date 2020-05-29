##################################################################################################
### gs25 분석 ###

#분석할 파일 읽고
gs25<-read.csv("insta_gs25.csv")
cu<-read.csv("./data/insta_cu.csv")
emart24<-read.csv("./data/insta_emart24.csv")
mini<-read.csv("./data/insta_ministop.csv")

#중복 제거
insta_cu<-unique(cu)
insta_emart24<-unique(emart24)
insta_mini<-unique(mini)

#결측치 제거
insta_cu %>% filter(!is.na(article))->insta_cu 
insta_emart24 %>% filter(!is.na(article))->insta_emart24 
insta_mini %>% filter(!is.na(article))->insta_mini

#tibble 객체로 변경
insta_gs25<-tibble(
  text = as.vector(gs25$article)
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


##vec 로 정제
#gs25.n.vec<-gs25_noun$gs25_noun

##카운팅하기
gs25_noun %>% 
  count(gs25_noun,sort=T)->counting
cu_noun %>% 
  count(cu_noun,sort=T)->cu.counting
emart24_noun %>% 
  count(emart24_noun,sort=T)->emart24.counting
mini_noun %>% 
  count(mini_noun,sort=T)->mini.counting

##펭 한글자 나온거 펭수로 변경
###원하는 문자 들어가있는 행 찾아서 데이터 바꿔주기..어려웟음 데이터프레임에서
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
counting %>% 
  filter(!nchar(gs25_noun)==1)->gs25.cnt
cu.counting %>% 
  filter(cu_noun=="차"|cu_noun=="면"|cu_noun=="술"|cu_noun=="떡"|cu_noun=="콘"|cu_noun=="빵"|cu_noun=="쌀"|!nchar(cu_noun)==1)->cu
emart24.counting %>% 
  filter(emart24_noun=="차"|emart24_noun=="면"|emart24_noun=="술"|emart24_noun=="떡"|emart24_noun=="콘"|emart24_noun=="빵"|emart24_noun=="쌀"|!nchar(emart24_noun)==1)->emart24
mini.counting %>% 
  filter(mini_noun=="차"|mini_noun=="면"|mini_noun=="술"|mini_noun=="떡"|mini_noun=="콘"|mini_noun=="빵"|mini_noun=="쌀"|!nchar(mini_noun)==1)->mini

#### 표 만들기
theme_set(theme_bw(base_family = "AppleGothic"))
ggplot(gs25.cnt %>% filter(n > 280), aes(reorder(gs25_noun, n), n)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
ggplot(cu %>% filter(n > 2000), aes(reorder(cu_noun, n), n)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
ggplot(emart24 %>% filter(n > 500), aes(reorder(emart24_noun, n), n)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
ggplot(mini %>% filter(n > 800), aes(reorder(mini_noun, n), n)) + 
  geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  coord_flip() + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

####워드클라우드
font_add_google("Noto Sans", "notosans")
pal = redmonder.pal(6, "sPBIRdPu") #색 파레트 
showtext_auto()
gs25.cnt %>% 
  filter(n>150) %>% 
  with(wordcloud(gs25_noun
                 , n
                 , family = "notosans"
                 ,colors = pal))
cu %>% 
  filter(n>1000) %>% 
  with(wordcloud(cu_noun
                 , n
                 , family = "notosans"
                 ,colors = pal))
emart24 %>% 
  filter(n>200) %>% 
  with(wordcloud(emart24_noun
                 , n
                 , family = "notosans"
                 ,colors = pal))
mini %>% 
  filter(n>300) %>% 
  with(wordcloud(mini_noun
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


##################################################################################################