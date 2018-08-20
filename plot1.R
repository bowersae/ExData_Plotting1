#Read in household_power_consumption.txt file from working directory
power<-read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?", colClasses=c('character',
                  'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#Format date
power$Date = as.Date(power$Date,"%d/%m/%Y")

#Limit data to only Feb 1-2, 2007
power_limited<-subset(power, power$Date=="2007-2-1"|power$Date=="2007-2-2")

#Remove data lines with incomplete data
power_limited<-power_limited[complete.cases(power_limited),]

#set parameters of display
par(mfcol=c(1,1))

#Create histogram
hist(power_limited$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.copy(png,"plot1.png", width=480, height=480)
dev.off