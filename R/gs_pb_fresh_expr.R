pppp%>%strsplit(.,")")%>%unlist -> names2
pppp<-"더큰)삼각마요1편"


#plusPBFname%>%strsplit(.,")")%>%unlist -> names2

# eventGood
# 롯데)김밥세트(김치) 라면  // 롯데)김밥세트  // 롯데)김밥세트(김치)
#제조사

eventwhatif  <- NULL
whatif <- NULL

#1
if(length(names2)==3) {
  eventwhatif<-append(eventwhatif,paste(names2[2],names2[3],sep=")"))
  whatif <- append(whatif,names2[1])
}
eventwhatif 
whatif

#2
if(length(names2)==2&length(grep('\\(',names2))==0){ 
  eventwhatif<-append(eventwhatif,names2[2])
  whatif <- append(whatif,names2[1])
}
eventwhatif 
whatif

#3
if(length(names2)==2&length(grep('\\(',names2))==1){
  eventwhatif<-append(eventwhatif,paste0(names[1],")",names[2]))
  whatif <- append(whatif, "GSPB")
}
eventwhatif 
whatif

#4
if(length(names2==2)&length(grep('\\C', names2))==2){
  eventwhatif<-append(eventwhatif, paste0(names2[1],names2[2],")"))
  whatif<-append(whatif, "GSPB")
}
eventwhatif 
whatif

#5
if(length(names2==1)){
  eventGoodPBF<-append(eventGoodPBF,names2[1])
  plusPBFmanuf<-append(plusPBFmanuf, "GSPB")
}

#6

pppp%>%strsplit(.,")")%>%unlist -> names2
pppp<-"더큰)삼각마요1편"

if(names2[1]=='더큰'||'삼각'||'NEW'){
  eventwhatif<-append(eventwhatif,paste0(names2[1],")",names2[2]))
  whatif<-append(whatif, "GSPB")
}
eventwhatif 
whatif
