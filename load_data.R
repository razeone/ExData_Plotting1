# First let's download the dataset
url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./data")){dir.create("./data")}
if(!file.exists("./data/electric_consumption.zip")){download.file(url, destfile = "./data/electric_consumption.zip")}
if(!file.exists("./data/household_power_consumption.txt")){unzip("./data/electric_consumption.zip", exdir = "./data/")}
# First let's calculate the amount of memory needed for this dataset
memoryNeeds <- (2075259 * 9 * 8) / 2^20
print(paste("You need at least", memoryNeeds, "MB of RAM in order to read this dataset"))
power <- read.table("./data/household_power_consumption.txt", sep = ";", na = "?", header = T)
workingData <- power[(power$Date == "1/2/2007" | power$Date == "2/2/2007"),]
dateTime <- paste(workingData$Date, workingData$Time)
workingData$DateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
attach(workingData)