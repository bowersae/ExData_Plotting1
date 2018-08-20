#Read in household_power_consumption.txt file from working directory
power<-read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?")

#Format date
#power$Date = as.Date(power$Date,"%d/%m/%Y")

#Limit data to only Feb 1-2, 2007
power_limited<-subset(power, power$Date=="1/2/2007"|power$Date=="2/2/2007")

#Concatenate date and time as one column
DateTime <- strptime(paste(power_limited$Date, power_limited$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
power_final <- cbind(DateTime, power_limited)

#Remove data lines with incomplete data
power_final<-power_final[complete.cases(power_final),]

#set parameters of display
par(mfcol=c(1,1))

#Create line graph
plot(power_final$DateTime,power_final$Sub_metering_1,xlab="", ylab = "Energy sub metering",type = "n")
lines(power_final$DateTime,power_final$Sub_metering_1,col="black")
lines(power_final$DateTime,power_final$Sub_metering_2,col="red")
lines(power_final$DateTime,power_final$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = c("solid","solid","solid"), col=c("black","red","blue"))


dev.copy(png,"plot3.png", width=480, height=480)
dev.off