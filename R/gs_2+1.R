as.Date(Sys.Date()) #년, 월, 일

library(stringr)
library(RSelenium)
library(dplyr)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url)

#2+1

more<-remDr$findElement(using='css','#TWO_TO_ONE')
more$getElementTagName()
more$getElementText()
more$clickElement()

plus2sample<-NULL
plus2name<-NULL
plus2manuf<-NULL
plus2price <- NULL
plus2date <- NULL
plus2store <- NULL
plus2photo <- NULL
for(i in 1:83){
  for(n in 1:8){
    
    #상품명
    plus2sample <- remDr$findElement(using='css',paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.tit"))
    plus2name<- append(plus2name,plus2sample$getElementText())
    
    #가격
    plus2sample <- remDr$findElement(using='css', paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.price > span"))
    plus2price<- append(plus2price,plus2sample$getElementText())
    
  
    #날짜
    plus2date <- append(plus2date, as.Date(Sys.Date()))
    
    #유통업체
    plus2store <- append(plus2store, "GS리테일")
  }
  more<-remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
  Sys.sleep(1)
}

#제조사) 가져오기
plus2name%>% str_extract(., "[[가-힣]\\w]{1,}[)]" )%>% gsub(")","",.)->plus2manuf


#상품명만 남기기
plus2name%>% str_extract(.,"[)]{1}[[가-힣]\\w]{1,}")%>% gsub(")","",.)->plus2name

#가격
plus2price%>% gsub("원","",.) ->plus2price

#cbind

gsplus2product <- data.frame(plus2date, plus2name, plus2store, plus2price, plus2manuf)
View(gsplus2product)
names(gsplus2product)=c("기준날짜","상품명","판매업소","판매가격","제조사")

write.csv(gsplus2product,paste0(Sys.Date(),"_GS2+1.csv"))



