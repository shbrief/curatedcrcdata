rm(list=ls())
source("../../functions.R")

uncurated <- read.csv("../uncurated/GSE21510_full_pdata.csv",as.is=TRUE,row.names=1)

##initial creation of curated dataframe
curated <- initialCuratedDF(rownames(uncurated),template.filename="template_crc.csv")

##--------------------
##start the mappings
##--------------------


##title -> alt_sample_name
curated$alt_sample_name <- uncurated$title

##sample_type
tmp <- uncurated$characteristics_ch1.2
tmp[tmp=="tissue: cancer, LCM"] <-"tumor"
tmp[tmp=="tissue: normal, homogenized"] <-"adjacentnormal"
tmp[tmp=="tissue: cancer, homogenized"] <-"tumor"
curated$sample_type <- tmp


##stage -> T
tmp <- uncurated$characteristics_ch1.1
tmp <- sub("stage: ","",tmp,fixed=TRUE)
tmp <- gsub("[^\\d]","",tmp,perl=TRUE)
curated$T <- tmp 


##summarystage
tmp<-uncurated$characteristics_ch1.1
tmp <- gsub("[^\\d]","",tmp,perl=TRUE)
tmp[tmp=="0"] <-NA
tmp[tmp=="1"] <-"early"
tmp[tmp=="2"] <-"early"
tmp[tmp=="3"] <-"late"
tmp[tmp=="4"] <-"late"
curated$summarystage <- tmp 

##M
tmp <- uncurated$characteristics_ch1
tmp[tmp=="metastasis: metastatic recurrence"] <-"1"
tmp[tmp=="metastasis: none"] <-"0"
tmp[tmp=="metastasis: metastasis"] <-"1"
curated$M <- tmp


curated <- postProcess(curated, uncurated)
write.table(curated, row.names=FALSE, file="../curated/GSE21510_curated_pdata.txt",sep="\t")
