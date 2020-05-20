#plus11<- sapply(plus11sample, function(x){x$getElementText()})
#plus11<- c(plus11, unlist(repl))
#more$clickElement()
#plus11sample$clickElement()

library(stringr)
library(RSelenium)
library(dplyr)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
#pb 상품 
url <- 'http://gs25.gsretail.com/gscvs/ko/products/youus-main'
remDr$navigate(url)


#FRESH 상품 더보기
more<-remDr$findElement(using='css','#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div.cnt_section.mt50 > div > div.prod_section.differentiation > div > span > a')
more$getElementTagName()
more$getElementText()
more$clickElement()

plusPBSselector <- NULL
plusPBSsample<-NULL
plusPBSname<-NULL
plusPBSmanuf<-NULL
plusPBSprice <- NULL
plusPBSdate <- NULL
plusPBSstore <- NULL
plusPBSphoto <- NULL
names<-NULL
eventGoodPBS<-NULL
plusPBSnameSample<-NULL

k<-1
finished <- FALSE
for (i in 1:39){
  for(n in 1:16){
    
    #상품명
    plusPBSsample <- NULL
    plusPBSsample <- remDr$findElement(using='css',paste0("#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div > div > div > div.tblwrap.mt20 > div.tab_cont.on > ul > li:nth-child(",n,") > div > p.tit"))
    if(is.null(plusPBSsample)){
      print("finish")
      finished <- TRUE
      break;
    }
    plusPBSname<- plusPBSsample$getElementText()
    plusPBSname<-as.character(plusPBSname)
    plusPBSnameSample<-append(plusPBSnameSample, plusPBSname)
    plusPBSname%>%strsplit(.,")")%>%unlist -> names
    
    # eventGood
    # 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
    #제조사
    if(names[1]=='더큰'|names[1]=='삼각'|names[1]=='NEW'){
      eventGoodPBS<-append(eventGoodPBS,paste0(names2[1],")",names2[2]))
      plusPBSmanuf<-append(plusPBSmanuf, "GSPB")
    }
    else{
      #for(j in 1:1){
      if(length(names)==3) {
        eventGoodPBS<-append(eventGoodPBS,paste0(names[2],names[3],sep=")"))
        plusPBSmanuf <- append(plusPBSmanuf,names[1])
      }
      else if(length(names)==2&length(grep('\\(',names))==0){ 
        eventGoodPBS<-append(eventGoodPBS,names[2])
        plusPBSmanuf <- append(plusPBSmanuf,names[1])
      }
      else if(length(names)==2&length(grep('\\(', names))==2){
        eventGoodPBS<-append(eventGoodPBS, paste0(names[1],names[2],")"))
        plusPBSmanuf<-append(plusPBSmanuf, "GSPB")
      }
      else if(length(names)==1){
        eventGoodPBS<-append(eventGoodPBS,names[1])
        plusPBSmanuf<-append(plusPBSmanuf, "GSPB")
      }else{
        eventGoodPBS<-append(eventGoodPBS,plusPBSname)
        plusPBSmanuf<-append(plusPBSmanuf, "GSPB")
        # print(plusPBSname)
        # print("another")
      }
      #}
    }
    
    cat(k)
    k<-k+1
    
    #가격
    plusPBSsample <- remDr$findElement(using='css', paste0("#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div > div > div > div.tblwrap.mt20 > div.tab_cont.on > ul > li:nth-child(",n,") > div > p.price > span"))
    plusPBSprice<- append(plusPBSprice,plusPBSsample$getElementText())
    
    #날짜
    plusPBSdate <- append(plusPBSdate, Sys.Date())
    
    #유통업체
    plusPBSstore <- append(plusPBSstore, "GS리테일")
  }
  
  #if(finished == TRUE) break;
  more<-remDr$findElement(using='css','#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div > div > div > div.tblwrap.mt20 > div.paging > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
  Sys.sleep(1)
}



#가격
plusPBSprice%>% gsub("원","",.) ->plusPBSprice

#cbind
gsplusPBSproduct <- data.frame(plusPBSdate, eventGoodPBS, plusPBSstore, plusPBSprice, plusPBSmanuf) #157 152 157 157 152
View(gsplusPBSproduct)
names(gsplusPBSproduct)=c("기준날짜","상품명","판매업소","판매가격","제조사")

write.csv(gsplusPBSsproduct,paste0(Sys.Date(),"_GSPB_Special.csv"))
