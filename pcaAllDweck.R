
library(readr)
library(psych)
library(stats)

dweckStudies1_2_4.orig <- read.csv("dweckAllData.csv")
dweckStudies1_2_4.itemsOnly <- dweckStudies1_2_4.orig[,3:ncol(dweckStudies1_2_4.orig)]
nfactors(dweckStudies1_2_4.itemsOnly)  ## hmmm...
dweckStudies1_2_4.pca <- principal(dweckStudies1_2_4.itemsOnly,nfactors=3,rotate="cluster")
print(dweckStudies1_2_4.pca)
write.csv(dweckStudies1_2_4.pca$loadings,"studies1_2_4Loadings.csv")