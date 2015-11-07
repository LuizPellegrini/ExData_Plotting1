##
## Plot 2 creates the Global Active Power consumption X day  Plot
##
data_cons <-read.table("household_power_consumption.txt",header=TRUE, 
                       stringsAsFactors=FALSE,na.string='?',sep=';')
##
data_cons$Date <- as.Date(data_cons$Date, format="%d/%m/%Y")
dt_plot <- data_cons[(data_cons$Date=="2007-02-01") | (data_cons$Date=="2007-02-02"),]
##
dt_plot$Global_active_power <- 
  as.numeric(as.character(dt_plot$Global_active_power))
dt_plot$Global_reactive_power <- 
  as.numeric(as.character(dt_plot$Global_reactive_power))
dt_plot$Voltage <- as.numeric(as.character(dt_plot$Voltage))
dt_plot <- transform(dt_plot, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dt_plot$Sub_metering_1 <- as.numeric(as.character(dt_plot$Sub_metering_1))
dt_plot$Sub_metering_2 <- as.numeric(as.character(dt_plot$Sub_metering_2))
dt_plot$Sub_metering_3 <- as.numeric(as.character(dt_plot$Sub_metering_3))
##
## Plot 2
##
plot(dt_plot$timestamp,dt_plot$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
#
# Create plot2.png file
#
dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
dev.off()  ## closes the PNG device