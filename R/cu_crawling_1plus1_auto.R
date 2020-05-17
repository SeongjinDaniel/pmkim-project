#install.packages("dplyr")
library(RSelenium)
library(dplyr)
#install.packages("stringr")
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
# 더보기태그
more <- remDr$findElement("css","#contents > div.relCon > div.prodListWrap > div > div.prodListBtn-w > a")

# write oliver.yoo
indexPart <- 30 # 30부터 check!! 이숫자의 의미는 따로 없음
flag <- FALSE
repeat{
  # 40개의 상품씩 크롤링 후 더이상 상품이 없으면 종료하는 반복문
  # index* 1부터 start - (repeat - indexPart) - (for1~40 index1to40)
  indexPart <- indexPart + 1
  for(index1to40 in 1:40){
    if(index1to40 == 1) {
      # Test code
      print("####################################################################################")
      cat(indexPart,index1to40,"\n")
    }
    # 한번더 반복되기 때문에 break;
    if(indexPart == 33) break;
    if(indexPart == 31){
      Sys.sleep(1)
      selProd <- paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index1to40,") > p.prodName > a")
      selPrice <- paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index1to40,") > p.prodPrice > span")
      selImg <- paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index1to40,") > div > a > img")
    }else{
      selProd <- paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(",indexPart,") > li:nth-child(",index1to40,") > p.prodName > a")
      selPrice <- paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(",indexPart,") > li:nth-child(",index1to40,") > p.prodPrice > span")
      selImg <- paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(",indexPart,") > li:nth-child(",index1to40,") > div > a > img")
    }
    
    # names
    names <- NULL
    try({
      names <- remDr$findElement("css",selProd)
    }, silent = TRUE)
    # print(names)
    # names가 NULL이면 error니까 해당 index가 없다는 뜻
    if(is.null(names)){
      if(index1to40 == 1) break
      else{
        #if(index1to40 != 40){
          #str(index1to40)
        print("null in")
        flag <- TRUE
        #}
        break
      }
    }
    
    print("names")
    names <- unlist(names$getElementText())
    names%>%
      strsplit(.,")")%>%
      unlist->names
    
    # eventGood
    # 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
    if(length(names)==3) {
      eventGood<-paste(names[2],names[3],sep=")")
    }else if(length(names)==2&length(grep('\\(',names))==0){ 
      eventGood<-names[2]
    }else if(length(names)==2&length(grep('\\(',names))==1){
      eventGood<-paste0(names[2],")")
    }
    
    # prodName
    prodName<-names[1]
    
    # price
    price <- remDr$findElement("css",selPrice)
    price <- unlist(price$getElementText())
    # Sys.sleep(1)
    
    # Image address source
    img <- remDr$findElement("css",selImg)
    img_url <- unlist(img$getElementAttribute("src"))
    Sys.sleep(1)
    
    inform <- data.frame(searchDate=date,eventGood,shopName,eventPrice=price,prodName,eventName=type,saleImg=img_url)
    print(inform)
    totalInform <- rbind(totalInform,inform)
  }
  if(flag == TRUE){
    print("Finish")
    getwd()
    write.csv(totalInform,"cu1+1.csv")
    break;
  }
  # more 변수를 위에서 사용하면 error 나서 여기서 사용함
  if(!is.null(names)){
    try({
      more <- remDr$findElement("css","#contents > div.relCon > div.prodListWrap > div > div.prodListBtn-w > a")
      more$clickElement()
    }, silent = T)
    
  }
}
<<<<<<< HEAD:R/cu_crawling_1plus1_auto.R
####1+1여기까지####

####2+1시작####
#install.packages("dplyr")
library(RSelenium)
library(dplyr)
#install.packages("stringr")
library(stringr)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'http://cu.bgfretail.com/event/plus.do?category=event&depth2=1&sf=N'
remDr$navigate(url)

plusone <- remDr$findElement("css","#contents > div.relCon > div.depth3.mb40 > ul > li.eventInfo_03 > a")
plusone$clickElement()

date <- Sys.Date()
totalInform <- NULL
type <- "2+1"
shopName <- "GS"
# 더보기태그
more <- remDr$findElement("css","#contents > div.relCon > div.prodListWrap > div > div.prodListBtn-w > a")

# write oliver.yoo
indexPart <- 30 # 30부터 check!! 이숫자의 의미는 따로 없음
flag <- FALSE
repeat{
  # 40개의 상품씩 크롤링 후 더이상 상품이 없으면 종료하는 반복문
  # index* 1부터 start - (repeat - indexPart) - (for1~40 index1to40)
  indexPart <- indexPart + 1
  for(index1to40 in 1:40){
    if(index1to40 == 1) {
      # Test code
      print("####################################################################################")
      cat(indexPart,index1to40,"\n")
    }
    if(indexPart == 31){
      Sys.sleep(1)
      selProd <- paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index1to40,") > p.prodName > a")
      selPrice <- paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index1to40,") > p.prodPrice > span")
      selImg <- paste0("#contents > div.relCon > div.prodListWrap > ul > li:nth-child(",index1to40,") > div > a > img")
    }else{
      selProd <- paste0("#contents > div.relCon > div.prodListWrap > ul:nth-                                                                                                                                                                                                                               child(",indexPart,") > li:nth-child(",index1to40,") > p.prodName > a")
      selPrice <- paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(",indexPart,") > li:nth-child(",index1to40,") > p.prodPrice > span")
      selImg <- paste0("#contents > div.relCon > div.prodListWrap > ul:nth-child(",indexPart,") > li:nth-child(",index1to40,") > div > a > img")
    }
    
    # names
    names <- NULL
    try({
      names <- remDr$findElement("css",selProd)
    }, silent = TRUE)
    # names가 NULL이면 error니까 해당 index가 없다는 뜻
    if(is.null(names)){
      if(index1to40 == 1) break
      else{
        #if(index1to40 != 40){
          #str(index1to40)
          print("null in")
          flag <- TRUE
        #}
        break
      }
    }
    
    names <- unlist(names$getElementText())
    names%>%
      strsplit(.,")")%>%
      unlist->names
    
    # eventGood
    # 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
    if(length(names)==3) {
      eventGood<-paste(names[2],names[3],sep=")")
    }else if(length(names)==2&length(grep('\\(',names))==0){ 
      eventGood<-names[2]
    }else if(length(names)==2&length(grep('\\(',names))==1){
      eventGood<-paste0(names[2],")")
    }
    
    # prodName
    prodName<-names[1]
    
    # price
    price <- remDr$findElement("css",selPrice)
    price <- unlist(price$getElementText())
    # Sys.sleep(1)
    
    # Image address source
    img <- remDr$findElement("css",selImg)
    img_url <- unlist(img$getElementAttribute("src"))
    Sys.sleep(1)
    
    inform <- data.frame(searchDate=date,eventGood,shopName,eventPrice=price,prodName,eventName=type,saleImg=img_url)
    print(inform)
    totalInform <- rbind(totalInform,inform)
  }
  if(flag == TRUE){
    print("Finish")
    getwd()
    write.csv(totalInform,"cu2+1.csv")
    break;
  }
  # more 변수를 위에서 사용하면 error 나서 여기서 사용함
  if(!is.null(names)){
    # more <- NULL
    try({
      more <- remDr$findElement("css","#contents > div.relCon > div.prodListWrap > div > div.prodListBtn-w > a")
      more$clickElement()
    }, silent = T)
    # if(is.null(more)) break;
     
  }
}
=======
>>>>>>> faecbea8c99f5d35418ca5407e8f9bd00157c34b:R/cu_crawling_1plus1_byOliver.R
