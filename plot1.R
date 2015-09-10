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

## Start the png recording
png(filename = "plot1.png", width = 504, height = 504, units = "px")

## Create the plot (histogram)
hist(
  as.numeric(df$Global_active_power),
  include.lowest = TRUE,
  col="red",
  xlim = c(0, 7),
  ylim = c(0, 1200),
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  axes = FALSE
)

## Label the axes
axis(side=1, at = seq(0, 6, by = 2))
axis(side=2, at = seq(0, 1200, by = 200))

## End the png recording
dev.off()

## Remove the data frame that was created
rm(df)