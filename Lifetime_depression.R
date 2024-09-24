## ----Depression ever case------------

if(diagnosticsFlag) unique(dat$`29014-0.0`)
if(diagnosticsFlag) unique(dat$`29021-0.0`)

cidid_symptoms <- c(
  "29011-0.0",
  "29012-0.0",
  "29018-0.0",
  "29022-0.0",
  "29026-0.0",
  "29027-0.0",
  "29029-0.0"
)

dat <-
  dat %>%
  mutate(
    # missingness of core symptoms (yes = either symptoms are missing)
    cidid.no.info = case_when(
      (
        is.na(`29011-0.0`) |
          `29011-0.0` < 0
      ) |
        (
          is.na(`29012-0.0`) |
            `29012-0.0` < 0
        ) ~ 1,
      .default = 0
    ),
    day.time = case_when(
      `29014-0.0` == 1 |
        `29014-0.0` == 0 ~ 1,
      `29014-0.0` == 2 |
        `29014-0.0` == 3 ~ 0,
      .default = NA_real_
    ),
    day.freq = case_when(
      `29015-0.0` == 1 |
        `29015-0.0` == 0 ~ 1,
      `29015-0.0` == 2 ~ 0,
      .default = NA_real_
    ),
    impairment = case_when(
      `29031-0.0` == 1 |
        `29031-0.0` == 0 ~ 1,
      `29031-0.0` == 2 |
        `29031-0.0` == 3 ~ 0,
      .default = NA_real_
    ),
    # modify the coding format of weight change
    `tmp_29021-0.0` = case_when(
      `29021-0.0` == 0 |
        `29021-0.0` == 1 |
        `29021-0.0` == 2 ~ 1,
      `29021-0.0` == 3 ~ 0,
      .default = NA_real_
    ),
    # change negative value to NA
    across(
      all_of(cidid_symptoms),
      ~ case_when(
        (. == 1) ~ 1,
        (. == 0) ~ 0,
        (
          (. < 0) |
            is.na(.)
        ) ~ NA_real_
      ),
      .names = "tmp_{col}"
    )
  ) %>%
  mutate(
    # core symptoms + frequency
    cidid.screen = case_when(
      (
        `29011-0.0` == 1 |
          `29012-0.0` == 1
      ) &
        day.time == 1 &
        day.freq == 1 &
        impairment == 1 ~ 1,
      (
        `29011-0.0` == 0 &
          `29012-0.0` == 0
      ) |
        day.time == 0 |
        day.freq == 0 |
        impairment == 0 ~ 0,
      .default = NA_real_
    )
  ) %>%
  mutate(
    # total number of symptoms
    cidid.symptom.score = rowSums(
      select(
        .,
        starts_with("tmp_")
      ),
      na.rm = TRUE
    ) * NA_real_^(
      rowSums(
        !is.na(
          select(
            .,
            starts_with("tmp_")
          )
        )
      ) == 0
    ) # anything ^ 0 equals 1, show NA if all items are missing
  ) %>%
  mutate(
    # MHQ2.DepressionEverCase
    MHQ2.DepressionEverCase = case_when(
      cidid.screen == 1 &
        !is.na(cidid.symptom.score) &
        cidid.symptom.score >= 5 ~ 1,
      (
        cidid.screen == 0 |
          cidid.symptom.score < 5
      ) &
        cidid.no.info == 0 &
        !is.na(cidid.symptom.score) ~ 0,
      .default = NA_real_
    )
  ) %>%
  select(
    -cidid.no.info,
    -cidid.screen,
    -cidid.symptom.score,
    -day.time,
    -day.freq,
    -impairment,
    -starts_with("tmp_")
  )

rm(cidid_symptoms)



## ----Depression ever control---------

phq_symptoms <- c(
  "29002-0.0",
  "29003-0.0",
  "29004-0.0",
  "29005-0.0",
  "29006-0.0",
  "29007-0.0",
  "29008-0.0",
  "29009-0.0",
  "29010-0.0"
)

dat$tmp_29000 <- apply(
  dat[, grepl(
    "29000-0",
    colnames(dat)
  )],
  1,
  function(x) {
    "1" %in% x
  }
)

dat <-
  dat %>%
  # change coding format of PHQ 9 symptoms
  mutate(
    across(
      all_of(phq_symptoms), ~ case_when(
        (
          . == 2 |
            . == 3
        ) ~ 1,
        (
          . == 0 |
            . == 1
        ) ~ 0,
        (
          . < 0 |
            is.na(.)
        ) ~ NA_real_
      ), .names = "tmp_{col}"
    )
  ) %>%
  mutate(
    # PHQ score
    phq.symptom.score = rowSums(
      select(
        .,
        starts_with("tmp_")
      ),
      na.rm = TRUE
    ) * NA_real_^(
      rowSums(
        !is.na(
          select(
            .,
            starts_with("tmp_")
          )
        )
      ) == 0
    )
  ) %>%
  mutate(
    MHQ2.DepressionEverControl = case_when(
      tmp_29000 == FALSE &
        `29011-0.0` == 0 &
        `29012-0.0` == 0 &
        phq.symptom.score < 5 &
        !is.na(phq.symptom.score) ~ 1,
      tmp_29000 == TRUE |
        `29011-0.0` == 1 |
        `29012-0.0` == 1 |
        (
          phq.symptom.score >= 5 &
            !is.na(phq.symptom.score)
        ) ~ 0,
      .default = NA_real_
    )
  ) %>%
  select(-starts_with("tmp_"))

rm(phq_symptoms)



## ----subthreshold depressive symptoms ever----

dat$tmp_29000 <- apply(
  dat[, grepl(
    "29000-0",
    colnames(dat)
  )],
  1,
  function(x) {
    "1" %in% x
  }
)

dat <-
  dat %>%
  mutate(
    subthreshold = case_when(
      (
        `29011-0.0` == 1 |
          `29012-0.0` == 1 |
          tmp_29000 == TRUE |
          (
            phq.symptom.score >= 5 &
              !is.na(phq.symptom.score)
          )
      ) ~ 1,
      `29011-0.0` == 0 &
        `29012-0.0` == 0 &
        tmp_29000 == FALSE &
        (
          phq.symptom.score < 5 &
            !is.na(phq.symptom.score)
        ) ~ 0,
      .default = NA_real_
    )
  ) %>%
  mutate(
    MHQ2.DepressionSubthreshold = case_when(
      MHQ2.DepressionEverCase == 1 |
        subthreshold == 1 ~ 1,
      MHQ2.DepressionEverCase == 0 &
        subthreshold == 0 ~ 0,
      .default = NA_real_
    )
  ) %>%
  select(
    -phq.symptom.score,
    -tmp_29000,
    -subthreshold
  )

