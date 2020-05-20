## 남기고 싶은 중복 데이터 값을 아래쪽에 두고
## 중복된 데이터값을 지우고 싶을 때 사용

##cu goods 중복 데이터 제거
exam <- read.csv("data/goods_cu.csv") 
exam<-exam[-which(duplicated(exam$good_name,fromLast=T)),]
write.csv(exam,file="goods_cu.csv")

##emart24 중복 데이터 제거
exam <- read.csv("data/goods_emart24.csv") 
exam<-exam[-which(duplicated(exam$good_name,fromLast=T)),]
write.csv(exam,file="goods_emart24.csv")

##ministop 중복 데이터 제거
exam <- read.csv("data/goods_ministop.csv") 
exam<-exam[-which(duplicated(exam$good_name,fromLast=T)),]
write.csv(exam,file="goods_ministop.csv")

##seven eleven 중복 데이터 제거
exam <- read.csv("data/goods_seveneleven.csv") 
exam<-exam[-which(duplicated(exam$good_name,fromLast=T)),]
write.csv(exam,file="goods_seveneleven.csv")

##gs25 중복 데이터 제거
exam <- read.csv("data/goods_gs25.csv") 
exam<-exam[-which(duplicated(exam$good_name,fromLast=T)),]
write.csv(exam,file="goods_gs25.csv")
