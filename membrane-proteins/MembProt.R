MembProt <- structure(list(Year = 1985:2014, Count = c(1L, 0L, 1L, 0L, 0L, 
0L, 0L, 3L, 1L, 3L, 2L, 6L, 8L, 9L, 7L, 11L, 5L, 13L, 18L, 16L, 
18L, 24L, 28L, 30L, 41L, 43L, 40L, 65L, 55L, 72L), Cumulative = c(1L, 
1L, 2L, 2L, 2L, 2L, 2L, 5L, 6L, 9L, 11L, 17L, 25L, 34L, 41L, 
52L, 57L, 70L, 88L, 104L, 122L, 146L, 174L, 204L, 245L, 288L, 
328L, 393L, 448L, 520L)), .Names = c("Year", "Count", "Cumulative"
), row.names = c(NA, 30L), class = "data.frame")

library(ggplot2)
library(plyr)

# Remove most recent year (incomplete data)
MembProt <- subset(MembProt, Year != "2015")

# Create Plot
ggplot(data=MembProt,aes(x=Year, y=Cumulative,)) + geom_bar(stat="identity",size=1) + labs(x="Year", y="Cumulative Number of Structures", title="Cumulative Number of Membrane Protein Structures") + scale_x_continuous(breaks=c(seq(from=1985,to=2014,by=2))) + scale_y_continuous(breaks=c(seq(from=0,to=600,by=100))) + theme_minimal() + theme(axis.text.x = element_text(angle=45,hjust=1),axis.line = element_line(size = 0.5, linetype = "solid",colour = "black"))

ggsave(file="MembProf.pdf", width=7, height=5)