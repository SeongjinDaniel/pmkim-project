library(RSelenium)
library(dplyr)

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- 'https://www.emart24.co.kr/introduce2/findBranch.asp'
remDr$navigate(url)

#마지막페이지 찾은 후 첫 페이지 돌아오기
currentNum <- 1
finalPage <- remDr$findElement('css','#skipCont > div.section > div.find_listArea.openList > div > a:nth-child(14)')
finalPage$clickElement()

finalNum <- remDr$findElement('css','#skipCont > div.section > div.find_listArea.openList > div > a.first.on')
finalNum <- as.integer(unlist(finalNum$getElementText()))

firstPage <- remDr$findElement('css','#skipCont > div.section > div.find_listArea.openList > div > a:nth-child(1)')
firstPage$clickElement()

shopTotal <- NULL

shopName <- 'emart24'
num <- 1
repeat{
  for(index in 1:5){       #한 페이지 크롤링
    
    # 매장명
    shopNameDetail <- remDr$findElement("css",paste0('#skipCont > div.section > div.find_listArea.openList > table > tbody > tr:nth-child(',index,') > td:nth-child(1) > strong'))
    shopNameDetail <- shopNameDetail$getElementText()

    shopNameDetail %>% 
      unlist %>% 
      paste0(shopName,.) -> shopNameDetail

    #매장 정보(주소, 운영시간)
    shopInfo <- remDr$findElement('css',paste0('#skipCont > div.section > div.find_listArea.openList > table > tbody > tr:nth-child(',index,') > td.txtLeft > p:nth-child(1)'))
    shopInfo <- shopInfo$getElementText()
    
    shopInfo %>% 
      unlist %>% 
      strsplit(.,' \\| ') %>%
      unlist %>% 
      gsub('','',.)-> shopInfo
    
    shopAddr <- shopInfo[1]
    
    shopInfo[2] %>% 
      strsplit(.,' \\: ') %>% 
      unlist %>% 
      .[2] %>% 
      strsplit(.,' \\~ ') %>% 
      unlist -> shopTime
    
    shopOpen <- shopTime[1]
    shopClose <- shopTime[2]
    
    #매장 전화번호
    shopTel <- remDr$findElement('css',paste0('#skipCont > div.section > div.find_listArea.openList > table > tbody > tr:nth-child(',index,') > td.txtLeft > p.pull-left'))
    shopTel <- shopTel$getElementText()
    shopTel %>% 
      unlist %>% 
      strsplit(., ' \\: ') %>% 
      unlist %>% 
      .[2] -> shopTel
    
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
    
    shopId <- paste0('em',enum)
    
    info <- data.frame(shopId, shopName, shopNameDetail, shopTel, shopOpen, shopClose, shopAddr)
    print(info)
    
    shopTotal <- rbind(shopTotal,info)
    
    num <- num+1
  }
  Sys.sleep(1)
  currentNum <- currentNum +1 
  
  #페이지 넘김
  if(currentNum == finalNum+1) break;
  nextPage <- remDr$findElement('css','#skipCont > div.section > div.find_listArea.openList > div > a.next.bgNone')
  nextPage$clickElement()
}
write.csv(shopTotal,'emart24_locInfo.csv')