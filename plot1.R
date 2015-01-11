## Ensure that the data folder is present in the working directory
##Read Data
data<-read.table(file = "exdata-data-household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";")
summary(data)
class(data)
class(data$Date)


##Taking subset of data
data_sub<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007" ,]
fix(data_sub)

#converting global active power to numeric
data_sub$Global_active_power<-as.numeric(as.character(data_sub$Global_active_power))

#changing margins
par(mar=c(4,4,2,2))
#opening png device
png(filename = "plot1.png",width = 480,height = 480)
#plotting histogram
hist(data_sub$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
