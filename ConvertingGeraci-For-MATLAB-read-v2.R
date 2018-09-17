
setwd("/SinaMc/University/codeMy/CodePaper1-UsingMatrixcompletion/ConvertingGeraci-For-MATLAB/ReadMatrices/reads/")


R=matrix(0,90*100,100)
lengAll=matrix(0,100,1)

rowIDX=0;
for (ii in 0:99 ) {
  data_R=read.delim(paste("exp", ii,".m.AT", sep=""),header = F)
  
  leng=dim(data_R)[1]
  lengAll[ii+1]=leng
  for (i in 1:leng ) {
    rowIDX=rowIDX+1
    
    for (j in 1:100 ) {
      if (substr(data_R[i,],j,j)=='t') {
        R[rowIDX,j]=-1}
      if (substr(data_R[i,],j,j)=='a') {
        R[rowIDX,j]=1}
    }
  }
}


R1=as.data.frame(R[1:rowIDX,],col.names=F)
colnames(R1)=NULL

write.csv(R1,  file ="ReadMatrix.txt", row.names = F)
write.csv(lengAll,  file ="NumberRowsofMatrix.txt")

