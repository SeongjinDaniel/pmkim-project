library(RSelenium)
library(dplyr)

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'https://www.ministop.co.kr/MiniStopHomePage/page/store/store.do'
remDr$navigate(url)

si <- remDr$findElement('css','#area1')
si$clickElement()

seoul <- remDr$findElement('css','#area1 > option:nth-child(2)')
seoul$clickElement()

btn <- remDr$findElement('css','#section > div.inner.wrap > div > div.store_content > div.store_txt > div.area > a')
btn$clickElement()

shopTotal <- NULL
shopName <- '미니스톱'
num <- 1
index <- 1
repeat{
  info <- remDr$findElement('css',paste0('#section > div.inner.wrap > div > div.store_content > div.store_txt > div.area > ul > li:nth-child(',index,')'))
  info <- info$getElementText()
  
  info %>% 
    unlist %>% 
    strsplit(.,'\n') %>% 
    unlist -> info
  
  shopNameDetail <- info[1]
  shopAddr <- info[2]
  
  info[3] %>% 
    gsub('[^0-9]','',.) -> shopTel
  
  #shopId 생성
  if(nchar(num)==1){
    enum <- paste0('0000',num)
  }else if(nchar(num)==2){
    enum <- paste0('000',num)
  }else if(nchar(num)==3){
    enum <- paste0('00',num)
  }else if(nchar(num)==4){
    enum <- paste0('0',num)
  }
  shopId <- paste0('ms',enum)
  
  shopInfo <- data.frame(shop_id=shopId, shop_name=shopName, shop_name_detail=shopNameDetail, tel_num=shopTel, shop_addr=shopAddr)
  shopTotal <- rbind(shopTotal,shopInfo)
  
  print(shopInfo)
  
  num <- num+1
  index <- index+1
}

write.csv(shopTotal,"ministop_locInfo.csv")


ggplot(food,aes(x=food[[1]],y=food[[2]]))