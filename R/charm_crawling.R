# 참가격 생필품가격정보 크롤링

#install.packages("RSelenium")
library(RSelenium)
library(httr)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.price.go.kr/tprice/portal/dailynecessitypriceinfo/priceiteminfo/getPriceItemInfoList.do'
remDr$navigate(url)
Sys.sleep(5)

# 대형마트, 백화점, .. 등 모든 유형 체크!!
#chk_LM #대형마트
clickStore <- function(){
  clickCheck <- remDr$findElement(using='css',"#chk_LM")
  clickCheck$clickElement()
  #chk_DP # 백화점
  clickCheck <- remDr$findElement(using='css',"#chk_DP")
  clickCheck$clickElement()
  #chk_SM # 슈퍼마켓
  clickCheck <- remDr$findElement(using='css',"#chk_SM")
  clickCheck$clickElement()
  #chk_TR # 전통시장
  clickCheck <- remDr$findElement(using='css',"#chk_TR")
  clickCheck$clickElement()
  #chk_CS # 편의점
  clickCheck <- remDr$findElement(using='css',"#chk_CS")
  clickCheck$clickElement()
  Sys.sleep(1)
}
clickStore()


# 분기, 지역, 품목, 상품마다 클릭해서 크롤링
# 분기 //*[@id="inspectDay"]
# 지역 //*[@id="entpAreaCode"]
# 품목 //*[@id="goodSmlclsCode"]
# 상품 //*[@id="goodId"]

clickType <- function(optionType, index){
  # index
  # optionType <- "goodId"
  selectInfo <- paste("//*[@id=\"",optionType,"\"]/option[",index,"]", sep="")
  try({optionDay <- remDr$findElement(using='xpath', value=selectInfo)}, silent=T)
  return(optionDay)
}
searchDate <- "기준날짜"
goodName <- "상품명"
shopName <- "판매업소"
goodPrice <- "판매가격"
prodName <- "제조사"
image <- "이미지"
location <- "지역"
beforeWeekPrice <- "1주전가격"
beforeMonthPrice <- "1개월전가격"
beforeSixMonthPrice <- "6개월전가격"
beforeYearPrice <- "1년전가격"

