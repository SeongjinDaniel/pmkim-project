library(RSelenium)
library(dplyr)
library(stringr)


remDr <-
  remoteDriver(remoteServerAddr = "localhost",
               port = 4445,
               browserName = "chrome")
remDr$open()
url <- 'https://www.emart24.co.kr/product/eventProduct.asp'
remDr$navigate(url)

#2+1 행사 정보

plustwo <-
  remDr$findElement("css", "#tabNew > ul > li:nth-child(3) > h4 > a")
plustwo$clickElement()

date <- Sys.Date()
totalInform <- NULL
type <- "2+1"
shopName <- "emart24"
num <- 4
endLink <- NULL

index <- 1
repeat {
  for (index in 1:15) {
    prodName <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productDiv"
        )
      )
    prodName <- unlist(prodName$getElementText())
    
    prodName %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
    } else if (length(prodName == 1) &
               length(grep("\\(", prodName)) == 1) {
      paste0(prodName[1], ")") -> prodName[1]
    } else if (length(prodName) == 3 &
               length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
    }
    
    (prodStore <- prodName[1])
    (prodName <- prodName[2])

    price <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.price"
        )
      )
    price <- unlist(price$getElementText())
    price <- gsub(" 원", "", price)
    img <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productImg > img"
        )
      )
    img_url <- unlist(img$getElementAttribute("src"))
    inform <-
      data.frame(
        searchDate = date,
        eventGood = prodName,
        shopName = shopName,
        eventPrice = price,
        prodName = prodStore,
        eventName = type,
        saleImg = img_url
      )
    print(inform)
    totalInform <- rbind(totalInform, inform)
  }
  if (num == 13) {
    page <-
      remDr$findElement("css",
                        "#regForm > div.section > div.eventProduct > div.paging > a.next.bgNone")
    page$clickElement()
    num <- 4
  } else{
    page <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.paging > a:nth-child(",
          num,
          ")"
        )
      )
    page$clickElement()
    num <- num + 1
  }
  Sys.sleep(1)
  try(endLink <-
        remDr$findElement(
          "css",
          paste0(
            "#regForm > div.section > div.eventProduct > div.paging > a:nth-child(",
            num,
            ")"
          )
        ), silent = T)
}
write.csv(totalInform, "emart24_2+1.csv")


# 할인 행사 정보

remDr$open()
remDr$navigate(url)

sale <-
  remDr$findElement("css", "#tabNew > ul > li:nth-child(5) > h4 > a")
sale$clickElement()
date <- Sys.Date()
totalInform <- NULL
type <- "SALE"
shopName <- "emart24"
num <- 4
endLink <- NULL
#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(9) > div > p.productDiv
index <- 9
repeat {
  for (index in 1:15) {
    prodName <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productDiv"
        )
      )
    prodName <- unlist(prodName$getElementText())
    
    prodName %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
    } else if (length(prodName == 1) &
               length(grep("\\(", prodName)) == 1) {
      paste0(prodName[1], ")") -> prodName[1]
    } else if (length(prodName) == 3 &
               length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
    }
    
    (prodStore <- prodName[1])
    (prodName <- prodName[2])
    
    price <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.price"
        )
      )
    price <- unlist(price$getElementText())
    price %>%
      gsub(" 원", "", .) %>%
      strsplit(., " → ") %>%
      unlist %>%
      .[2] -> price
    
    img <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productImg > img"
        )
      )
    img_url <- unlist(img$getElementAttribute("src"))
    inform <-
      data.frame(
        searchDate = date,
        eventGood = prodName,
        shopName = shopName,
        eventPrice = price,
        prodName = prodStore,
        eventName = type,
        saleImg = img_url
      )
    print(inform)
    totalInform <- rbind(totalInform, inform)
  }
  #regForm > div.section > div.eventProduct > div.paging > a:nth-child(4)
  
  if (num == 13) {
    page <-
      remDr$findElement("css",
                        "#regForm > div.section > div.eventProduct > div.paging > a.next.bgNone")
    page$clickElement()
    num <- 4
  } else {
    page <-
      remDr$findElement(
        "css",
        paste0(
          "#regForm > div.section > div.eventProduct > div.paging > a:nth-child(",
          num,
          ")"
        )
      )
    page$clickElement()
    num <- num + 1
  }
  print(num)
  try(endLink <-
        remDr$findElement(
          "css",
          paste0(
            "#regForm > div.section > div.eventProduct > div.paging > a:nth-child(",
            num,
            ")"
          )
        ), silent = T)
  print(length(endLink))
  #print(length(endLink))
  if (num == 8)
    break
  
  Sys.sleep(1)
}

