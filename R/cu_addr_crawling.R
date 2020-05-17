library(RSelenium)
library(dplyr)
library(tibble)
library(stringr)
install.packages("stringR")
install.packages("tibble")
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url<-'http://cu.bgfretail.com/store/list.do?category=store'
remDr$navigate(url)

##서울 골라서 검색
pick<-remDr$findElement(using="css","#sido > option:nth-child(3)")
pick$clickElement()
click<-remDr$findElement(using="css","#contents > div.relCon > div > div.search_store > div.search_wrap > table > tbody > tr:nth-child(1) > td:nth-child(3) > div > input[type=image]:nth-child(1)")
click$clickElement()
#sido > option:nth-child(3) // 서울 특별시
#contents > div.relCon > div > div.search_store > div.search_wrap > table > tbody > tr:nth-child(1) > td:nth-child(3) > div > input[type=image]:nth-child(1)

shop_name<- NULL;shop_addr<-NULL;csv<-NULL;cu.addr.file<-NULL
##인덱스 클릭
repeat(
for(paging in 4:8){
  #매장명, 주소
  for(index in 1:5){
    shop_name<-remDr$findElement(using="css",paste0("#result_search > div.result_store > div.detail_store > table > tbody > tr:nth-child(",index,") > td:nth-child(1) > span.name"))
    shop_name<-unlist(shop_name$getElementText())  
    shop_addr<-remDr$findElement(using="css",paste0("#result_search > div.result_store > div.detail_store > table > tbody > tr:nth-child(",index,") > td:nth-child(2) > div > address > a"))
    shop_addr<-unlist(shop_addr$getElementText())  
    csv <- data.frame(shop_name = shop_name
                      ,shop_addr = shop_addr
    )
    cu.addr.file<- rbind(cu.addr.file,csv)
    print(paste0(shop_name, "   ",shop_addr))
  }
  ##인덱스 클릭
  next.page<-remDr$findElement(using="css",paste0("#paging > ul > a:nth-child(",paging,")"))
  next.page$clickElement()
  Sys.sleep(1)
})
write.csv(cu.file,file="cu_addr.csv")




