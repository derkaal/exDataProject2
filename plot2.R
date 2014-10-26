setwd("RDokumente/data/exdata-data-NEI_data")

# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")

#subset data
Omar <- subset(NEI, fips == "24510")

#aggregate data for total emissions/year
aggEmissions <- aggregate(Emissions ~ year,Omar, sum)
aggEmissions$Emissions <- aggEmissions$Emissions/1000

#plot data
png('plot2.png')
plot(aggEmissions$year, aggEmissions$Emissions, type="h",
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions ('000)")
dev.off()
