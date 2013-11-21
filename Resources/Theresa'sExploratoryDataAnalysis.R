DataFrame<-read.csv("Insert File Pathway Here")
head(DataFrame)

DataFrame = DataFrame[DataFrame$year >=1990,]
head(DataFrame)
head(DataFrame$magnitude,100)

Year1990plus<-DataFrame[DataFrame$year>=1990,]
head(Year1990plus)
Mag3plus1990present<-Year1990plus[which(Year1990plus$magnitude>=3),]
Mag3plus1990present$inter<-rep(0,(length(Mag3plus1990present$time)))
for(i in 1:length(Mag3plus1990present)){
  Mag3plus1990present$inter[i]<-Mag3plus1990present$time[i+1]-Mag3plus1990present$time[i]
}
head(Mag3plus1990present)
plot(Mag3plus1990present$magnitude,Mag3plus1990present$inter)
