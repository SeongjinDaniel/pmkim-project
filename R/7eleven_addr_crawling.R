#install.packages("dplyr")
library(RSelenium)
library(dplyr)
#install.packages("stringr")
#library(stringr)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'http://www.7-eleven.co.kr/'
remDr$navigate(url)

# 매점찾기 클릭
searchAddr <- remDr$findElement("css","#header > div > div > div.head_util > a.util_store.store_open")
searchAddr$clickElement()

# [매장 주소 테이블]
# 1. shop_id : 임의로 줄것, 앞에 영어 두글자+숫자 5자리 (ex:cu00001) 
# 2. shop_name : CU /////
# 3. shop_name_detail : 역삼점 /////
# 4. tel_num : 02436098 /////
# 5. shop_addr : 주소~~~ //////

shop_id <- NULL; shop_name <- "7eleven"; shop_name_detail <- NULL; tel_num <- "1577-0711"; shop_addr <- NULL;
shop_id_seq <- 0; guAllCount <- 25; totalInform <- NULL;
# str(guAllCount)

# guIndex는 2부터 시작(강남구부터)
for(guIndex in 2:guAllCount){
  # 서울은 클릭하자마자 서울이니까 일단 클릭 패스!!
  # 해당 구 클릭
  selectInfo <- paste0("#storeLayGu > option:nth-child(",guIndex,")")
  optionGu <- remDr$findElement(using='css', value=selectInfo)
  optionGu$clickElement()
  Sys.sleep(1)
  #확인 버튼 클릭
  search <- remDr$findElement("css","#storeButton1")
  search$clickElement()
  Sys.sleep(1)
  
  curIdx <- 1
  repeat{
    shop_id_seq <- shop_id_seq+1
    #shopId 생성  
    if(nchar(shop_id_seq)==1){
      enum <- paste0('0000',shop_id_seq)
    }else if(nchar(shop_id_seq)==2){
      enum <- paste0('000',shop_id_seq)
    }else if(nchar(shop_id_seq)==3){
      enum <- paste0('00',shop_id_seq)
    }else if(nchar(shop_id_seq)==4){
      enum <- paste0('0',shop_id_seq)
    }
    shop_id <- paste0("7eleven",enum)
    
    #shop_name_detail 찾기
    #storeForm > div:nth-child(4) > div.list_stroe > ul > li:nth-child(1) > a > span:nth-child(1)
    #:
    #storeForm > div:nth-child(4) > div.list_stroe > ul > li:nth-child(175) > a > span:nth-child(1)
    shopName <- NULL
    shopNameInfo <- paste0("#storeForm > div:nth-child(4) > div.list_stroe > ul > li:nth-child(",curIdx,") > a > span:nth-child(1)")
    try(shopName <- remDr$findElement("css",shopNameInfo))
    if(is.null(shopName)) break;
    shop_name_detail <- unlist(shopName$getElementText())
    #Sys.sleep(1)
    
    #shop_addr 찾기
    #storeForm > div:nth-child(4) > div.list_stroe > ul > li:nth-child(1) > a > span:nth-child(2)
    #:
    #storeForm > div:nth-child(4) > div.list_stroe > ul > li:nth-child(175) > a > span:nth-child(2)
    shopAddrInfo <- paste0("#storeForm > div:nth-child(4) > div.list_stroe > ul > li:nth-child(",curIdx,") > a > span:nth-child(2)")
    try(shopAddr <- remDr$findElement("css",shopAddrInfo))
    shop_addr <- unlist(shopAddr$getElementText())
    #Sys.sleep(1)
    
    inform <- data.frame(shop_id,shop_name,shop_name_detail,tel_num,shop_addr)
    print(inform)
    totalInform <- rbind(totalInform,inform)
    curIdx <- curIdx + 1
    Sys.sleep(1)
  }
}
write.csv(totalInform,paste0(gsub("-","",Sys.Date()),"7eleven_addr_crawling.csv"))


