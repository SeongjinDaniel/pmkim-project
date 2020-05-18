library(RSelenium)
library(dplyr)
library(tibble)
library(stringr)
install.packages("stringR")
install.packages("tibble")
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url<-'http://cu.bgfretail.com/index.do'
remDr$navigate(url)
##팝업창 끄기
closing<-remDr$findElement(using="css","#close_popup14 > img")
closing$clickElement()
##후버기능
hover<-remDr$findElement(using="css","#gnb > div.gnbWrap.gnbWrapIndex > div.gnbBox > ul > li:nth-child(2) > a > img")
remDr$mouseMoveToLocation(webElement = hover)
##클릭해서 전쳏상품 들어가기
click<-remDr$findElement(using="css","#gnb > div.gnbWrap.gnbWrapIndex > div.gnbBox > ul > li:nth-child(2) > ul > li:nth-child(3) > a")
click$clickElement()


eventGood<- NULL
names<-NULL
eventPrice<-NULL
prodName<-NULL
eventName<-NULL
saleImg<-NULL
more<-NULL
csv<-NULL
pb.list<-c("도","샌","햄","주","면","김","샐","편스","즉석빵","튀김","델","도너츠","고","고구마","즉석","그릴","푸")
cu.file<-NULL


for(index in 2:7){
  cnt<-1
  n<-1
  ##더보기
  #dataTable > div.prodListBtn > div.prodListBtn-w > a
  try(repeat{
  more<-remDr$findElement(using="css","#dataTable > div.prodListBtn > div.prodListBtn-w > a")
  more$clickElement()
  Sys.sleep(5)
  },silent=T)

  try(repeat{
  p.list<-17*n
  ##총 이름
  names<- remDr$findElement(using="css",paste0("#dataTable > div:nth-child(",p.list,") > ul > li:nth-child(",cnt,") > p.prodName > span"))
  #names<- remDr$findElement(using="css",paste0("#dataTable > div:nth-child(85) > ul > li:nth-child(29) > p.prodName > span"))
  names<- unlist(names$getElementText())


  if(length(grep('\\)',names))==1){
    names%>%
      strsplit(.,")")%>%
      unlist->names
    ##제조사, 제품명 구분
    if(length(names)==3) {
      eventGood<-paste(names[2],names[3],sep=")")
    }else if(length(names)==2&length(grep('\\(',names))==0){ 
      eventGood<-names[2]
    }else if(length(names)==2&length(grep('\\(',names))==1){
      eventGood<-paste0(names[2],")")
    }

    ##제조사 한글자인 경우 PB 상품 처리
    ##비비고 잡아주는 기능 및 샐,도,햄,,,등등 찾아주는 기능
    ## %in% 으로 잡아주는 구문 잘 외울것
    if(names[1] %in% pb.list|nchar(names[1])>=5){
      if(length(grep('\\비비고',names))==1){
        prodName<-"비비고"
      }else{
        prodName<-"CU"
      }
    }
    else{prodName<-names[1]}
  }else{
    eventGood<-names
    prodName<-"CU"
  }

  ##제조사 CU인 경우 PB event 처리
  if(prodName=="CU"){
    eventName<-"PB"
  }else{
    eventName<-"없음"
  }
  ##가격
  eventPrice<-remDr$findElement(using="css",paste0("#dataTable > div:nth-child(",p.list,") > ul > li:nth-child(",cnt,") > p.prodPrice > span"))
  eventPrice<-unlist(eventPrice$getElementText())
  ##이미지 url
  img<-remDr$findElement(using="css",paste0("  #dataTable > div:nth-child(",p.list,") > ul > li:nth-child(",cnt,") > div > a > img"))
  saleImg<-unlist(img$getElementAttribute("src"))
  csv <- data.frame(eventGood = eventGood
                    ,shopName = "CU"
                    ,eventPrice = eventPrice
                    ,prodName = prodName
                    ,eventName = eventName
                    ,searchDate = Sys.Date()
                    ,saleImg = saleImg)
  #file 변수 초기화 필수! rbind로 한 행씩 채워넣기
  cu.file<- rbind(cu.file,csv)
  if(cnt==40){
    n<-n+1
    cnt<-1
  }else{
    cnt<-cnt+1  
  }
  print(paste0(eventGood," ",prodName," cnt=",cnt, " ",p.list))
  Sys.sleep(1)

  },T)
  ##category click
  category<-remDr$findElement(using="css",paste0("#lnb > div > div.depth3.depth3Lnb > ul > li.prodInfo_0",index," > a"))
  category$clickElement()
  Sys.sleep(10)
}
write.csv(cu.file,file="cu_all.csv")

###수정수정수정 여기서 파일 저장해줘야합니다 
##원하는 행 지우는 부분
#cu.file<-cu.file[-c(3339:3342),]
cu.file.2<-NULL


