## =========================================================================
## Coursera: Exploratory Data Analysis                      Course Project 1
##
## Author:    A Hutchison
## Created:   5 Aug 2015
## File name: plot3.R
##
## Reads file of electrical usage data provided by the course team, retaining
## only those records for 1st and 2nd February 2007, and creates "plot3.png":
## multi-line graph of energy sub-metering vs date/Time
## =========================================================================

rm(list=ls())   # Clear the workspace

                # move to directory containing extracted data
setwd("D:/Corsera/ExploratoryDataAnalysis/ExData_Plotting1")

                # import data as a data frame
dataclasses  <-  c("character", "character" ,replicate(7, "numeric"))
rawdata      <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                          colClasses = dataclasses, na.strings="?")

                # extract required data subset
dataset      <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
rm(rawdata)

               # concatenate date and time fields and convert to date format
dataset$DtTm     <- paste(dataset$Date, dataset$Time)
dataset$DateTime <- strptime(dataset$DtTm, "%d/%m/%Y %H:%M:%S")

               # PLOT 3: Line graph sub-metering vs date/time

png(filename="plot3.png", width=480, height=480)
with(dataset,  plot(DateTime, Sub_metering_1, type="l", col="black", xlab="",
                              ylab="Energy sub metering") )
with(dataset, lines(DateTime, Sub_metering_2, type="l", col="red", xlab="") )
with(dataset, lines(DateTime, Sub_metering_3, type="l", col="blue", xlab="") )
legend("topright", lty=c(1,1,1), cex=0.8, col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()
