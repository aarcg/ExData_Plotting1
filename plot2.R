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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Build the plot
plot(df$Date_time, df$Global_active_power, type="n", xlab = "", ylab="Global Active Power (kilowatts)")
lines(df$Date_time, df$Global_active_power, type="l")

## End the png recording
dev.off()

## Remove the data frame that was created
rm(df)