## ----not during AN criteria---------------------------------------------------
dat <- dat %>%
  mutate(BE_not_during_AN =
           case_when(
             # 29134: "If you reported a time or times of low weight above, do/did you experience episodes of excessive overeating/binge eating during your time(s) of low weight?"
 
        # 1. part: people who binged outside of low weight = 1                  
             # "Only at time(s) when I was not at low weight"
            (
             `29134-0.0` == 2 |
               
            # "Both at times of low weight and when not at low weight"   
             `29134-0.0` == 1 |
              
            # "Not applicable, as did not have low weight"
             `29134-0.0` == -4
            ) |
              
        # 2. part people who binged at a low weight, but did not qualify for a full AN diagnosis      
            # "Only at time(s) of low weight"
             (
               `29134-0.0` == 0 &
                
            # No lifetime anorexia nervosa
              Anorexia_nervosa == 0 &
              SelfReportedAnorexiaNervosa == 0 
            # Here, any other other reports of AN in the UK Biobank can be added,
            # e. g., HES data can be added
            
            ) ~ 1,
                     
        # did respond to the ED section of the MHQ2
        !is.na(`29205-0.0`) ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

