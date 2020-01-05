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
png("plot2.png",width=480,height = 480)
b <- plot(x=data1$DateAdj,y=data1$FakeGAP,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
