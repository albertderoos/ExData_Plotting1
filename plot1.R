## Assignment Coursera Electric Power Consumption: Plot 1
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

## Create the plot 1 as histogram of global active power
     
     png("Plot1.png", width = 480, height = 480)
     hist(powerdata$Global_active_power, breaks = 15, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
     dev.off()