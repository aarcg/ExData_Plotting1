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
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

## Build the plot
plot(df$Datetime, df$Global_active_power)
plot(df$Datetime, df$Global_active_power, type="n")
lines(df$Datetime, df$Global_active_power, type="l")