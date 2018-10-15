plot1 <- function (){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))

  data <- transform(subset(data, Date=="2/1/2007"| Date =="2/2/2007"),
                        Date=format(as.Date(Date, format="%d/%m/%Y"),"%Y-%m-%d"), 
                        Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))


  hist(data$Global_active_power, col="Orange")
  
  ##title(main = "Global Active Power")
  
  dev.copy(png, file = "plot1.png")
  dev.off()
  
}
