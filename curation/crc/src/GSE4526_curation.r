rm(list=ls())

source("../../functions.R")

uncurated <- read.csv("../uncurated/GSE4526_full_pdata.csv",as.is=TRUE,row.names=1)

##initial creation of curated dataframe
curated <- initialCuratedDF(rownames(uncurated),template.filename="template_crc.csv")


##title -> alt_sample_name
tmp <- uncurated$title
curated$alt_sample_name <- tmp

##stageall
curated$stageall <- "3"

##recurrence_status (-) = did not develop; (+) = developed recurrence
tmp <- uncurated$description
tmp[tmp=="Recurrence(+)"] <- "recurrence"
tmp[tmp=="Recurrence(-)"] <- "norecurrence"
curated$recurrence_status <- tmp


curated <- postProcess(curated, uncurated)

write.table(curated, row.names=FALSE, file="../curated/GSE4526_curated_pdata.txt",sep="\t")