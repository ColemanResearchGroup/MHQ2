## ------------------------------------
dat <- dat %>%
  mutate(
    MHQ2.ExtendedPurgingPhenotype = case_when(
      is.na(`29144-0.0`) |
        `29144-0.0` < 0 ~ NA,
      TRUE ~ `29144-0.0`
    )
  )


## ------------------------------------
dat <- dat %>%
  mutate(
    MHQ2.PurgingDisorder = case_when(
      # Purging behaviours & once a week
      `29144-0.0` == 1 &
        # & at least three months
        `29145-0.0` == 0 &
        # & self-worth dependent on body shape/weight during purging
        `29146-0.0` %in% c(1, 2) ~ 1,
      # does not have purging disorder (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

if(diagnosticsFlag) dat %>%
  group_by(
    `29144-0.0`,
    `29145-0.0`,
    `29146-0.0`,
    MHQ2.PurgingDisorder
  ) %>%
  tally()


## ------------------------------------
if(diagnosticsFlag) dat %>%
  select(
    `29144-0.0`, # weight loss behaviours once per week
    `29145-0.0`, # weight loss behaviours duration
    `29146-0.0`, # weight loss behaviours self-esteem
    `29205-0.0`, # end date ED section MHQ2
    MHQ2.PurgingDisorder
  ) %>%
  filter(
    MHQ2.PurgingDisorder == 1
  )


## ------------------------------------
if(diagnosticsFlag) dat %>%
  count(MHQ2.PurgingDisorder)

