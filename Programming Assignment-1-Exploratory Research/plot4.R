
if(!file.exists("hh_power")){file.create("hh_power")}
fileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"hh_power")
hh_power <- unzip("hh_power")
hh_power<- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings= "?")

hh_power$Time <- strptime(paste(hh_power$Date, hh_power$Time), "%d/%m/%Y %H:%M:%S")
hh_power$DT<-as.Date(hh_power$Date,"%d/%m/%Y")
hh_power<- subset(hh_power, (hh_power$Date == "1/2/2007" | hh_power$Date== "2/2/2007")) 

png("plot4.png", width=480, height= 480)
par(mfrow=c(2,2))

#Plot-1
plot(hh_power$Time,hh_power$Global_active_power,ylab="Global Active Power",xlab="",type="l")
#Plot-2
plot(hh_power$Time,hh_power$Voltage, xlab="datetime", ylab="Voltage",type="l")
#Plot-3
plot(hh_power$Time,hh_power$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(hh_power$Time,hh_power$Sub_metering_2,col="red")
lines(hh_power$DT,hh_power$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1)
#Plot-4
plot(hh_power$Time,hh_power$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="l")
dev.off()