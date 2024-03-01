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
                
            # No lifetime anorexia nervosa  #+++JZ: Overarching functionality - needs to be reviewed!!
               AN == 0 & #from external AN
              `29000-0.16` != 17 #from external SELF_REPORTED  #+++JZ: this especially - changed from == 0 as I think we do not have values for everyone
            # +++ add any other reports of AN
            ) ~ 1
           )
  )




## ----BED ICD11 algorithm------------------------------------------------------
MHQ2 <- MHQ2 %>%
  mutate(ICD11_BED_algorithm =
           case_when(
             
        # "Have you had recurrent episodes of excessive overeating or binge eating (i.e. eating significantly more than what most people eat in a similar period of time, for example, two hours)?" = "Yes, at least once a week" 
            `29132-0.0` == 2 &
              
        # "During your episodes of excessive overeating/binge eating, how often have you felt like you did not have control over your eating (e.g. not being able to stop eating or feeling compelled to eat)?" = "At least once a week for at least 3 months"  
           `29135-0.0` == 0 &
              
        # "What was the longest amount of time when you were overeating/binge eating at least once a week?" = "At least 3 months"
           `29133-0.0` == 0 &
          
        # "Do/did you feel distressed about your episodes of excessive overeating/binge eating?" = "Yes"
          `29137-0.0` == 1 &
          
        # "During the time(s) when you were regularly overeating/binge eating, have you done any of the following as a way to control your body shape or weight? (Select all that apply)?" = "None of the above"
          `29140-0.0` == 0 &
        
       # ICD11 criteria: "The individual may be of normal weight or even low weight (though not sufficiently to meet the diagnostic requirements for Anorexia Nervosa)" (calculated above)
          not_during_AN == 1 ~ 1
           )
  )

# Check
# MHQ2 %>%
#  freq(ICD11_BED_algorithm)

