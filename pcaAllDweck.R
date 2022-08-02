########################
### Experiment setup ###
########################

whoami <- Sys.info()[["user"]]
if (whoami == "trafton") {
    experimentName <- "fullDweckPCA"
    workingDirectory <- "~/Documents/graphics/AnnaGarren/"
}
## source(paste0(workingDirectory, "R/helper.R"))
## graphSaveDirectory <- paste0(workingDirectory, "graphs/", experimentName, "/")
## dataDirectory <- paste0(workingDirectory, "data/raw/", experimentName, "/")
setwd(paste0(workingDirectory, "/", experimentName))
## VerifyPathIsSafe(graphSaveDirectory)
## VerifyPathIsSafe(dataDirectory)

## source(paste0(workingDirectory, "R/GetData", experimentName, ".R"))

library(readr)
library(psych)
library(stats)
performPCA <- function(data){
  pca <- principal(data,nfactors=3,rotate="varimax")
  return(pca)
}

RUNORIGINAL <- FALSE

if (RUNORIGINAL) {
fullData.orig <- read.csv("dweckAllData.csv")
fullData <- fullData.orig[,3:ncol(fullData.orig)]
fullData.m <- as.matrix(fullData)
##fullData <- matrix(as.numeric(fullData),ncol=ncol(fullData))
fullData.t <- t(fullData.m)
pca <- performPCA(fullData)
pca <- performPCA(fullData.m)
pca <- performPCA(fullData.t)
pca$loadings
loadings <- c(pca$loadings)
loadings <- matrix(loadings,nrow=40,ncol=3)
items <- as.data.frame(read.csv("dweckAllData.csv")[,2])
colnames(items) <- c("items")
loadings <- cbind(items,loadings)
write.csv(loadings,"loadingsAllDweck.csv")
}


### beetle test

## fullData.orig <- read.csv("dweckAllData.csv")
## fullData.beetle <- subset(fullData.orig, condition == "stapler")
## fullData.beetle <- fullData.beetle[,3:ncol(fullData.beetle)]
## fullData.m <- as.matrix(fullData.beetle)
## ##fullData <- matrix(as.numeric(fullData),ncol=ncol(fullData))
## fullData.t <- t(fullData.m)
## pca <- performPCA(fullData)


## greg version

## I think when you constructed the dweckAllData.csv file, you put it
## into a format for pca.  So tranforming it again mucks it up.  Below, I
## use your principal call directly.  This should work for you as well.

dweckStudies1_2_4.orig <- read.csv("dweckAllData.csv")
dweckStudies1_2_4.itemsOnly <- dweckStudies1_2_4.orig[,3:ncol(dweckStudies1_2_4.orig)]
nfactors(dweckStudies1_2_4.itemsOnly)  ## hmmm...
dweckStudies1_2_4.pca <- principal(dweckStudies1_2_4.itemsOnly,nfactors=3,rotate="varimax")
print(dweckStudies1_2_4.pca)
