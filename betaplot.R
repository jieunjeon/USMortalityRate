library(ggplot2)
# read the total.df csv file
file <- paste0("~/Documents/2018 Spring/333 project/4.25 working.csv")
data <- read.csv(file, header=T, stringsAsFactors = FALSE)


df <- data.frame(var=c("(Intercept)", "data$Median.Normalized", "data$Pct.Senior", "data$Pct.White", "data$Pct.Foreign", "data$County", "data$Density", "data$Median.Income.Normalized:data$Pct.Senior.Normalized"), coef=c(-0.018089716, -0.622574636, -0.323596773, -0.165268372,-0.249151745, -0.0000000939, 0.050992389, -0.087583491))
ggplot(df, aes(x=var, y=coef), xlim=c(-1,1)) + geom_bar(stat="identity") + ylim(-1,1) + geom_hline(yintercept = 0) + labs(title="Full Model - all.filtered.Confound.Senior.Normalized")
#legend(title="Income.Normalized")
#print(plot)



#theme_set(theme_classic())
#ggplot(data, aes(x=data$x, y=data$coefffs)) 
#+ labs(title="Income") + theme(plot.title = element_text(hjust=0.5))
#plot(  y=data$coefffs,x=data$x, ylim=c(-1,1))
#legend(title="lm.income")

#plot(c("(Intercept", "data$Median.Income.Normalized"),c(0.00000000000184, 0.5326123), geom="auto", ylim=c(-1, 1) ,xlab ="Income.Norm")

