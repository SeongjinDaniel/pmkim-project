#plus11<- sapply(plus11sample, function(x){x$getElementText()})
#plus11<- c(plus11, unlist(repl))
#more$clickElement()
#plus11sample$clickElement()

Sys.Date() #년, 월, 일

library(stringr)
library(RSelenium)
library(dplyr)
product=NULL
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url)


#1+1
#상품명


more<-remDr$findElement(using='css','#ONE_TO_ONE ')
more$getElementTagName()
more$getElementText()
more$clickElement()

plus1sample<-NULL
plus1name<-NULL
for(i in 1:22){
  for(n in 1:8){
    plus1sample <- remDr$findElement(using='css',paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li:nth-child(",n,") > div > p.tit"))
    plus1name<- append(plus1name,plus1sample$getElementText())
    
    plus1sample <- remDr$findElement(using='css', paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li:nth-child(",n,") > div > p.price > span"))
    plus1price<- append(plus1price,plus1sample$getElementText())
  }
  
  prodName <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index,") > p.prodName > a"))
  prodName <- unlist(prodName$getElementText())
  Sys.sleep(1)
  price <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index,") > p.prodPrice > span"))
  price <- unlist(price$getElementText())
  Sys.sleep(1)
  img <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index,") > div > a > img"))
  inform <- data.frame(date,prodName,price)
  print(inform)
  totalInform <- rbind(totalInform,inform)


    

  more<-remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > div > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
}

#제조사) 가져오기
plus1name%>%
  str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
  gsub(")","",.)->plus1manuf

#상품명만 남기기
plus1name%>%
  str_extract(.,"[)]{1}[[가-힣]\\w]{1,}")%>%
  gsub(")","",.)->plus1name

#판매가격
plus1sample<-NULL
plus1price<-NULL
for(i in 1:23){
  for(i in 1:8){
    n<- i;
    plus1selector<-paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li:nth-child(",n,") > div > p.price > span")
    plus1sample <- remDr$findElement(using='css',plus1selector)
    plus1price<- append(plus1price,plus1sample$getElementText())
  }
}

plus1price%>%
  gsub("원","",.)->plus1price

#cbind
View(gsplus1product)
gsplus1product <- cbind(plus1name, plus1price, plus1manuf)
gsplus1product %>% 
  mutate(rlw)

# 시간 판매업소 제조사

write.csv(gsplus1product,"gs1뿔1.csv")


#2+1
#상품명
more<-remDr$findElement(using='css','#TWO_TO_ONE')
more$getElementTagName()
more$getElementText()
more$clickElement()

plus2sample<-NULL
plus2name<-NULL
for(i in 1:84){
  for(i in 1:8){
    n<- i;
    plus2selector<-paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.tit")
    plus2sample <- remDr$findElement(using='css',plus2selector)
    plus2name<- append(plus2name,plus2sample$getElementText())
  }
  Sys.sleep(1)
}

#제조사) 가져오기
plus2name%>%
  str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
  gsub(")","",.)->plus2manuf


#상품명만 남기기




#판매가격
plus2sample<-NULL
plus2price<-NULL
for(i in 1:84){
  for(i in 1:8){
    n<- i;
    plus2selector<-paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.price > span")
    plus2sample <- remDr$findElement(using='css',plus2selector)
    plus2price<- append(plus2price,plus2sample$getElementText())
  }
}
plus2price%>%
  gsub("원","",.)%>%
  as.data.frame(.)->plus2price

gsplus2product <- cbind(plus2name, plus2manuf, plus2price)
# 시간 판매업소 제조사

write.csv(gsplus2product,"gs2뿔1.csv")




#덤덤
#상품명

url <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigator(url)
more<-remDr$findElement(using='css','#GIFT')
more$getElementTagName()
more$getElementText()
more$clickElement()

plusGiftsample<-NULL
plusGiftname<-NULL
for(i in 1:2){
  for(i in 1:8){
    n<- i;
    plusGiftselector<-paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(7) > ul > li:nth-child(",n,") > div > p.tit")
    plusGiftsample <- remDr$findElement(using='css',plusGiftselector)
    plusGiftname<- append(plusGiftname,plusGiftsample$getElementText())
  }
}

plusGiftname%>%
  str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
  gsub(")","",.)->plusGiftmanuf


#판매가격
plusGiftsample<-NULL
plusGiftprice<-NULL
for(i in 1:2){
  for(i in 1:8){
    n<- i;
    plusGiftselector<-paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(7) > ul > li:nth-child(",n,") > div > p.price > span")
    plusGiftsample <- remDr$findElement(using='css',plusGiftselector)
    plusGiftprice<- append(plusGiftprice,plusGiftsample$getElementText())
  }
}
plusGiftprice%>%
  gsub("원","",.)%>%
  as.data.frame(.)->plusGiftprice

gsplusGiftproduct <- cbind(plusGiftname, plusGiftmanuf, plusGiftprice)
# 시간 판매업소 제조사

write.csv(gsplusGiftproduct,"gs덤.csv")

