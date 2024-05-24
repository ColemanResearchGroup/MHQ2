# The overarching script for MHQ2
#
# author: "Johan Zvrskovec"
# date: '2023-12-20'
#
# This is the overarching script. It works as a wrapper around the coding scripts for individual parts of MHQ2, as of now.

# Clear global environment prior to initiation
remove(list = ls())

# Load dependencies
packages <- c("data.table", "tidyverse", "dplyr", "optparse")
lapply(X = packages, FUN = require, character.only = TRUE)

#parse command line arguments
clParser <- OptionParser()
clParser <- add_option(clParser, c("-i", "--input-data-file-path"), type="character", default=NA,
                       help="File path to a file to read as the data to process.\n")
clParser <- add_option(clParser, c("-o", "--output-data-file-path"), type="character", default=NA,
                       help="File path to a file to write as the processed data.\n")
clParser <- add_option(clParser, c("-v", "--variables"), type="character", default=NA,
                       help="A comma separated string with variable names to export from the processed data.\n")

clOptions<-parse_args(clParser)
argInputDataFilePath<-clOptions$`input-data-file-path`
argOutputDataFilePath<-clOptions$`output-data-file-path`
argVariables<-clOptions$variables

runAllScriptsOverarching <- function(
    dat=NULL,
    variablesToExtract=NULL,
    inputDataFilePath=NA,
    outputDataFilePath=NA,
    writeOutput=F,
    diagnosticsFlag=F   #set this to T if you want to print debugging information
    ){
  
  cat("\nRunning the MHQ2 overarching coding script.\n")
  
  
  #dedicated argument defaults - we cannot set these in the normal way because of the hard coded defaults from the run script
  if(is.na(outputDataFilePath)){
    outputDataFilePath<-"runAllScriptsOverarching.tsv"
  }
  

  
  toReturn<-c()
  
  # MHQ2 metadata
  # Describes datasets/instruments/scripts
  meta.scripts<-data.frame(matrix(data = NA,nrow = 0,ncol = 0))
  meta.scripts.dependency<-data.frame(matrix(data = NA,nrow = 0,ncol = 0))
  
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SELF_REPORTED","Self_reported")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SELF_REPORTED_ED","Self_reported_eating_disorder")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("ANXIETY","Anxiety")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("LT_DEPRESSION","Lifetime_depression")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("PHQ9","PHQ9")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SELF_HARM","Self_harm")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("TRAUMA","Trauma")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("MANIA","Mania")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("MORE_DEPRESSION","More_depression")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("AN","Anorexia_nervosa")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("BE_ND_AN","BE_not_during_AN")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("BED","Binge_eating_disorder")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("BN","Bulimia_nervosa")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("PURGINGD","Purging_disorder")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SUBSTANCES","Alcohol_cannabis")
  meta.scripts[nrow(meta.scripts)+1,c("code","filename.ex.suffix")]<-c("SOCIAL","Social_situations")

  producedVariables <- c(
    "MHQ2.SelfReportedDiagnosis",                  
    "MHQ2.SelfReportedDiagnosisMHQ2016Compatible",
    "MHQ2.SelfReportedAnxietyDisorder",            
    "MHQ2.SelfReportedEatingDisorder",            
    "MHQ2.SelfReportedAnorexiaNervosa",          
    "MHQ2.SelfReportedBulimiaNervosa",             
    "MHQ2.SelfReportedBingeEatingDisorder",
    "",
    "MHQ2.Gad7Score",                              
    "MHQ2.GadCurrent",                             
    "MHQ2.PanicSymptomsCount",                     
    "MHQ2.PanicAttacksEver",                       
    "MHQ2.PanicDisorder",                          
    "MHQ2.DepressionEverCase",                   
    "MHQ2.DepressionEverControl",                
    "MHQ2.DepressionSubthreshold",                
    "MHQ2.PHQ9NoInfo",                           
    "MHQ2.PHQ9Screen",                            
    "MHQ2.PHQ9Items",                            
    "MHQ2.PHQ9DerivedDepression",                
    "MHQ2.PHQ9Severity",                          
    "MHQ2.DepressedCurrent",                      
    "MHQ2.CurrentSubthresholdDepression",        
    "MHQ2.CurrentMoreSevereDepression",         
    "MHQ2.DepressedMedicationHelped",            
    "MHQ2.Depressed.non_medication.therapy.helped",
    "MHQ2.Not.Worth.Living",                       
    "MHQ2.Self.Harm.Ever",                         
    "MHQ2.Self.Harm.Ever.12m",                     
    "MHQ2.Suicide.Attempt",
    "MHQ2.TraumaChildhood",
    "MHQ2.TraumaAdulthood",
    "MHQ2.Trauma12Months",
    "MHQ2.Total.Manifestations",                   
    "MHQ2.Hypomania.Ever",                         
    "MHQ2.Mania.Ever",                             
    "MHQ2.BD1",                                    
    "MHQ2.Wider.Bipolar",                          
    "MHQ2.depression.single",                      
    "MHQ2.depression.recurrent",                   
    "MHQ2.depression.single.event",                
    "MHQ2.depression.postnatal",                   
    "MHQ2.depression.melancholic",                 
    "MHQ2.depression.atypical",                    
    "MHQ2.LW_made_yourself_vomit",                 
    "MHQ2.LW_used_laxatives",                      
    "MHQ2.LW_used_diuretics",                      
    "MHQ2.LW_used_weight_loss_pills",              
    "MHQ2.LW_excessive_exercise",                  
    "MHQ2.LW_fasted",                              
    "MHQ2.LW_other_weight_control",                
    "MHQ2.BMI_at_low_weight",                     
    "MHQ2.Anorexia_nervosa",                       
    "MHQ2.Anorexia_nervosa_binge_eating_purging",  
    "MHQ2.Anorexia_nervosa_restricting",           
    "MHQ2.BE_not_during_AN",                       
    "MHQ2.BE_rapid_eating_numeric",                
    "MHQ2.BE_feeling_uncomf_full_numeric",         
    "MHQ2.BE_large_amounts_not_hungry_numeric",    
    "MHQ2.BE_eaten_alone_embarrassed_numeric",     
    "MHQ2.BE_disgusted_depressed_after_numeric",   
    "MHQ2.BE_no_characteristics_numeric",          
    "MHQ2.BE_characteristics_PTNA_numeric",        
    "MHQ2.BE_characteristics_sumscore",            
    "MHQ2.Binge_eating_disorder",                  
    "MHQ2.BE_made_yourself_vomit",                 
    "MHQ2.BE_used_laxatives",                      
    "MHQ2.BE_used_diuretics",                      
    "MHQ2.BE_used_weight_loss_pills",              
    "MHQ2.BE_excessive_exercise",                  
    "MHQ2.BE_fasted",                              
    "MHQ2.BE_other_weight_control",                
    "MHQ2.Bulimia_nervosa",                        
    "MHQ2.Purging_disorder",
    "MHQ2.Sum_AUDIT",
    "MHQ2.alcohol_hazardous_use",
    "MHQ2.alcohol_harmful_use",
    "MHQ2.alcohol_nonuse",
    "MHQ2.cannabis_use",
    "MHQ2.daily_cannabis_use",
    "MHQ2.social_isolation",
    "MHQ2.virtually_connected",
    "MHQ2.UCLA_loneliness_sum",
    "MHQ2.BRS"
  )
  
  toReturn$producedVariables<-producedVariables
  
  if(length(variablesToExtract)>0){
    #assess misspecified variables in variablesToExtract
    misspecifiedVariables <- variablesToExtract[!(variablesToExtract %in% producedVariables)]
    if(length(misspecifiedVariables)>0){
      warning("There are specified variables that are not produced by this script.")
      warning("The script will terminate and return further information.")
      warning("A list of misspecified variables is in the return object misspecifiedVariables.")
      warning("Note that the script uses case sensitive matching for specified variables.\n")
      toReturn$misspecifiedVariables<-misspecifiedVariables
      return(toReturn)
    }
  }
  
  requiredVariables <- c(
    "eid", #UK Biobank ID
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
    "29205-0.0", #Has answered ED section of MHQ2
    "29091-0.0",
    "29092-0.0",
    "29093-0.0",
    "29094-0.0",
    "29095-0.0",
    "29096-0.0",
    "29097-0.0",
    "29098-0.0",
    "29099-0.0",
    "29100-0.0",
    "20117-0.0",
    "2664-0.0", #Reason for stopping drinking
    "29104-0.0",
    "29107-0.0",
    "29162-0.0",
    "29163-0.0",
    "29167-0.0",
    "29164-0.0",
    "29168-0.0",
    "29172-0.0",
    "29173-0.0",
    "29174-0.0",
    "29175-0.0",
    "29177-0.0",
    "29179-0.0",
    "29176-0.0",
    "29178-0.0",
    "29180-0.0",
    "20117-0.0" #Alcohol dependence from baseline
  )
  
  requiredVariables<-unlist(requiredVariables)
  
  toReturn$requiredVariables <- requiredVariables
  
  # Read data
  # All scripts must use the same variable for holding the data; dat
  if(is.null(dat)){
    if(!is.na(inputDataFilePath)){
      #Rds-file
      if(any(grep(pattern = "\\.rds$", x = inputDataFilePath, ignore.case = T))){
        dat <- readRDS(inputDataFilePath)
      } else { #assume tsv format otherwise
        dat <- fread(file = inputDataFilePath, na.strings =c(".",NA,"NA",""), encoding = "UTF-8",check.names = T, fill = T, blank.lines.skip = T, data.table = F, nThread = nThreads, showProgress = F)
      }
    } else {
      stop("No input file specified\n")
    }
  }
  
  #assess missing variables in dat
  missingVariables <- requiredVariables[!(requiredVariables %in% colnames(dat))]
  
  if(length(missingVariables)>0){
    warning("There are required variables missing. The script will terminate and return further information. A list of missing variables is in the returned sub-object missingVariables.\n")
    toReturn$missingVariables<-missingVariables
    return(toReturn)
  }

  #+++JZ: Did we expect there to be a variable called eid? Now we have both eid and ID because the scripts use ID.
  if(!any(colnames(dat)=="eid")) dat$eid<-1:nrow(dat)
  dat$ID<-dat$eid #this is a temporary ID variable to be able to link copies of derived datasets with the original
  
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
  
  if(length(variablesToExtract)>0){
    toReturn$processedDat<-toReturn$processedDat[,variablesToExtract] #do we want to have a case-insensitive option here?
  }
  
  if(writeOutput){
    data.table::fwrite(x = toReturn$processedDat,file = outputDataFilePath, append = F,quote = F,sep = "\t",col.names = T)
  }
  
  cat("\nThe data has been processsed and the resulting dataframe is in the returned sub-object processedDat.\n")
  
  return(toReturn)
  

}

#execute function if we run from the command line
if(interactive()==FALSE){
  cat("\nWelcome to the MHQ2 overarching coding script.\n")
  if(!is.na(argInputDataFilePath)){
    #we need to at least specify an input file to run the script
    
    argVariables2<-NA
    if(!is.na(argVariables)) argVariables2<-unlist(strsplit(argVariables,split = ",",fixed = TRUE))
    
    runAllScriptsOverarching(
      inputDataFilePath = argInputDataFilePath,
      outputDataFilePath = argOutputDataFilePath,
      variablesToExtract = argVariables2,
      writeOutput = TRUE
    )
  } else {
    print_help(clParser)
  }
}


#test of whole function
# result <-runAllScriptsOverarching(
#   variablesToExtract = c("Depressed.Current","Mania.Ever"),
#   inputDataFilePath = 'data/MHQ2_Height_Alcohol_Field_Anonymous.Rds'
#   )

#misspecified variable
# result <-runAllScriptsOverarching(
#   variablesToExtract = c("Depressed.Current","Mania.Ever","crap"),
#   inputDataFilePath = 'data/MHQ2_Height_Alcohol_Field_Anonymous.Rds'
#   )

