plot3 <- function () {
      
      #Data is read in but skips to the desired date, then reads in the rows of data wanted for the assignment
      data <- read.table("household_power_consumption.txt", sep=";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)
      
      #Changed the format of date and time variable and combined them
      time <- strptime(paste(data2[,1], data2[,2]), "%d/%m/%Y %H:%M:%S") 
      time <- data.frame(time)
      
      #Created a data frame for each of the meter data with the date/time data
      Meter1 <- data.frame(c(time, data.frame(data[,7])))
      Meter2 <- data.frame(c(time, data.frame(data[,8])))
      Meter3 <- data.frame(c(time, data.frame(data[,9])))
      
      #Created legend and colour info to be used later
      Legends <- c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  ")
      colours <- c("black", "red", "blue")
      
      #Open graphic device, plot first line followed by other two, added label, copied to png, then closed graphic device
      quartz()
      plot(Meter1, type="l", xlab = "", ylab ="Energy sub metering")
      lines(Meter2, type="l", col = "red")
      lines(Meter3, type="l", col = "blue")
      legend("topright", legend = Legends, lty = 1, col = colours) 
      
      dev.copy(png, file = "plot3.png", width = 480, height = 480)
      dev.off()
}
