plot3 <- function (){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
  
  data <- transform(subset(data, Date=="1/2/2007"| Date =="2/2/2007"),
                    Date=format(as.Date(Date, format="%d/%m/%Y"),"%Y/%m/%d"), 
                    Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))
  
  #png("plot3.png", width = 480, height = 480)
  
  datetime <- paste(data$Date, data$Time)
  
  data$datetime <- as.POSIXct(datetime)
     
                      
 with(data, {
    
    plot(data$datetime, data$Sub_metering_1, type="l", ylab = "Energy sub metering",
      
      ylim = c(0, max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)))
  
    lines(data$datetime, data$Sub_metering_2, col = "red")
    
    lines(data$datetime, data$Sub_metering_3, col = "blue")
 
 })
  
 # legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       # lty= 1, lwd=2, legend = c("black", "red", "blue"))  
  
  dev.copy(png, file = "plot3.png")
  dev.off()
  
}
