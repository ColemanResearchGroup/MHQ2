## ----extended BE or overeating------------------------------------------------
MHQ2 <- MHQ2 %>%
  mutate(extended_BE_or_overeating_algorithm =
           case_when(
             
         # "Have you had recurrent episodes of excessive overeating or binge eating (i.e. eating significantly more than what most people eat in a similar period of time, for example, two hours)?" = "Yes, at least once a week" 
            `29132-0.0` == 2  ~ 1
            # +++ possibly add "occasionally"
            )
  )


## ----extended BE (with loss of control----------------------------------------
MHQ2 <- MHQ2 %>%
  mutate(extended_BE_algorithm =
           case_when(
             
           # "Have you had recurrent episodes of excessive overeating or binge eating (i.e. eating significantly more than what most people eat in a similar period of time, for example, two hours)?" = "Yes, at least once a week" 
            `29132-0.0` == 2  &
              # +++ possibly add "occasionally"
              
             # "During your episodes of excessive overeating/binge eating, how often have you felt like you did not have control over your eating (e.g. not being able to stop eating or feeling compelled to eat)?"
           (
             # "At least once a week for at least 3 months'
             `29135-0.0` == 0 |
               
               # "At least once a week for between 1 and 3 months"
               `29135-0.0` == 1 |
               
               # "Occasionally"
               `29135-0.0` == 2 
           ) ~ 1
           )
  )

