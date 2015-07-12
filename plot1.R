plot1 <- function () {
      
      #Data is read in but skips to the desired date, then reads in the rows of data wanted for the assignment
      data <- read.table("household_power_consumption.txt", sep=";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2880)

      #Changed the data in the Global_Active_Power column (column #3) to numeric
      data[,3] <- as.character(data[,3])
      data[,3] <- as.numeric(data[,3])

      #Open graphic device, create histogram, copy it to a png file, then close graphic device
      quartz()
      hist(data[,3], main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
      
      dev.copy(png, file = "plot1.png", width=480, height = 480)
      dev.off()
}
