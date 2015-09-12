## Close any open connection and free up memory
closeAllConnections()
remove(data)

## Download the zip file in a temp file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp <- tempfile()
download.file(url,temp)

## Extract the data insode the zip file and load in a dataframe changing the ? to NA
data <- read.table(unz(temp,"household_power_consumption.txt"),header = TRUE, sep = ";",na.strings=c("?"))
unlink(temp)

##Combine dDate & Time into a new field
data$extdate = paste (data$Date,data$Time, sep = " ")

##coerce extate field to date format
data$extdate = strptime(data$extdate,"%d/%m/%Y %H:%M:%S")

## Subset the data to include only the desired date
dataset <- subset(data,as.Date(data$extdate) == "2007-02-01" | as.Date(data$extdate) == "2007-02-02")



## Make Plot 2


png(filename="C:/Users/210054296/Documents/2015/Education/Exploratory Data Analysis/Week 1 Assignment/plot2.png")
plot(dataset$extdate,dataset$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()