library(RSelenium)
library(dplyr)
library(tibble)
library(stringr)
install.packages("stringR")
install.packages("tibble")
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url<-'http://www.7-eleven.co.kr/product/presentList.asp'
remDr$navigate(url)

##행사 형태 클릭하기
#선택됐을 떄 : actFrm > div.cont_body > div.wrap_tab > ul > li.on > a
#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(1) > a

##이미지 url
#www.7-eleven.co.kr/upload/product/8801104/220200.1.jpg

file<-NULL
eventGood<- NULL
names<-NULL
eventPrice<-NULL
prodName<-NULL
eventName<-NULL
saleImg<-NULL
csv<-NULL
more<-NULL


#listUl > li:nth-child(2) > ul > li //행사형태
#listUl > li:nth-child(2) > div > div > div.name //상품이름
#listUl > li:nth-child(2) > div > div > div.price > span // 가격
#listUl > li:nth-child(2) > div > img // img url


#moreImg > a
webElem <- remDr$findElement("css", "body")
#스크롤 바 내려주는 효과
remDr$navigate(url)
for(index in 1:4){
  #더보기 누르기
  more<-remDr$findElement(using="css","#listUl > li.btn_more > a")
  more$clickElement()
  Sys.sleep(1)
  repeat{
    more<-remDr$findElement(using="css","#moreImg > a")
    more$clickElement()
    Sys.sleep(1)
  }
  cnt<-2
  cnt<-225
  repeat{
    names<- remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") div > img"))
    names<- unlist(names$getElementAttribute("alt"))
    names%>%
      strsplit(.,")")%>%
      unlist->names
    if(length(names)==3) {
      eventGood<-paste(names[2],names[3],sep=")")
    }else if(length(names)==2&length(grep('\\(',names))==0){ 
      eventGood<-names[2]
    }else if(length(names)==2&length(grep('\\(',names))==1){
      eventGood<-paste0(names[2],")")
    }
    prodName<-names[1]
#    names%>%
#      str_extract(., "[[가-힣]\\w\\W]{1,}[)]" )%>%
#      gsub(")","",.)->prodName
#    names%>%
#      str_extract(.,"[)]{1}[[가-힣]\\w\\W]{1,}")%>%
#      gsub(")","",.)->eventGood
    eventPrice<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") div.price > span"))
    eventPrice<-unlist(eventPrice$getElementText())
    eventName<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") >ul > li "))
    eventName<-unlist(eventName$getElementText())
    img<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") div > img"))
    saleImg<-unlist(img$getElementAttribute("src"))
    csv <- data.frame(eventGood = eventGood
                      ,shopName = "세븐일레븐"
                      ,eventPrice = eventPrice
                      ,prodName = prodName
                      ,eventName = eventName
                      ,searchDate = Sys.Date()
                      ,saleImg = saleImg)
    file<- rbind(file,csv)
    cnt<-cnt+1 
    print(paste0(eventGood," ",prodName))
  }

  click <- remDr$findElement(using="css",paste0("#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(",index,") > a"))
  click$clickElement()

  Sys.sleep(3)
}
write.csv(file,file="sevenEleven.csv")
#그 옆 상품 : #listUl > li:nth-child(54) > a
#더보기 가려진 상품 : #listUl > li:nth-child(55) > a
##listUl > li:nth-child(64) > a // #listUl > li:nth-child(65) > a

