## -----------------------------------------------------------------------------
#Extended anorexia phenotype
MHQ2 <- MHQ2 %>%
  mutate(Extended_AN = 
           case_when(`29120-0.0` == 1 ~ 1,
                     `29120-0.0` == 0 ~ 0,
                     TRUE ~ NA
                     )
        )


## -----------------------------------------------------------------------------
#BMI at low weight

#FOR TESTING: MHQ2$'12144-1.0'<-169.0
MHQ2 <- MHQ2 %>%
  mutate(BMI =
           case_when(is.na(`29125-0.0`) |
                     is.na(`50-0.0`) | #fetched from external dataset +++JZ: WHICH?
                     `29125-0.0` %in% c(0, -1, -3) ~ NA,
                     TRUE ~ `29125-0.0` / (`50-0.0`/100)^2)
        )


## -----------------------------------------------------------------------------
#Anorexia nervosa
MHQ2 <- MHQ2 %>%
  mutate(AN =
           #Case {Extended anorexia phenotype}
           case_when(Extended_AN == 1 &

           #{BMI at low weight} <= 18.55 kg/m2
                       BMI <= 18.55 &

           #(Did you feel fat? = 1 Yes
                       (`29122-0.0` == 1 |

           #Afraid of gaining weight or becoming fat = 1 Yes
                        `29123-0.0` == 1 |

           #Thinking or feeling body larger than it is = 1 Yes
                        `29124-0.0` == 1 |

           #WDependency of self-esteem on body shape or weight = 2 A great deal OR 1 A moderate amount)
                        `29146-0.0` %in% c(1,2)) &

           #(Afraid of gaining weight or becoming fat = 1 Yes
                       (`29123-0.0` == 1 |

           #Methods of controlling body shape or weight when at this low weight = any of 1 to 7)
                        `29130-0.0` %in% c(1,2,3,4,5,6,7))
            ~ 1,
         TRUE ~ 0
  ))

# #check results
# View(
#   MHQ2[,
#        c(
#          'Extended_AN',
#          'BMI',
#          '29122-0.0',
#          '29124-0.0',
#          '29128-0.0',
#          '29129-0.0',
#          '29123-0.0',
#          '29130-0.0',
#          'AN'
#        )
#        ]
# )


## -----------------------------------------------------------------------------
#Anorexia nervosa - binge/purge subtype
MHQ2 <- MHQ2 %>%
  mutate(AN_binge_purge =
           case_when(Extended_AN == 1 &
                       `29123-0.0` == 1 &
                       (`29134-0.0` %in% c(1,2) |
                        `29130-0.0` %in% c(1, 2, 3, 7))
            ~ 1,
         TRUE ~ 0
  ))
# #check results
# View(
#   MHQ2[,
#        c(
#          'Extended_AN',
#          '29123-0.0',
#          '29134-0.0',
#          '29130-0.0',
#          'AN_binge_purge'
#        )
#        ]
# )


## -----------------------------------------------------------------------------
#Anorexia nervosa - restricting subtype
MHQ2 <- MHQ2 %>%
  mutate(AN_restrict =
           case_when(Extended_AN == 1 &
                       `29123-0.0` == 1 &
                       !(`29130-0.0` %in% c(1, 2, 3, 7)) &
                       (`29132-0.0` == 0 |
                        `29134-0.0` == 0) &
                       `29130-0.0` %in% c(4,5,6)
            ~ 1,
         TRUE ~ 0
  ))
# #check results
# View(
#   MHQ2[,
#        c(
#          'Extended_AN',
#          'BMI',
#          '29123-0.0',
#          '29132-0.0',
#          '29134-0.0',
#          '29130-0.0',
#          'AN_restrict'
#        )
#        ]
# )

