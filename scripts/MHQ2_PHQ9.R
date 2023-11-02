##### Current Depression    ######
##### Rujia Wang 2023-11-02 ######

library(dplyr)

### select PHQ-9 and medication and non-medication therapy variables
MHQ<-subset(data,select=c("ID","29002-0.0","29003-0.0","29004-0.0","29005-0.0","29006-0.0","29007-0.0","29008-0.0","29009-0.0","29010-0.0","29038-0.0","29038-0.1","29038-0.2","29039-0.0","29039-0.1","29039-0.2","29039-0.3","29039-0.4","29039-0.5","29039-0.6","29040-0.0","29041-0.0","29042-0.0","29043-0.0","29044-0.0","29045-0.0","29046-0.0","29047-0.0","29047-0.1","29048-0.0"))

### rename variable names
new_colnames <- paste0("f.", gsub("-", ".", colnames(MHQ)))
colnames(MHQ) <- new_colnames

### change variable type as numeric, except for the "ID" first column
for (col in names(MHQ)[-1]) {
  MHQ[[col]] <- as.numeric(MHQ[[col]])
}

#####Current depression: PHQ-9######

### A (core): as least have one core symptom in past two weeks
### f.29002.0.0: Little interest or pleasure (D1a) = More than half of the days (02) or Nearly every day (03)
### OR
### f.29003.0.0: Feeling down (D1b) = More than half of the days (02) or Nearly every day (03)

### AND
### B (number of symptoms) – Sum positive items >= 5
### f.29002.0.0: Little interest or pleasure (D1a) = More than half of the days (02) or Nearly every day (03)
### f.29003.0.0: Feeling down (D1b) = More than half of the days (02) or Nearly every day (03)
### f.29004.0.0: Trouble sleeping (D1c) = More than half of the days (02) or Nearly every day (03)
### f.29005.0.0: Feeling tired (D1d) = More than half of the days (02) or Nearly every day (03)
### f.29006.0.0: Poor appetite(D1e)  = More than half of the days (02) or Nearly every day (03)
### f.29007.0.0: Feeling guilt (D1f) = More than half of the days (02) or Nearly every day (03)
### f.29008.0.0: Trouble concentrating (D1g) = More than half of the days (02) or Nearly every day (03)
### f.29009.0.0: Moving slowly (D1h) = More than half of the days (02) or Nearly every day (03)
### f.29010.0.0: Thoughts death (D1i) = Several days (01) More than half of the days (02) or Nearly every day (03)

### check whether participants have info for two core symptoms

MHQ <- MHQ %>%
  mutate(
    PHQ9.No.Info = ifelse(
      (is.na(f.29002.0.0) | f.29002.0.0 < 0) & (is.na(f.29003.0.0) | f.29003.0.0 < 0),
      1,
      0
    )
  )

### screen participants who meet at least one core symptom

MHQ <- MHQ %>%
  mutate(
    PHQ9.Screen = ifelse(
      ((!is.na(f.29002.0.0) & f.29002.0.0 >= 2) | (!is.na(f.29003.0.0) & f.29003.0.0 >= 2)) &
        (!is.na(PHQ9.No.Info) & PHQ9.No.Info == 0),
      1,
      0
    )
  )

### The number of items met by the participants
### List of columns of PHQ9
columns_PHQ9.Items <- c(
  "f.29002.0.0", "f.29007.0.0", "f.29003.0.0", "f.29008.0.0", 
  "f.29004.0.0", "f.29009.0.0", "f.29005.0.0", "f.29006.0.0", "f.29010.0.0"
)

MHQ$PHQ9.Items <- 0

for (col in columns_PHQ9.Items) {
  cutoff <- ifelse(col == "f.29010.0.0", 1, 2)
  MHQ$PHQ9.Items <- with(MHQ, ifelse(!is.na(get(col)) & get(col) >= cutoff, PHQ9.Items + 1, PHQ9.Items))
}

### PHQ-9 driven depression

MHQ <- MHQ %>%
  mutate(
    PHQ9.derived.depression = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      (!is.na(PHQ9.Screen) & PHQ9.Screen == 1) & (!is.na(PHQ9.Items) & PHQ9.Items > 4) ~ 1,
      TRUE ~ 0
    )
  )

### PHQ-9 full score
### Cut-offs used are: < 5 No depression; 5-15 Less severe depression; >15 More severe depression

MHQ <- MHQ %>%
  mutate(
    PHQ9.Severity = rowSums(across(c(f.29002.0.0, f.29007.0.0, f.29003.0.0, f.29008.0.0,
                                     f.29004.0.0, f.29009.0.0, f.29005.0.0, f.29010.0.0, f.29006.0.0),
                                   ~ ifelse(. < 0 | is.na(.), 0, .))
    )
  )

### Current Depression cases (1 = cases): PHQ9 derived depression + CIDI-SF(L): Depressed.Ever
### Current Depression controls (0 = controls): Scores negative on PHQ9 algorithm and below cut-off on PHQ9 full score (NOT {PHQ9 derived depression} AND PHQ9 full score < 5 )
#### FLAG: line 105: need to merge Depressed.Ever variable from Lifetime depression script ####

MHQ <- MHQ %>%
  mutate(
    Depressed.Current = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      PHQ9.derived.depression == 0 & (!is.na(PHQ9.Severity) & PHQ9.Severity < 5) ~ 0,
      Depressed.Ever == 1 & (!is.na(PHQ9.Screen) & PHQ9.Screen == 1) & (!is.na(PHQ9.Items) & PHQ9.Items > 4) ~ 1, # need to merge Depressed.Ever
      TRUE ~ NA_real_
    )
  )

