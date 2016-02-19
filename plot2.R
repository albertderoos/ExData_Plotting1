## Assignment Coursera Electric Power Consumption: Plot 2
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
     png("Plot2.png", width = 480, height = 480)
     plot(powerdata$t, powerdata$Global_active_power, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l")
     dev.off()