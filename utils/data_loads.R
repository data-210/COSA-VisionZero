### Data Loads
library(tidyverse)

###############################################################################
### New 2013 Data
satx_2013 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2013v3.csv", header = TRUE, stringsAsFactors = FALSE)
# Remove null values
# new_data_2013 <- new_data_2013[complete.cases(new_data_2013), 1]
# Adjust crash date and remove/add month column
satx_2013$Crash_Date <- mdy(satx_2013$Crash_Date)
satx_2013$Crash_Month <- month(satx_2013$Crash_Date)
satx_2013$Crash_Month <- month.name[satx_2013$Crash_Month]
satx_2013$Crash_Year <- year(satx_2013$Crash_Date)
satx_2013 <- satx_2013 %>%
  filter(Person_Type == "3 - PEDALCYCLIST" |
           Person_Type == "4 - PEDESTRIAN")
# Adjust Lat/Long & Street Number & Age
satx_2013$Latitude <- as.numeric(satx_2013$Latitude)
satx_2013$Longitude <- as.numeric(satx_2013$Longitude)
satx_2013$Street_Number <- as.numeric(satx_2013$Street_Number)
satx_2013$Person_Age <- as.numeric(satx_2013$Person_Age)

# Remove NA values
satx_2013 <- satx_2013[complete.cases(satx_2013), ]
View(satx_2013)

# Write to csv
#ped_cycle <- read.csv("ped_cycle.csv", header = TRUE, stringsAsFactors = FALSE)

################################################################################

# Function
pedcycle_cleaning_function <- function(dataframe){
  
  # Adjust Crash Date and re-add
  dataframe$Crash_Date <- lubridate::mdy(dataframe$Crash_Date)
  dataframe$Crash_Month <- lubridate::month(dataframe$Crash_Date, label = TRUE, abbr = FALSE)
  dataframe$Crash_Year <- lubridate::year(dataframe$Crash_Date)
  
  # Adjust Lat/Lng and Street Num
  dataframe$Latitude <- as.numeric(dataframe$Latitude)
  dataframe$Longitude <- as.numeric(dataframe$Longitude)
  dataframe$Street_Number <- as.numeric(dataframe$Street_Number)
  
  # Filter for pedestrians and cyclists
  dataframe <- dataframe %>%
    filter(Person_Type == "3 - PEDALCYCLIST" |
             Person_Type == "4 - PEDESTRIAN")
  
  # Remove NA values
  #dataframe <- dataframe[complete.cases(dataframe), ]
  
  # Return cleaned data
  return(dataframe)
  
}

# New 2014 data with function
satx_2014 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2014v3.csv", header = TRUE,
                      stringsAsFactors = FALSE)
View(satx_2014)
df1 <- satx_2014
View(df1)
df1 <- pedcycle_cleaning_function(df1)
satx_2014 <- pedcycle_cleaning_function(satx_2014)

# 2015 data load
satx_2015pt1 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2015v3pt1.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_2015pt1)
satx_2015pt2 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2015v3pt2.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2015 <- rbind(satx_2015pt1, satx_2015pt2)
View(satx_2015)
satx_2015 <- pedcycle_cleaning_function(satx_2015)

# 2016 Data Load
satx_2016pt1 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2016v3pt1.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2016pt2 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2016v3pt2.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2016 <- rbind(satx_2016pt1, satx_2016pt2)
satx_2016 <- pedcycle_cleaning_function(satx_2016)

# 2017 Data Load
satx_2017pt1 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2017v3pt1.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2017pt2 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2017v3pt2.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2017 <- rbind(satx_2017pt1, satx_2017pt2)
satx_2017 <- pedcycle_cleaning_function(satx_2017)

# 2018 Data Load
satx_2018pt1 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2018v3pt1.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2018pt2 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2018v3pt2.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2018 <- rbind(satx_2018pt1, satx_2018pt2)
satx_2018 <- pedcycle_cleaning_function(satx_2018)
View(satx_2018)

# 2019 Data Load
satx_2019pt1 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2019v3pt1.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2019pt2 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2019v3pt2.csv", header = TRUE,
                         stringsAsFactors = FALSE)
satx_2019 <- rbind(satx_2019pt1, satx_2019pt2)
satx_2019 <- pedcycle_cleaning_function(satx_2019)
View(satx_2019)

# 2020 Data Load
satx_2020 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2020v3.csv", header = TRUE,
                      stringsAsFactors = FALSE)
satx_2020 <- pedcycle_cleaning_function(satx_2020)
View(satx_2020)

# 2021 Data Load
satx_2021 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2021v3.csv", header = TRUE,
                      stringsAsFactors = FALSE)
View(satx_2021)
satx_2021 <- pedcycle_cleaning_function(satx_2021)

# 2022 Data Load
satx_2022 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2022v3.csv", header = TRUE,
                      stringsAsFactors = FALSE)
View(satx_2022)
satx_2022 <- pedcycle_cleaning_function(satx_2022)

# 2023 Data Load January - May
satx_2023_jan_may <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_2023_JanMay.csv", header = TRUE,
                              stringsAsFactors = FALSE)
satx_2023_jan_may <- pedcycle_cleaning_function(satx_2023_jan_may)
View(satx_2023_jan_may)

# 2023 June
satx_2023_june <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_june_2023.csv", header = TRUE,
                           stringsAsFactors = FALSE)
satx_2023_june <- pedcycle_cleaning_function(satx_2023_june)
View(satx_2023_june)

# 2023 July
satx_2023_july <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_july_2023.csv", header = TRUE,
                           stringsAsFactors = FALSE)
satx_2023_july <- pedcycle_cleaning_function(satx_2023_july)

