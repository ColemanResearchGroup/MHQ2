# Load dependencies

packages <- c("data.table", "tidyverse", "dplyr",  "Hmisc", "stringi")
lapply(X = packages, FUN = require, character.only = TRUE)

# Read in the data

Full_Data_MHQ2 <- readRDS("../Full_Data_MHQ1_MHQ2_Update_2024_03_08.rds")

# Table 1 - Sample sizes

# Completed MHQ2: Marked as having completed all sections
# 29197 When online Mental health questionnaire completed
# 29198 When online Depression questionnaire completed
# 29199 When online Mood changes questionnaire completed
# 29200 When online Anxiety and panic questionnaire completed
# 29201 When online Adverse life events questionnaire completed
# 29202 When online Alcohol use questionnaire completed
# 29203 When online Cannabis use questionnaire completed
# 29204 When online Harm behaviours questionnaire completed
# 29205 When online Eating patterns questionnaire completed
# 29206 When online General health questionnaire completed
# 29207 When online COVID-19 questionnaire completed
# 29208 When online Social situation questionnaire completed
# 29209 When online General well-being questionnaire completed

sink("Table1.txt")

writeLines("Stage Number")
writeLines("UK.Population DEFINED.ELSEWHERE")
writeLines("Invites DEFINED.ELSEWHERE")
writeLines("Started DEFINED.ELSEWHERE")
writeLines(paste0("Completed ", sum(Full_Data_MHQ2$MHQ2_Completed, na.rm=T)))

sink()

## Age median

# UKB

UKB.Age.Median <- median(Full_Data_MHQ2$UKB.Age, na.rm = TRUE)

# MHQ1

MHQ1.Age.Median <- median(Full_Data_MHQ2$MHQ1.Age, na.rm = TRUE)

# MHQ2

MHQ2.Age.Median <- median(Full_Data_MHQ2$MHQ2.Age, na.rm = TRUE)

# Table 2 – Sample characteristics

sink("Table2.txt")

## Header
cat("Measure\tSub-measure\tMHQ2\tMHQ1\tMHQ2-MHQ1\tUKB\tMHQ2-UKB\n")

