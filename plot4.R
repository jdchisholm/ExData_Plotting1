plot4 <- function () {
      
      data <- read.table("household_power_consumption.txt", sep=";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)
      
      #Changed the format of date and time variable and combined them
      time <- strptime(paste(data2[,1], data2[,2]), "%d/%m/%Y %H:%M:%S") 
      time <- data.frame(time)
      
      #Open graphic device and set number of figures in plot
      quartz()
      par(mfrow = c(2,2))
      
      #Creates a data frame of data and plots top left graph
      TopLeft <- data.frame(c(time, data.frame(data[,3])))
      plot(TopLeft, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
      
      #Creates a data frame of data and plots top right graph
      TopRight <- data.frame(c(time, data.frame(data[,5])))
      plot(TopRight, type="l", xlab = "datetime", ylab = "Voltage")
      
      #Creates a data frames of each meter series and plots bottom left graph
      Meter1 <- data.frame(c(time, data.frame(data[,7])))
      Meter2 <- data.frame(c(time, data.frame(data[,8])))
      Meter3 <- data.frame(c(time, data.frame(data[,9])))
      
      Legends <- c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  ")
      colours <- c("black", "red", "blue")
      plot(Meter1, type="l", xlab = "", ylab ="Energy sub metering")
      lines(Meter2, type="l", col = "red")
      lines(Meter3, type="l", col = "blue")
      legend("topright", legend = Legends, lty = 1, col = colours, cex=0.75) 
     
      #Creates a data frame of data and plots bottom right graph
      BottomRight <- data.frame(c(time, data.frame(data[,4])))
      plot(BottomRight, type="l", xlab = "datetime", ylab = "Global_reactive_power")
      
      #Copies figure to png and closes graphic device
      dev.copy(png, file = "plot4.png", width = 480, height = 480)
      dev.off()
}