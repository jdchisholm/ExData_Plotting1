plot2 <- function () {
      
      #Data is read in but skips to the desired date, then reads in the rows of data wanted for the assignment
      data <- read.table("household_power_consumption.txt", sep=";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)
      
      #Changed the format of date and time variable and combined them
      time <- strptime(paste(data2[,1], data2[,2]), "%d/%m/%Y %H:%M:%S") 
      time <- data.frame(time)
      
      #Created a data frame of both time and Global_Active_Power data
      ToPlot <- data.frame(c(time, data.frame(data[,3])))
      
      #Open graphic device, plot data, copy to png, then close graphic device
      quartz()
      plot(ToPlot, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
      
      dev.copy(png, file = "plot2.png", width = 480, height = 480)
      dev.off()
}
