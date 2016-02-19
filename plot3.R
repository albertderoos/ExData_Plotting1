## Assignment Coursera Electric Power Consumption: Plot 3
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

## Create the plot 1 as time(day) of global active power
     Sys.setlocale("LC_TIME", "English")
     
     png("Plot3.png", width = 480, height = 480)
     plot(powerdata$t, powerdata$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
     points(powerdata$t, powerdata$Sub_metering_1, type = "l", col = "black")
     points(powerdata$t, powerdata$Sub_metering_2, type = "l", col = "red")     
     points(powerdata$t, powerdata$Sub_metering_3, type = "l", col = "blue")
     legend("topright", lty =1 , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
     dev.off()