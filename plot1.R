## =========================================================================
## Coursera: Exploratory Data Analysis                      Course Project 1
##
## Author:    A Hutchison
## Created:   5 Aug 2015
## File name: plot1.R
##
## Reads file of electrical usage data provided by the course team, retaining
## only those records for 1st and 2nd February 2007, and creates "plot1.png":
## histogram of Global_active_power.
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

                # PLOT 1: histogram of Global_active_power

png(filename="plot1.png", width=480, height=480)
with(dataset, hist(Global_active_power, col="red",
                   main="Global active power",
                   xlab="Global Active Power (kilowatts)"))
dev.off()