repeat{
  optionDay <- NULL
#--------------------------------------------------------------------------------------
  # 1~4분기 실행
  for(indexQuarter in 1:4){
    # day 클릭
    optionDay <- NULL
    optionLoc <- NULL
    optionProType <- NULL
    optionPro <- NULL
    indexLoc <- 2
    indexProType <- 1
    indexPro <- 2
    #print(quarterIndex)
    
    optionDay <- clickType("inspectDay", indexQuarter)
    
    if(is.null(optionDay)) {
      cat("종료\n")
      break;
    }
    #--------------------------------------------------------------------------------------    
    # 지역 클릭
    repeat{
      optionLoc <- NULL
      optionLoc <- clickType("entpAreaCode", indexLoc)
      indexLoc <- indexLoc + 1
      if(is.null(optionLoc)) {
        cat("종료\n")
        break;
      }
      optionLoc$clickElement()
      Sys.sleep(1)
      
      #--------------------------------------------------------------------------------------
      # 판매점 전체로만 클릭해서 사용!! -> 따로 클릭 안해도됨 default가 전체임
      # 품목 클릭
      repeat{
        optionProType <- NULL
        optionProType <- clickType("goodSmlclsCode", indexProType)
        indexProType <- indexProType + 1
        if(is.null(optionProType)) {
          cat("종료\n")
          break;
        }
        optionProType$clickElement()
        print("품목클릭")
        Sys.sleep(1)
        
        # 상품 클릭 (전체로하면 안됨)
        repeat{
          optionPro <- NULL
          optionPro <- clickType("goodId", indexPro)
          indexPro <- indexPro + 1
          if(is.null(optionPro)) {
            cat("종료\n")
            break;
          }
          optionPro$clickElement()
          Sys.sleep(1)
          # 조회 클릭
          clickFind <- remDr$findElement(using='css',"#search_btn")
          clickFind$clickElement()
          print("상품클릭")
          Sys.sleep(1)

          for(index in 2:6){
            # 추후에 전체 상품개수 확인하고 Sequence 변경하기
            # 여기서 부터 상품 크롤링 !!ㅎㅎㅎ ...
            # 밑에 탭에 대형마트, 백화점, 슈퍼마켓, 전통시장, 편의점 순으로!! 크롤링
            # #tab_menu > ul > li.on > span > a           ---전체
            # #tab_menu > ul > li:nth-child(2) > span > a --- 대형마트
            # #tab_menu > ul > li:nth-child(3) > span > a --- 백화점
            # #tab_menu > ul > li:nth-child(4) > span > a --- 슈퍼마켓
            # :
            # #tab_menu > ul > li:nth-child(6) > span > a --- 편의점
            #index <- 2
            selectInfo <- paste("#tab_menu > ul > li:nth-child(",index,") > span > a", sep="")
            click_Stores <- remDr$findElement(using='css', selectInfo)
            storeType <- click_Stores$getElementText()
            click_Stores$clickElement()
            #print("stssssss")
            #storeType <- click_Stores$getElementText()
            Sys.sleep(1)
            print("storeType")
            # #tab_menu > ul > li.on > span > a
            #tab_menu > ul > li:nth-child(1) > span > a
            #tab_menu > ul > li.on > span > a
            #tab_menu > ul > li.on > span > a
            #tab_menu > ul > li:nth-child(1) > span > a
            #tab_menu > ul > li:nth-child(3) > span > a
            
              #Date#################################################################
              #shopName#################################################################
              # #resultTable > tbody > tr:nth-child(1) > td:nth-child(2)
              # :
              # #resultTable > tbody > tr:nth-child(10) > td:nth-child(2)

              # 페이지 next
              oldPage <- 3
              newPage <- 3
              curPage <- 3
              repeat{
                limit <- 0
                for(idx in 1:10){
                  # 개수가 10개 이하이면!! -> 처리하기!!
                  limit <- gsub("[^[:digit:]]", "", storeType)
                  limit <- as.numeric(limit)
                  Sys.sleep(1)
                  if(limit == 0) break;
                  
                  #Date 하나로 고정#################################################################
                  selectYear <- remDr$findElement(using='css',"#inspectYear > option[selected]")
                  selectedYear <- selectYear$getElementText()
                  selectMonth <- remDr$findElement(using='css',"#inspectMonth > option[selected]")
                  selectedMonth <- selectMonth$getElementText()
                  selectDay <- remDr$findElement(using='css',"#inspectDay > option[selected]")
                  selectedDay <- selectDay$getElementText()
                  
                  date <- paste(selectedYear,"-", selectedMonth, "-", selectedDay, sep="")
                  
                  searchDate <- append(searchDate, date)
                  
                  #good 하나로 고정#################################################################
                  goodTemp <- remDr$findElement(using='css', "#schForm > h3")
                  good <- goodTemp$getElementText()
                  
                  goodName <- append(goodName, unlist(good))
                  #good#################################################################
                  # 판매점 크롤링
                  #resultTable > tbody > tr:nth-child(3) > td:nth-child(2)
                  temp <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(2)")
                  shopTemp <- NULL
                  try({shopTemp <- remDr$findElement(using='css', temp)}, silent=T)
                  if(is.null(shopTemp)){
                    print("상품 List 크롤링 종료");
                    break;
                  }
                  shop <- shopTemp$getElementText()
                  shopName <- append(shopName, unlist(shop))
                  Sys.sleep(1);
                  ################### success ###################
                  
                  #prodName###############################################################
                  # 위에서 NULL로 break해서 반복문을 나가면 이하 코드에서는 break 코드가 필요없음
                  temp2 <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(3)")
                  try({productTemp <- remDr$findElement(using='css', temp2)}, silent=T)
                  product <- productTemp$getElementText()
                  prodName <- append(prodName, unlist(product))
                  #prodName###############################################################
                  
                  #goodPrice###############################################################
                  # 위에서 NULL로 break해서 반복문을 나가면 이하 코드에서는 break 코드가 필요없음
                  # #resultTable > tbody > tr:nth-child(1) > td:nth-child(4)
                  # :
                  # #resultTable > tbody > tr:nth-child(10) > td:nth-child(4)
                  temp3 <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(4)")
                  try({priceTemp <- remDr$findElement(using='css', temp3)}, silent=T)
                  price <- priceTemp$getElementText()
                  goodPrice <- append(goodPrice, unlist(price))
                  #goodPrice###############################################################
                  
                  #image###############################################################
                  #schForm > div.product > div.product_info > div > img
                  try({imageTemp <- remDr$findElement(using='css', "#schForm > div.product > div.product_info > div > img[src]")}, silent=T)
                  imageSrc <- imageTemp$getElementAttribute("src")
                  image <- append(image, unlist(imageSrc))
                  #image###############################################################
                  
                  #Location#################################################################
                  try({loc <- remDr$findElement(using='css', "#entpAreaCode > option[selected]")}, silent=T)
                  selectedLoc <- loc$getElementText()
                  location <- append(location, unlist(selectedLoc))
                  #Location#################################################################
                  
                  # beforeWeekPrice <- "1주전"
                  #beforeWeekPrice#################################################################
                  temp4 <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(5)")
                  try({wPriceTemp <- remDr$findElement(using='css', temp4)}, silent=T)
                  wPrice <- wPriceTemp$getElementText()
                  beforeWeekPrice <- append(beforeWeekPrice, unlist(wPrice))
                  #beforeWeekPrice#################################################################
                  
                  #beforeMonthPrice#################################################################
                  temp5 <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(6)")
                  try({mPriceTemp <- remDr$findElement(using='css', temp5)}, silent=T)
                  mPrice <- mPriceTemp$getElementText()
                  beforeMonthPrice <- append(beforeMonthPrice, unlist(mPrice))
                  #beforeMonthPrice#################################################################
                  
                  #beforeSixMonthPrice#################################################################
                  temp6 <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(7)")
                  try({smPriceTemp <- remDr$findElement(using='css', temp6)}, silent=T)
                  smPrice <- smPriceTemp$getElementText()
                  beforeSixMonthPrice <- append(beforeSixMonthPrice, unlist(smPrice))
                  #beforeSixMonthPrice#################################################################
                  
                  #beforeYearPrice#################################################################
                  temp7 <- paste0("#resultTable > tbody > tr:nth-child(",idx,") > td:nth-child(8)")
                  try({yPriceTemp <- remDr$findElement(using='css', temp7)}, silent=T)
                  yPrice <- yPriceTemp$getElementText()
                  beforeYearPrice <- append(beforeYearPrice, unlist(yPrice))
                  #beforeYearPrice#################################################################

                }
                
                # #schForm > div.pagination > span:nth-child(3) > strong
                # #schForm > div.pagination > span:nth-child(4) > a
                # :
                # #schForm > div.pagination > span:nth-child(12) > a
                
                #schForm > div.pagination > span:nth-child(4) > a
                
                oldpageNum <- remDr$findElement(using='css',"#schForm > div.pagination strong")
                oldPage <- as.numeric(oldpageNum$getElementText())
                
                if(newPage == 12){
                  clickNextPages <- remDr$findElement(using='css',"#schForm > div.pagination > a.next")
                  clickNextPages$clickElement()
                  newPage <- 3
                  curPage <- newPage
                  print("1")
                  Sys.sleep(1)
                }
                else{
                  if(limit <= 10){
                    print("in limit")
                    break;
                    Sys.sleep(1)
                  }else{
                    newPage <- curPage + 1
                    str(newPage)
                    print("else")
                    #schForm > div.pagination > span:nth-child(4) > a
                    temp0 <- paste0("#schForm > div.pagination > span:nth-child(",newPage,") > a")
                    clickNextPage <- remDr$findElement(using='css',temp0)
                    clickNextPage$clickElement()
                    curPage <- newPage
                    Sys.sleep(1)
                  }
                } 
                
                newPageNum2 <- remDr$findElement(using='css',"#schForm > div.pagination strong")
                newPageNum <- as.numeric(newPageNum2$getElementText())
                #str(newPage)
                
                if(oldPage == newPageNum) break
              }
              #shopName#################################################################


          }
        }

      }
      
    }

    optionDay$clickElement()
  }
  if(is.null(optionDay)) {
    cat("종료\n")
    break;
  }
  
}




# Test# Test# Test# Test# Test# Test# Test# Test# Test# Test# Test# Test

# clickCheck <- remDr$findElement(using='css',"#search_btn")
# clickCheck$clickElement()
# 
# # resultTable > tbody > tr:nth-child(1) > td:nth-child(1)
# clickCheck <- remDr$findElement(using='css',"# resultTable > tbody > tr:nth-child(1) > td:nth-child(1)")
# clickCheck$clickElement()
# 
# selectInfo <- paste("//*[@id=\"inspectYear\"]", sep="")
# try(tt <- remDr$findElement(using='xpath', value=selectInfo), silent=T)
# tt$getElementText()

