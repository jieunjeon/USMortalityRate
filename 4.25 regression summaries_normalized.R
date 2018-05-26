
# read the total.df csv file
file <- paste0("~/Documents/2018 Spring/333 project/csv4.25 Jieun_Final Project Analysis.csv")
data <- read.csv(file, header=T, stringsAsFactors = FALSE)


fit <- lm(formula = data$Mortality.Rate.Estimate ~ data$Median.Income + data$Pct.Senior + data$Median.Income * data$Pct.Senior + data$Pct.White + data$Pct.Foreign + data$County_Pop + data$Density)
summary(fit)

a <- fit$coefficients
df <- data.frame(coefffs = fit$coefficients)
df
write.csv(df, '4.25 working.csv')