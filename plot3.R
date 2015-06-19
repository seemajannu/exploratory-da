# Load data
require(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Sample
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Baltimore City, Maryland 
mdata <- subset(NEI, fips == 24510)
mdata$year <- factor(mdata$year, levels = c('1999', '2002', '2005', '2008'))

#plot
png('plot3.png', width = 800, height = 500, units = 'px')
ggplot(data = mdata, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = F) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + ggtitle('Emissions per Type in Baltimore City, Maryland') + geom_jitter(alpha = 0.10)
dev.off()

