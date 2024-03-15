## -----------------------------------------------------------------------------
dat <- dat %>%
  mutate(social_isolation = case_when(
    (is.na(`29162-0.0`) | `29162-0.0` < 0) |
    (is.na(`29163-0.0`) | `29163-0.0` < 0) |
    (is.na(`29167-0.0`) | `29167-0.0` < 0) ~ NA_real_,
    (`29162-0.0` == 0 & `29163-0.0` %in% c(0, 1)) |
    (`29162-0.0` == 0 & `29167-0.0` == 0) |
    (`29163-0.0` %in% c(0, 1) & `29167-0.0` == 0) ~ 1,
    TRUE ~ 0
  )
)



## -----------------------------------------------------------------------------
dat <- dat %>%
  mutate(virtually_connected = case_when(
    (is.na(`29164-0.0`) | `29164-0.0` < 0) |
    (is.na(`29168-0.0`) | `29168-0.0` < 0) ~ NA_real_,
    `29164-0.0` %in% c(3, 4, 5) |
    !`29168-0.0` == 0 ~ 1,
    TRUE ~0
  )
)



## -----------------------------------------------------------------------------
##Re-code scores to 1-3
#Companionship, 29172
dat <- dat %>%
  mutate(`29172-0.0_recoded_social` = recode(as.character(`29172-0.0`),
    "0" = 1,
    "1" = 2,
    "2" = 3,
    "-1" = NA_real_,
    "-3" = NA_real_,
    .default = NA_real_
  )
)

#Left out, 29173
dat <- dat %>%
  mutate(`29173-0.0_recoded_social` = recode(as.character(`29173-0.0`),
    "0" = 1,
    "1" = 2,
    "2" = 3,
    "-1" = NA_real_,
    "-3" = NA_real_,
    .default = NA_real_
  )
)

#Isolated, 29174
dat <- dat %>%
  mutate(`29174-0.0_recoded_social` = recode(as.character(`29174-0.0`),
    "0" = 1,
    "1" = 2,
    "2" = 3,
    "-1" = NA_real_,
    "-3" = NA_real_,
    .default = NA_real_
  )
)

##Sum of UCLA scores
dat$UCLA_loneliness_sum <- rowSums(
  dat[,c("29172-0.0_recoded_social","29173-0.0_recoded_social","29174-0.0_recoded_social")],
  na.rm = FALSE
)

dat <- dat[,!grepl("_recoded_social$",colnames(dat))]



## -----------------------------------------------------------------------------
##Re-code scores
#Bounce back, BRS1, 29175
dat <- dat %>%
  mutate(`29175-0.0_recoded_social` = recode(as.character(`29175-0.0`),
    "0" = 1,
    "1" = 2,
    "2" = 3,
    "3" = 4,
    "4" = 5,
    .default = NA_real_
  )
)

#Recover, BRS3, 29177
dat <- dat %>%
  mutate(`29177-0.0_recoded_social` = recode(as.character(`29177-0.0`),
    "0" = 1,
    "1" = 2,
    "2" = 3,
    "3" = 4,
    "4" = 5,
    .default = NA_real_
  )
)

#Little Trouble, BRS5, 29179
dat <- dat %>%
  mutate(`29179-0.0_recoded_social` = recode(as.character(`29179-0.0`),
    "0" = 1,
    "1" = 2,
    "2" = 3,
    "3" = 4,
    "4" = 5,
    .default = NA_real_
  )
)

#Hard time, BRS2, 29176
dat <- dat %>%
  mutate(`29176-0.0_recoded_social` = recode(as.character(`29176-0.0`),
    "0" = 5,
    "1" = 4,
    "2" = 3,
    "3" = 2,
    "4" = 1,
    .default = NA_real_
  )
)

#Hard to snap back, BRS4, 29178
dat <- dat %>%
  mutate(`29178-0.0_recoded_social` = recode(as.character(`29178-0.0`),
    "0" = 5,
    "1" = 4,
    "2" = 3,
    "3" = 2,
    "4" = 1,
    .default = NA_real_
  )
)

#Setbacks, BRS6, 29180
dat <- dat %>%
  mutate(`29180-0.0_recoded_social` = recode(as.character(`29180-0.0`),
    "0" = 5,
    "1" = 4,
    "2" = 3,
    "3" = 2,
    "4" = 1,
    .default = NA_real_
  )
)

##BRS score sum
dat <- dat %>%
  mutate(BRS = (`29175-0.0_recoded_social` +
    `29177-0.0_recoded_social` +
    `29179-0.0_recoded_social` +
    `29176-0.0_recoded_social` +
    `29178-0.0_recoded_social` +
    `29180-0.0_recoded_social`
  ) / 6
)

dat <- dat[,!grepl("_recoded_social$",colnames(dat))]


