
worldpopulation <- read.table("~//data files//API_SP.POP.TOTL_DS2_en_csv_v2.csv", sep = ",", skip = 4, header = T)
edit(head(worldpopulation[1:3,]))
nrow(worldpopulation)
ncol(worldpopulation)
str(worldpopulation)


countries <- levels(worldpopulation$Country.Name)


#NL en Korea filteren
nlzkdata <- subset(worldpopulation,worldpopulation$Country.Name == "Korea, Rep." |   worldpopulation$Country.Name == "Netherlands")

colnames(nlzkdata)[5:62] <- substring(names(nlzkdata[5:62]),2) #werkt

install.packages("reshape2")
library(reshape2)

nlzkdata <- melt(nlzkdata)  #zet de dataframe om naar long-format, i.p.v. wide
names(nlzkdata) <- tolower(names(nlzkdata)) #haalt de hoofdlettersweg in kolomnamen
nlzkdata <- nlzkdata[,-2:-6] #verweiderd ongebruikte kolommen
head(nlzkdata)

#plot(nlzkdata$variable[nlzkdata$country.name=="Korea, Rep."],nlzkdata$value[nlzkdata$country.name=="Korea, Rep."]/1000000, type = "n", ylim = c(0,50))
#lines(nlzkdata$variable[nlzkdata$country.name=="Netherlands"],nlzkdata$value[nlzkdata$country.name=="Netherlands"]/1000000)
#plot(nlzkdata$country. ~ nlzkdata$value)

help(matplot)
matplot(nlzkdata$variable[nlzkdata$country.name == "Korea, Rep."],nlzkdata$value[nlzkdata$country.name == "Korea, Rep."]/1000, type = "l", ylim = c(0,55000),
        col = "red", main = "national population growth in numbers", ylab = "size of population ( x 1000)", xlab = "years")
matplot(nlzkdata$variable[nlzkdata$country.name == "Netherlands"],nlzkdata$value[nlzkdata$country.name == "Netherlands"]/1000, type = "l", add = T, 
        col = "blue")
help(legend)
legend(x = 1960, y = 55000, legend = unique(nlzkdata$country.name), fill = c("red","blue"))

#Nu relatieve groei proberen te plotten. Deze visualisatie is namelelijk niet heel erg bruikbaar
write.csv(nlzkdata, "C://Users//Robbin Berger//Documents//data files//nlzkdata.csv", append = T, quote = T)
    #in excel de relatieve getallen erbij gezet..... 
nlzkdata <- read.table("~//data files//nlzkdata.csv", header = T, sep = ";")
head(nlzkdata)

matplot(nlzkdata$variable[nlzkdata$country.name == "Korea"],nlzkdata$relative[nlzkdata$country.name == "Korea"], type = "l",
        col = "red", main = "national population growth in numbers", ylab = "size of population ( x 1000)", xlab = "years")
matplot(nlzkdata$variable[nlzkdata$country.name == "Netherlands"],nlzkdata$relative[nlzkdata$country.name == "Netherlands"], type = "l", add = T, 
        col = "blue")
help(legend)
legend(x = 1960, y = 55000, legend = unique(nlzkdata$country.name), fill = c("red","blue"))
