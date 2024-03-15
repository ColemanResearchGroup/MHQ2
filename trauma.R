## -----------------------------------------------------------------------------
trauma_field_numbers <- as.character(29076:29090)


## -----------------------------------------------------------------------------
trauma_data <- dat %>% 
  select(matches(paste(trauma_field_numbers, 
                       collapse = "|")))

# Inspect data
# glimpse(trauma_data)
# 
# summary(trauma_data)


## -----------------------------------------------------------------------------
trauma_data <- trauma_data %>%
  mutate(across(everything(), ~ ., .names = "{.col}_mod")) %>%
  mutate_all(~ as.numeric(.)) %>%
  mutate_all(~ case_when(
    . == -3 ~ NA_real_,
    TRUE ~ .
  ))




## -----------------------------------------------------------------------------
trauma_data <- trauma_data %>%
  mutate(
    TraumaChildhood = case_when(
       (is.na(`29076-0.0_mod`)
         & is.na(`29077-0.0_mod`)
         & is.na(`29078-0.0_mod`)
         & is.na(`29079-0.0_mod`)
         & is.na(`29080-0.0_mod`)) ~ NA_real_,
      (`29076-0.0_mod` < 3) # Felt loved = Never true (0) Rarely true (1) or Sometimes true (2) 
     | (`29077-0.0_mod` > 0) #Physically abused by family = Rarely true (01), Sometimes true (02), Often true (03) OR Very often true (04)
     | (`29078-0.0_mod` > 0) # Felt hated by family = Rarely true (01), Sometimes true (02), Often true (03) OR Very often true (04) 
     | (`29079-0.0_mod` > 0) # Sexually molested = Rarely true (01), Sometimes true (02), Often true (03) OR Very often true (04) 
     | (`29080-0.0_mod` < 4) # Someone to take to doctor when needed as a child = Often true (03), Sometimes true (02) OR Rarely true (01) OR Never (0)
    ~ 1,
    TRUE ~ 0   )
    )
  
trauma_data %>%
  with(table(TraumaChildhood, useNA="a"))


## -----------------------------------------------------------------------------
trauma_data <- trauma_data %>%
  mutate(
    TraumaAdulthood = case_when(
      (is.na(`29081-0.0_mod`)
        & is.na(`29082-0.0_mod`)
        & is.na(`29083-0.0_mod`)
        & is.na(`29084-0.0_mod`)
        & is.na(`29085-0.0_mod`)) ~ NA_real_,
      (`29081-0.0_mod` > 0) # Stopped seeing friends (29081) = Yes, within the last 12 months (02) OR Yes, but not in the last 12 months (01)  
     | (`29082-0.0_mod` > 0) # Belittled (29082) = Yes, within the last 12 months (02) OR Yes, but not in the last 12 months (01)  
     | (`29083-0.0_mod` > 0) # Hurt (29083) = Yes, within the last 12 months (02) OR Yes, but not in the last 12 months (01)  
     | (`29084-0.0_mod` > 0) # Touched without consent (29084) = Yes, within the last 12 months (02) OR Yes, but not in the last 12 months (01) 
     | (`29085-0.0_mod` > 0) # Sex without consent (29085) = Yes, within the last 12 months (02) OR Yes, but not in the last 12 months (01)
    ~ 1,
    TRUE ~ 0   )
    )
  
trauma_data %>% 
  with(table(TraumaAdulthood, useNA="a"))


## -----------------------------------------------------------------------------
trauma_data <- trauma_data %>%
  mutate(
    Trauma12Months = case_when(
      (is.na(`29081-0.0_mod`)
        & is.na(`29082-0.0_mod`)
        & is.na(`29083-0.0_mod`)
        & is.na(`29084-0.0_mod`)
        & is.na(`29085-0.0_mod`)
        & is.na(`29086-0.0_mod`)
        & is.na(`29087-0.0_mod`)
        & is.na(`29088-0.0_mod`)
        & is.na(`29089-0.0_mod`)
        & is.na(`29090-0.0_mod`)
      ) ~ NA_real_,
      (`29081-0.0_mod` == 2) # Stopped seeing friends (29081) = Yes, within the last 12 months (02)   
     | (`29082-0.0_mod` == 2) # Belittled (29082) = Yes, within the last 12 months (02) 
     | (`29083-0.0_mod` == 2) # Hurt (29083) = Yes, within the last 12 months (02)
     | (`29084-0.0_mod` == 2) # Touched without consent (29084) = Yes, within the last 12 months (02) 
     | (`29085-0.0_mod` == 2) # Sex without consent (29085) = Yes, within the last 12 months (02) 
     | (`29086-0.0_mod` == 2) # Assault (29086) = Yes, within the last 12 months (02)
     | (`29087-0.0_mod` == 2) # Injury or illness (29087) = Yes, within the last 12 months (02)
     | (`29088-0.0_mod` == 2) # Divorce (29088) = Yes, within the last 12 months (02) 
     | (`29089-0.0_mod` == 2) # Death spouse (29089) = Yes, within the last 12 months (02)
     | (`29090-0.0_mod` == 2) # Death suicide (29090) = Yes, within the last 12 months (02) 
    ~ 1,
    TRUE ~ 0   )
    )
  
trauma_data %>% 
  with(table(Trauma12Months, useNA="a"))


## ----select columns-----------------------------------------------------------
selected_columns <- trauma_data %>% 
  select(TraumaChildhood,
         TraumaAdulthood,
         Trauma12Months)


## -----------------------------------------------------------------------------
dat <- cbind(dat,
  selected_columns)

