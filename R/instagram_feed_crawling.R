library(RSelenium)
library(dplyr)
library(stringr)

##id pw 설정
pyun.id<-"pyun_ma"
pyun.pw<-"rlavusqhr1234"
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.instagram.com/explore/tags/세븐일레븐/'
remDr$navigate(url)
Sys.sleep(5)

##로그인
login.click<-remDr$findElement(using="css","#react-root > section > nav > div._8MQSO.Cx7Bp > div > div > div.ctQZg > div > span > a:nth-child(1) > button")
login.click$clickElement()
input.id<-remDr$findElement(using="css","#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(2) > div > label > input")
input.id$sendKeysToElement(list(pyun.id))
input.pw<-remDr$findElement(using="css","#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(3) > div > label > input")
input.pw$sendKeysToElement(list(pyun.pw))
login.click<-remDr$findElement(using="css","#react-root > section > main > div > article > div > div:nth-child(1) > div > form > div:nth-child(4) > button")
login.click$clickElement()
close.click<-remDr$findElement(using="css","#react-root > section > main > div > div > div > div > button")
close.click$clickElement()
Sys.sleep(5)

##첫번째 게시물 클릭
first.click<-remDr$findElement(using="css","#react-root > section > main > article > div.EZdmt > div > div > div:nth-child(1) > div:nth-child(1)")
first.click$clickElement()

##게시글
i.cnt<-1
group.cnt<-1
bind.test<-NULL
repeat{
  tryCatch({
    feed.url <- remDr$findElement(using = "css",paste0("#react-root > section > main > article > div.EZdmt > div > div > div:nth-child(",group.cnt,") > div:nth-child(",i.cnt,") > a"))
    feed.url <- unlist(feed.url$getElementAttribute("href"))
    
    feed.img <- remDr$findElement(using = "css",
                                  "body > div._2dDPU.CkGkG > div.zZYga > div > article > div._97aPb > div  img")
    feed.img <- unlist(feed.img$getElementAttribute("src"))
    df.test <- data.frame(url = feed.url,
                          img = feed.img
                        )
    bind.test <- rbind(bind.test, df.test)
    
    ##옆 게시물로 이동
    if (nrow(bind.test) == 1) {
      r.move <-
        remDr$findElement(using = "css", "body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a")
    } else{
      r.move <-
        remDr$findElement(
          using = "css",
          " body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow"
        )
    }
    r.move$clickElement()
    
  },
  error = function(e) {
    r.move <-
      remDr$findElement(
        using = "css",
        " body > div._2dDPU.CkGkG > div.EfHg9 > div > div > a._65Bje.coreSpriteRightPaginationArrow"
      )
    r.move$clickElement()
    message(e)
    return(NA)
  },
  finally = {
    if (i.cnt%%3==0) {
      group.cnt<-group.cnt+1 
      i.cnt<-1
    }else{
      i.cnt<-i.cnt+1  
    }
    Sys.sleep(2)
    print(paste0(group.cnt," : ",i.cnt))
    if(group.cnt==4) break;
  })
}
