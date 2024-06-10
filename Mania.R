## -----------------------------------------------------------------------------

dat$Total.Manifestations <- 0

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.0`) &
      `29051-0.0` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.1`) &
      `29051-0.1` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.2`) &
      `29051-0.2` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.3`) &
      `29051-0.3` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.4`) &
      `29051-0.4` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.5`) &
      `29051-0.5` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.6`) &
      `29051-0.6` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    !is.na(`29051-0.7`) &
      `29051-0.7` > 0,
    Total.Manifestations + 1,
    Total.Manifestations
  )
)

dat$Total.Manifestations <- with(
  dat,
  ifelse(
    is.na(`29051-0.0`) |
      `29051-0.0` < 0,
    NA,
    Total.Manifestations
  )
)


## -----------------------------------------------------------------------------

dat$MHQ2.HypomaniaEver <- with(
  dat,
  case_when(
    (
      is.na(`29049-0.0`) |
        `29049-0.0` < 0
    ) &
      (
        is.na(`29050-0.0`) |
          `29050-0.0` < 0
      ) &
      is.na(Total.Manifestations) &
      (
        is.na(`29052-0.0`) |
          `29052-0.0` < 0
      ) ~ NA_real_,
    (
      !is.na(`29049-0.0`) &
        `29049-0.0` == 1 |
        (
          !is.na(`29050-0.0`) &
            `29050-0.0` == 1
        )
    ) &
      (
        (
          !is.na(`29049-0.0`) &
            `29049-0.0` == 1 &
            Total.Manifestations >= 3
        ) |
          Total.Manifestations >= 4
      ) &
      !is.na(`29052-0.0`) &
      `29052-0.0` == 3 ~ 1,
    .default = 0
  )
)


## -----------------------------------------------------------------------------

dat$MHQ2.ManiaEver <- with(
  dat,
  case_when(
    (
      is.na(`29049-0.0`) |
        `29049-0.0` < 0
    ) &
      (
        is.na(`29050-0.0`) |
          `29050-0.0` < 0
      ) &
      is.na(Total.Manifestations) &
      (
        is.na(`29052-0.0`) |
          `29052-0.0` < 0
      ) &
      (
        is.na(`29056-0.0`) |
          `29056-0.0` < 0
      ) &
      (
        is.na(`29057-0.0`) |
          `29057-0.0` < 0
      ) ~ NA_real_,
    (
      (
        !is.na(`29049-0.0`) &
          `29049-0.0` == 1
      ) |
        (
          !is.na(`29050-0.0`) &
            `29050-0.0` == 1
        )
    ) &
      (
        (
          !is.na(`29049-0.0`) &
            `29049-0.0` == 1 &
            Total.Manifestations >= 3
        ) |
          Total.Manifestations >= 4
      ) &
      (
        (
          !is.na(`29052-0.0`) &
            `29052-0.0` == 3
        ) &
          (
            (
              !is.na(`29056-0.0`) &
                `29056-0.0` == 1
            ) |
              (
                !is.na(`29057-0.0`) &
                  `29057-0.0` == 1
              )
          )
      ) ~ 1,
    .default = 0
  )
)



## -----------------------------------------------------------------------------

dat$MHQ2.BD1 <- with(
  dat,
  ifelse(
    (
      !is.na(MHQ2.DepressionEverCase) &
        MHQ2.DepressionEverCase == 1
    ) & 
      (
        !is.na(MHQ2.ManiaEver) &
          MHQ2.ManiaEver == 1
      ),
    1,
    0
  )
)



## -----------------------------------------------------------------------------

grep_reports <- function(data, codes) {
  return(
    apply(
      X = data,
      MARGIN = 1,
      FUN = function(selected_row) {
	if (all(is.na(selected_row))) {
          return(NA_real_)
        } else {
          return(sign(sum(codes %in% selected_row)))
        }
      }
    )
  )
}


dat$SelfReportedBipolarDisorder <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = 2
)

dat$MHQ2.BipolarControl <- with(
  dat,
  ifelse(
    !is.na(MHQ2.HypomaniaEver) &
      MHQ2.HypomaniaEver == 0 &
      !is.na(MHQ2.ManiaEver) &
      MHQ2.ManiaEver == 0 &
      (
        is.na(20126-0.0) |
	(
	  20126-0.0 != 1 &
	  20126-0.0 != 2
        )
      ) &
      (
        is.na(SelfReportedBipolarDisorder) |
          SelfReportedBipolarDisorder != 1
      ),
    1,
    0
  )
)



## -----------------------------------------------------------------------------

dat$MHQ2.WiderBipolar <- with(
  dat,
  ifelse(
    (
      !is.na(MHQ2.DepressionEverCase) &
        MHQ2.DepressionEverCase == 1
    ) &
      (
        !is.na(MHQ2.HypomaniaEver) &
          MHQ2.HypomaniaEver == 1
      ),
    1,
    0
  )
)

