#plus11<- sapply(plus11sample, function(x){x$getElementText()})
#plus11<- c(plus11, unlist(repl))
#more$clickElement()
#plus11sample$clickElement()

as.Date(Sys.Date()) #년, 월, 일

library(stringr)
library(RSelenium)
library(dplyr)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url)


#1+1

more<-remDr$findElement(using='css','#ONE_TO_ONE ')
more$getElementTagName()
more$getElementText()
more$clickElement()

plus1selector <- NULL
plus1sample<-NULL
plus1name<-NULL
plus1manuf<-NULL
plus1price <- NULL
plus1date <- NULL
plus1store <- NULL
plus1photo <- NULL
names<-NULL
eventGood1<-NULL
event1<-NULL
img_url<-NULL
k<-1

  for(i in 1:22){
    for(n in 1:8){
      
      #상품명
      plus1sample <- remDr$findElement(using='css',paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li:nth-child(",n,") > div > p.tit"))
      plus1name<- plus1sample$getElementText()
      plus1name<-as.character(plus1name)
      plus1name%>%strsplit(.,")")%>%unlist -> names
      
      # eventGood
      # 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
      #제조사
      if(length(names)==3) {
        eventGood1<-append(eventGood1,paste(names[2],names[3],sep=")"))
        plus1manuf <- append(plus1manuf,names[1])
      }
      else if(length(names)==2&length(grep('\\(',names))==0){ 
        eventGood1<-append(eventGood1,names[2])
        plus1manuf <- append(plus1manuf,names[1])
      }
      else if(length(names)==2&length(grep('\\(',names))==1){
        eventGood1<-append(eventGood1,paste0(names[2],")"))
        plus1manuf <- append(plus1manuf,names[1])
      }else{
        eventGood1<-append(eventGood1,paste0(names[1],")"))
        plus1manuf<-append(plus1manuf, "null")
      }
      cat(k)
      k<-k+1
      
      
      #가격
      plus1sample <- remDr$findElement(using='css', paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li:nth-child(",n,") > div > p.price > span"))
      plus1price<- append(plus1price,plus1sample$getElementText())
      
      #날짜
      plus1date <- append(plus1date, Sys.Date())
      
      #유통업체
      plus1store <- append(plus1store, "gs")
      event1<-append(event1, "1+1")
      
      
      
      #사진
      try(
        {img <- remDr$findElement("css", paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > ul > li:nth-child(",n,") > div > p.img > img"))
        img_url <- append(img_url,unlist(img$getElementAttribute("src")))}
      )
  }

    more<-remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(3) > div > a.next')
    more$getElementTagName()
    more$getElementText()
    more$clickElement()
    Sys.sleep(1)
  }
#please work work work work


#가격
plus1price%>% gsub("원","",.) ->plus1price

#cbind

gsplus1product <- data.frame(plus1date, eventGood1, plus1store, plus1price, plus1manuf, event1, img_url)
View(gsplus1product)
names(gsplus1product)=c("기준날짜","상품명","판매업소","판매가격","제조사","event", "img_url")


write.csv(gsplus1product,paste0(Sys.Date(),"_GS1+1.csv"))
