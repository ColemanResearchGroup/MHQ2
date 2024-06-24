## ----Install dependencies - remove hashes to install----

# packages <- c("data.table","tidyverse","dplyr")
# package_install(packages)







## ----Define grep_reports-------------

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



## ----Any self-reported diagnosis-----

dat$MHQ2.SelfReportedDiagnosis <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = c(1:13, 15:20)
)



## ----Any self-reported diagnosis, MHQ2016 compatible----

dat$MHQ2.SelfReportedDiagnosisMHQ2016Compatible <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = c(1:15, 17, 19)
)



## ----Any anxiety diagnosis-----------

dat$MHQ2.SelfReportedAnxietyDisorder <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = c(10:13, 15)
)



## ----Any eating disorder diagnosis----

dat$MHQ2.SelfReportedEatingDisorder <- grep_reports(
  data = dat[, grep(
    "^29000-",
    colnames(dat)
  )],
  codes = c(17:20)
)


