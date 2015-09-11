## Read and subset the data
df <- read.table(
  pipe('grep "^[1-2]/2/2007" "./data/household_power_consumption.txt"'),
  header = FALSE,
  sep=";",
  na.strings="?",
  stringsAsFactors = FALSE
)

names(df) <- read.table("./data/household_power_consumption.txt",
                        nrows = 1,
                        sep = ";",
                        stringsAsFactors = FALSE
)

## Build a date time column in the data frome
df$Date_time <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

## Start the png recording
png(filename = "plot3.png", width = 504, height = 504, units = "px")

## Build the plot
plot(df$Date_time, df$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
lines(df$Date_time, df$Sub_metering_1, type="l")
lines(df$Date_time, df$Sub_metering_2, type="l", col="red")
lines(df$Date_time, df$Sub_metering_3, type="l", col="blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue")
       )

## End the png recording
dev.off()

## Remove the data frame that was created
rm(df)