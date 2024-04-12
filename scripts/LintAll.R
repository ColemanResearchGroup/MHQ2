
### Author: JRIColeman
### Date: 2024-04-121
### Purpose: Lint all modules

### Install packages

# install.packages("lintr")

### Load library

library(lintr)

### Define lint

mhq_lints <- linters_with_defaults(
  object_name_linter(
    styles = c("symbol", 
               "CamelCase", 
               "snake_case", 
               "lowercase"
    )
  )
)

### Lint all

sink("AnxietyLint.txt")
lint("Anxiety.Rmd")
sink()

sink("BED_DSM5Lint.txt")
lint("BED_DSM5.Rmd")
sink()

sink("BED_ICD11Lint.txt")
lint("BED_ICD11.Rmd")
sink()

sink("Extended_BELint.txt")
lint("Extended_BE.Rmd")
sink()

sink("MHQ2_Lifetime_DepressionLint.txt")
lint("MHQ2_Lifetime_Depression.Rmd")
sink()

sink("MHQ2_Mania_v1Lint.txt")
lint("MHQ2_Mania_v1.Rmd")
sink()

sink("MHQ2_PHQ9Lint.txt")
lint("MHQ2_PHQ9.Rmd")
sink()

sink("SelfReportedLint.txt")
lint("SelfReported.Rmd")
sink()

sink("self-harm_mhq2_jgmLint.txt") 
lint("self-harm_mhq2_jgm.Rmd")
sink()

sink("traumaLint.txt")
lint("trauma.Rmd")
sink()
