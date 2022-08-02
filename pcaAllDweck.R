
library(readr)
library(psych)
library(stats)
performPCA <- function(data){
  pca <- principal(data,nfactors=3,rotate="varimax")
  return(pca)
}

fullData <- read.csv("dweckAllData.csv")
fullData <- fullData[,3:ncol(fullData)]
fullData <- as.matrix(fullData)
fullData <- matrix(as.numeric(fullData),ncol=ncol(fullData))
fullData <- t(fullData)
pca <- performPCA(fullData)
pca$loadings
loadings <- c(pca$loadings)
loadings <- matrix(loadings,nrow=40,ncol=3)
items <- as.data.frame(read.csv("dweckAllData.csv")[,2])
colnames(items) <- c("items")
loadings <- cbind(items,loadings)
write.csv(loadings,"loadingsAllDweck.csv")