### Current or subthreshold depression:
### This category plus controls for current depression will contain all of those who answered validly
#### FLAG: line 119: need to merge Depressed.Ever variable from Lifetime depression script ####

MHQ <- MHQ %>%
  mutate(
    current.subthreshold.Depression = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      (is.na(Depressed.Current) & !is.na(PHQ9.Severity) & PHQ9.Severity >= 5) | Depressed.Current == 1 ~ 1,
      !is.na(Depressed.Ever) & Depressed.Ever == 1 ~ 0, # need to merge Depressed.Ever
      TRUE ~ NA_real_
    )
  )

### Current more severe depression: 
### As current depression (above) with PHQ9 full score > 15

MHQ <- MHQ %>%
  mutate(
    Current.more.severe.depression = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      Depressed.Current == 0 | (is.na(PHQ9.Severity) | PHQ9.Severity <= 15) ~ 0,
      Depressed.Current == 1 & !is.na(PHQ9.Severity) & PHQ9.Severity > 15 ~ 1,
      TRUE ~ NA_real_
    )
  )

### Medication helped
### Any of the drugs the participant reported taking helped symptoms of depression (at least a little).
### Case {depression ever} AND
### f.29038.0.0-f.29038.0.2: Have you ever tried (D27) = Medication prescribed to you (02) AND
### f.29039.0.0-f.29039.0.6: Have you ever tried these (D28) = at least one of: Citalopram (01), Fluoxetine (02), Sertraline (03), Paroxetine (04), Amitriptyline (05), Dosulepin (06), Other antidepressant (07) AND
### For any of D28a to D28g: Has (selected medication) helped you to feel better (D28a-g) = “Yes, at least a little”
### f.29040.0.0: Citalopram has helped feel better (01)
### f.29041.0.0: Fluoxetine has helped feel better (01)
### f.29042.0.0: Sertraline has helped feel better (01)
### f.29043.0.0: Paroxetine has helped feel better (01)
### f.29044.0.0: Amitriptyline has helped feel better (01)
### f.29045.0.0: Dosulepin has helped feel better (01)
### f.29046.0.0: Other antidepressants has helped feel better (01)

### check f.29038.0.0-f.29038.0.2: Have you ever tried (D27) = Medication prescribed to you (02) 
f.29038<-apply(MHQ[,grep("f.29038.0", colnames(MHQ))], 1, function(row) "2" %in% row) 
MHQ$f.29038[c(f.29038)]<-1

### check f.29039.0.0-f.29039.0.6: Have you ever tried these (D28) = at least one of:Citalopram (01), Fluoxetine (02), Sertraline (03), Paroxetine (04), Amitriptyline (05), Dosulepin (06), Other antidepressant (07)

f.29039 <- apply(MHQ[, grep("f.29039.0", colnames(MHQ))], 1, function(row) any(c("1","2","3","4","5","6","7") %in% row))
MHQ$f.29039[c(f.29039)] <- 1

#### FLAG: lines 165 and 167: need to merge Depressed.Ever variable from Lifetime depression script ####

MHQ <- MHQ %>%
  mutate(
    Depressed.medication.helped = case_when(
      Depressed.Ever == 1 & f.29038 == 1 & f.29039 == 1 &  # need to merge Depressed.Ever
        (f.29040.0.0 == 1 | f.29041.0.0 == 1 | f.29042.0.0 == 1 | f.29043.0.0 == 1 | f.29044.0.0 == 1 | f.29045.0.0 == 1 | f.29046.0.0 == 1) ~ 1,
      Depressed.Ever == 1 & f.29039 == 1 &
        ((f.29040.0.0 %in% c(0, -1) | f.29041.0.0 %in% c(0, -1) | f.29042.0.0 %in% c(0, -1) |
            f.29043.0.0 %in% c(0, -1) | f.29044.0.0 %in% c(0, -1) | f.29045.0.0 %in% c(0, -1) | f.29046.0.0 %in% c(0, -1))) ~ 0,
      TRUE ~ NA_real_
    )
  )
      
### Non-medication therapy helped
### Any of the talking therapies or other therapeutic activities that participant reported participating in helped symptoms of depression (at least a little).
### Case {depression ever} AND
### f.29047.0.0: Activities undertaken to treat depression (D29) = “Talking therapies, such as psychotherapy, counselling, group therapy or CBT” (01) OR “Other therapeutic activities such as mindfulness, yoga or art classes” (02) AND
### f.29048.0.0: Activities have helped (D29a) = “Yes, at least a little” (01)

### check f.29047.0.0-f.29047.0.1: Activities undertaken to treat depression (D29)
f.29047 <- apply(MHQ[, grep("f.29047.0", colnames(MHQ))], 1, function(row) any(c("1","2") %in% row))
MHQ$f.29047[c(f.29047)] <- 1

#### FLAG: lines 189 and 190: need to merge Depressed.Ever variable from Lifetime depression script ####

MHQ <- MHQ %>%
  mutate(
    Depressed.non_medication.therapy.helped = case_when(
      Depressed.Ever == 1 & f.29047 == 1 & f.29048.0.0 == 1 ~ 1, # need to merge Depressed.Ever
      Depressed.Ever == 1 & f.29047 == 1 & (f.29048.0.0 == 0 | f.29048.0.0 == -1) ~ 0, 
      TRUE ~ NA_real_
    )
  )

                                                       



