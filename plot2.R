# Load the data into R
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Sample
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Subsetting data & appends two years into one dataframe MD 
MD <- subset(NEI, fips == '24510')

#plotting 
png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()



