## ----bipolar type I cases------------
# this is the variable of biopolar type I from mania algorithm
# needed for single and recurrent unipolar depression

# bipolar.type.I
# dat$BD1: bipolar type 1 case = 1, not case = 0 #EXTERNAL FROM MANIA



## ----Single episode unipolar depression----

dat <-
  dat %>%
  mutate(
    MHQ2.DepressionSingle = case_when(
      MHQ2.DepressionEverCase == 1 &
        (`29033-0.0` == 1 & !is.na(`29033-0.0`)) &
        MHQ2.BD1 == 0 ~ 1,
      MHQ2.DepressionEverCase == 0 |
        (
          `29033-0.0` > 1 &
            !is.na(`29033-0.0`)
        ) |
        `29033-0.0` == -4  |
        MHQ2.BD1 == 1 ~ 0,
      .default = NA_real_
    )
  )

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.DepressionEverCase,
    `29033-0.0`,
    MHQ2.BD1,
    MHQ2.DepressionSingle
  ) %>%
  tally()

if (diagnosticsFlag) {
  View(dat %>%
    group_by(
      MHQ2.DepressionEverCase,
      `29033-0.0`,
      MHQ2.BD1,
      MHQ2.DepressionSingle
    ) %>%
    tally())
}


## ----Recurrent unipolar depression----

dat <-
  dat %>%
  mutate(
    MHQ2.DepressionRecurrent = case_when(
      MHQ2.DepressionEverCase == 1 &
        (
          !is.na(`29033-0.0`) &
            (
              `29033-0.0` > 1 |
                `29033-0.0` == -4
            )
        ) &
        MHQ2.BD1 == 0 ~ 1,
      MHQ2.DepressionEverCase == 0 |
        MHQ2.BD1 == 1 |
        `29033-0.0` == 1  ~ 0,
      .default = NA_real_
    )
  )

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.DepressionEverCase,
    `29033-0.0`,
    MHQ2.BD1,
    MHQ2.DepressionRecurrent
  ) %>%
  tally()

# View(dat %>%
#   group_by(
#     MHQ2.DepressionEverCase,
#     `29033-0.0`,
#     MHQ2.BD1,
#     MHQ2.DepressionRecurrent
#   ) %>%
#   tally())



## ----Single episode unipolar depression triggered by event----

dat <-
  dat %>%
  mutate(
    MHQ2.DepressionSingleEvent = case_when(
      MHQ2.DepressionSingle == 1 &
        `29013-0.0` == 1 ~ 1,
      MHQ2.DepressionSingle == 0 |
        `29013-0.0` == 0 ~ 0,
      .default = NA_real_
    )
  )

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.DepressionEverCase,
    `29033-0.0`,
    MHQ2.BD1,
    MHQ2.DepressionSingleEvent
  ) %>%
  tally()

# View(dat %>%
#   group_by(
#     MHQ2.DepressionEverCase,
#     `29033-0.0`,
#     MHQ2.BD1,
#     MHQ2.DepressionSingleEvent
#   ) %>%
#   tally())



## ----Post-natal depression-----------

dat <-
  dat %>%
  mutate(
    MHQ2.DepressionPostnatal = case_when(
      MHQ2.DepressionEverCase == 1 &
        `29035-0.0` == 1 ~ 1,
      MHQ2.DepressionEverCase == 0 |
        `29035-0.0` == 0 ~ 0,
      .default = NA_real_
    )
  )

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.DepressionEverCase,
    `29033-0.0`,
    MHQ2.BD1,
    MHQ2.DepressionPostnatal
  ) %>%
  tally()

# View(dat %>%
#   group_by(
#     MHQ2.DepressionEverCase,
#     `29033-0.0`,
#     MHQ2.BD1,
#     MHQ2.DepressionPostnatal
#   ) %>%
#   tally())



## ----Melancholic-like depression-----

