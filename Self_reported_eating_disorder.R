## -----------------------------------------------------------------------------
library("tidyverse")




## ----Define grep_reports------------------------------------------------------

grep_reports <- function(data, codes) {
  return(
    apply(
      X = data,
      MARGIN = 1,
      FUN = function(selected_row) {
        if (
          all(
            is.na(selected_row)
          )
        ) {
          return(NA_real_)
        } else {
          return(
            sign(
              sum(codes %in% selected_row)
            )
          )
        }
      }
    )
  )
}



## ----Any eating disorder diagnosis--------------------------------------------

dat$SelfReportedEatingDisorder <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = c(17:20)
)



## ----Anorexia nervosa---------------------------------------------------------
dat$SelfReportedAnorexiaNervosa <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = 17
)


## -----------------------------------------------------------------------------
if(diagnosticsFlag) dat %>%
  count(SelfReportedAnorexiaNervosa)


## ----Bulimia nervosa----------------------------------------------------------
dat$SelfReportedBulimiaNervosa <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = 18
)


## -----------------------------------------------------------------------------
if(diagnosticsFlag) dat %>%
  count(SelfReportedBulimiaNervosa)


## ----Binge eating disorder----------------------------------------------------
dat$SelfReportedBingeEatingDisorder <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = 19
)


## -----------------------------------------------------------------------------
if(diagnosticsFlag) dat %>%
  count(SelfReportedBingeEatingDisorder)

