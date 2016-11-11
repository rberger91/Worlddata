
worldpopulation <- read.table("~//data files//API_SP.POP.TOTL_DS2_en_csv_v2.csv", sep = ",", skip = 4, header = T)
edit(head(worldpopulation[1:3,]))
nrow(worldpopulation)
ncol(worldpopulation)
str(worldpopulation)


countries <- levels(worldpopulation$Country.Name)


#NL en Korea filteren
nlzkdata <- subset(worldpopulation,worldpopulation$Country.Name == "Korea, Rep." |   worldpopulation$Country.Name == "Netherlands")
t(nlzkdata)
help(t)
