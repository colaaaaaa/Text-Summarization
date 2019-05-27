rm(list=ls())
args = commandArgs(trailingOnly=TRUE)
td="/mnt/c/Users/Yogesh Kushwah/Desktop/major/tempdir"
singleString<-NULL
require(tm)
my.corpus <- Corpus(DirSource(td));

docss <- my.corpus;
dtmm <- DocumentTermMatrix(docss);
C<-  DocumentTermMatrix(docss);
#inspect(dtmm);
library(philentropy)
dtmd <- distance(as.matrix(dtmm),as.matrix(dtmm), method="jaccard")
rownames(dtmd)<-rownames(dtmm);
colnames(dtmd)<-rownames(dtmm)
dtmd <- as.matrix(dtmd);
#dtmd
for(i in 1: nrow(dtmd))
{
  for(j in 1 : ncol(dtmd))
  {  dtmd[i,j]=1-dtmd[i,j]
  #cossim[i,j]=1-cossim[i,j]
  }
}

A<-dtmd
#Making normalized matrix for page rank
Nr<-matrix(0, nrow(A),ncol(A))
N<-matrix(0, nrow(A),ncol(A))

for(i in 1: nrow(A))
{ od=0
for(k in 1:nrow(A))
{
  if(A[i,k]==0)
  {
    od=od+1
  }
}
#print(od)
for(j in 1: ncol(A))
{ 
  if((nrow(A)-od-1)!=0)
  {
  N[i,j] <- A[i,j]/(nrow(A)-od-1)
  }
  else
  {
    N[i,j]=A[i,j]
  
    }
  
  Nr[i,j] <- 1/(nrow(A))
  if(i==j)
  {N[i,j]=0
  }
  
}
}
#Nr
sum<-colSums(A)

for(i in 1: nrow(A))
{
  for(j in 1:ncol(A))
  {
    if(sum[j]==0)
    {
      N[i,j]=1/(nrow(A))
    }
  }
  
}
#N
M <- 0.85*N + 0.15*Nr  # M is final matrix with dampling factor d=0.85
B<-matrix(0,nrow=nrow(C),ncol=ncol(C))
C<-as.matrix(C)
rsum<-rowSums(C)
rsum<-as.matrix(rsum)
rsum<-t(rsum)
for(i in 1: nrow(C))
{
  for(j in 1: ncol(C))
  {
    if(rsum[i]!=0)
    {
    B[i,j]<-C[i,j]/rsum[i] 
    }
  }
}
#B
p1 <- runif(nrow(A), 1, 1)
a<-1
p2 <- (a*M+(1-a)*B%*%t(B))%*%p1
#p2
q<-1
while( sum((p2-p1)^2) >= 0.001)
{ q<-q+1
p1 <- p2
p2 <- (a*M+(1-a)*B%*%t(B))%*%p1
#print(p2)
}
q#rownames(p2)<-rownames(A)
rnames<-rownames(A)
#p2# final corank converged vector
sen <- matrix(,2,nrow(A))
sen[,1:nrow(A)] <- rownames(A)
for(e in 1: length(p2))
{sen[1,e]<-rnames[e]
 sen[2,e]<-as.numeric(p2[e])
}

sen<-t(sen)
sen <- sen[order(sen[,2],decreasing = T,method = c("radix")),]
print(sen)
names<-sen[1:length(p2)]
names<-gsub('.{4}$', '', names)
path<-args[1]
path<-substr(path, 1, nchar(path)-4) 
#path<-substr(path,0,3)
path<-paste(toString(path),".csv",sep="",collapse = NULL)
path <- paste("/mnt/c/Users/Yogesh Kushwah/Desktop/major/summary_csv/",path,sep="",collapse = NULL)
write.table(names,path, sep = ",", row.names = FALSE, col.names = FALSE)


