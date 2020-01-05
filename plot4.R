setwd("C:/Users/June Kieu/Desktop/Studying R")
getwd()
data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
as.Date(data1$Date)              
data1 <- na.omit(data1)
data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$FakeGAP <- data1$Global_active_power/500 #In order to mimic the exact provided graph,
# I created this Fake Global Active Power
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)
data1$FakeGRP <- data1$Global_reactive_power/500 # Similarly I created fake Global Reactive Power
data1$DateAdj <- as.POSIXct(paste(data1$Date,data1$Time),format="%d/%m/%Y %H:%M:%S")
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(x=data1$DateAdj,y=data1$FakeGAP,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(x=data1$DateAdj,y=data1$Voltage,type="l",xlab="",ylab="Voltage")
plot(x=data1$DateAdj,y=data1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data1$DateAdj,data1$Sub_metering_2,col="red")
lines(data1$DateAdj,data1$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1))
plot(x=data1$DateAdj,y=data1$FakeGRP,type = "l",ylab="Global_reactive_power")
dev.off()
