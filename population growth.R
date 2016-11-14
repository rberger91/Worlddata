
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

install.packages("reshape2")
library(reshape2)

nlzkdata <- melt(nlzkdata)  #zet de dataframe om naar long-format, i.p.v. wide
names(nlzkdata) <- tolower(names(nlzkdata)) #haalt de hoofdlettersweg in kolomnamen
head(nlzkdata)
nlzkdata <- nlzkdata[,-2:-4]
head(nlzkdata)
