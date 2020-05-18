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


#gsStorestore <- NULL # 브랜드명

gsStorename <-NULL # 매장
gsStoresample<-NULL # 매장명 샘플
gsStorenames<-NULL

#gsStoreTel <- NULL

#gsStoreAddrSample<-NULL #주소 샘플
#gsStoreAddr <- NULL # 주소


#finished <- FALSE
num<-0
Sys.sleep(1)

for(i in 1:598){
  
  for(n in 1:5){
    
    #브랜드명
    #gsStorestore <- append(gsStorestore, "gs")
    
    #매장명
    gsStoresample <- NULL
    gsStoresample <- remDr$findElement(using='css',paste0("#storeInfoList > tr:nth-child(",n,") > td:nth-child(1) > a"))
    
    gsStorename<- gsStoresample$getElementText()
    gsStorenames<- append(gsStorenames, as.character(gsStorename))
    
    
    #gsStoreTel <- append(gsStoreTel,"1644-5425")
    
    
    #매장주소
    #gsStoreAddrSample <- remDr$findElement(using='css', paste0("#storeInfoList > tr:nth-child(",n,") > td:nth-child(2) > a"))
    #getstoreAddrSample2<- gsStoreAddrSample$getElementText()
    #gsStoreAddr<- append(gsStoreAddr,getstoreAddrSample2)
    
    
    #num<-num+1
    #if(nchar(num)==1){
    #  enum <- paste0('0000',num)
    #}else if(nchar(num)==2){
    #  enum <- paste0('000',num)
    #}else if(nchar(num)==3){
    #  enum <- paste0('00',num)
    #}else if(nchar(num)==4){
    #  enum <- paste0('0',num)
    #}
    #shopId <- append(shopId,paste0('gs',enum))
    
    #출력해보기 (ID, 매장명, 매장주소)
    num<-num+1
    cat(num,  ",  ")
    
  }
  
  Sys.sleep(1)
  more<-remDr$findElement(using='css','#pagingTagBox > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
  Sys.sleep(1)
  
}

#shopId 생성
#shopId<-NULL
#for(num in 1: 2988){
#  if(nchar(num)==1){
#    enum <- paste0('0000',num)
#  }else if(nchar(num)==2){
#    enum <- paste0('000',num)
#  }else if(nchar(num)==3){
#    enum <- paste0('00',num)
#  }else if(nchar(num)==4){
#    enum <- paste0('0',num)
#  }
#  shopId <- append(shopId,paste0('gs',enum))
}




#gsStorename%>%gsub("GS25","",.)%>%append(gsStorenames, .)->gsStorenames


as.character(gsStoreAddr2) ->gsStoreAddr2
typeof(gsStoreAddr2)
#cbind 2988이 맞음

gsgsStoreproduct <- data.frame(shopId, gsStorestore, gsStorenames, gsStoreTel, gsStoreAddr2) 
names(gsgsStoreproduct)=c("shop_id","브랜드","상세명","전화번호","주소")
View(gsgsStoreproduct)
write.csv(gsgsStoreproduct,paste0(Sys.Date(),"_GS_SeoulAddr.csv"))






