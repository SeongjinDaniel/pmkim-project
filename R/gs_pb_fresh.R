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
#pb 상품 
url <- 'http://gs25.gsretail.com/gscvs/ko/products/youus-main'
remDr$navigate(url)


#FRESH 상품 더보기
more<-remDr$findElement(using='css','#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div.cnt_section.mt50 > div > div.prod_section.food > div > span > a')
more$getElementTagName()
more$getElementText()
more$clickElement()

plusPBFselector <- NULL
plusPBFsample<-NULL
plusPBFname<-NULL
plusPBFmanuf<-NULL
plusPBFprice <- NULL
plusPBFdate <- NULL
plusPBFstore <- NULL
plusPBFphoto <- NULL
names<-NULL
eventGoodPBF<-NULL
plusPBFnameSample<-NULL

k<-1
finished <- FALSE
for(i in 1:10){
  for(n in 1:16){
    
    #상품명
    plusPBFsample <- NULL
    plusPBFsample <- remDr$findElement(using='css',paste0("#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div > div > div > div.tblwrap.mt20 > div.tab_cont.on > ul > li:nth-child(",n,") > div > p.tit"))
    if(is.null(plusPBFsample)){
      print("finish")
      finished <- TRUE
      break;
    }
    plusPBFname<- plusPBFsample$getElementText()
    plusPBFname<-as.character(plusPBFname)
    plusPBFnameSample<-append(plusPBFnameSample, plusPBFname)
    plusPBFname%>%strsplit(.,")")%>%unlist -> names
    
    # eventGood
    # 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
    #제조사
    if(names[1]=='더큰'|names[1]=='삼각'|names[1]=='NEW'){
      eventGoodPBF<-append(eventGoodPBF,paste0(names[1],")",names[2]))
      plusPBFmanuf<-append(plusPBFmanuf, "GSPB")
    }
    else{
      #for(j in 1:1){
        if(length(names)==3) {
          eventGoodPBF<-append(eventGoodPBF,paste0(names[2],names[3],sep=")"))
          plusPBFmanuf <- append(plusPBFmanuf,names[1])
        }
        else if(length(names)==2&length(grep('\\(',names))==0){ 
          eventGoodPBF<-append(eventGoodPBF,names[2])
          plusPBFmanuf <- append(plusPBFmanuf,names[1])
        }
        else if(length(names)==2&length(grep('\\(', names))==2){
          eventGoodPBF<-append(eventGoodPBF, paste0(names[1],names[2],")"))
          plusPBFmanuf<-append(plusPBFmanuf, "GSPB")
        }
        else if(length(names)==1){
          eventGoodPBF<-append(eventGoodPBF,names[1])
          plusPBFmanuf<-append(plusPBFmanuf, "GSPB")
        }else{
          eventGoodPBF<-append(eventGoodPBF,plusPBFname)
          plusPBFmanuf<-append(plusPBFmanuf, "GSPB")
          # print(plusPBFname)
          # print("another")
        }
      #}
    }
  
    cat(k)
    k<-k+1
    
    #가격
    plusPBFsample <- remDr$findElement(using='css', paste0("#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div > div > div > div.tblwrap.mt20 > div.tab_cont.on > ul > li:nth-child(",n,") > div > p.price > span"))
    plusPBFprice<- append(plusPBFprice,plusPBFsample$getElementText())
    
    #날짜
    plusPBFdate <- append(plusPBFdate, Sys.Date())
    
    #유통업체
    plusPBFstore <- append(plusPBFstore, "gs")
  }
  
  if(finished == TRUE) break;
  more<-remDr$findElement(using='css','#contents > div.yCmsComponent.span-24.section1.cms_disp-img_slot > div > div > div > div > div > div.tblwrap.mt20 > div.paging > a.next')
  more$getElementTagName()
  more$getElementText()
  more$clickElement()
  Sys.sleep(1)
}



#가격
plusPBFprice%>% gsub("원","",.) ->plusPBFprice

#cbind
gsplusPBFproduct <- data.frame(plusPBFdate, eventGoodPBF, plusPBFstore, plusPBFprice, plusPBFmanuf) #157 152 157 157 152
View(gsplusPBFproduct)
names(gsplusPBFproduct)=c("기준날짜","상품명","판매업소","판매가격","제조사")

write.csv(gsplusPBFproduct,paste0(Sys.Date(),"_GSPB_Fresh.csv"))
