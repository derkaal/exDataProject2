# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")

#aggregate data for total Emissions/year
aggEmissions <- aggregate(Emissions ~ year,NEI, sum)
aggEmissions$Emissions <- aggEmissions$Emissions/1000

#plot data
png('plot1.png')
plot(aggEmissions$year, aggEmissions$Emissions, type="h",
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions ('000)")
dev.off()