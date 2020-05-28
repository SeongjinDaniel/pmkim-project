library(RSelenium)
library(dplyr)
install.packages("stringr")
library(stringr)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'http://cu.bgfretail.com/event/plus.do?category=event&depth2=1&sf=N'
remDr$navigate(url)

plusone <- remDr$findElement("css","#contents > div.relCon > div.depth3.mb40 > ul > li.eventInfo_02 > a")
plusone$clickElement()

date <- Sys.Date()
totalInform <- NULL
type <- "1+1"
shopName <- "GS"
more <- reDr$findElement("css","#contents > div.relCon > div.prodListWrap > div > div.prodListBtn-w > a") # 더보기태그

for(index in 1:40){
  
  prodName <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index,") > p.prodName > a"))
  prodName <- unlist(prodName$getElementText())
  prodName%>%
    str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
    gsub(")","",.)->prodStore
  Sys.sleep(1)
  prodName%>%
    str_extract(.,"[)]{1}[[가-힣]\\w]{1,}")%>%
    gsub(")","",.)->prodName
  Sys.sleep(1)
  price <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index,") > p.prodPrice > span"))
  price <- unlist(price$getElementText())
  Sys.sleep(1)
  img <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index,") > div > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  #download.file(img_url,destfile = paste0(prodName,".jpg"))
  Sys.sleep(1)
  inform <- data.frame(searchDate=date,eventGood=prodName,eventPrice=price,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
}

more$clickElement()

for(index in 1:40){
  prodName <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(50) > li:nth-child(",index,") > p.prodName > a"))
  prodName <- unlist(prodName$getElementText())
  prodName%>%
    str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
    gsub(")","",.)->prodStore
  Sys.sleep(1)
  prodName%>%
    str_extract(.,"[)]{1}[[가-힣]\\w]{1,}")%>%
    gsub(")","",.)->prodName
  Sys.sleep(1)
  price <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(50) > li:nth-child(",index,") > p.prodPrice > span"))
  price <- unlist(price$getElementText())
  Sys.sleep(1)
  img <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(50) > li:nth-child(",index,") > div > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  Sys.sleep(1)
  inform <- data.frame(searchDate=date,eventGood=prodName,eventPrice=price,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
}

more$clickElement()
Sys.sleep(2)

for(index in 1:40){
  prodName <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(67) > li:nth-child(",index,") > p.prodName > a"))
  prodName <- unlist(prodName$getElementText())
  prodName%>%
    str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
    gsub(")","",.)->prodStore
  Sys.sleep(1)
  prodName%>%
    str_extract(.,"[)]{1}[[가-힣]\\w]{1,}")%>%
    gsub(")","",.)->prodName
  Sys.sleep(1)
  price <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(67) > li:nth-child(",index,") > p.prodPrice > span"))
  price <- unlist(price$getElementText())
  Sys.sleep(1)
  img <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(67) > li:nth-child(",index,") > div > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  Sys.sleep(1)
  inform <- data.frame(searchDate=date,eventGood=prodName,eventPrice=price,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
}

more$clickElement()
Sys.sleep(2)

for(index in 1:7){
  prodName <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(84) > li:nth-child(",index,") > p.prodName > a"))
  prodName <- unlist(prodName$getElementText())
  prodName%>%
    str_extract(., "[[가-힣]\\w]{1,}[)]" )%>%
    gsub(")","",.)->prodStore
  Sys.sleep(1)
  prodName%>%
    str_extract(.,"[)]{1}[[가-힣]\\w]{1,}")%>%
    gsub(")","",.)->prodName
  Sys.sleep(1)
  price <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(84) > li:nth-child(",index,") > p.prodPrice > span"))
  price <- unlist(price$getElementText())
  Sys.sleep(1)
  img <- remDr$findElement("css",paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(84) > li:nth-child(",index,") > div > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  Sys.sleep(1)
  inform <- data.frame(searchDate=date,eventGood=prodName,eventPrice=price,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
}

write.csv(totalInform,"cu.csv")

#1+1까지 했음