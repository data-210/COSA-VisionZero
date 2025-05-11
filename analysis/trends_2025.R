### 2025 trends ###
library(tidyverse)
library(ggthemes)

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

# Summarize
ped_summary <- pedestrians %>%
  group_by(Crash_Year) %>%
  summarise(
    total_crashes = n(),
    total_injuries = sum(Person_Total_Injury_Count, na.rm = TRUE),
    serious_injuries = sum(Person_Suspected_Serious_Injury_Count, na.rm = TRUE),
    deaths = sum(Person_Death_Count, na.rm = TRUE)
  )

cyclist_summary <- cyclists %>%
  group_by(Crash_Year) %>%
  summarise(
    total_crashes = n(),
    total_injuries = sum(Person_Total_Injury_Count, na.rm = TRUE),
    serious_injuries = sum(Person_Suspected_Serious_Injury_Count, na.rm = TRUE),
    deaths = sum(Person_Death_Count, na.rm = TRUE)
  )

# Monthly summary
month_levels <- month.name
df_filtered$Crash_Month <- factor(df_filtered$Crash_Month, levels = month_levels,
                                  ordered = TRUE)

# Group and summarize
# Group and summarize
monthly_summary <- df_filtered %>%
  filter(Crash_Year %in% c(2023, 2024, 2025)) %>%
  mutate(Person_Category = case_when(
    str_detect(Person_Type, "PEDESTRIAN") ~ "Pedestrian",
    str_detect(Person_Type, "PEDALCYCLIST") ~ "Cyclist",
    TRUE ~ "Other"
  )) %>%
  filter(Person_Category != "Other") %>%
  group_by(Person_Category, Crash_Year, Crash_Month) %>%
  summarise(
    total_crashes = n(),
    total_injuries = sum(Person_Total_Injury_Count, na.rm = TRUE),
    serious_injuries = sum(Person_Suspected_Serious_Injury_Count, na.rm = TRUE),
    deaths = sum(Person_Death_Count, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  pivot_longer(
    cols = c(total_crashes, total_injuries, serious_injuries, deaths),
    names_to = "Metric", values_to = "Count"
  )
View(monthly_summary)
