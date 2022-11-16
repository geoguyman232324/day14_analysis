nhi <- read.csv("C:/Users/Joe/OneDrive/Desktop/day14_analysis/data/F2022-NHIS-MentalHealth_raw (1).csv")
library(naniar)
library(tidyverse)
library(dplyr)
nhicleaner <-nhi %>% 
  replace_with_na(replace=list(HRSLEEP=0))

nhicleaner <- nhicleaner %>% 
  mutate(sleepmt7hr= ifelse(HRSLEEP>7, TRUE, FALSE))
nhic <- nhicleaner
nhic <- nhic %>%
  replace_with_na(replace=list(AEFFORT= c(6,7,8,9)))
nhic <- nhic %>%
  replace_with_na(replace=list(AHOPELESS= c(6,7,8,9)))
nhic <- nhic %>%
  replace_with_na(replace=list(ANERVOUS= c(6,7,8,9)))
nhic <- nhic %>%
  replace_with_na(replace=list(ARESTLESS= c(6,7,8,9)))
nhic <- nhic %>%
  replace_with_na(replace=list(ASAD= c(6,7,8,9)))
nhic <- nhic %>%
  replace_with_na(replace=list(AWORTHLESS= c(6,7,8,9)))

nhic <- nhic %>% 
  mutate(kesslerscore = AEFFORT+AHOPELESS+
         ANERVOUS+ARESTLESS+ASAD+AWORTHLESS)
nhic <- nhic %>% 
  mutate(mentalhealth_servere= ifelse(kesslerscore>=13, "Servere", "Not"))
nhic <- nhic %>%
  replace_with_na(replace=list(POORYN= 9))