write.csv(totalInform, "emart24_sale.csv")
#View(totalInform)
#str(totalInform$eventGood[16*(num-3)])
#grep(totalInform$eventGood[16*(num-3)],totalInform$eventGood)


#PB상품_아임이

remDr$open()
url <- 'https://www.emart24.co.kr/product/emart24.asp'
remDr$navigate(url)

date <- Sys.Date()
totalInform <- NULL
type <- "PB"
shopName <- "emart24"
num <- 4
endLink <- NULL
#prodName <- "아임이)지퍼백(대)15매"
repeat {
  for (index in 1:15) {
    prodName <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productDiv"
        )
      )
    prodName <- unlist(prodName$getElementText())
    
    prodName %>%
      strsplit(., ")") %>%
      unlist -> prodName
    
    if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")") -> prodName[2]
    } else if (length(prodName) == 1 &
               length(grep("\\(", prodName)) == 1) {
      paste0(prodName[1], ")") -> prodName[1]
    } else if (length(prodName) >= 3 &
               length(grep("\\(", prodName)) == 1) {
      paste0(prodName[2], ")", prodName[3]) -> prodName[2]
    }
    
    (prodStore <- prodName[1])
    (prodName <- prodName[2])
    
    #price <- remDr$findElement("css",paste0("#regForm > div.section > div.eventProduct > div.tabContArea > ul > li:nth-child(",index,") > div > p.price"))
    #price <- unlist(price$getElementText())
    #price %>%
    #  gsub(" 원","",.) %>%
    #  strsplit(.," → ") %>%
    #  unlist %>%
    #  .[2] -> price
    price <- 'NONE'
    
    img <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productImg > img"
        )
      )
    img_url <- unlist(img$getElementAttribute("src"))
    inform <-
      data.frame(
        searchDate = date,
        eventGood = prodName,
        shopName = shopName,
        eventPrice = price,
        prodName = prodStore,
        eventName = type,
        saleImg = img_url
      )
    print(inform)
    totalInform <- rbind(totalInform, inform)
  }
  if (num == 13) {
    page <-
      remDr$findElement("css",
                        "#skipCont > div.section > div.tabContArea > div > a.next.bgNone")
    page$clickElement()
    num <- 4
  } else {
    page <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
          num,
          ")"
        )
      )
    page$clickElement()
    num <- num + 1
  }
  print(num)
  try(endLink <-
        remDr$findElement(
          "css",
          paste0(
            "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
            num,
            ")"
          )
        ), silent = T)
  print(length(endLink))
  #print(length(endLink))
  if (num == 12)
    break
  
  Sys.sleep(1)
}

write.csv(totalInform, "emart24_PB.csv")

#PB상품_민생
remDr$open()
url <- 'https://www.emart24.co.kr/product/emart24.asp'
remDr$navigate(url)

minsaeng <-
  remDr$findElement("css", '#skipCont > ul > li:nth-child(2)')
minsaeng$clickElement()
date <- Sys.Date()
totalInform <- NULL
type <- "PB"
shopName <- "emart24"
num <- 4
endLink <- NULL

repeat {
  for (index in 1:15) {
    prodName <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productDiv"
        )
      )
    prodName <- unlist(prodName$getElementText())
    
    (prodStore <- '민생')
    
    price <- 'NONE'
    
    img <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productImg > img"
        )
      )
    img_url <- unlist(img$getElementAttribute("src"))
    inform <-
      data.frame(
        searchDate = date,
        eventGood = prodName,
        shopName = shopName,
        eventPrice = price,
        prodName = prodStore,
        eventName = type,
        saleImg = img_url
      )
    print(inform)
    totalInform <- rbind(totalInform, inform)
  }
  if (num == 13) {
    page <-
      remDr$findElement("css",
                        "#skipCont > div.section > div.tabContArea > div > a.next.bgNone")
    page$clickElement()
    num <- 4
  } else {
    page <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
          num,
          ")"
        )
      )
    page$clickElement()
    num <- num + 1
  }
  print(num)
  try(endLink <-
        remDr$findElement(
          "css",
          paste0(
            "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
            num,
            ")"
          )
        ), silent = T)
  print(length(endLink))
  #print(length(endLink))
  if (num == 12)
    break
  
  Sys.sleep(1)
}

write.csv(totalInform, "emart24_PB.csv", TRUE, col.names = FALSE)

#PB상품_freshfood

remDr$open()
url <- 'https://www.emart24.co.kr/product/emart24.asp'
remDr$navigate(url)

freshfood <-
  remDr$findElement("css", '#skipCont > ul > li:nth-child(3)')
