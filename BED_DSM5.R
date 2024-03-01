## ----not during AN criteria---------------------------------------------------
MHQ2 <- MHQ2 %>%
  mutate(not_during_AN =
           case_when(
             # "If you reported a time or times of low weight above, do/did you experience episodes of excessive overeating/binge eating during your time(s) of low weight?"
             
             # "Only at time(s) when I was not at low weight"
            (
             `29134-0.0` == 2 |
               
            # "Both at times of low weight and when not at low weight"   
             `29134-0.0` == 1 |
              
            # "Not applicable, as did not have low weight"
             `29134-0.0` == -4
            ) |
              
            # "Only at time(s) of low weight"
             (
               `29134-0.0` == 0 &
                
            # No lifetime anorexia nervosa #+++JZ: Overarching functionality - needs to be reviewed!!
              AN == 0 & #from external AN
              `29000-0.16` != 17 #from external SELF_REPORTED  #+++JZ: this especially - changed from == 0 as I think we do not have values for everyone
            # +++ add any other reports of AN
            ) ~ 1
           )
  )


## ----sumscore BE behaviours---------------------------------------------------
# Create numeric variables
MHQ2 <- MHQ2 %>%
  mutate(rapid_eating_numeric =
           case_when(`29136-0.0` == 1 |
                     `29136-0.1` == 1 |
                     `29136-0.2` == 1 | 
                     `29136-0.3` == 1 |
                     `29136-0.4` == 1 ~ 1,
                     
                     TRUE ~ 0
                     )
         ) %>%
  mutate(feeling_uncomf_full_numeric =
           case_when(`29136-0.0` == 2 |
                     `29136-0.1` == 2 |
                     `29136-0.2` == 2 | 
                     `29136-0.3` == 2 |
                     `29136-0.4` == 2 ~ 1,
                     
                     TRUE ~ 0
                     )
         ) %>%
  mutate(large_amounts_not_hungry_numeric =
           case_when(`29136-0.0` == 3 |
                     `29136-0.1` == 3 |
                     `29136-0.2` == 3 | 
                     `29136-0.3` == 3 |
                     `29136-0.4` == 3 ~ 1,
                     
                     TRUE ~ 0
                     )
         ) %>%
  mutate(eaten_alone_embarrassed_numeric =
           case_when(`29136-0.0` == 4 |
                     `29136-0.1` == 4 |
                     `29136-0.2` == 4 | 
                     `29136-0.3` == 4 |
                     `29136-0.4` == 4 ~ 1,
                     
                     TRUE ~ 0
                     )
         ) %>%
  mutate(disgusted_depressed_after_numeric =
           case_when(`29136-0.0` == 5 |
                     `29136-0.1` == 5 |
                     `29136-0.2` == 5 | 
                     `29136-0.3` == 5 |
                     `29136-0.4` == 5 ~ 1,
                     
                     TRUE ~ 0
                     )
         ) %>%
  mutate(no_BE_behaviours_numeric =
           case_when(`29136-0.0` == 0 |
                     `29136-0.1` == 0 |
                     `29136-0.2` == 0 | 
                     `29136-0.3` == 0 |
                     `29136-0.4` == 0 ~ 1,
                     
                     TRUE ~ 0
                     )
         ) %>%
  mutate(PNTA_BE_behaviours_numeric =
           case_when(`29136-0.0` == -3 |
                     `29136-0.1` == -3 |
                     `29136-0.2` == -3 | 
                     `29136-0.3` == -3 |
                     `29136-0.4` == -3 ~ 1,
                     
                     TRUE ~ 0
                     )
         )

# # Check (expecting 6,312)
# MHQ2 %>%
#   freq(rapid_eating_numeric)

# # Check (expecting 10,920)
# MHQ2 %>%
#   freq(feeling_uncomf_full_numeric)

# # Check (expecting 9,963)
# MHQ2 %>%
#   freq(large_amounts_not_hungry_numeric)

# # Check (expecting 5,798)
# MHQ2 %>%
#   freq(eaten_alone_embarrassed_numeric)

# # Check (expecting 8,341)
# MHQ2 %>%
#   freq(disgusted_depressed_after_numeric)

# # Check (expecting 2,429)
# MHQ2 %>%
#   freq(no_BE_behaviours_numeric)

# # Check (expecting 97)
# MHQ2 %>%
#   freq(PNTA_BE_behaviours_numeric)


# Create sumscore
BE_behaviours_items <- MHQ2 %>% select(rapid_eating_numeric,
                                      feeling_uncomf_full_numeric,
                                      large_amounts_not_hungry_numeric,
                                      eaten_alone_embarrassed_numeric,
                                      disgusted_depressed_after_numeric)

MHQ2 <- MHQ2 %>%
    mutate(
        BE_behaviours_sumscore = rowSums(BE_behaviours_items,
                                         na.rm = TRUE)
    )

# Check (expecting maximum 5, minimum 0)
# MHQ2 %>%
#   descr(BE_behaviours_sumscore)




## ----BED DSM5 algorithm-------------------------------------------------------
MHQ2 <- MHQ2 %>%
  mutate(DSM5_BED_algorithm =
           case_when(
             
         # "Have you had recurrent episodes of excessive overeating or binge eating (i.e. eating significantly more than what most people eat in a similar period of time, for example, two hours)?" = "Yes, at least once a week" 
            `29132-0.0` == 2 &
        
        # "During your episodes of excessive overeating/binge eating, how often have you felt like you did not have control over your eating (e.g. not being able to stop eating or feeling compelled to eat)?" = "At least once a week for at least 3 months"  
           `29135-0.0` == 0 &
              
        # "What was the longest amount of time when you were overeating/binge eating at least once a week?" = "At least 3 months"
           `29133-0.0` == 0 &
          
        # "During these episodes of excessive overeating/binge eating, have you:" (Participant needs at least 3 of 5 binge-eating-related behaviours, sumscore calculated above)
          BE_behaviours_sumscore >= 3 &
          
        # "Do/did you feel distressed about your episodes of excessive overeating/binge eating?" = "Yes"
          `29137-0.0` == 1 &
          
        # "During the time(s) when you were regularly overeating/binge eating, have you done any of the following as a way to control your body shape or weight? (Select all that apply)?" = "None of the above"
          `29140-0.0` == 0 &

        # DSM5 criteria: "Does not occur exclusively during the course of anorexia nervosa" (calculated above)
          not_during_AN == 1 ~ 1
           )
  )

# Check
# MHQ2 %>%
#  freq(DSM5_BED_algorithm)

