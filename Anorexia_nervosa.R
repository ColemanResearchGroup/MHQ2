## ----made yourself vomit------------------------------------------------------
dat <- dat %>%
  mutate(
    LW_made_yourself_vomit =
      case_when(
        `29130-0.0` == 1 |
        `29130-0.1` == 1 |
        `29130-0.2` == 1 | 
        `29130-0.3` == 1 |
        `29130-0.4` == 1 |
        `29130-0.5` == 1 |
        `29130-0.6` == 1 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 1.021)
dat %>%
  count(LW_made_yourself_vomit)


## ----used laxatives-----------------------------------------------------------
dat <- dat %>%
  mutate(
    LW_used_laxatives =
      case_when(
        `29130-0.0` == 2 |
        `29130-0.1` == 2 |
        `29130-0.2` == 2 | 
        `29130-0.3` == 2 |
        `29130-0.4` == 2 |
        `29130-0.5` == 2 |
        `29130-0.6` == 2 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 1.050)
dat %>%
  count(LW_used_laxatives)


## ----used diuretics-----------------------------------------------------------
dat <- dat %>%
  mutate(
    LW_used_diuretics =
      case_when(
        `29130-0.0` == 3 |
        `29130-0.1` == 3 |
        `29130-0.2` == 3 | 
        `29130-0.3` == 3 |
        `29130-0.4` == 3 |
        `29130-0.5` == 3 |
        `29130-0.6` == 3 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 247)
dat %>%
  count(LW_used_diuretics)


## ----used weight loss pills---------------------------------------------------
dat <- dat %>%
  mutate(
    LW_used_weight_loss_pills =
      case_when(
        `29130-0.0` == 4 |
        `29130-0.1` == 4 |
        `29130-0.2` == 4 | 
        `29130-0.3` == 4 |
        `29130-0.4` == 4 |
        `29130-0.5` == 4 |
        `29130-0.6` == 4 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 288)
dat %>%
  count(LW_used_weight_loss_pills)


## ----excessive exercise-------------------------------------------------------
dat <- dat %>%
  mutate(
    LW_excessive_exercise =
      case_when(
        `29130-0.0` == 5 |
        `29130-0.1` == 5 |
        `29130-0.2` == 5 | 
        `29130-0.3` == 5 |
        `29130-0.4` == 5 |
        `29130-0.5` == 5 |
        `29130-0.6` == 5 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 1,917)
dat %>%
  count(LW_excessive_exercise)


## ----fasted-------------------------------------------------------------------
dat <- dat %>%
  mutate(
    LW_fasted =
      case_when(
        `29130-0.0` == 6 |
        `29130-0.1` == 6 |
        `29130-0.2` == 6 | 
        `29130-0.3` == 6 |
        `29130-0.4` == 6 |
        `29130-0.5` == 6 |
        `29130-0.6` == 6 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 2,403)
dat %>%
  count(LW_fasted)


## ----other weight control-----------------------------------------------------
dat <- dat %>%
  mutate(
    LW_other_weight_control =
      case_when(
        `29130-0.0` == 7 |
        `29130-0.1` == 7 |
        `29130-0.2` == 7 | 
        `29130-0.3` == 7 |
        `29130-0.4` == 7 |
        `29130-0.5` == 7 |
        `29130-0.6` == 7 ~ 1,
                     
        # did not engage in any weight control behaviour
        `29130-0.0` == 0 ~ 0,
        
        # people who have not answered the MHQ2
        TRUE ~ NA_real_
                     )
         )

# Check (expecting 823)
dat %>%
  count(LW_other_weight_control)


## -----------------------------------------------------------------------------
dat <- dat %>%
  mutate(
    BMI_at_low_weight =
      case_when(
        is.na(`29125-0.0`) |
          is.na(`50-0.0`) |
          `29125-0.0` %in% c(0, -1, -3) ~ NA_real_,
        TRUE ~ `29125-0.0` / (`50-0.0`/100)^2)
        )


## -----------------------------------------------------------------------------
dat %>% 
  select(
    BMI_at_low_weight
  ) %>% 
  summary()


## -----------------------------------------------------------------------------
dat <- dat %>%
  mutate(Anorexia_nervosa = 
           case_when(
# Criterion A             
           # BMI at low weight <= 18.55 kg/m2
                       BMI_at_low_weight <= 18.55 &
# Criterion B
             # During the time when you were at this low weight: Afraid that you might gain weight or become fat = 1 Yes
                       (`29123-0.0` == 1 |

           # Have you done any of the following as a way to control your body shape or weight? = any of 1 to 7
             # when at low weight
                        LW_made_yourself_vomit == 1 |
                        LW_used_laxatives == 1 |
                        LW_used_diuretics == 1 |
                        LW_used_weight_loss_pills == 1 |
                        LW_excessive_exercise == 1 |
                        LW_fasted == 1 |
                        LW_other_weight_control == 1) &
# Criterion C  
           # Did you feel fat at low weight? = 1 Yes
                       (`29122-0.0` == 1 |

           # During the time when you were at this low weight: Did you think or feel that your body or parts of your body were larger than they actually were? = 1 Yes
                        `29124-0.0` == 1 |

           # Did/do you ever think your low weight had/has negative consequences for your health? = 0 No
                        `29128-0.0` == 0 |

           # When you are/were at this low weight, was your self-esteem dependent on your body shape or weight = 2 A great deal OR 1 A moderate amount
                        `29129-0.0` %in% c(1, 2) )
            ~ 1,
           
           # has answered ED section of MHQ2
           !is.na(`29205-0.0`) ~ 0,
           
           # people who have not answered the MHQ2
           TRUE ~ NA_real_
         )
  )


## -----------------------------------------------------------------------------
dat %>%
  count(Anorexia_nervosa)


## -----------------------------------------------------------------------------
dat <- dat %>%
  mutate(Anorexia_nervosa_binge_eating_purging =
# Criterion A
           # BMI at low weight <= 18.55 kg/m2
              case_when( BMI_at_low_weight <= 18.55 &
# Criterion B
           # During the time when you were at this low weight: Afraid that you might gain weight or become fat = 1 Yes
                       (`29123-0.0` == 1 |

          # Have you done any of the following as a way to control your body shape or weight? = any of 1 to 7
            # when at low weight
                        LW_made_yourself_vomit == 1 |
                        LW_used_laxatives == 1 |
                        LW_used_diuretics == 1 |
                        LW_used_weight_loss_pills == 1 |
                        LW_excessive_exercise == 1 |
                        LW_fasted == 1 |
                        LW_other_weight_control == 1) &

# Criterion C
           # Did you feel fat at low weight? = 1 Yes
                       (`29122-0.0` == 1 |

           # During the time when you were at this low weight: Did you think or feel that your body or parts of your body were larger than they actually were? = 1 Yes
                        `29124-0.0` == 1 |

           # Did/do you ever think your low weight had/has negative consequences for your health? = 0 No
                        `29128-0.0` == 0 |

           # When you are/were at this low weight, was your self-esteem dependent on your body shape or weight = 2 A great deal OR 1 A moderate amount
                        `29129-0.0` %in% c(1,2) ) &

# AN binge-eating criterion
          # Have you had recurrent episodes of excessive overeating or binge eating (EP6c) = 0 ONLY at time(s) of low weight OR 1 BOTH at time(s) of low weight AND at time(s) when I was not at low weight)
                       (`29134-0.0` %in% c(
                         0, 	# Only at time(s) of low weight
                         1	# Both at times of low weight and when not at low weight
                         ) |
# AN purging criterion
          # Have you done any of the following as a way to control your body shape or weight (EP5) = 1 Made yourself vomit OR 2 Used laxatives (pills or liquids meant to stimulate bowel movement) OR 3 Used diuretics (water pills) 
            # when at low weight
                        (LW_made_yourself_vomit == 1 |
                        LW_used_laxatives == 1 |
                        LW_used_diuretics == 1)
                  )
            ~ 1,
           
           # has answered ED section of MHQ2
           !is.na(`29205-0.0`) ~ 0,
           
           # people who have not answered the MHQ2
           TRUE ~ NA_real_
         )
  )


## -----------------------------------------------------------------------------
dat %>%
  count(Anorexia_nervosa_binge_eating_purging)


## -----------------------------------------------------------------------------
dat <- dat %>%
  mutate(Anorexia_nervosa_restricting =
# Criterion A
           # BMI at low weight <= 18.55 kg/m2
              case_when( BMI_at_low_weight <= 18.55 &
# Criterion B
           # During the time when you were at this low weight: Afraid that you might gain weight or become fat = 1 Yes
                       (`29123-0.0` == 1 |

          # Have you done any of the following as a way to control your body shape or weight? = 4 Used weight loss pills OR 5 exercise excessively OR 6 fasted
                        LW_excessive_exercise == 1 |
                        LW_fasted == 1 |
                        LW_used_weight_loss_pills == 1) &

# Criterion C
           # Did you feel fat at low weight? = 1 Yes
                       (`29122-0.0` == 1 |

           # During the time when you were at this low weight: Did you think or feel that your body or parts of your body were larger than they actually were? = 1 Yes
                        `29124-0.0` == 1 |

           # Did/do you ever think your low weight had/has negative consequences for your health? = 0 No
                        `29128-0.0` == 0 |

           # When you are/were at this low weight, was your self-esteem dependent on your body shape or weight = 2 A great deal OR 1 A moderate amount
                        `29129-0.0` %in% c(1,2) ) &

# Restricting type: During the last 3 months... 
  
  #...the individual has not engaged in recurrent episodes of binge eating or purging behavior (i.e., self-induced vomiting or the misuse of laxatives, diuretics, or enemas)...
                        (`29132-0.0` == 0 | # Never binge eating
                        `29134-0.0` == 2 # Binge eating: Only at time(s) when I was not at low weight [2,767]
                        ) &
  # During the period of time when you were at your lowest weight, did you use any of the following as a way to control your weight or shape?
                      (
                        LW_made_yourself_vomit == 0 | # No
                        LW_used_laxatives == 0 | # No
                        LW_used_diuretics == 0 # No
                        )

            ~ 1,
           
           # has answered ED section of MHQ2
           !is.na(`29205-0.0`) ~ 0,
           
           # people who have not answered the MHQ2
           TRUE ~ NA_real_
         )
  )

