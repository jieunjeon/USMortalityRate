require(XML)
require(RCurl)
library(readr)
library(plyr)


state.name = sub(pattern=' ',replacement='-',x=state.name)
state.name = append(state.name,"district-of-columbia")

list.income.df = c()
list.mortality.df = c()

for(state in state.name){
  list.income.df = append(list.income.df,paste(state,"income",sep="."))
  list.mortality.df = append(list.mortality.df,paste(state,"mortality",sep="."))
}

i = 1
for (state in state.name){
    link.table = paste0("https://www.indexmundi.com/facts/united-states/quick-facts/",state,"/median-household-income#table")
    county = data.frame(readHTMLTable(getURL(link.table)))[,1]
    rate = data.frame(readHTMLTable(getURL(link.table)))[,2]
    print(list.income.df[i])
    assign(list.income.df[i], data.frame(county,rate))
    i = 1+i
}


j=1
state.name = gsub(pattern='-',replacement='_',x=state.name)
for(state in state.name){
  file = paste0("IHME_USA_COUNTY_MORTALITY_RATES_1980_2014_",state,"_Y2017M05D19.CSV")
  recall.file = read_csv(file)
  st = subset(recall.file, cause_name == "All causes" & sex == "Both" & year_id %in% c("2009","2010","2011","2012","2013"))
  st = st[,c(2,9)]; st
  print(list.mortality.df[j])
  assign(list.mortality.df[j],ddply(st, .(location_name), summarize, mean=mean(mx)))  
  j = j+1
}

n = numeric()
k=1
state.name = sub(pattern='_',replacement=' ',x=state.name)
for(state in state.name){
  n=append(n,which(get(list.mortality.df[k]) == state))
  k=k+1
}

l=1
for(state in state.name[1:50]){
  assign(list.mortality.df[l],get(list.mortality.df[l])[-c(n[l]),])
  l=l+1
}

