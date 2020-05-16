library(RSelenium)
library(dplyr)

library(stringr)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'https://www.ministop.co.kr/MiniStopHomePage/page/event/plus1.do'
remDr$navigate(url)

date <- Sys.Date()
totalInform <- NULL
type <- "1+1"
shopName <- "ministop"

index <- 1
repeat{
  
  if(index %% 20 == 0){
    more <- remDr$findElement("css","#section > div.inner.wrap.service1 > div.event_plus_list > div > a.pr_more") # 더보기태그
    more$clickElement()
  }
#  prod <- remDr$findElement("css",paste0("#section > div.inner.wrap.service1 > div.event_plus_list > ul > li:nth-child(",index,") > a > p"))
#  prod <- prod$getElementText()
  img <- remDr$findElement("css",paste0("#section > div.inner.wrap.service1 > div.event_plus_list > ul > li:nth-child(",index,") > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  prod <- img$getElementAttribute("alt")
  prod %>% 
    unlist %>% 
    strsplit(.,"\n") %>% 
    unlist -> prod
  
  if (length(grep("\\)", prod[1])) == 1) {
    prod[1] %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
      prodName <- prodName[2]
    } else if (nchar(prodName[1])<=3){
      prodName[1] <- 'ministop'
      prodName <- prodName[2]
    } else if (length(prodName) == 1 & length(grep("\\(", prodName)) == 1) {
        paste0(prodName[1], ")") -> prodName[1]
        prodName <- prodName[2]
    } else if (length(prodName) >= 3 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
      prodName <- prodName[2]
    } else {
      prodStore <- prodName[1]
      prodName <- prodName[2]
    }
    
    
  }else{
    (prodStore <- 'ministop')
    prodName <- prod[1]
  }
  price <- remDr$findElement("css",paste0('#section > div.inner.wrap.service1 > div.event_plus_list > ul > li:nth-child(',index,') > a > p > strong'))
  price <- unlist(price$getElementText())
  
  inform <- data.frame(searchDate=date,eventGood=prodName,shopName=shopName,eventPrice=price,prodName=prodStore,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
  
  index <- index+1
  Sys.sleep(1)
}

write.csv(totalInform,"ministop.csv")


#PB상품

remDr$open()
url <- 'https://www.ministop.co.kr/MiniStopHomePage/page/guide/list_9.do'
remDr$navigate(url)

date <- Sys.Date()
totalInform <- NULL
type <- "PB"
shopName <- "ministop"
index <- 1
repeat{
  
  if(index %% 9 == 0){
    more <- remDr$findElement("css","#section_tab1 > div > a.pr_more") # 더보기태그
    more$clickElement()
  }
  prod <- remDr$findElement("css",paste0("#section_tab1 > ul > li:nth-child(",index,") > a > p"))
  prod <- prod$getElementText()
  prod %>% 
    unlist %>% 
    strsplit(.,"\n") %>% 
    unlist -> prod
  
  if (length(grep("\\)", prod[1])) == 1) {
    prod[1] %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
    } else if (length(prodName) == 1 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[1], ")") -> prodName[1]
    } else if (length(prodName) >= 3 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
    }
    
    if(prodName[1]=='PB'){
      prodStore <- 'ministop'
    }else{
      (prodStore <- prodName[1])
    }
    
    (prodName <- prodName[2])
    
  } else{
    (prodStore <- 'ministop')
    
  }

  prod[2] %>% 
    gsub("원","",.) -> price

  img <- remDr$findElement("css",paste0("#section_tab1 > ul > li:nth-child(",index,") > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  
  inform <- data.frame(searchDate=date,eventGood=prodName,shopName=shopName,eventPrice=price,prodName=prodStore,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
  
  index <- index+1
  Sys.sleep(1)
}
write.csv(totalInform,"ministop_PB.csv")

#PB상품_FreshFood

remDr$open()
url <- 'https://www.ministop.co.kr/MiniStopHomePage/page/guide/list.do'
remDr$navigate(url)

date <- Sys.Date()
totalInform <- NULL
type <- "Fresh Food"
shopName <- "ministop"
index <- 1
#prod <- c('LL)뉴치킨마요덮밥','3,500원')
repeat{

  if(index %% 9 == 0){
    more <- remDr$findElement("css","#section_tab1 > div > a.pr_more") # 더보기태그
    more$clickElement()
  }
  prod <- remDr$findElement("css",paste0("#section_tab1 > ul > li:nth-child(",index,") > a > p"))
  prod <- prod$getElementText()
  prod %>% 
    unlist %>% 
    strsplit(.,"\n") %>% 
    unlist -> prod
  
  if (length(grep("\\)", prod[1])) == 1) {
    prod[1] %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
      prodName <- prodName[2]
    } else if (nchar(prodName[1])==1){
      prodName[1] <- 'ministop'
      prodName <- prodName[2]
    } else if (length(prodName) == 1 & length(grep("\\(", prodName)) == 1) {
      if (length(grep("한끼",prodName[1]))==1){
        prodName <- paste0(prodName[1],")")
        prodStore <- 'ministop'
      } else {
        paste0(prodName[1], ")") -> prodName[1]
        prodName <- prodName[2]
      }
    } else if (length(prodName) >= 3 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
      prodName <- prodName[2]
    } else {
      prodStore <- prodName[1]
      prodName <- prodName[2]
    }
    
    
  }else{
    (prodStore <- 'ministop')
    prodName <- prod[1]
  }
  
  prod[2] %>% 
    gsub("원","",.) -> price

  img <- remDr$findElement("css",paste0("#section_tab1 > ul > li:nth-child(",index,") > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  
  inform <- data.frame(searchDate=date,eventGood=prodName,shopName=shopName,eventPrice=price,prodName=prodStore,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
  
  index <- index+1
  Sys.sleep(1)
}

write.csv(totalInform,"ministop_PB.csv",TRUE,col.names = FALSE)

#PB상품_FreshFood_도시락 이외// url list_2,3,4,7요청 나머지 코드 같음

remDr$open()
url <- 'https://www.ministop.co.kr/MiniStopHomePage/page/guide/list_7.do'
remDr$navigate(url)

date <- Sys.Date()
totalInform <- NULL
type <- "Fresh Food"
shopName <- "ministop"
index <- 1
#prod <- c('LL)뉴치킨마요덮밥','3,500원')
repeat{
  
  if(index %% 9 == 0){
    more <- remDr$findElement("css","#section_tab1 > div > a.pr_more") # 더보기태그
    more$clickElement()
  }
  prod <- remDr$findElement("css",paste0("#section_tab1 > ul > li:nth-child(",index,") > a > p"))
  prod <- prod$getElementText()
  prod %>% 
    unlist %>% 
    strsplit(.,"\n") %>% 
    unlist -> prod
  
  if (length(grep("\\)", prod[1])) == 1) {
    prod[1] %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
      prodName <- prodName[2]
    } else if (nchar(prodName[1])<=3){
      prodName[1] <- 'ministop'
      prodName <- prodName[2]
    } else if (length(prodName) == 1 & length(grep("\\(", prodName)) == 1) {
      if (length(grep("점보",prodName[1]))==1){
        prodName <- paste0(prodName[1],")")
        prodStore <- 'ministop'
      } else {
        paste0(prodName[1], ")") -> prodName[1]
        prodName <- prodName[2]
      }
    } else if (length(prodName) >= 3 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
      prodName <- prodName[2]
    } else {
      prodStore <- prodName[1]
      prodName <- prodName[2]
    }
    
    
  }else{
    (prodStore <- 'ministop')
    prodName <- prod[1]
  }
  
  prod[2] %>% 
    gsub("원","",.) -> price
  
  img <- remDr$findElement("css",paste0("#section_tab1 > ul > li:nth-child(",index,") > a > img"))
  img_url <- unlist(img$getElementAttribute("src"))
  
  inform <- data.frame(searchDate=date,eventGood=prodName,shopName=shopName,eventPrice=price,prodName=prodStore,eventName=type,saleImg=img_url)
  print(inform)
  totalInform <- rbind(totalInform,inform)
  
  index <- index+1
  Sys.sleep(1)
}

write.csv(totalInform,"ministop_PB.csv",TRUE,col.names = FALSE)
