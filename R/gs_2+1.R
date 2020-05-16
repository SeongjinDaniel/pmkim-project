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
names<- NULL
eventGood<-NULL
event2 <- NULL
img_url<-NULL
k<-1
for(i in 1:84){
  for(n in 1:8){
    #상품명
    plus2sample <- remDr$findElement(using='css',paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.tit"))
    plus2name<- plus2sample$getElementText()
    plus2name<-as.character(plus2name)
    plus2name%>%strsplit(.,")")%>%unlist -> names

    # eventGood
    # 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
    #제조사
    if(length(names)==3) {
      eventGood<-append(eventGood,paste(names[2],names[3],sep=")"))
      plus2manuf <- append(plus2manuf,names[1])
    }
    else if(length(names)==2&length(grep('\\(',names))==0){ 
      eventGood<-append(eventGood,names[2])
      plus2manuf <- append(plus2manuf,names[1])
    }
    else if(length(names)==2&length(grep('\\(',names))==1){
      eventGood<-append(eventGood,paste0(names[2],")"))
      plus2manuf <- append(plus2manuf,names[1])
    }else{
      eventGood<-append(eventGood,paste0(names[1],")"))
      plus2manuf<-append(plus2manuf, "null")
    }
    cat(k)
    k<-k+1
    
    #가격
    plus2sample <- remDr$findElement(using='css', paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.price > span"))
    plus2price<- append(plus2price,plus2sample$getElementText())
  
    #날짜
    plus2date <- append(plus2date, as.Date(Sys.Date()))
    
    #유통업체
    plus2store <- append(plus2store, "gs")
    event2<-append(event2, "2+1")
    
    
    #사진
    try(
      {
        img <- remDr$findElement("css", paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(",n,") > div > p.img > img"))
        img_url <- append(img_url,unlist(img$getElementAttribute("src")))
      }
    )
    
  }
  more<-remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
  Sys.sleep(1)
}

#가격
plus2price%>% gsub("원","",.) ->plus2price



#cbind

gsplus2product <- data.frame(plus2date, eventGood, plus2store, plus2price, plus2manuf, event2, img_url)
View(gsplus2product)
names(gsplus2product)=c("기준날짜","상품명","판매업소","판매가격","제조사", "event","img_url")

write.csv(gsplus2product,paste0(Sys.Date(),"_GS2+1.csv"))



