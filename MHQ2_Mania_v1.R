## -----------------------------------------------------------------------------
dat$Total.Manifestations<-0

dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.0`) & `29051-0.0` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.1`) & `29051-0.1` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.2`) & `29051-0.2` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.3`) & `29051-0.3` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.4`) & `29051-0.4` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.5`) & `29051-0.5` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.6`) & `29051-0.6` > 0, Total.Manifestations + 1, Total.Manifestations))
dat$Total.Manifestations<-with(dat, ifelse(!is.na(`29051-0.7`) & `29051-0.7` > 0, Total.Manifestations + 1, Total.Manifestations))

dat$Total.Manifestations<-with(dat, ifelse(is.na(`29051-0.0`) | `29051-0.0` < 0, NA, Total.Manifestations))




## -----------------------------------------------------------------------------
dat$Hypomania.Ever <- with(dat, 
  case_when(
    (is.na(`29049-0.0`) | `29049-0.0` < 0) &
      (is.na(`29050-0.0`) | `29050-0.0` < 0) &
      is.na(Total.Manifestations) &
      (is.na(`29052-0.0`) | `29052-0.0` < 0) ~ NA_real_,
    (!is.na(`29049-0.0`) & `29049-0.0` == 1 |
      (!is.na(`29050-0.0`) & `29050-0.0` == 1)) &
      ((!is.na(`29049-0.0`) & `29049-0.0` == 1 & Total.Manifestations >= 3) |
      Total.Manifestations >= 4) &
      !is.na(`29052-0.0`) & `29052-0.0` == 3 ~ 1,
    .default = 0
  )
)


## -----------------------------------------------------------------------------

dat$Mania.Ever <- with(dat,
  case_when(
    (is.na(`29049-0.0`) | `29049-0.0` < 0) &
      (is.na(`29050-0.0`) | `29050-0.0` < 0) &
      is.na(Total.Manifestations) &
      (is.na(`29052-0.0`) | `29052-0.0` < 0) &
      (is.na(`29056-0.0`) | `29056-0.0` < 0) &
      (is.na(`29057-0.0`) | `29057-0.0` < 0) ~ NA_real_,
    ((!is.na(`29049-0.0`) & `29049-0.0` == 1) |
      (!is.na(`29050-0.0`) & `29050-0.0` == 1)) &
      ((!is.na(`29049-0.0`) & `29049-0.0` == 1 & Total.Manifestations >= 3) |
      Total.Manifestations >= 4) &
      ((!is.na(`29052-0.0`) & `29052-0.0` == 3) &
      ((!is.na(`29056-0.0`) & `29056-0.0` == 1) |
      (!is.na(`29057-0.0`) & `29057-0.0` == 1))) ~ 1,
    .default = 0
  )
)



## -----------------------------------------------------------------------------

dat$BD1 <- with(dat,
                 ifelse(
                   (!is.na(depression.ever.case) & depression.ever.case ==1) & #depression.ever.case EXTERNAL FROM LT_DEPRESSION
                     (!is.na(Mania.Ever) & Mania.Ever == 1),
                   1,
                   0
                 ))


## -----------------------------------------------------------------------------
dat$Wider.Bipolar <- with(dat,
                           ifelse(
                           (!is.na(depression.ever.case) & depression.ever.case == 1 ) &
                             (!is.na(Hypomania.Ever) & Hypomania.Ever == 1),
                           1, 0
                           ))

