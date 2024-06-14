## ------------------------------------
anx_pad_field_numbers <- as.character(29058:29075)


## ------------------------------------
anx_pad_data <- dat %>%
  select(eid,
    matches(
      paste(
        anx_pad_field_numbers,
        collapse = "|"
      )
    )
  )

# Inspect data
if(diagnosticsFlag) glimpse(anx_pad_data)
if(diagnosticsFlag) summary(anx_pad_data)


## ------------------------------------
anx_pad_data <- anx_pad_data %>%
  mutate(across(everything(), ~ ., .names = "{.col}_mod")) %>%
  mutate_all(~ as.numeric(.)) %>%
  mutate_all(~ case_when(
    . == -3 ~ NA_real_,
    TRUE ~ .
  ))




## ------------------------------------
anx_pad_data <- anx_pad_data %>%
  mutate(
    MHQ2.GAD7Score = rowSums(
      select(.,
        "29058-0.0_mod",
        "29059-0.0_mod",
        "29060-0.0_mod",
        "29061-0.0_mod",
        "29062-0.0_mod",
        "29063-0.0_mod",
        "29064-0.0_mod"
      ),
      na.rm = TRUE
    )
  )

if(diagnosticsFlag) summary(anx_pad_data$MHQ2.GAD7Score)

if(diagnosticsFlag) anx_pad_data %>%
  count(MHQ2.GAD7Score)


## ------------------------------------
anx_pad_data <- anx_pad_data %>%
  mutate(
    Gad7NaCount = rowSums(
      select(.,
        "29058-0.0_mod",
        "29059-0.0_mod",
        "29060-0.0_mod",
        "29061-0.0_mod",
        "29062-0.0_mod",
        "29063-0.0_mod",
        "29064-0.0_mod"
      ) %>%
        is.na()
    )
  )

# check NA count
if(diagnosticsFlag) anx_pad_data %>%
  select(Gad7NaCount,
    "29058-0.0_mod",
    "29059-0.0_mod",
    "29060-0.0_mod",
    "29061-0.0_mod",
    "29062-0.0_mod",
    "29063-0.0_mod",
    "29064-0.0_mod"
  ) %>%
  head()

#check freq
if(diagnosticsFlag) anx_pad_data %>%
  count(Gad7NaCount)


## ------------------------------------
# Create a new column named 'MHQ2.GADDerivedAnxiety' in the data frame
# Calculate 'MHQ2.GADDerivedAnxiety' value.
anx_pad_data <- anx_pad_data %>%
  mutate(
    MHQ2.GADDerivedAnxiety = case_when(
      # If 'MHQ2.GAD7Score' is missing (NA) Assign NA to the 'MHQ2.GADDerivedAnxiety' column.
      is.na(MHQ2.GAD7Score) ~ NA_real_,
      # If 'MHQ2.GAD7Score' is greater than 9 (i.e. >=10 for moderate current Gad)
      # Assign 1 to the 'MHQ2.GADDerivedAnxiety' column (as case)
      MHQ2.GAD7Score > 9 ~ 1,
      # If score less than 10, and adding score with NA count *3
      # (in case they score on the missed NA items [max 3 each]
      # taking them above threshold of 10)
      # Assign 0
      MHQ2.GAD7Score < 10 & MHQ2.GAD7Score + Gad7NaCount * 3 < 10 ~ 0,
      # NA if no conditions are met
      TRUE ~ NA_real_
    )
  )

if(diagnosticsFlag) anx_pad_data %>%
  count(MHQ2.GADDerivedAnxiety)


## ----Check colnames------------------
if(diagnosticsFlag) anx_pad_data %>%
  select(contains("29065")) %>%
  head()
# field name ranges: 29065-0.0 - 29065-0.12


## ------------------------------------
if(diagnosticsFlag) anx_pad_data %>%
  # matches regular expression
  # (column names that start with "29065-0.",
  # followed by a digit, and end with "_mod")
  select(matches("^29065-0\\.\\d+_mod$")) %>%
  summary()


