library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

Omar <- subset(NEI, fips == 24510)
Omar$year <- factor(Omar$year, levels = c('1999', '2002', '2005', '2008'))

png('plot3.png', width = 800, height = 500, units = 'px')

ggplot(data=Omar, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +

geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
ylab(expression(paste('Log of Emissions'))) + xlab('Year') + 
ggtitle('Emissions per type of source in Baltimore City, Maryland')

dev.off()