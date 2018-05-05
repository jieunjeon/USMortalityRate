#rm(list = ls())
 
#install.packages("bindr")      
#install.packages("blscrapeR")
#install.packages("choroplethr")

library(bindr)
library(blscrapeR)
library(choroplethr)



setwd( "~/Documents/2018 Spring/333 project")

#Read in "All County.csv" file -- 
data = read.csv("Data_Real_Final.csv")
head(data)

#x = get_bls_county()
#str(x)



##### Create County Heat Maps
##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####
##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### #####

##### Mortality - Raw
df = data.frame(value = as.numeric(data$Mortality.Rate), region = as.numeric(data$FIPS))
county_choropleth(df)

##### Mortality - Filtered
df.estimate = data.frame(value = as.numeric(data$Mortality.Rate.Estimate), region = as.numeric(data$FIPS))
county_choropleth(df.estimate)


df = data.frame(value = as.numeric(data$Density), region = as.numeric(data$FIPS))
county_choropleth(df)






