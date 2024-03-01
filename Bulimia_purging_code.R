## -----------------------------------------------------------------------------
MHQ2 <- MHQ2 %>%
  mutate(bulimia_nervosa_DSM5_algorithm = 
            #HEver had recurrent episodes of excessive overeating or binge eating = 2 Yes, at least once a week 
           case_when(`29132-0.0` == 2 &

            #Longest amount of time that overate or binge ate at least once a week = 0 At least three months 
                     `29133-0.0` == 0 &

            #Experienced episodes of overeating/binge eating during time(s) of low weight = 1 Both, 2 Only at times when I was not at low weight or -4 not underweight
                     (`29134-0.0` %in% c(1,2,-4) |

            #Experienced episodes of overeating/binge eating during time(s) of low weight = 0 Only at time(s) of low weight
                        (`29134-0.0` == 0 &

            #NOT Case {Extended anorexia phenotype} 
                         Extended_AN == 0)) &

            #Frequency of feeling had no control over eating during episodes of overeating/binge eating = 0 At least once a week for at least three months
                     `29135-0.0` == 0 &

            #Distress about episodes of overeating/binge eating) = 1 Yes
                     `29137-0.0` == 1 &

            #Methods of controlling body shape or weight when overeating/binge eating = 1 Made yourself vomit OR  2 Used laxatives (pills or liquids meant to stimulate bowel movements) OR 3 Used diuretics (water pills) OR 4 Used weight loss pills (over the counter or prescription) OR 5 Exercised excessively, felt compelled to exercise, felt uneasy or distressed if unable to exercise or prioritised exercise over your health or important activities OR 6 Fasted or not eaten for eight waking hours or more OR 7 Used other methods to lose weight/stay at low weight) 
                     `29140-0.0` %in% c(1,2,3,4,5,6,7) &

            #Frequency of using methods of controlling body shape or weight when overeating/binge eating = 1 Yes, at least once a week
                     `29141-0.0` == 1 &

            #Longest amount of time that engaged in these behaviours when overeating/binge eating = 0 At least three months
                     `29142-0.0` == 0 &

            #Dependency of self-esteem on body shape or weight when overeating/binge eating = 2 A great deal OR 1 A moderate amount
                     `29143-0.0` %in% c(1,2)
             ~ 1,
            TRUE ~ 0
           )
         )


## -----------------------------------------------------------------------------
#Extended purging phenotype
MHQ2 <- MHQ2 %>%
  mutate(Extended_purg = 
           case_when(`29144-0.0` == 1 ~ 1,
                     TRUE ~ 0)
  )


## -----------------------------------------------------------------------------
#Purging disorder
MHQ2 <- MHQ2 %>%
  mutate(Purging = 
           case_when(`29144-0.0` == 1 &
                     `29145-0.0` == 0 &
                     `29143-0.0` %in% c(1,2)
           ~ 1,
        TRUE ~ 0
        )
  )

