library(RSelenium)
library(dplyr)
library(tibble)
install.packages("tibble")
install.packages("RSelenium")
install.packages("dplyr")
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

shop_name<- NULL;shop_addr<-NULL;csv<-NULL;tel_num<-NULL;cu.addr.file<-NULL

##인덱스 클릭
repeat(
  for(paging in 4:8){
    #매장명, 주소
    for(index in 1:5){
      shop_name_detail<-remDr$findElement(using="css",paste0("#result_search > div.result_store > div.detail_store > table > tbody > tr:nth-child(",index,") > td:nth-child(1) > span.name"))
      shop_name_detail<-unlist(shop_name_detail$getElementText())  
      shop_addr<-remDr$findElement(using="css",paste0("#result_search > div.result_store > div.detail_store > table > tbody > tr:nth-child(",index,") > td:nth-child(2) > div > address > a"))
      shop_addr<-unlist(shop_addr$getElementText())  
      if(is.null(shop_addr)){
        shop_addr<-"서울시 강남구 테헤란로 405(삼성동)"
      }
      tel_num<-remDr$findElement(using="css",paste0("#result_search > div.result_store > div.detail_store > table > tbody > tr:nth-child(",index,") > td:nth-child(1) > span.tel"))
      tel_num<-unlist(tel_num$getElementText())
      if(is.null(tel_num)){
        tel_num<-"15778007"
      }else{
        tel_num %>% 
          gsub("[[:punct:]]","",.)->tel_num
      }
      
      csv <- data.frame(shop_name = "CU"
                        ,shop_name_detail = shop_name_detail
                        ,tel_num = tel_num
                        ,shop_addr = shop_addr
      )
      cu.addr.file<- rbind(cu.addr.file,csv)
      print(paste0(shop_name, "   ",shop_addr," ", tel_num," ",shop_name_detail))
    }
    ##인덱스 클릭
    next.page<-remDr$findElement(using="css",paste0("#paging > ul > a:nth-child(",paging,")"))
    next.page$clickElement()
    Sys.sleep(1)
  })

write.csv(cu.addr.file,file="cu_addr.csv")

#행지우기
cu.addr.file<-cu.addr.file[-c(2575:3120),]


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



