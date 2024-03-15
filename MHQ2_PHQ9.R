## ----rename variable names----------------------------------------------------
# new_colnames <- paste0("f.", gsub("-", ".", colnames(dat)))
# colnames(dat) <- new_colnames



## ----check whether participants have info for two core symptoms---------------

dat <- dat %>%
  mutate(
    PHQ9.No.Info = ifelse(
      (is.na(`29002-0.0`) | `29002-0.0` < 0) & (is.na(`29003-0.0`) | `29003-0.0` < 0),
      1,
      0
    )
  )



## ----screen participants who meet at least one core symptom-------------------

dat <- dat %>%
  mutate(
    PHQ9.Screen = ifelse(
      ((!is.na(`29002-0.0`) & `29002-0.0` >= 2) | (!is.na(`29003-0.0`) & `29003-0.0` >= 2)) &
        (!is.na(PHQ9.No.Info) & PHQ9.No.Info == 0),
      1,
      0
    )
  )



## ----The number of items met by the participants------------------------------

### List of columns of PHQ9
columns_PHQ9.Items <- c(
  "29002-0.0", "29007-0.0", "29003-0.0", "29008-0.0", 
  "29004-0.0", "29009-0.0", "29005-0.0", "29006-0.0", "29010-0.0"
)

### change as numeric variables
for (col in columns_PHQ9.Items) {
  dat[[col]] <- as.numeric(dat[[col]])
}

dat$PHQ9.Items <- 0

for (col in columns_PHQ9.Items) {
  cutoff <- ifelse(col == "29010-0.0", 1, 2)
  dat$PHQ9.Items <- with(dat, ifelse(!is.na(get(col)) & get(col) >= cutoff, PHQ9.Items + 1, PHQ9.Items))
}



## ----PHQ-9 driven depression--------------------------------------------------

dat <- dat %>%
  mutate(
    PHQ9.derived.depression = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      (!is.na(PHQ9.Screen) & PHQ9.Screen == 1) & (!is.na(PHQ9.Items) & PHQ9.Items > 4) ~ 1,
      TRUE ~ 0
    )
  )



## ----PHQ-9 full score---------------------------------------------------------

dat <- dat %>%
  mutate(
    PHQ9.Severity = rowSums(across(c(`29002-0.0`, `29007-0.0`, `29003-0.0`, `29008-0.0`,
                                     `29004-0.0`, `29009-0.0`, `29005-0.0`, `29010-0.0`, `29006-0.0`),
                                   ~ ifelse(. < 0 | is.na(.), 0, .))
    )
  )

### Set PHQ9.Severity to NA, if all items are missing

conditions <- Reduce(
  `&`,
  lapply(columns_PHQ9.Items, function(col) {
    (dat[[col]] < 0 | is.na(dat[[col]]))
  })
)

dat$PHQ9.Severity[conditions] <- NA



## ----Current Depression-------------------------------------------------------

dat <- dat %>%
  mutate(
    Depressed.Current = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      PHQ9.derived.depression == 0 & (!is.na(PHQ9.Severity) & PHQ9.Severity < 5) ~ 0,
      depression.ever.case == 1 & (!is.na(PHQ9.Screen) & PHQ9.Screen == 1) & (!is.na(PHQ9.Items) & PHQ9.Items > 4) ~ 1, # need to merge depression.ever.case
      TRUE ~ NA_real_
    )
  )



## ----Current or subthreshold depression---------------------------------------

dat <- dat %>%
  mutate(
    Current.subthreshold.Depression = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      (!is.na(PHQ9.Severity) & PHQ9.Severity >= 5) | PHQ9.derived.depression == 1 ~ 1,
      !is.na(Depressed.Current) & Depressed.Current == 0 ~ 0, 
      TRUE ~ NA_real_
    )
  )



## ----Current more severe depression-------------------------------------------

dat <- dat %>%
  mutate(
    Current.more.severe.depression = case_when(
      PHQ9.No.Info == 1 ~ NA_real_,
      Depressed.Current == 0 | (is.na(PHQ9.Severity) | PHQ9.Severity <= 15) ~ 0,
      Depressed.Current == 1 & !is.na(PHQ9.Severity) & PHQ9.Severity > 15 ~ 1,
      TRUE ~ NA_real_
    )
  )



## ----Medication helped--------------------------------------------------------

### check 29038.0.0-29038.0.2: Have you ever tried (D27) = Medication prescribed to you (2) 

`29038`<-apply(dat[,grep("29038-0", colnames(dat))], 1, function(row) "2" %in% row) 
dat$`29038`[c(`29038`)]<-1

### check 29039.0.0-29039.0.6: Have you ever tried these (D28) = at least one of:Citalopram (1), Fluoxetine (2), Sertraline (3), Paroxetine (4), Amitriptyline (5), Dosulepin (6), Other antidepressant (7)

`29039` <- apply(dat[, grep("29039-0", colnames(dat))], 1, function(row) any(c("1","2","3","4","5","6","7") %in% row))
dat$`29039`[c(`29039`)] <- 1

#### FLAG: lines 250 and 252: need to merge depression.ever.case variable from Lifetime depression script ####

dat <- dat %>%
  mutate(
    Depressed.medication.helped = case_when(
      depression.ever.case == 1 & `29038` == 1 & `29039` == 1 &  # need to depression.ever.case
        (`29040-0.0` == 1 | `29041-0.0` == 1 | `29042-0.0` == 1 | `29043-0.0` == 1 | `29044-0.0` == 1 | `29045-0.0` == 1 | `29046-0.0` == 1) ~ 1,
      depression.ever.case == 1 & `29039` == 1 &
        ((`29040-0.0` %in% c(0, -1) | `29041-0.0` %in% c(0, -1) | `29042-0.0` %in% c(0, -1) |
            `29043-0.0` %in% c(0, -1) | `29044-0.0` %in% c(0, -1) | `29045-0.0` %in% c(0, -1) | `29046-0.0` %in% c(0, -1))) ~ 0,
      TRUE ~ NA_real_
    )
  )
 


## ----Non-medication therapy helped--------------------------------------------

### check 29047.0.0-29047.0.1: Activities undertaken to treat depression (D29)
`29047` <- apply(dat[, grep("29047-0", colnames(dat))], 1, function(row) any(c("1","2") %in% row))
dat$`29047`[c(`29047`)] <- 1

#### FLAG: lines 283 and 284: need to merge depression.ever.case variable from Lifetime depression script ####

dat <- dat %>%
  mutate(
    Depressed.non_medication.therapy.helped = case_when(
      depression.ever.case == 1 & `29047` == 1 & `29048-0.0` == 1 ~ 1, # need to merge Depressed.Ever
      depression.ever.case == 1 & `29047` == 1 & (`29048-0.0` == 0 | `29048-0.0` == -1) ~ 0, 
      TRUE ~ NA_real_
    )
  )


