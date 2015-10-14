IncomeAge <- structure(list(Age = structure(c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 
8L, 9L, 10L, 11L, 12L, 13L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 
10L, 11L, 12L, 13L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 
11L, 12L, 13L), .Label = c("Under 20", "20-24", "25-29", "30-34", 
"35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", 
"70-74", "75 and over"), class = c("ordered", "factor")), Category = structure(c(1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 3L, 3L, 3L, 3L, 
3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L), .Label = c("Both", "Female", "Male"), class = "factor"), 
    MedianIncome = c(11200L, 14500L, 19300L, 23400L, 25000L, 
    25100L, 25000L, 24500L, 23200L, 20400L, 19300L, 17200L, 17000L, 
    11500L, 15300L, 20000L, 25000L, 28100L, 29400L, 29600L, 29400L, 
    27200L, 23600L, 20900L, 17900L, 18800L, 10600L, 13700L, 18500L, 
    21200L, 21100L, 20100L, 20200L, 19500L, 19200L, 17100L, 17100L, 
    16000L, 15400L)), .Names = c("Age", "Category", "MedianIncome"
), row.names = c(NA, -39L), class = "data.frame")

library(ggplot2)
library(scales)

IncomeAge$Age <- factor(IncomeAge$Age,levels=c("Under 20","20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75 and over"),ordered=TRUE)

ggplot(data=IncomeAge,aes(x=Age, y=MedianIncome, colour=Category)) + geom_line(aes(group=Category),size=1) + labs(x="Age", y="Median Income Pre-Tax (£)", title="Income by Age and Gender in the UK", color="Gender")   + theme_minimal() + theme(legend.position="bottom",axis.line = element_line(size = 0.5, linetype = "solid",colour = "black")) + scale_y_continuous(limits=c(0,30000),breaks=c(seq(from=0,to=30000,by=5000)),labels=comma)

ggsave(file="IncomeAge.pdf", width=8.5, height=5)