## Age
cat("Age\t45-54\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[1], paste(round(prop.table(table(Full_Data_MHQ2$MHQ2.Age.Bands))[1],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ1.Age.Bands)[1], paste(round(prop.table(table(Full_Data_MHQ2$MHQ1.Age.Bands))[1],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[1] - table(Full_Data_MHQ2$MHQ1.Age.Bands)[1], "\t")
cat(table(Full_Data_MHQ2$UKB.Age.Bands)[1], paste(round(prop.table(table(Full_Data_MHQ2$UKB.Age.Bands))[1],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[1] - table(Full_Data_MHQ2$UKB.Age.Bands)[1], "\n")

cat("Age\t55-64\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[2], paste(round(prop.table(table(Full_Data_MHQ2$MHQ2.Age.Bands))[2],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ1.Age.Bands)[2], paste(round(prop.table(table(Full_Data_MHQ2$MHQ1.Age.Bands))[2],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[2] - table(Full_Data_MHQ2$MHQ1.Age.Bands)[2], "\t")
cat(table(Full_Data_MHQ2$UKB.Age.Bands)[2], paste(round(prop.table(table(Full_Data_MHQ2$UKB.Age.Bands))[2],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[2] - table(Full_Data_MHQ2$UKB.Age.Bands)[2], "\n")

cat("Age\t65-74\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[3], paste(round(prop.table(table(Full_Data_MHQ2$MHQ2.Age.Bands))[3],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ1.Age.Bands)[3], paste(round(prop.table(table(Full_Data_MHQ2$MHQ1.Age.Bands))[3],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[3] - table(Full_Data_MHQ2$MHQ1.Age.Bands)[3], "\t")
cat(table(Full_Data_MHQ2$UKB.Age.Bands)[3], paste(round(prop.table(table(Full_Data_MHQ2$UKB.Age.Bands))[3],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[3] - table(Full_Data_MHQ2$UKB.Age.Bands)[3], "\n")

cat("Age\t75-84\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[4], paste(round(prop.table(table(Full_Data_MHQ2$MHQ2.Age.Bands))[4],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ1.Age.Bands)[4], paste(round(prop.table(table(Full_Data_MHQ2$MHQ1.Age.Bands))[4],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[4] - table(Full_Data_MHQ2$MHQ1.Age.Bands)[4], "\t")
cat(table(Full_Data_MHQ2$UKB.Age.Bands)[4], paste(round(prop.table(table(Full_Data_MHQ2$UKB.Age.Bands))[4],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[4] - table(Full_Data_MHQ2$UKB.Age.Bands)[4], "\n")

cat("Age\t85+\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[5], paste(round(prop.table(table(Full_Data_MHQ2$MHQ2.Age.Bands))[5],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ1.Age.Bands)[5], paste(round(prop.table(table(Full_Data_MHQ2$MHQ1.Age.Bands))[5],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[5] - table(Full_Data_MHQ2$MHQ1.Age.Bands)[5], "\t")
cat(table(Full_Data_MHQ2$UKB.Age.Bands)[5], paste(round(prop.table(table(Full_Data_MHQ2$UKB.Age.Bands))[5],2)*100, "%", sep=""),"\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands)[5] - table(Full_Data_MHQ2$UKB.Age.Bands)[5], "\n")

cat("Age\tMedian","\t")
cat(MHQ2.Age.Median,"\t")
cat(MHQ1.Age.Median,"\t")
cat(MHQ2.Age.Median - MHQ1.Age.Median,"\t")
cat(UKB.Age.Median,"\t")
cat(MHQ2.Age.Median - UKB.Age.Median,"\n")

## Sex

cat("Sex\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Sex), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Sex), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Sex), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Ethnicity

cat("Ethnicity\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Ethnicity), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Ethnicity), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Ethnicity), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## TDI

cat("TDI\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.TDI), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.TDI), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.TDI), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Highest.Qualification

cat("Highest.Qualification\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Highest.Qualification), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Highest.Qualification), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Highest.Qualification), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Housing

cat("Housing\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Housing), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Housing), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Housing), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Longstanding.Illness

cat("Longstanding.Illness\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Longstanding.Illness), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Longstanding.Illness), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Longstanding.Illness), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Neuroticism

cat("Neuroticism\tNA","\t")
cat(mean(Full_Data_MHQ2$MHQ2.Neuroticism, na.rm=T), "\t", sd(Full_Data_MHQ2$MHQ2.Neuroticism, na.rm=T), "\t") #MHQ2
cat(mean(Full_Data_MHQ2$MHQ1.Neuroticism, na.rm=T), "\t", sd(Full_Data_MHQ2$MHQ1.Neuroticism, na.rm=T), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(mean(Full_Data_MHQ2$UKB.Neuroticism, na.rm=T), "\t", sd(Full_Data_MHQ2$UKB.Neuroticism, na.rm=T), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Smoking

cat("Smoking\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Smoking), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Smoking), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Smoking), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

## Physical.Activity

cat("Physical.Activity\tNA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Physical.Activity), "\t") #MHQ2
cat(table(Full_Data_MHQ2$MHQ1.Physical.Activity), "\t") #MHQ1
cat("\t") #MHQ2 - MHQ1
cat(table(Full_Data_MHQ2$UKB.Physical.Activity), "\t") #UKB
cat("\t") #MHQ2-UKB
cat("\n")

sink()

# Table 3 – Sample characteristics by lifetime disorder
# Supplementary Table 3a – Sample characteristics by lifetime disorder (female sex)
# Supplementary Table 3b – Sample characteristics by lifetime disorder (male sex)

sink("Table3.txt")

## Header
cat("Measure\tSub-measure\tMHQ2\tNo Lifetime Criteria\tDepression\tBipolar I\tPanic Disoder\tAny eating disorder\n")

## Age
cat("Age.Bands","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Age.Bands, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

cat("Age.Median","\t","NA","\t")
cat(MHQ2.Age.Median, "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(median(Full_Data_MHQ2[Full_Data_MHQ2$depression.ever.case == 1, "MHQ2.Age"], na.rm = TRUE), "\t") # Depression
cat(median(Full_Data_MHQ2[Full_Data_MHQ2$BD1 == 1, "MHQ2.Age"], na.rm = TRUE), "\t") # Bipolar I
cat(median(Full_Data_MHQ2[Full_Data_MHQ2$PanicDisorder == 1, "MHQ2.Age"], na.rm = TRUE), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Sex

cat("Sex","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Sex, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Sex, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Sex, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Sex, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Ethnicity

cat("Ethnicity","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Ethnicity, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Ethnicity, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Ethnicity, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Ethnicity, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## TDI

cat("TDI","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.TDI, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.TDI, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.TDI, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.TDI, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Highest.Qualification

cat("Highest.Qualification","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Highest.Qualification, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Highest.Qualification, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Highest.Qualification, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Highest.Qualification, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Housing

cat("Housing","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Housing, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Housing, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Housing, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Housing, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Longstanding.Illness

cat("Longstanding.Illness","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Longstanding.Illness, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Longstanding.Illness, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Longstanding.Illness, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Longstanding.Illness, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Neuroticism

cat("Neuroticism","\t","NA","\t")
cat(mean(Full_Data_MHQ2$MHQ2.Neuroticism, na.rm=T), "\t", sd(Full_Data_MHQ2$MHQ2.Neuroticism, na.rm=T), "\t") #MHQ2
cat("\t") # No Lifetime Criteria
cat(mean(Full_Data_MHQ2[Full_Data_MHQ2$depression.ever.case == 1, "MHQ2.Neuroticism"], na.rm=T), "\t",
  sd(Full_Data_MHQ2[Full_Data_MHQ2$depression.ever.case == 1, "MHQ2.Neuroticism"], na.rm=T), "\t") # Depression 
cat(mean(Full_Data_MHQ2[Full_Data_MHQ2$BD1 == 1, "MHQ2.Neuroticism"], na.rm=T), "\t",
  sd(Full_Data_MHQ2[Full_Data_MHQ2$BD1 == 1, "MHQ2.Neuroticism"], na.rm=T), "\t") # Bipolar I
cat(mean(Full_Data_MHQ2[Full_Data_MHQ2$PanicDisorder == 1, "MHQ2.Neuroticism"], na.rm=T), "\t",
  sd(Full_Data_MHQ2[Full_Data_MHQ2$PanicDisorder == 1, "MHQ2.Neuroticism"], na.rm=T), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Smoking

cat("Smoking","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Smoking, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Smoking, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Smoking, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Smoking, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Physical.Activity

cat("Physical.Activity","\t","NA","\t")
cat(table(Full_Data_MHQ2$MHQ2.Physical.Activity, Full_Data_MHQ2$MHQ2_Completed), "\t") # MHQ2
cat("\t") # No Lifetime Criteria
cat(table(Full_Data_MHQ2$MHQ2.Physical.Activity, Full_Data_MHQ2$depression.ever.case), "\t") # Depression
cat(table(Full_Data_MHQ2$MHQ2.Physical.Activity, Full_Data_MHQ2$BD1), "\t") # Bipolar I
cat(table(Full_Data_MHQ2$MHQ2.Physical.Activity, Full_Data_MHQ2$PanicDisorder), "\t") # Panic disorder
cat("\t") # Eating disorder
cat("\n")

## Childhood adverse experience
## Adult adverse experience
## Social isolation
## Loneliness from UCLA score
## Low resilience from Brief Resilience Score
## EQ-5D VAS score mean (sd) (higher is better health)

sink()

### TO DO

# sink("SupplemntaryTable3a.txt")
# sink("SupplemntaryTable3b.txt")

# Rows:

# Figure 5 – Upset plot of disorder overlap

# library(UpSetR)
# png("Figure5.pdf", res = 300))
# print(upset(Full_Data_MHQ2, nsets))
# png()

sink("Data_For_Figure5.txt")
print(with(Full_Data_MHQ2[Full_Data_MHQ2$MHQ2.Completed == 1, ],
    table(Full_Data_MHQ2$depression.ever.case,
      Full_Data_MHQ2$BD1,
      Full_Data_MHQ2$PanicDisorder,
      Full_Data_MHQ2$Anorexia_nervosa,
      Full_Data_MHQ2$Bulimia_nervosa,
      Full_Data_MHQ2$Purging_disorder,
      Full_Data_MHQ2$Self.Harm.Ever,
      useNA="a")))
sink()

# # Table 6 – MHQ1 vs MHQ2 – Current illness by Age

# Rows:
# N positive (%)
# Under 52
# 52-58
# 59-65
# 66-74
# 75-81
# Over 81

# Columns
# PHQ9 case
# GAD7 case
# AUDIT harmful case
# (Split by sex)
# (Split by MHQ1, MHQ2)


# # Table 7a – MHQ1 vs MHQ2 - Lifetime syndromes (Not excluding new onset)
# # Table 7b – MHQ1 vs MHQ2 - Lifetime syndromes (Excluding new onset)

# Rows
# Depression
# Bipolar
# Self-harm
# Cannabis
# Any SR clinician diagnosis

# Columns
# Met in both
# Met 1 not 2
# Met 2 not 1*
# Neither Kappa

# # Table 8 – Deeper exploration of depression ()

# Rows
# Sex
# Median current age (or 5y bands)
# Ave PHQ9 score
# Ave GAD7 score
# Median age onset
# % single episode depression
# % recurrent depression
# % bipolar affective disorder

# Columns
# Met criteria in both
# Met criteria 1 not 2
# Met criteria 2 not 1
# Never met criteria
