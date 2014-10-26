library(ggplot2)
library(plyr)

#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#identify coal-related SCC
sccCoal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

#merge the two data sets
merge <- merge(x = NEI, y = sccCoal, by = 'SCC')
mergeSum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
mergeSum$Emissions <- mergeSum$Emissions/1000
colnames(mergeSum) <- c('Year', 'Emissions')


png("plot4.png")
ggplot(data = mergeSum, aes(x = Year, y = Emissions / 1000)) + 
geom_line(aes(group = 1, col = Emissions)) + 
geom_point(aes(size = 2, col = Emissions)) + 
ggtitle('Emissions from coal combustion-related sources') + 
ylab('Emissions (kilo)') +
theme(legend.position = 'none')

dev.off()