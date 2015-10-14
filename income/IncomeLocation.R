library(rgdal)
library(ggplot2)
setwd("~/Dropbox/Downloads")

IncomeLocation <- read.csv("~/Dropbox/Downloads/Income/Income3/IncomeLocation-Table 1.csv", na.strings="", stringsAsFactors=FALSE)

names(IncomeLocation)[names(IncomeLocation)=="District"] <- "LAD14NM"

write.csv(file=fileName, x=Dataframe)


# https://en.wikipedia.org/wiki/NUTS_of_the_United_Kingdom
# https://en.wikipedia.org/wiki/ISO_3166-2:GB
# http://www.ons.gov.uk/ons/guide-method/geography/beginner-s-guide/other/nomenclature-of-units-for-territorial-statistics/north-east/index.html
# From https://geoportal.statistics.gov.uk/geoportal/catalog/content/filelist.page
UK <- readOGR(dsn = 'Local_authority_district_(GB)_2014_Boundaries_(Generalised_Clipped)',layer = 'LAD_DEC_2014_GB_BGC')

UK@data$LAD14NM

plot(UK)

UK$LAD14NM[!UK$LAD14NM %in% IncomeLocation$LAD14NM]

[1] Kingston upon Hull, City of * Herefordshire, County of   * 
 [3] Bristol, City of *            Medway (Medway Towns)                  
 [5] Cheshire West and Chester (And)   Isles of Scilly      *(Of)       
 [7] South Bucks  (Buckinghamshire)                King's Lynn and West Norfolk (Kings)
						   King’s Lynn and West Norfolk
 [9] St Edmundsbury  (St.)             St Albans       (St.)            
[11] Newcastle upon Tyne (n-u-t)          Kingston upon Thames (Kingston-upon-Thames)
[13] Richmond upon Thames  Richmond-upon-Thames       Eilean Siar      Comhairle nan Eilean Siar           
[15] Scottish Borders   (borders)          City of Edinburgh        (E, City of)   
[17] Vale of Glamorgan (The Vale of Glamorgan)           Rhondda Cynon Taf Rhondda, Cynon, Taff

IncomeLocation$LAD14NM[!IncomeLocation$LAD14NM %in% UK$LAD14NM]

library(plyr)

UK@data <- join(UK@data, IncomeLocation)

library(tmap)

qtm(UK, "Mean")

# Plot by name
new <- data.frame(UK@data$LAD14NM,UK@data$Median)
new <- new[order(new$UK.data.Median, decreasing=T),]
new$UK.data.LAD14NM <- reorder(new$UK.data.LAD14NM, new$UK.data.Median)
ggplot(new, aes(UK.data.Median, UK.data.LAD14NM)) + geom_point()

UKF <- fortify(UK)
UK$id <- row.names(UK)
UKF <- join(UKF, UK@data)
ggplot(UKF, aes(long, lat, group = group, fill = Median)) + geom_polygon() + coord_equal() + scale_fill_gradient(limits=c(16000, 33400))
ggsave(file="income-location.pdf", width=10, height=15)