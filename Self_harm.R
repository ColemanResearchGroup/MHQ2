## ------------------------------------

dat$MHQ2.LifeNotWorthLivingEver <- with(
  dat,
  case_when(
    is.na(`29108-0.0`) |
      `29108-0.0` < 0 ~ NA,
    TRUE ~ `29108-0.0`
  )
)



## ------------------------------------

dat$MHQ2.SelfHarmEver <- with(
  dat,
  case_when(
    is.na(`29111-0.0`) |
      `29111-0.0` < 0 ~ NA_real_,
    !is.na(`29111-0.0`) &
      `29111-0.0` > 0 ~ 1,
    .default = 0
  )
)



## ------------------------------------

dat$MHQ2.SelfHarm12Month <- with(
  dat,
  case_when(
    is.na(`29111-0.0`) |
      `29111-0.0` < 0 |
      is.na(`29114-0.0`) |
      `29114-0.0` < 0 ~ NA,
    !is.na(`29111-0.0`) &
      `29111-0.0` > 0 &
      !is.na(`29114-0.0`) &
      `29114-0.0` > 0 ~ 1,
    .default = 0
  )
)



## ------------------------------------

dat$MHQ2.SuicideAttemptEver <- with(
  dat,
  case_when(
    is.na(`29111-0.0`) |
      `29111-0.0` < 0 |
      is.na(`29116-0.0`) |
      is.na(`29116-0.0`) < 0 ~ NA,
    !is.na(`29111-0.0`) &
      `29111-0.0` > 0 &
      !is.na(`29116-0.0`) &
      `29116-0.0` > 0 ~ 1,
    .default = 0
  )
)

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.LifeNotWorthLivingEver,
    MHQ2.SelfHarmEver,
    MHQ2.SelfHarm12Month,
    MHQ2.SuicideAttemptEver
  ) %>%
  tally()