dat <-
  dat %>%
  mutate(
    mood.worse = case_when(
      `29017-0.0` == 0 ~ 1,
      `29017-0.0` == 1 |
        `29017-0.0` == 2 ~ 0,
      .default = NA_real_
    ),
    appetite.weight = case_when(
      (
        `29020-0.0` == 2 |
          `29021-0.0` == 1
      ) ~ 1,
      (
        `29020-0.0` == 0 &
          (
            `29021-0.0` == 0 |
              `29021-0.0` == 2 |
              `29021-0.0` == 3
          )
      ) |
        (
          `29020-0.0` == 1 &
            (
              `29021-0.0` == 0 |
                `29021-0.0` == 2 |
                `29021-0.0` == 3
            )
        ) ~ 0,
      .default = NA_real_
    ),
    wake.early = case_when(
      `29022-0.0` == 1 &
        `29024-0.0` == 1 ~ 1,
      `29022-0.0` == 0 |
        `29024-0.0` == 0 ~ 0,
      .default = NA_real_
    ),
    guilt = case_when(
      `29028-0.0` == 1 ~ 1,
      `29028-0.0` == 0 ~ 0,
      .default = NA_real_
    )
  ) %>%
  mutate(
    melan.symptom.score = rowSums(
      select(
        .,
        mood.worse,
        appetite.weight,
        wake.early,
        guilt
      ),
      na.rm = TRUE
    ) * NA_real_^(
      rowSums(
        !is.na(
          select(
            .,
            mood.worse,
            appetite.weight,
            wake.early,
            guilt
          )
        )
      ) == 0
    )
  ) %>%
  mutate(
    MHQ2.DepressionMelancholic = case_when(
      MHQ2.DepressionEverCase == 1 &
        (
          `29012-0.0` == 1 |
            `29016-0.0` == 0
        ) &
        (
          melan.symptom.score > 2 &
            !is.na(melan.symptom.score)
        ) ~ 1,
      MHQ2.DepressionEverCase == 0 |
        (
          `29012-0.0` == 0 &
            `29016-0.0` == 1
        ) |
        melan.symptom.score <= 2 ~ 0,
      .default = NA_real_
    )
  ) %>%
  select(
    -mood.worse,
    -appetite.weight,
    -wake.early,
    -guilt,
    -melan.symptom.score
  )

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.DepressionEverCase,
    `29012-0.0`,
    `29016-0.0`,
    MHQ2.DepressionMelancholic
  ) %>%
  tally()

# View(dat %>%
#   group_by(
#     MHQ2.DepressionEverCase,
#     `29012-0.0`,
#     `29016-0.0`,
#     MHQ2.DepressionMelancholic
#   ) %>%
#   tally())



## ----Atypical depression-------------

dat <-
  dat %>%
  mutate(
    appetite.weight = case_when(
      `29020-0.0` == 1 |
        `29021-0.0` == 0 ~ 1,
      (
        `29020-0.0` == 0 &
          (`29021-0.0` == 1 |
             `29021-0.0` == 2 |
             `29021-0.0` == 3
          )
      ) |
        (
          `29020-0.0` == 2 &
            (
              `29021-0.0` == 1 |
                `29021-0.0` == 2 |
                `29021-0.0` == 3
            )
        ) ~ 0,
      .default = NA_real_
    ),
    sleep.much = case_when(
      `29022-0.0` == 1 &
        `29025-0.0` == 1 ~ 1,
      `29022-0.0` == 0 |
        `29025-0.0` == 0 ~ 0,
      .default = NA_real_
    ),
    heavy.feeling = case_when(
      `29019-0.0` == 1 ~ 1,
      `29019-0.0` == 0 ~ 0,
      .default = NA_real_
    ),
    rejection = case_when(
      `29032-0.0` == 0 ~ 1,
      `29032-0.0` == 1 |
        `29032-0.0` == 2 ~ 0,
      .default = NA_real_
    )
  ) %>%
  mutate(
    atypical.symptom.score = rowSums(
      select(
        .,
        appetite.weight,
        sleep.much,
        heavy.feeling,
        rejection
      ),
      na.rm = TRUE
    ) * NA_real_^(
      rowSums(
        !is.na(
          select(
            .,
            appetite.weight,
            sleep.much,
            heavy.feeling,
            rejection
          )
        )
      ) == 0
    )
  ) %>%
  mutate(
    MHQ2.DepressionAtypical = case_when(
      MHQ2.DepressionEverCase == 1 &
        MHQ2.DepressionMelancholic == 0 &
        `29016-0.0` == 1 &
        (
          atypical.symptom.score > 1 &
            !is.na(atypical.symptom.score)
        ) ~ 1,
      MHQ2.DepressionEverCase == 0 |
        MHQ2.DepressionMelancholic == 1 |
        `29016-0.0` == 0 |
        atypical.symptom.score <= 1 ~ 0,
      .default = NA_real_
    )
  ) %>%
  select(
    -appetite.weight,
    -sleep.much,
    -heavy.feeling,
    -rejection,
    -atypical.symptom.score
  )

if(diagnosticsFlag) dat %>%
  group_by(
    MHQ2.DepressionEverCase,
    MHQ2.DepressionAtypical
  ) %>%
  tally()

# View(dat %>%
#   group_by(
#     MHQ2.DepressionEverCase,
#     MHQ2.DepressionAtypical
#   ) %>%
#   tally())


