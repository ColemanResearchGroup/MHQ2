# The overarching script for MHQ2
#
# author: "Johan Zvrskovec"
# date: '2023-12-20'
#
# This is the overarching script. It works as a wrapper around the coding scripts for individual parts of MHQ2, as of now. It may be easier in the end to just paste all code into one script, when most of the reviews are done.

# Clear global environment prior to initiation
remove(list = ls())

# Load dependencies
# Summarytools is not needed for the overarching script
packages <- c("data.table", "tidyverse", "dplyr") #"summarytools"
lapply(X = packages, FUN = require, character.only = TRUE)

# MHQ2 metadata
# Describes datasets/instruments/scripts
meta.scripts<-data.frame(matrix(data = NA,nrow = 0,ncol = 0))
meta.scripts.dependency<-data.frame(matrix(data = NA,nrow = 0,ncol = 0))

meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SELF_REPORTED","SelfReported")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SELF_REPORTED_ED","Self_reported_eating_disorder")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("ANXIETY","Anxiety")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("LT_DEPRESSION","MHQ2_Lifetime_Depression")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("PHQ9","MHQ2_PHQ9")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SELF_HARM","self-harm_mhq2_jgm")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("TRAUMA","trauma")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("MANIA","MHQ2_Mania_v1")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("MORE_DEPRESSION","MHQ2_More_Depression")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("AN","Anorexia_nervosa")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("BE_ND_AN","BE_not_during_AN")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("BED","Binge_eating_disorder")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("BN","Bulimia_nervosa")
meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("PURGINGD","Purging_disorder")


requiredVariables <- c(
  paste0("29000-0.",0:19), #self reported diagnoses
  paste0("2900",2:9,"-0.0"), #Depression ever
  paste0("290",10:12,"-0.0"), #Depression ever
  paste0("290",14:15,"-0.0"), #Depression ever
  "29018-0.0",
  "29021-0.0",
  "29022-0.0",
  "29026-0.0",
  "29027-0.0",
  "29029-0.0",
  paste0("29038-0.",0:2), #medication helped symptoms of depression
  paste0("29039-0.",0:6), #medication helped symptoms of depression
  paste0("290",40:48,"-0.0"), #medication/non-medication helped symptoms of depression
  paste0("290",49:50,"-0.0"),#mania
  paste0("29051-0.",0:7),#mania
  "29052-0.0",
  "29056-0.0",
  "29057-0.0",
  paste0("290",58:64,"-0.0"), #gad7
  paste0("29065-0.",0:12),#Panic attack symptoms
  "29067-0.0",
  "29068-0.0",
  "29069-0.0",
  "29070-0.0",
  "29074-0.0",
  "29075-0.0",
  paste0("290",76:90,"-0.0"), #trauma, abuse
  "29108-0.0", #self harm
  "29111-0.0",
  "29114-0.0",
  "29116-0.0"
  #HERE!!!!
)

requiredVariables<-unlist(requiredVariables)

#for testing
#dat <- readRDS('data/MHQ2_Height_Alcohol_Field_Anonymous.rds')
#inputDataFilePath <- 'data/MHQ2_Height_Alcohol_Field_Anonymous.Rds'

runAllScriptsOverarching <- function(
    dat=NULL,
    variablesToExtract=NULL,
    inputDataFilePath=NULL,
    outputDataFilePath="runAllScriptsOverarching.tsv",
    writeOutput=F
    ){
  
  # Read data
  # All scripts must use the same variable for holding the data; dat
  if(is.null(dat)){
    if(!is.null(inputDataFilePath)){
      #Rds-file
      if(any(grep(pattern = "\\.rds$", x = inputDataFilePath, ignore.case = T))){
        dat <- readRDS(inputDataFilePath)
      } else { #assume tsv format otherwise
        dat <- fread(file = inputDataFilePath, na.strings =c(".",NA,"NA",""), encoding = "UTF-8",check.names = T, fill = T, blank.lines.skip = T, data.table = F, nThread = nThreads, showProgress = F)
      }
    } else {
      stop("No input file specified")
    }
  }

  dat$ID<-1:nrow(dat) #this is a temporary ID variable to be able to link copies of derived datasets with the original
  
  # Process
  # Execute all scripts from the source. These must be configured to be compatible with this process.
  for(iDS in 1:nrow(meta.scripts)){
    #iDS <- 2 #test
    
    cCode<-meta.scripts[iDS,c("code")]
    cFilename<-meta.scripts[iDS,c("filename.ex.suffix")]
    #as R - this puts the files in the working directory root though
    knitr::purl(
      file.path("scripts",paste0(cFilename,".Rmd"))
    )
    source(
      paste0(cFilename,".R")
    )
  }

}
#skimr::skim(dat)
