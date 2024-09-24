## ----BE rapid_eating-----------------
# Create numeric variables
dat <- dat %>%
  mutate(
    BE_rapid_eating_numeric = case_when(
      `29136-0.0` == 1 |
        `29136-0.1` == 1 |
        `29136-0.2` == 1 |
        `29136-0.3` == 1 |
        `29136-0.4` == 1 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check
if(diagnosticsFlag) dat %>%
  count(BE_rapid_eating_numeric)


## ----BE feeling_uncomf_full----------
dat <- dat %>%
  mutate(
    BE_feeling_uncomf_full_numeric = case_when(
      `29136-0.0` == 2 |
        `29136-0.1` == 2 |
        `29136-0.2` == 2 |
        `29136-0.3` == 2 |
        `29136-0.4` == 2 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check (expecting 10,920)
if(diagnosticsFlag) dat %>%
  count(BE_feeling_uncomf_full_numeric)


## ----BE large_amounts_not_hungry-----
dat <- dat %>%
  mutate(
    BE_large_amounts_not_hungry_numeric = case_when(
      `29136-0.0` == 3 |
        `29136-0.1` == 3 |
        `29136-0.2` == 3 |
        `29136-0.3` == 3 |
        `29136-0.4` == 3 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check (expecting 9,963)
if(diagnosticsFlag) dat %>%
  count(BE_large_amounts_not_hungry_numeric)


## ----BE eaten_alone_embarrassed------
dat <- dat %>%
  mutate(
    BE_eaten_alone_embarrassed_numeric = case_when(
      `29136-0.0` == 4 |
        `29136-0.1` == 4 |
        `29136-0.2` == 4 |
        `29136-0.3` == 4 |
        `29136-0.4` == 4 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check (expecting 5,798)
if(diagnosticsFlag) dat %>%
  count(BE_eaten_alone_embarrassed_numeric)


## ----BE disgusted_depressed_after----
dat <- dat %>%
  mutate(
    BE_disgusted_depressed_after_numeric = case_when(
      `29136-0.0` == 5 |
        `29136-0.1` == 5 |
        `29136-0.2` == 5 |
        `29136-0.3` == 5 |
        `29136-0.4` == 5 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check (expecting 8,341)
if(diagnosticsFlag) dat %>%
  count(BE_disgusted_depressed_after_numeric)


## ----sumscore BE behaviours----------
dat <- dat %>%
  mutate(
    BE_no_characteristics_numeric = case_when(
      `29136-0.0` == 0 |
        `29136-0.1` == 0 |
        `29136-0.2` == 0 |
        `29136-0.3` == 0 |
        `29136-0.4` == 0 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check (expecting 2,429)
if(diagnosticsFlag) dat %>%
  count(BE_no_characteristics_numeric)


## ----sumscore BE behaviours 2--------
dat <- dat %>%
  mutate(
    BE_characteristics_PTNA_numeric = case_when(
      `29136-0.0` == -3 |
        `29136-0.1` == -3 |
        `29136-0.2` == -3 |
        `29136-0.3` == -3 |
        `29136-0.4` == -3 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

# Check (expecting 97)
if(diagnosticsFlag) dat %>%
  count(BE_characteristics_PTNA_numeric)


## ----sumscore BE_characteristics_items----
BE_characteristics_items <- dat %>%
  select(
    BE_rapid_eating_numeric,
    BE_feeling_uncomf_full_numeric,
    BE_large_amounts_not_hungry_numeric,
    BE_eaten_alone_embarrassed_numeric,
    BE_disgusted_depressed_after_numeric
  )

if(diagnosticsFlag) BE_characteristics_items %>%
  names()


## ----BE characteristics--------------
dat <- dat %>%
  mutate(
    BE_characteristics_sumscore = rowSums(
      BE_characteristics_items,
      na.rm = TRUE
    )
  )

# Check (expecting maximum 5, minimum 0)
if(diagnosticsFlag) dat %>%
  select(BE_characteristics_sumscore) %>%
  count(BE_characteristics_sumscore)


## ----BED DSM5 algorithm--------------
dat <- dat %>%
  mutate(
    MHQ2.BingeEatingDisorderDSM5 = case_when(
      # "Have you had recurrent episodes of excessive overeating
      # or binge eating (i.e. eating significantly more than what
      # most people eat in a similar period of time,
      # for example, two hours)?" = "Yes, at least once a week"
      `29132-0.0` == 2 &
        # "During your episodes of excessive overeating/binge eating,
        # how often have you felt like you did not have control over
        # your eating (e.g. not being able to stop eating or feeling
        # compelled to eat)?" = "At least once a week for at least 3 months"
        `29135-0.0` == 0 &
        # "What was the longest amount of time when you were overeating/binge
        # eating at least once a week?" = "At least 3 months"
        `29133-0.0` == 0 &
        # During these episodes of excessive overeating or binge eating,
        # have you (Participant needs at least 3 of 5 binge-eating-related
        # characteristics, sum score calculated above)
        BE_characteristics_sumscore >= 3 &
        # "Do/did you feel distressed about your episodes of
        # excessive overeating/binge eating? Yes"
        `29137-0.0` == 1 &
        # "During the time(s) when you were regularly overeating/binge eating,
        # have you done any of the following as a way to control your body shape
        # or weight? (Select all that apply)?" = "None of the above"
        (
          `29140-0.0` == 0 |
            `29140-0.1` == 0 |
            `29140-0.2` == 0 |
            `29140-0.3` == 0 |
            `29140-0.4` == 0 |
            `29140-0.5` == 0 |
            `29140-0.6` == 0
        ) &
        # DSM5 criteria: "Does not occur exclusively during the course
        # of anorexia nervosa" (calculated above)
        BE_not_during_AN == 1 ~ 1,
      # did not binge eat (has answered ED section of MHQ2)
      !is.na(`29205-0.0`) ~ 0,
      # people who have not answered the MHQ2
      TRUE ~ NA_real_
    )
  )

