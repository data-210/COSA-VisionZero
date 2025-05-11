### 2025 trends ###
library(tidyverse)

# Read csv file
ped_cycle_df <- read_csv("~/Documents/Repos/COSA-VisionZero/src/ped_cycle_df.csv")

# Filter for crash years
df_filtered <- ped_cycle_df %>%
  filter(Crash_Year %in% c(2023, 2024, 2025))

# Separate pedestrians and cyclists
pedestrians <- df_filtered %>%
  filter(str_detect(Person_Type, "PEDESTRIAN"))

cyclists <- df_filtered %>%
  filter(str_detect(Person_Type, "PEDALCYCLIST"))
