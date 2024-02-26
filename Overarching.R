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
  
  toReturn<-c()
  
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
  
  producedVariables <- c(
    "ID",                                     
    "SelfReportedDiagnosis",                  
    "SelfReportedDiagnosisMHQ2016Compatible",
    "SelfReportedAnxietyDisorder",            
    "SelfReportedEatingDisorder",            
    "SelfReportedAnorexiaNervosa",          
    "SelfReportedBulimiaNervosa",             
    "SelfReportedBingeEatingDisorder",        
    "Gad7Score",                              
    "GadCurrent",                             
    "PanicSymptomsCount",                     
    "PanicAttacksEver",                       
    "PanicDisorder",                          
    "depression.ever.case",                   
    "depression.ever.control",                
    "depression.subthreshold",                
    "PHQ9.No.Info",                           
    "PHQ9.Screen",                            
    "PHQ9.Items",                            
    "PHQ9.derived.depression",                
    "PHQ9.Severity",                          
    "Depressed.Current",                      
    "Current.subthreshold.Depression",        
    "Current.more.severe.depression",         
    "29038",                                  
    "29039",                                
    "Depressed.medication.helped",            
    "29047",                                  
    "Depressed.non_medication.therapy.helped",
    "Not.Worth.Living",                       
    "Self.Harm.Ever",                         
    "Self.Harm.Ever.12m",                     
    "Suicide.Attempt",                        
    "Total.Manifestations",                   
    "Hypomania.Ever",                         
    "Mania.Ever",                             
    "BD1",                                    
    "Wider.Bipolar",                          
    "depression.single",                      
    "depression.recurrent",                   
    "depression.single.event",                
    "depression.postnatal",                   
    "depression.melancholic",                 
    "depression.atypical",                    
    "LW_made_yourself_vomit",                 
    "LW_used_laxatives",                      
    "LW_used_diuretics",                      
    "LW_used_weight_loss_pills",              
    "LW_excessive_exercise",                  
    "LW_fasted",                              
    "LW_other_weight_control",                
    "BMI_at_low_weight",                     
    "Anorexia_nervosa",                       
    "Anorexia_nervosa_binge_eating_purging",  
    "Anorexia_nervosa_restricting",           
    "BE_not_during_AN",                       
    "BE_rapid_eating_numeric",                
    "BE_feeling_uncomf_full_numeric",         
    "BE_large_amounts_not_hungry_numeric",    
    "BE_eaten_alone_embarrassed_numeric",     
    "BE_disgusted_depressed_after_numeric",   
    "BE_no_characteristics_numeric",          
    "BE_characteristics_PTNA_numeric",        
    "BE_characteristics_sumscore",            
    "Binge_eating_disorder",                  
    "BE_made_yourself_vomit",                 
    "BE_used_laxatives",                      
    "BE_used_diuretics",                      
    "BE_used_weight_loss_pills",              
    "BE_excessive_exercise",                  
    "BE_fasted",                              
    "BE_other_weight_control",                
    "Bulimia_nervosa",                        
    "Purging_disorder"      
  )
  
  
  requiredVariables <- c(
    "50-0.0", #Adult height at sign up to UK Biobank
    paste0("29000-0.",0:19), #self reported diagnoses
    paste0("2900",2:9,"-0.0"), #Depression ever
    paste0("290",10:15,"-0.0"), #Depression ever
    "29016-0.0",
    "29017-0.0",
    "29018-0.0",
    "29019-0.0",
    "29020-0.0",
    "29021-0.0",
    "29022-0.0",
    "29024-0.0",
    "29025-0.0",
    "29026-0.0",
    "29027-0.0",
    "29028-0.0",
    "29029-0.0",
    "29032-0.0",
    "29033-0.0", #Depression, number of episodes
    "29035-0.0", #Post-natal depression
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
    "29116-0.0",
    "29125-0.0",#Anorexia nervosa
    "29122-0.0",
    "29123-0.0",
    "29124-0.0",
    "29128-0.0",
    "29129-0.0",
    paste0("29130-0.",0:6), #Anorexia nervosa
    "29132-0.0",#Binge eating disorder
    "29133-0.0",
    "29134-0.0",
    "29135-0.0",
    "29137-0.0",
    paste0("29136-0.",0:4), #Binge eating disorder
    paste0("29140-0.",0:6), #Binge eating disorder, Bulimia nervosa
    "29141-0.0", #Bulimia nervosa
    "29143-0.0",
    "29144-0.0", #Purging disorder
    "29145-0.0",
    "29146-0.0",
    "29205-0.0" #Has answered ED section of MHQ2
    
  )
  
  requiredVariables<-unlist(requiredVariables)
  
  toReturn$requiredVariables <- requiredVariables
  
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
  
  #assess missing variables in dat
  missingVariables <- requiredVariables[!(requiredVariables %in% colnames(dat))]
  
  if(length(missingVariables)>0){
    warning("There are required variables missing. The script will terminate and return further information. A list of missing variables is in the return object missingVariables.")
    toReturn$missingVariables<-missingVariables
    return(toReturn)
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
      paste0(cFilename,".R"),
      local=TRUE #execute in local environment i.e. the function
    )
  }
  
  
  #export results
  toReturn$processedDat<-dat[,producedVariables]
  
  if(writeOutput){
    data.table::fwrite(x = toReturn$processedDat,file = outputDataFilePath, append = F,quote = F,sep = "\t",col.names = T)
  }
  
  return(toReturn)
  

}
