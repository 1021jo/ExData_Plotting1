file<-read.table("./household_power_consumption.txt",header=TRUE, sep=";")
for(i in 3:9) {file[,i]<-as.numeric(as.character(file[,i]))}
file$Date<-as.Date(file$Date, format="%d/%m/%Y")
subfile<-file[file$Date=="2007-02-01",]
subfile<-rbind(subfile,file[file$Date=="2007-02-02",])

plot(subfile$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="",
     cex.axis=0.8,xaxt="n")
lines(subfile$Sub_metering_2, col="red")
lines(subfile$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),cex=0.7, y.intersp=0.8)
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"),cex.axis=0.8,tck=-0.02)
par(mar=c(4.1,5.1,4.1,2.1))
dev.copy(png, file="plot3.png")
dev.off()