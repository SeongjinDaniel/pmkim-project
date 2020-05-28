url<-'http://www.7-eleven.co.kr/product/presentList.asp'
remDr$navigate(url)
data.table<-NULL

##행사 형태 클릭하기
#선택됐을 떄 : actFrm > div.cont_body > div.wrap_tab > ul > li.on > a
#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(1) > a
#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(2) > a
#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(3) > a
#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(4) > a

##more더보기 누르기
#listUl > li.btn_more > a
#moreImg > a
#moreImg > a

##이미지 url
#www.7-eleven.co.kr/upload/product/8801104/220200.1.jpg
for(index in 1:4){
  more<-remDr$findElement(using="css","#listUl > li.btn_more > a")
  more$clickElement()
  click <- remDr$findElement(using="css",paste0("#actFrm > div.cont_body > div.wrap_tab > ul > li:nth-child(",index,") > a"))
  click$clickElement()
  Sys.sleep(3)
}

#베스트 댓글
bestReNodes<-remDr$findElements(using="css selector","ul.u_cbox_list span.u_cbox_contents")
tr<-sapply(bestReNodes,function(x){x$getElementText()})
re<-unlist(tr)
data.table<-append(data.table,re)

#전체 댓글
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()


#반복
#다음 a selector : #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13)
# 12 : #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(4)
# 다음 : #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13)
# 클린봇의 댓글 부분 : #cbox_module > div > div.u_cbox_content_wrap > ul > li.u_cbox_comment.cbox_module__comment_384188676._user_id_no_ckceh > div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span
#cbox_module > div > div.u_cbox_content_wrap > ul > li.u_cbox_comment.cbox_module__comment_385248138._user_id_no_bpFhR > div.u_cbox_comment_box > div > div.u_cbox_text_wrap
#cbox_module > div > div.u_cbox_content_wrap > ul > li.u_cbox_comment.cbox_module__comment_385248138._user_id_no_bpFhR > div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span
for(j in 1:5){
  for (i in 4:13) {
    Sys.sleep(2)
    #전체 댓글 읽고 적용
    totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list div.u_cbox_text_wrap")
    tr<-sapply(totalReviewNodes,function(x){x$getElementText()})
    re<-unlist(tr)
    data.table<-append(data.table,re)
#    View(data.table)
    nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
    nextPage<-remDr$findElement(using='css',nextCss)
    nextPage$clickElement()
  
    Sys.sleep(2)
  }
}
write(data.table,"webtoon1.txt")
