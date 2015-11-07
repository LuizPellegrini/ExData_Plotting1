##
## Plot 4 creates 4 plot composition
##
data_cons <-read.table("household_power_consumption.txt",header=TRUE, 
                       stringsAsFactors=FALSE,na.string='?',sep=';')
##
data_cons$Date <- as.Date(data_cons$Date, format="%d/%m/%Y")
dt_plot <- data_cons[(data_cons$Date=="2007-02-01") | (data_cons$Date=="2007-02-02"),]
##
dt_plot$Global_active_power <- as.numeric(as.character(dt_plot$Global_active_power))
dt_plot$Global_reactive_power <- as.numeric(as.character(dt_plot$Global_reactive_power))
dt_plot$Voltage <- as.numeric(as.character(dt_plot$Voltage))
dt_plot <- transform(dt_plot, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dt_plot$Sub_metering_1 <- as.numeric(as.character(dt_plot$Sub_metering_1))
dt_plot$Sub_metering_2 <- as.numeric(as.character(dt_plot$Sub_metering_2))
dt_plot$Sub_metering_3 <- as.numeric(as.character(dt_plot$Sub_metering_3))
##
## Plot 4
##
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(dt_plot$timestamp,dt_plot$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")
#
plot(dt_plot$timestamp,dt_plot$Voltage, type="l", xlab="", 
     ylab="Voltage")
#
plot(dt_plot$timestamp,dt_plot$Sub_metering_1, 
     type="s",xlab="",ylab="Energy sub metering",col="black")
lines(dt_plot$timestamp,dt_plot$Sub_metering_2,col="red",type="s")
lines(dt_plot$timestamp,dt_plot$Sub_metering_3,col="blue",type="s")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1), bty="n", cex=.6)
#
plot(dt_plot$timestamp,dt_plot$Global_reactive_power, type="l", xlab="", 
     ylab="Global_reacctive_power")
col=("red"),main="Global Active Power")
#
# Creates plot4.png file
#
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()  ## closes the PNG device
