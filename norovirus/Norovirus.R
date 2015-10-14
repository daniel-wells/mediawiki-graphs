
Noro <- read.csv("Norovirus.csv", na.strings="")



# Create Theme
theme_a <- theme_bw() + theme(axis.title = element_text(size = rel(1.5)), axis.text = element_text(size = rel(1.25)), axis.text.x = element_text(angle=45,hjust=1), plot.title = element_text(size=rel(1.5)))

# Set factor levels for Months - so plot in correct order
Noro$Month <- factor(Noro$Month,levels=c("Aug","Sep","Oct","Nov","Dec","Jan","Feb","Mar","Apr","May","Jun","Jul"),ordered=TRUE)

# Calculate Mean and standard deviation for each Month
NoroAnnual <- ddply(Noro, c("Month"), summarise,mean = mean(Cases),sd= sd(Cases),N = length(Cases),se= sd / sqrt(N))

# Plot Mean case per month
ggplot(NoroAnnual, aes(x=Month, y=mean,group=0)) +  geom_ribbon(aes(ymin=mean-sd,ymax=mean+sd),alpha=0.3) + geom_line() + labs(x="Month", y="Mean Cases", title="Mean Norovirus Cases per Month (2000-2011)")  + theme_a + annotate("text", x=3, y=1500, label="Shaded Area: Standard Deviation")

# Plot all Seasons Cases
ggplot(data=Noro,aes(x=Month, y=Cases,group=Season, colour=Season)) + geom_line(size=0.5,alpha=0.5) + geom_smooth(aes(group = 1),size=1)


# Sum Cases Per Season
NoroSeason <- ddply(Noro, c("Season"), summarise, Sum=sum(Cases,na.rm=TRUE))

# Remove Seasons with incomplete data
NoroSeason <- subset(NoroSeason, Season != "1999/2000" & Season != "2012/2013")

# Plot Total Case Per Season
ggplot(data=NoroSeason,aes(x=Season, y=Sum,group=0)) + geom_line(size=1) + labs(x="Season (Aug-Jul)", y="Total Cases", title="Norovirus Cases Per Season") + theme_a + scale_y_continuous(limits=c(0,12600),breaks = seq(0,12600,by = 2000))