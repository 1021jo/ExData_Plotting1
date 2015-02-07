file<-read.table("./household_power_consumption.txt",header=TRUE, sep=";")
for(i in 3:9) {file[,i]<-as.numeric(as.character(file[,i]))}
file$Date<-as.Date(file$Date, format="%d/%m/%Y")
subfile<-file[file$Date=="2007-02-01",]
subfile<-rbind(subfile,file[file$Date=="2007-02-02",])
par(mfrow=c(2,2))
plot(subfile$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", 
     xlab="", cex.lab=0.8,cex.axis=0.8,xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"),cex.axis=0.8,tck=-0.02)

plot(subfile$Voltage,type="l",ylab="Voltage", xlab="datetime", cex.lab=0.8, cex.axis=0.8,xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"),cex.axis=0.8,tck=-0.02)

plot(subfile$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="",cex.lab=0.8,
     cex.axis=0.8,xaxt="n")
lines(subfile$Sub_metering_2, col="red")
lines(subfile$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),cex=0.6, y.intersp=0.4, bty = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"),cex.axis=0.8,tck=-0.02)

plot(subfile$Global_reactive_power,type="s",ylab="Global_reactive_power", xlab="datetime", cex.lab=0.8, cex.axis=0.8,xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri","Sat"),cex.axis=0.8,tck=-0.02)
dev.copy(png, file="plot4.png")
dev.off()