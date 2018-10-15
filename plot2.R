plot2 <- function (){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
  
  data <- transform(subset(data, Date=="1/2/2007"| Date =="2/2/2007"),
                        Date=format(as.Date(Date, format="%d/%m/%Y"),"%Y/%m/%d"), 
                        Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))
  
 
  plot(as.POSIXct(paste(data$Date, data$Time)),
                  data$Global_active_power, type="l")
 
  
  dev.copy(png, file = "plot2.png")
  dev.off()
}
##2007/2/1 h/m/s