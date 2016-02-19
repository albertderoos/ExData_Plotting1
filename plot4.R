## Assignment Coursera Electric Power Consumption: Plot 4
## Albert de Roos

     library("dplyr")

## Read file and select the relevant rows to create tidy data
     
     #read in the file
     powerdataraw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                             colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
     
     #select only the columns that we are interested in
     temp1 <- filter(powerdataraw, Date == "1/2/2007" | Date == "2/2/2007")
     
     #combine date/time columns into new column t
     x <- paste(as.Date(temp1$Date, "%d/%m/%Y"), temp1$Time)
     t <- strptime(x, "%Y-%m-%d %H:%M:%S")
     powerdata <- cbind(temp1, t)


## create the plot, set some variables and open png file
     
     # open png file and set some variables 
     png("Plot4.png", width = 480, height = 480)
     par(mfcol=c(2,2), mar=c(4,4,1,1), oma=c(1,1,1,1), cex = 0.8, mgp = c(2.5, 1, 0))
     Sys.setlocale("LC_TIME", "English")

     
     # create the plot 1 as time(day) of global active power
     plot(powerdata$t, powerdata$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

     
     # create plot 3 submetering versus datetime
     plot(powerdata$t, powerdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
     points(powerdata$t, powerdata$Sub_metering_1, type = "l", col = "black")
     points(powerdata$t, powerdata$Sub_metering_2, type = "l", col = "red")     
     points(powerdata$t, powerdata$Sub_metering_3, type = "l", col = "blue")
     legend("topright", lty =1 , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), 
                    cex = 0.7, bty = "n")
 
     # create plot 3 voltage against datetime
     plot(powerdata$t, powerdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
     
     # create plot 4
     plot(powerdata$t, powerdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
     
     #close png file
     dev.off()
     
     
     