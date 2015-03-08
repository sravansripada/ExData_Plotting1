setwd("D:/One Drive/Coursera/Exploratory Data Analysis/Assignments/Week 1/Data/exdata-data-household_power_consumption")
install.packages("sqldf")
library(sqldf)
## Read subset of data using read.csv.sql
data<-read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date='1/2/2007' OR Date='2/2/2007'") 

##Convert dates
?strptime
#1/2/2007
data$Date<-strptime(x = data$Date,format = "%d/%m/%Y" )

##plot 3

#checking class of submetering
class(data$Sub_metering_1)
summary(data$Sub_metering_1)
png(filename = "plot3.png",width = 480,height = 480)
plot(x=strptime(paste(as.character(data$Date),data$Time),format="%Y-%m-%d %H:%M:%S"),y=data$Sub_metering_1,type="l",col="black",ylab="Energy Sub Metering",xlab="")
points(strptime(paste(as.character(data$Date),data$Time),format="%Y-%m-%d %H:%M:%S"),data$Sub_metering_2,type="l",col="red")
points(strptime(paste(as.character(data$Date),data$Time),format="%Y-%m-%d %H:%M:%S"),data$Sub_metering_3,type="l",col="blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .6
)
dev.off()
