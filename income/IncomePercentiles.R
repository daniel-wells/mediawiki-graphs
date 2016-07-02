IncomePercentiles <- structure(list(Percentile = 1:99, X2012to13 = c(8320L, 8570L, 
8820L, 9060L, 9300L, 9550L, 9800L, 10000L, 10300L, 10500L, 10700L, 
10900L, 11100L, 11200L, 11400L, 11600L, 11800L, 11900L, 12100L, 
12300L, 12500L, 12600L, 12800L, 13000L, 13200L, 13400L, 13600L, 
13800L, 13900L, 14100L, 14300L, 14500L, 14700L, 14900L, 15100L, 
15400L, 15600L, 15800L, 16000L, 16200L, 16400L, 16700L, 16900L, 
17100L, 17400L, 17600L, 17900L, 18100L, 18400L, 18700L, 18900L, 
19200L, 19500L, 19800L, 20100L, 20400L, 20700L, 21000L, 21300L, 
21700L, 22000L, 22400L, 22700L, 23100L, 23500L, 23900L, 24300L, 
24700L, 25200L, 25600L, 26100L, 26600L, 27100L, 27700L, 28200L, 
28800L, 29400L, 30000L, 30700L, 31400L, 32200L, 33000L, 33800L, 
34700L, 35700L, 36600L, 37600L, 38600L, 39500L, 40700L, 42200L, 
43900L, 46000L, 48800L, 52500L, 57500L, 65100L, 75700L, 101000L
)), .Names = c("Percentile", "X2012to13"), class = "data.frame", row.names = c(NA, 
-99L))

library(ggplot2)
library(scales)

# Create Plot
ggplot(data=IncomePercentiles,aes(x=Percentile, y=X2012to13,)) +
	geom_bar(stat="identity",width=1) +
	scale_x_continuous(breaks=c(seq(from=0,to=100,by=5))) +
	scale_y_continuous(limits=c(0,102000),breaks=c(seq(from=0,to=101000,by=10000)),labels=comma) +
	labs(x="Percentile (%)", y="Post-Tax Income (£)", title="Post-Tax Income Percentiles") +
	theme_minimal() +
	theme(axis.line = element_line(size = 0.5, linetype = "solid",colour = "black"))

ggsave(file="IncomePercentile.pdf", width=7, height=5)