freshfood$clickElement()
date <- Sys.Date()
totalInform <- NULL
type <- "Fresh Food"
shopName <- "emart24"
num <- 4
endLink <- NULL

repeat {
  for (index in 1:15) {
    prodName <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productDiv"
        )
      )
    prodName <- unlist(prodName$getElementText())
    
    if (length(grep("\\)", prodName)) == 1) {
      prodName %>%
        strsplit(., ")") %>%
        unlist -> prodName
      
      if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
        paste0(prodName[2], ")") -> prodName[2]
      } else if (length(prodName) == 1 &
                 length(grep("\\(", prodName)) == 1) {
        paste0(prodName[1], ")") -> prodName[1]
      } else if (length(prodName) >= 3 &
                 length(grep("\\(", prodName)) == 1) {
        paste0(prodName[2], ")", prodName[3]) -> prodName[2]
      }
      (prodStore <- prodName[1])
      (prodName <- prodName[2])
      
    } else{
      (prodStore <- 'emart24')
      
    }
    
    price <- 'NONE'
    
    
    img <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productImg > img"
        )
      )
    img_url <- unlist(img$getElementAttribute("src"))
    inform <-
      data.frame(
        searchDate = date,
        eventGood = prodName,
        shopName = shopName,
        eventPrice = price,
        prodName = prodStore,
        eventName = type,
        saleImg = img_url
      )
    print(inform)
    totalInform <- rbind(totalInform, inform)
  }
  if (num == 13) {
    page <-
      remDr$findElement("css",
                        "#skipCont > div.section > div.tabContArea > div > a.next.bgNone")
    page$clickElement()
    num <- 4
  } else {
    page <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
          num,
          ")"
        )
      )
    page$clickElement()
    num <- num + 1
  }
  print(num)
  try(endLink <-
        remDr$findElement(
          "css",
          paste0(
            "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
            num,
            ")"
          )
        ), silent = T)
  
  print(length(endLink))
  
  
  Sys.sleep(1)
}

write.csv(totalInform, "emart24_PB.csv", TRUE, col.names = FALSE)

#PB상품_차별화상품

remDr$open()
url <- 'https://www.emart24.co.kr/product/emart24.asp'
remDr$navigate(url)

differ <- remDr$findElement("css", '#skipCont > ul > li:nth-child(4)')
differ$clickElement()
date <- Sys.Date()
totalInform <- NULL
type <- "PB"
shopName <- "emart24"
num <- 4
endLink <- NULL

repeat {
  for (index in 1:15) {
    prodName <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productDiv"
        )
      )
    prodName <- unlist(prodName$getElementText())
    
    if (length(grep("\\)", prodName)) == 1) {
      prodName %>%
        strsplit(., ")") %>%
        unlist -> prodName
      
      if (length(prodName) == 2 & length(grep("\\(", prodName)) == 1) {
        paste0(prodName[2], ")") -> prodName[2]
      } else if (length(prodName) == 1 &
                 length(grep("\\(", prodName)) == 1) {
        paste0(prodName[1], ")") -> prodName[1]
      } else if (length(prodName) >= 3 &
                 length(grep("\\(", prodName)) == 1) {
        paste0(prodName[2], ")", prodName[3]) -> prodName[2]
      }
      (prodStore <- prodName[1])
      (prodName <- prodName[2])
      
    } else{
      (prodStore <- 'emart24')
      
    }
    
    price <- 'NONE'
    
    
    img <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > ul > li:nth-child(",
          index,
          ") > div > p.productImg > img"
        )
      )
    img_url <- unlist(img$getElementAttribute("src"))
    inform <-
      data.frame(
        searchDate = date,
        eventGood = prodName,
        shopName = shopName,
        eventPrice = price,
        prodName = prodStore,
        eventName = type,
        saleImg = img_url
      )
    print(inform)
    totalInform <- rbind(totalInform, inform)
  }
  if (num == 13) {
    page <-
      remDr$findElement("css",
                        "#skipCont > div.section > div.tabContArea > div > a.next.bgNone")
    page$clickElement()
    num <- 4
  } else {
    page <-
      remDr$findElement(
        "css",
        paste0(
          "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
          num,
          ")"
        )
      )
    page$clickElement()
    num <- num + 1
  }
  print(num)
  try(endLink <-
        remDr$findElement(
          "css",
          paste0(
            "#skipCont > div.section > div.tabContArea > div > a:nth-child(",
            num,
            ")"
          )
        ), silent = T)
  
  print(length(endLink))
  
  
  Sys.sleep(1)
}

write.csv(totalInform, "emart24_PB.csv", TRUE, col.names = FALSE)

