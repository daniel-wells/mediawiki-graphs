IncomeCount <- structure(list(IncomeRange = structure(1:14, .Label = c("8-10", 
"10-12", "12-15", "15-20", "20-30", "30-50", "50-70", "70-100", 
"100-150", "150-200", "200-300", "300-500", "500-1000", "1000+"
), class = c("ordered", "factor")), Individuals = c(1960000L, 
2640000L, 4050000L, 5700000L, 7210000L, 6080000L, 1500000L, 746000L, 
394000L, 135000L, 88000L, 46000L, 24000L, 11000L)), .Names = c("IncomeRange", 
"Individuals"), row.names = c(NA, -14L), class = "data.frame")

library(ggplot2)
library(scales)

#Order Factors
IncomeCount$IncomeRange <- factor(IncomeCount$IncomeRange,levels=c("8-10","10-12","12-15","15-20","20-30","30-50","50-70","70-100","100-150","150-200","200-300","300-500","500-1000","1000+"),ordered=TRUE)


ggplot(data=IncomeCount,aes(x=IncomeRange, y=Individuals)) + geom_bar(stat="identity") + labs(x="Annual Income Range Before Deductions (£'000)", y="Number of Individuals", title="Number of Individuals by Income") + theme_minimal() + theme(axis.line = element_line(size = 0.5, linetype = "solid",colour = "black")) + scale_y_continuous(breaks=c(seq(from=0,to=7400000,by=1000000)),labels=comma)

ggsave(file="IncomeCount.pdf", width=10, height=5)