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
more<-NULL
csv<-NULL

#listUl > li:nth-child(2) > ul > li //행사형태
#listUl > li:nth-child(2) > div > div > div.name //상품이름
#listUl > li:nth-child(2) > div > div > div.price > span // 가격
#listUl > li:nth-child(2) > div > img // img url

remDr$navigate(url)
for(index in 3:4){
  #더보기 첫번째 누르기
  #listUl > li.btn_more > a
  more<-remDr$findElement(using="css","#listUl > li.btn_more > a")
  more$clickElement()
  Sys.sleep(1)
  #더보기 첫번째꺼 이후 더보기 누르기
  #moreImg > a
  try({repeat{
    more<-remDr$findElement(using="css","#moreImg > a")
    more$clickElement()
    Sys.sleep(1)
  }
  },T)
  #상품 번호 cnt
  cnt<-2
  #각 내용들 추출해서 뽑아주는 반복문
  try({repeat{
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
    
    eventPrice<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") div.price > span"))
    eventPrice<-unlist(eventPrice$getElementText())
    eventName<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") > ul > li"))
    eventName<-unlist(eventName$getElementText())
    if(eventName=="할인")
      eventName<-"SALE"
    
    img<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") div > img"))
    saleImg<-unlist(img$getElementAttribute("src"))
    csv <- data.frame(eventGood = eventGood
                      ,shopName = "세븐일레븐"
                      ,eventPrice = eventPrice
                      ,prodName = prodName
                      ,eventName = eventName
                      ,searchDate = Sys.Date()
                      ,saleImg = saleImg)
    #file 변수 초기화 필수! rbind로 한 행씩 채워넣기
    file<- rbind(file,csv)
    cnt<-cnt+1 
    print(paste0(eventGood," ",prodName))
  }
  },T)
  # 다음페이지로 넘기기
  click <- remDr$findElement(using="css",paste0("#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(",index,") > a"))
  click$clickElement()
  
  Sys.sleep(3)
}
write.csv(file,file="sevenEleven_11.csv")
write.csv(file,file="sevenEleven.csv")





##여기서 부터는 PB 아이템 크롤링 할 것임
pb.file<-NULL
url<-'http://www.7-eleven.co.kr/product/7prodList.asp'
remDr$navigate(url)
  #더보기 첫번째 누르기
  #listUl > li.btn_more > a
  more<-remDr$findElement(using="css","#listUl > li.btn_more > a")
  more$clickElement()
  Sys.sleep(1)
  #더보기 첫번째꺼 이후 더보기 누르기
  #moreImg > a
  try({repeat{
    more<-remDr$findElement(using="css","#moreImg > a")
    more$clickElement()
    Sys.sleep(1)
  }
  },T)
  #상품 번호 cnt
  cnt<-2
  #각 내용들 추출해서 뽑아주는 반복문
  try({repeat{
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
    
    eventPrice<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") div.price > span"))
    eventPrice<-unlist(eventPrice$getElementText())
    eventName<-remDr$findElement(using="css",paste0("#listUl > li:nth-child(",cnt,") > ul > li.ico_tag_04"))
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
    #file 변수 초기화 필수! rbind로 한 행씩 채워넣기
    
    pb.file<- rbind(pb.file,csv)
    cnt<-cnt+1 
    print(paste0(eventGood," ",prodName))
  }
  },T)
  
write.csv(pb.file,file="sevenEleven_PB.csv")




##여기서 부터는 Fresh Food 아이템 크롤링 할 것임
fresh.file<-NULL
url<-'http://www.7-eleven.co.kr/product/bestdosirakList.asp'
remDr$navigate(url)
#더보기 첫번째 누르기
#listUl > li.btn_more > a
more<-remDr$findElement(using="css","#listUl > li.btn_more > a")
more$clickElement()
Sys.sleep(1)
#더보기 첫번째꺼 이후 더보기 누르기
#moreImg > a
try({repeat{
  more<-remDr$findElement(using="css","#moreImg > a")
  more$clickElement()
  Sys.sleep(1)
}
},T)
#상품 번호 cnt
cnt<-2
#각 내용들 추출해서 뽑아주는 반복문
try({repeat{
  names<- remDr$findElement(using="css",paste0("#listDiv > div.dosirak_list.dosirak_list_01.dosirak_list_01_02 > ul > li:nth-child(",cnt,") > div > img"))
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
  
  eventPrice<-remDr$findElement(using="css",paste0("#listDiv > div.dosirak_list.dosirak_list_01.dosirak_list_01_02 > ul > li:nth-child(",cnt,") > div > div > div.price > span"))
  eventPrice<-unlist(eventPrice$getElementText())
  eventName<-remDr$findElement(using="css",paste0("#listDiv > div.dosirak_list.dosirak_list_01.dosirak_list_01_02 > ul > li:nth-child(1) > span"))
  eventName<-unlist(eventName$getElementText())
  img<-remDr$findElement(using="css",paste0("#listDiv > div.dosirak_list.dosirak_list_01.dosirak_list_01_02 > ul > li:nth-child(",cnt,") > div > img"))
  saleImg<-unlist(img$getElementAttribute("src"))
  csv <- data.frame(eventGood = eventGood
                    ,shopName = "세븐일레븐"
                    ,eventPrice = eventPrice
                    ,prodName = prodName
                    ,eventName = eventName
                    ,searchDate = Sys.Date()
                    ,saleImg = saleImg)
  #file 변수 초기화 필수! rbind로 한 행씩 채워넣기
  
  fresh.file<- rbind(fresh.file,csv)
  cnt<-cnt+1 
  print(paste0(eventGood," ",prodName))
}
},T)

write.csv(fresh.file,file="sevenEleven_fresh.csv")

