

library(nycflights13)
library(DataExplorer)
library(here)
library(kableExtra)
library(prettydoc)
library(dplyr)
library(devtools)
library(tidyverse)
library("viridis")          
library(paletteer)

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

#coorlation
plot_correlation(na.omit(final_data), maxcat = 5L)
plot_correlation(na.omit(p), type = "c")
plot_correlation(na.omit(p), type = "d")
##################################### End Notes ##########################################################################

#QQPlot Intro
#Quantile-Quantile plot a way to visualize deviations from a specific probabiity distribution. 

#Read in Data 
ChemData <- read_csv(here("T_AZuniga", "Data", "chemicaldata_maunalua.csv"))
View(ChemData)

ChemData_clean <-ChemData %>% 
  filter(complete.cases(.)) %>% #filter out everything that is not a complete row 
  separate(col = Tide_time, 
           into = c("Tide", "Time"), #Separate into two col's
           sep = "_", # seperate  by_
           remove = FALSE) %>% #Keeps the original Tide coloumn
  filter( Time == "Day") %>%  #filter$time~day
  rename("Temperature" = Temp_in) 

head(ChemData_clean)
# Step 1
qq_data <- ChemData_clean[, c("Season", "pH", "Temperature")]
plot_qq(qq_data, sampled_rows = 1000L)

# Step 2 logtransform data to fit the regression line
log_qq_data <- update_columns(qq_data, 8:10, function(x) log(x + 1))
plot_qq(log_qq_data[,c(2)], sampled_rows = 1000L)

######################## View Data by multiple features ##########
qq_data <- ChemData_clean[, c("Season", "pH", "Temperature", "Silicate")]

plot_qq(qq_data, by = "Season", sampled_rows = 1000L)
plot_qq(qq_data, by = "pH", sampled_rows = 1000L)
plot_qq(qq_data, by = "Silicate", sampled_rows = 1000L)


#useful tool to process data where multi-colinearity exists between thefeatures / variables. 
#PCA can be used when the dimensions of the input features are high (e.g. a lot of variables).
# as well as denoising and data compression.
#denoising?
pca_df <- na.omit(final_data[, c("origin", "dep_delay", "arr_delay", "air_time", "year_planes", "seats")])
plot_prcomp(pca_df, variance_cap = 0.9, nrow = 2L, ncol = 2L)


