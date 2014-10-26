library(ggplot2)


#read data
NEI <- readRDS("summarySCC_PM25.rds")

#subset and aggregate data
OmarVehicle <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
HankVehicle <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
OmarAgg <- aggregate(Emissions~year, OmarVehicle, sum)
HankAgg <- aggregate(Emissions~year, HankVehicle, sum)

#add identifier for cities
OmarAgg$City<-paste(rep('Baltimore City',4))
HankAgg$City<-paste(rep('Los Angeles County',4))

CityAgg<-rbind(OmarAgg,HankAgg)


png('plot6.png')
ggplot(data = CityAgg, aes(x = year, y = Emissions)) + 
geom_bar(aes(fill = year), stat = "identity") + 
guides(fill = F) + 
ggtitle('Emissions from motor vehicle sources: Baltimore City vs. Los Angeles') + 
ylab(expression('Emissions')) +
facet_grid(.~City)+
theme(legend.position = 'none')


dev.off()