## ------------------------------------
if(diagnosticsFlag) anx_pad_data %>%
  # matches regular expression
  # (column names that start with "29065-0.",
  # followed by a digit, and end with "_mod")
  select(matches("^29065-0\\.\\d+_mod$")) %>%
  count()


## ------------------------------------
#Create score for panic attack symptoms
anx_pad_data <- anx_pad_data %>%
  mutate(PanicSymptomsCount = 0)

anx_pad_data <- anx_pad_data %>%
  mutate(PanicSymptomsCount = case_when(
    `29065-0.0_mod` == 0 ~ 0,
    `29065-0.12_mod` > 0 ~ 13,
    `29065-0.11_mod` > 0 ~ 12,
    `29065-0.10_mod` > 0 ~ 11,
    `29065-0.9_mod` > 0 ~ 10,
    `29065-0.8_mod` > 0 ~ 9,
    `29065-0.7_mod` > 0 ~ 8,
    `29065-0.6_mod` > 0 ~ 7,
    `29065-0.5_mod` > 0 ~ 6,
    `29065-0.4_mod` > 0 ~ 5,
    `29065-0.3_mod` > 0 ~ 4,
    `29065-0.2_mod` > 0 ~ 3,
    `29065-0.1_mod` > 0 ~ 2,
    `29065-0.0_mod` > 0 ~ 1
  )
  )

if(diagnosticsFlag) anx_pad_data %>%
  count(PanicSymptomsCount)


## ------------------------------------
anx_pad_data <- anx_pad_data %>%
  mutate(MHQ2.PanicAttacksEver = case_when(
    is.na(PanicSymptomsCount) ~ NA,
    PanicSymptomsCount < 4 ~ 0,
    PanicSymptomsCount > 3 ~ 1
  )
  )

if(diagnosticsFlag) anx_pad_data %>%
  count(MHQ2.PanicAttacksEver)


## ------------------------------------
anx_pad_data <- anx_pad_data %>%
  mutate(MHQ2.PanicDisorder = case_when(
    # Symptoms {panic attack ever}
    MHQ2.PanicAttacksEver == 1 &
      (
        # Feel anxious more panic attacks = Yes
        `29067-0.0_mod` == 1 |
          # OR Feel worried bad things happening because of panic attacks = Yes
          `29068-0.0_mod` == 1 |
          # OR Avoid situations in which panic attacks might occur = Yes
          `29069-0.0_mod` == 1
      ) &
      # how long worry periods: codes 1-5 (greater than less than 1 month)
      `29070-0.0_mod` > 0 &
      (
        # AND not due to other reasons 'no never'
        `29074-0.0_mod` == 0 |
          # OR due to other reasons 'yes some of them'
          `29074-0.0_mod` == 1
      ) &
      (
        # occur in specific situation 'no'
        `29075-0.0_mod` == 0 |
          # OR occur in specific situation 'Yes, some of them'
          `29075-0.0_mod` == 1
      )
    ~ 1, # code as 1 if meet all criteria
    TRUE ~ 0 # other wise code as 0
  )
  )

if(diagnosticsFlag) anx_pad_data %>%
  count(MHQ2.PanicDisorder)


## ----Update the original dataset-----

setDT(dat, key = "eid")
setDT(anx_pad_data, key = "eid")

dat[anx_pad_data,
    on = c("eid"),
    c(
      "MHQ2.GAD7Score",
      "MHQ2.GADDerivedAnxiety",
      "PanicSymptomsCount",
      "MHQ2.PanicAttacksEver",
      "MHQ2.PanicDisorder"
    )
    := list(
      i.MHQ2.GAD7Score,
      i.MHQ2.GADDerivedAnxiety,
      i.PanicSymptomsCount,
      i.MHQ2.PanicAttacksEver,
      i.MHQ2.PanicDisorder
    )]


dat <- as.data.frame(dat)