# 2023 August
satx_2023_aug <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_aug_2023.csv", header = TRUE,
                          stringsAsFactors = FALSE)
View(satx_2023_aug)
satx_2023_aug <- pedcycle_cleaning_function(satx_2023_aug)

# 2023 September
satx_2023_sep <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_sep_2023.csv", header = TRUE,
                          stringsAsFactors = FALSE)
View(satx_2023_sep)
satx_2023_sep <- pedcycle_cleaning_function(satx_2023_sep)

# 2023 October
satx_oct2023 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_oct2023.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_oct2023)
satx_oct2023 <- pedcycle_cleaning_function(satx_oct2023)

# 2023 November
satx_nov2023 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_nov_2023.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_nov2023)
satx_nov2023 <- pedcycle_cleaning_function(satx_nov2023)

# 2023 December
satx_dec2023 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_dec_2023.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_dec2023)
satx_dec2023 <- pedcycle_cleaning_function(satx_dec2023)

# 2024 - January
satx_january2024 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_jan2024.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_january2024)
satx_jan2024 <- pedcycle_cleaning_function(satx_january2024)

# 2024 - February
satx_feb2024 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_feb2024.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_feb2024)
satx_feb2024 <- pedcycle_cleaning_function(satx_feb2024)

# 2024 - March
satx_mar2024 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_mar_2024.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_mar2024)
satx_mar2024 <- pedcycle_cleaning_function(satx_mar2024)

# 2024 - April
satx_apr2024 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_apr_2024.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_apr2024)
satx_apr2024 <- pedcycle_cleaning_function(satx_apr2024)

# 2024 - May
satx_may2024 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_may_2024.csv", header = TRUE,
                         stringsAsFactors = FALSE)
View(satx_may2024)
satx_may2024 <- pedcycle_cleaning_function(satx_may2024)

# 2024 - June
data <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_june_2024.csv", header = TRUE,
                          stringsAsFactors = FALSE)
View(data)
satx_june2024 <- pedcycle_cleaning_function(data)

# 2024 - July
data <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_july_2024.csv", header = TRUE,
                 stringsAsFactors = FALSE)
View(data)
satx_july2024 <- pedcycle_cleaning_function(data)
View(satx_july2024)

# 2024 - August
satx_aug2024 <- read.csv('/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_aug_2024.csv', header = TRUE,
                 stringsAsFactors = FALSE)
View(satx_aug2024)
satx_aug2024 <- pedcycle_cleaning_function(satx_aug2024)

# 2024 - September & October
satx_sepoct2024 <- read.csv('/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_sepoct2024.csv', header=TRUE,
                            stringsAsFactors = FALSE)
View(satx_sepoct2024)
satx_sepoct2024 <- pedcycle_cleaning_function(satx_sepoct2024)

# 2024 - November
satx_nov2024 <- read.csv('/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_novr24.csv', header = TRUE,
                         stringsAsFactors = FALSE)
satx_nov2024 <- pedcycle_cleaning_function(satx_nov2024)
View(satx_nov2024)

# 2024 - December
satx_dec2024 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_dec2024.csv", header = TRUE, stringsAsFactors = FALSE)
satx_dec2024 <- pedcycle_cleaning_function(satx_dec2024)
View(satx_dec2024)

# 2025 - January
satx_jan2025 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_jan2025.csv", header = TRUE, stringsAsFactors = FALSE)
satx_jan2025 <- pedcycle_cleaning_function(satx_jan2025)
View(satx_jan2025)

# 2025 - February
satx_feb2025 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_feb2025.csv", header = TRUE, stringsAsFactors = FALSE)
satx_feb2025 <- pedcycle_cleaning_function(satx_feb2025)
View(satx_feb2025)

# 2025 - March
satx_march2025 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_march2025.csv", header = TRUE, stringsAsFactors = FALSE)
satx_march2025 <- pedcycle_cleaning_function(satx_march2025)
View(satx_march2025)

# 2025 - April
satx_april2025 <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/data/satx_apr2025.csv", header = TRUE, stringsAsFactors = FALSE)
satx_april2025 <- pedcycle_cleaning_function(satx_april2025)
View(satx_april2025)
######################################################################################
######################################################################################
# Append data frames
# Change df names to: rbind(ped_cycle_df, satx_xxxx) depending on data year
# Read in ped_cycle_df
# ped_cycle_df <- read.csv("/Users/jackturek/Documents/Repos/COSA-VisionZero/src/ped_cycle_df.csv", header = TRUE, stringsAsFactors = FALSE)
# View(ped_cycle_df)
# ped_cycle_df <- rbind(ped_cycle_df, satx_dec2024, satx_jan2025)


ped_cycle_df <- rbind(satx_2013, satx_2014, satx_2015, satx_2016, satx_2017, satx_2018,
                      satx_2019, satx_2020, satx_2021, satx_2022, satx_2023_jan_may,
                      satx_2023_june, satx_2023_july, satx_2023_aug, satx_2023_sep, satx_oct2023,
                      satx_nov2023, satx_dec2023, satx_jan2024, satx_feb2024, satx_mar2024,
                      satx_apr2024, satx_may2024, satx_june2024, satx_july2024,
                      satx_aug2024, satx_sepoct2024, satx_nov2024, satx_dec2024, satx_jan2025,
                      satx_feb2025, satx_march2025, satx_april2025)
View(ped_cycle_df)

#ped_cycle_df <- rbind(ped_cycle_df, satx_june2024)

## Write final df to csv
output_dir <- '/Users/jackturek/Documents/Repos/COSA-VisionZero/src/'
file_name <- 'ped_cycle_df.csv'
file_path <- file.path(output_dir, file_name)
write.csv(ped_cycle_df, file_path, row.names = FALSE)
