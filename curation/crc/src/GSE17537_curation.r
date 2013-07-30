rm(list=ls())

source("../../functions.R")
uncurated <- read.csv("../uncurated/GSE17537_full_pdata.csv",as.is=TRUE,row.names=1)

##initial creation of curated dataframe
curated <- initialCuratedDF(rownames(uncurated),template.filename="template_crc.csv")

##alt_sample_name
##age
##gender
##ethnicity
##ajcc_stage
##grade
##summarygrade
##vital_status
##recurrence_status
##days_to_death

#alt_sample_name
curated$alt_sample_name <- uncurated$title

#age
tmp <- apply(uncurated,1,getVal,string="age: ")
tmp <- sub("age: ","",tmp[1,],fixed=TRUE)
curated$age_at_initial_pathologic_diagnosis <- tmp

#gender
tmp <- apply(uncurated,1,getVal,string="gender: ")
tmp <- sub("gender: ","",tmp,fixed=TRUE)
tmp[tmp=="male"] <- "m"
tmp[tmp=="female"] <- "f"
curated$gender <- tmp

#ethnicity
tmp <- apply(uncurated,1,getVal,string="ethnicity: ")
tmp <- sub("ethnicity: ","",tmp,fixed=TRUE)
tmp[tmp=="other (not caucasian, black, or hispanic)"] <- "other"
curated$ethnicity <- tmp

#ajcc_stage -> stageall
tmp <- apply(uncurated,1,getVal,string="ajcc_stage: ")
tmp <- sub("ajcc_stage: ","",tmp,fixed=TRUE)
curated$stageall <- tmp

#G
tmp <- apply(uncurated,1,getVal,string="grade: ")
tmp <- gsub("[^\\d]","",tmp,perl=TRUE)
tmp[tmp=="21"] <- "2"
curated$G <- tmp

##summarygrade
tmp <- apply(uncurated,1,getVal,string="grade: ")
tmp <- gsub("[^\\d]","",tmp,perl=TRUE)
tmp[tmp=="1"] <- "low"
tmp[tmp=="2"] <- "low"
tmp[tmp=="3"] <- "high"
tmp[tmp=="4"] <- "high"
tmp[tmp=="21"] <- "low"
tmp[tmp==""] <- NA
curated$summarygrade <- tmp


##vital_status
tmp <- apply(uncurated,1,getVal,string="overall_event (death from any cause): ")
tmp <- sub("overall_event (death from any cause): ","",tmp,fixed=TRUE)
tmp[tmp=="no death"] <- "living"
tmp[tmp=="death"] <- "deceased"
curated$vital_status <- tmp

##recurrence_status
tmp <- apply(uncurated,1,getVal,string="dfs_event (disease free survival; cancer recurrence):")
tmp <- sub("dfs_event (disease free survival; cancer recurrence): ","",tmp,fixed=TRUE)
tmp[tmp=="no recurrence"] <- "norecurrence"
curated$recurrence_status <- tmp

##days_to_death
tmp <- apply(uncurated,1,getVal,string="overall survival follow-up time:")
tmp <- sub("overall survival follow-up time: ","",tmp,fixed=TRUE)
tmp <- as.numeric(tmp)
tmp <- tmp * 30  #months to days
curated$days_to_death <- tmp

##days_to_tumor_recurrence
tmp <- apply(uncurated,1,getVal,string="dfs_time:")
tmp <- sub("dfs_time: ","",tmp,fixed=TRUE)
tmp <- as.numeric(tmp)
tmp <- tmp * 30  #months to days
curated$days_to_tumor_recurrence <- tmp

curated <- postProcess(curated, uncurated)
write.table(curated, row.names=FALSE, file="../curated/GSE17537_curated_pdata.txt",sep="\t")

##Questions:
##dfs_time==days_to_tumor_recurrence?
##what is dss_time?
