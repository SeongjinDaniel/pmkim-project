#plus11<- sapply(plus11sample, function(x){x$getElementText()})
#plus11<- c(plus11, unlist(repl))
#more$clickElement()
#plus11sample$clickElement()
#please work work work work

library(stringr)
library(RSelenium)
library(dplyr)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
#매장찾기
url <- 'http://gs25.gsretail.com/gscvs/ko/store-services/locations#;'
remDr$navigate(url)
Sys.sleep(1)

#도 선택하기
more<-remDr$findElement(using='css','#stb1')
more$getElementTagName()
more$getElementText()
more$clickElement()
Sys.sleep(1)

#서울시 선택하기
more<-remDr$findElement(using='css','#stb1 > option:nth-child(2)')
more$getElementTagName()
more$getElementText()
more$clickElement()
Sys.sleep(1)

#검색하기
more<-remDr$findElement(using='css','#searchButton')
more$getElementTagName()
more$getElementText()
more$clickElement()
Sys.sleep(1)

gsStorestore <- NULL # 브랜드명

gsStorename <-NULL # 매장
gsStoresample<-NULL # 매장명 샘플
gsStorenames<-NULL

gsStoreTel <- NULL

gsStoreAddrSample<-NULL #주소 샘플
gsStoreAddr <- NULL # 주소

k<-1
finished <- FALSE

Sys.sleep(1)
for(i in 1:598){
  for(n in 1:5){
    
    #브랜드명
    gsStorestore <- append(gsStorestore, "gs")
    
    #매장명
    gsStoresample <- NULL
    gsStoresample <- remDr$findElement(using='css',paste0("#storeInfoList > tr:nth-child(",n,") > td:nth-child(1) > a"))
    gsStorename<- gsStoresample$getElementText()
    gsStorename<-as.character(gsStorename)
    gsStorename%>%gsub("GS25","",.)%>%append(gsStorenames, .)
    
    
    gsStoreTel <- append(gsStoreTel,"1644-5425")
    
    
    #매장주소
    gsStoreAddrSample <- remDr$findElement(using='css', paste0("#storeInfoList > tr:nth-child(",n,") > td:nth-child(2) > a"))
    gsStoreAddr<- append(gsStoreAddr,gsStoreAddrSample$getElementText())
    
    cat(k, "-", gsStorename, ",  ")
    k<-k+1
    
  }
  Sys.sleep(1)
  more<-remDr$findElement(using='css','#pagingTagBox > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
}


#cbind
gsgsStoreproduct <- data.frame(gsStorestore, gsStorenames, gsStoreTel, gsStoreAddr) 
names(gsgsStoreproduct)=c("브랜드","상세명","전화번호","주소")

write.csv(gsgsStoreproduct,paste0(Sys.Date(),"_GSPB_SeoulAddr.csv"))
