
library(here)
library(nycflights13)
library(DataExplorer)
library("viridis")          
library(paletteer)
library(kableExtra)
library(prettydoc)
library(dplyr)
library(devtools)
library(tidyverse)
library(ggridges)
library(babynames)
library(ggthemes)
library(patchwork)

#5 Data sets use function plot_str()
data_list <- list(airlines, airports, flights, planes, weather)
plot_str(data_list)
plot_str(data_list, type = "r")


#### another method to merge, think about cbind() function
merge_airlines <- merge(flights, airlines, by = "carrier", all.x = TRUE)
merge_planes <- merge(merge_airlines, planes, by = "tailnum", all.x = TRUE, suffixes = c("_flights", "_planes"))
merge_airports_origin <- merge(merge_planes, airports, by.x = "origin", by.y = "faa", all.x = TRUE, suffixes = c("_carrier", "_origin"))
final_data <- merge(merge_airports_origin, airports, by.x = "dest", by.y = "faa", all.x = TRUE, suffixes = c("_origin", "_dest"))

#look at messy data for missing profile for each feature
plot_missing (final_data)

final_data <- drop_columns(final_data, "speed")


#visualize for frequency distribution for all discrete features 
plot_bar(final_data)

##################################### End Notes ##########################################################################

#QQPlot Intro
#Quantile-Quantile plot a way to visualize deviations from a specific probabiity distribution. 


ChemData <- read_csv(here("week_4", "data", "chemicaldata_maunalua.csv"))
View(ChemData)

ChemData_clean <-ChemData %>% 
  filter(complete.cases(.)) %>% #filter out everything that is not a complete row 
  separate(col = Tide_time, 
           into = c("Tide", "Time"), #Separate into two col's
           sep = "_", # seperate  by_
           remove = FALSE) %>% #Keeps the original Tide coloumn
  filter( Time == "Day") %>%  #filter$time~day
  rename("Temperature" = Temp_in)


ChemData_wide <- ChemData_clean %>% 
  pivot_longer(cols = Temperature:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols  
               names_to = "Variables", # the names of the new cols with all the column names 
               values_to = "Values") %>% # names of the new column with all the values 
  group_by(Variables, Season,  Zone) %>% 
  summarise(mean_vals = mean(Values, na.rm = TRUE),
            var_vals = var(Values, na.rm = TRUE)) %>% 
  pivot_wider(names_from = Variables, ### pivot_wider changes view of data 
              values_from = c(mean_vals,var_vals))


# Step 1
qq_data <- ChemData_wide[, c("Season", "mean_vals_pH")]
plot_qq(qq_data, sampled_rows = 1000L)

# Step 2 logtransform data to fit the regression line
log_qq_data <- update_columns(qq_data, 2, function(x) log(x + 1))
plot_qq(log_qq_data[,c(2)], sampled_rows = 1000L)


plot_qq(qq_data, by = "Season", sampled_rows = 1000L)
+
  scale_y_continuous(limits =c(500,5000))


plot_correlation(na.omit(final_data), maxcat = 5L)
plot_correlation(na.omit(p), type = "c")
plot_correlation(na.omit(p), type = "d")




