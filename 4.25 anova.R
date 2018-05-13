library(ggplot2)

# read the total.df csv file
file <- paste0("~/Documents/2018 Spring/333 project/csv4.25 Jieun_Final Project Analysis.csv")
data <- read.csv(file, header=T, stringsAsFactors = FALSE)


#summary(data)
#tmp <- as.factor(data$Pct.Senior.Normalized)
#data[,6]
#Y = c(data[,6])

#fullModel <- lm(data$Mortality.Rate ~ data$Median.Income + data$Pct.Senior + data$Median.Income * data$Pct.Senior + data$Pct.White + data$Pct.Foreign + data$County_Pop + data$Density
#)
#income <- lm(data$Mortality.Rate ~ data$Median.Income)

#anova(income, fullModel)


#data[] <- lapply(data,factor)
#summary(data[])
#full.model_data <- data[]

#full.model_data = factor(data[], levels = c(data$), ordered=TRUE)
#full.model_data
#analysis <- aov(data$Pct.Senior.Normalized ~ data[2,], data=data)

  
regr.full <- lm (data$Mortality.Rate.Normalized~ data$Median.Income + data$Pct.Senior + data$Median.Income * data$Pct.Senior + data$Pct.White + data$Pct.Foreign + data$County_Pop + data$Density
 , data =datas)
regr.reduced <- lm(data$Mortality.Rate.Normalized ~data$Median.Income + data$Pct.Senior + data$Pct.White + data$Pct.Foreign + data$County_Pop + data$Density
, data = datas)
anova(regr.full, regr.reduced)





#confint(regr)

#aa = data.frame(Fitted= fitted(regr), Residuals = resid(regr), variants = c(1,2))
#ggplot(aa, aes(Fitted, Residuals, colour = variants)) +geom_point()

# lm. all
# data$Median.Income + data$Pct.Senior + data$Pct.White + data$Pct.Foreign + data$County_Pop + data$Density

# full model
# data$Median.Income + data$Pct.Senior + data$Median.Income * data$Pct.Senior + data$Pct.White + data$Pct.Foreign + data$County_Pop + data$Density



#