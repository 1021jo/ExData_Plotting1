file<-read.table("./household_power_consumption.txt",header=TRUE, sep=";")
for(i in 3:9) {file[,i]<-as.numeric(as.character(file[,i]))}
file$Date<-as.Date(file$Date, format="%d/%m/%Y")
subfile<-file[file$Date=="2007-02-01",]
subfile<-rbind(subfile,file[file$Date=="2007-02-02",])

hist(subfile$Global_active, col="red", 
     main="Global Active Power",xlab="Global Active Power (kilowatts)", 
     yaxp=c(0,1200,6), cex.axis=0.6)
dev.copy(png, file="plot1.png")
dev.off()

