
worldpopulation <- read.table("~//data files//API_SP.POP.TOTL_DS2_en_csv_v2.csv", sep = ",", skip = 4, header = T)
edit(head(worldpopulation[1:3,]))
nrow(worldpopulation)
ncol(worldpopulation)
str(worldpopulation)


countries <- levels(worldpopulation$Country.Name)


#NL en Korea filteren
nlzkdata <- subset(worldpopulation,worldpopulation$Country.Name == "Korea, Rep." |   worldpopulation$Country.Name == "Netherlands")
nlzkdata

colnames(nlzkdata)[5:62] <- substring(names(nlzkdata[5:62]),2) #werkt
nlzkdata

plot(t(nlzkdata$Country.Name == "Netherlands"))
head(nlzkdata)

install.packages("reshape2")
library(reshape2)
library("ggplot2")
help(ggplot)


nlzkdata <- melt(nlzkdata)
head(nlzkdata)
plot(nlzkdata$variable[nlzkdata$Country.Name=="Korea, Rep."],nlzkdata$value[nlzkdata$Country.Name=="Korea, Rep."]/1000, type = "n")
help(plot)
