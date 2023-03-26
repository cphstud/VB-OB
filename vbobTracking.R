library(dplyr)
myDf=read.table("testout.json",sep = ",")
myDf=read.table("vbob.csv",sep = ",")

myDf = myDf %>% rename("frameIdx"=V1)
myDf = myDf %>% rename("gameClock"=V2)

myDfChar=myDf %>% select(1,c(3:13,36:46))
myDfNum=myDf %>% select(1,2,c(14:35),c(47:70))
myDfNumCp=myDfNum$frameIdx

collist=list()
for (i in 1:nrow(myDfNum)) {
  counter=1
    tmplist=list()
    tmplist[[1]]=myDfNum[i,1]
    tmplist[[2]]=myDfNum[i,2]
  for (hc in 3:13) {
    counter=counter+1
    v=c(myDfNum[i,hc],myDfNum[i,hc+11])
    tmplist[[counter]]=v
  }
  for (ac in 25:35) {
    counter=counter+1
    v=c(myDfNum[i,ac],myDfNum[i,ac+11])
    tmplist[[counter]]=v
  }
  vball=c(myDfNum[i,47],myDfNum[i,48])
  counter=counter+1
  tmplist[[counter]]=vball
  collist[[i]]=tmplist
}

