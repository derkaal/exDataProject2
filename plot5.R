library(ggplot2)


#read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

OmarVehicle <- subset(NEI, fips == 24510 & type == 'ON-ROAD')
OmarAgg <- aggregate(Emissions~year, OmarVehicle, sum)


png('plot5.png')

ggplot(data = OmarAgg, aes(x = year, y = Emissions)) + 
geom_bar(aes(fill = year), stat = "identity") + 
guides(fill = F) + 
ggtitle('Emissions from motor vehicle sources in Baltimore City') + 
ylab(expression('Emissions')) + 
xlab('Year') + 
theme(legend.position = 'none')


dev.off()