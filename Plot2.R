setwd("D:/One Drive/Coursera/Exploratory Data Analysis/Assignments/Week 1/Data/exdata-data-household_power_consumption")
install.packages("sqldf")
library(sqldf)
## Read subset of data using read.csv.sql
data<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date='1/2/2007' OR Date='2/2/2007'") 

##Convert dates
?strptime
#1/2/2007
data$Date<-strptime(x = data$Date,format = "%d/%m/%Y" )

##plot2

##creating date time for the plot
#paste(as.character(data$Date),data$Time)
#strptime(paste(as.character(data$Date),data$Time),format="%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png",width = 480,height = 480)
plot(strptime(paste(as.character(data$Date),data$Time),format="%Y-%m-%d %H:%M:%S"),data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
