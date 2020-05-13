library(RSelenium)
library(dplyr)
library(stringr)

#edit test
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'https://www.emart24.co.kr/product/eventProduct.asp'
remDr$navigate(url)

plusone <- remDr$findElement("css","#tabNew > ul > li:nth-child(2) > h4 > a")
plusone$clickElement()


#1+1 크롤링
date <- Sys.Date()
totalInform <- NULL
type <- "1+1"
shopName <- "emart24"
num <- 4
repeat{
  for(index in 1:15){
    #한페이지에 15개씩 있고, 다음페이지로 넘겨서 또 가져오기
    prodName <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.productDiv"))
    prodName <- unlist(prodName$getElementText())
    #prodName 받아서 )앞은 제조사 , 뒤는 상품명으로 나누기
    prodName%>%
      str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
      gsub(")","",.)->prodStore
    prodName%>%
      str_extract(.,"[)]{1}[[가-힣]\\w\\W]{1,}")%>%       
      gsub(")","",.)->prodName

    price <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.price"))
    price <- unlist(price$getElementText())
    price <- gsub(" 원","",price)
    img <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.productImg > img"))
    img_url <- unlist(img$getElementAttribute("src"))
    inform <- data.frame(searchDate=date,eventGood=prodName,shopName=shopName,eventPrice=price,prodName=prodStore,eventName=type,saleImg=img_url)
    print(inform)
    totalInform <- rbind(totalInform,inform)
  }
  if(num == 13){
    #10페이지에서 다음 페이지로 넘어가는 >표시 누르는 코드
    page <- remDr$findElement("css","#regForm > div.section > div.eventProduct > div.paging > a.next.bgNone")
    page$clickElement()
    num <- 4
  }else{
    #다음페이지 이동
    page <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.paging > a:nth-child(",num,")"))
    page$clickElement()
    num <- num +1
  }
}

write.csv(totalInform,"emart24_1+1.csv")

#2+1 크롤링
plustwo <- remDr$findElement("css","#tabNew > ul > li:nth-child(3) > h4 > a")
plustwo$clickElement()

date <- Sys.Date()
totalInform <- NULL
type <- "2+1"
shopName <- "emart24"
num <- 4

repeat{
  for(index in 1:15){
    #한페이지에 15개씩 있고, 다음페이지로 넘겨서 또 가져오기
    prodName <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.productDiv"))
    prodName <- unlist(prodName$getElementText())
    prodName%>%
      str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
      gsub(")","",.)->prodStore
    prodName%>%
      str_extract(.,"[)]{1}[[가-힣]\\w\\W]{1,}")%>%
      gsub(")","",.)->prodName

    price <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.price"))
    price <- unlist(price$getElementText())
    img <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.productImg > img"))
    img_url <- unlist(img$getElementAttribute("src"))   #이미지 url img태그 속성값으로 뽑아오기기
    inform <- data.frame(searchDate=date,eventGood=prodName,shopName=shopName,eventPrice=price,prodName=prodStore,eventName=type,saleImg=img_url)
    print(inform)
    totalInform <- rbind(totalInform,inform)
  }
  if(num == 13){
    #10페이지에서 다음 페이지로 넘어가는 >표시 누르는 코드
    page <- remDr$findElement("css","#regForm > div.section > div.eventProduct > div.paging > a.next.bgNone")
    page$clickElement()
    num <- 4
  }else{
    #다음페이지 이동
    page <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.paging > a:nth-child(",num,")"))
    page$clickElement()
    num <- num +1
  }
}

write.csv(totalInform,"emart24_2+1.csv")
