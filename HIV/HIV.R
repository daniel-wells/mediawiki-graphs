library(ggplot2)

HIV <- read.csv("HIV-data.csv", na.strings="")

#ggplot(HIV, aes(x = Year, )) + geom_line()

#ggplot(HIV, aes(Year)) +   geom_line(aes(y = Diagnoses)) +   geom_line(aes(y = Deaths)) +   geom_line(aes(y = MSM)) +   geom_line(aes(y = Hetro))

library("reshape2")

HIV_long <- melt(HIV, id="Year")

ggplot(data=HIV_long,aes(x=Year, y=value, colour=variable)) +
	geom_line(size=1) +
	labs(x="Year", y="Diagnoses / Deaths", title="HIV & AIDS Diagnoses and Deaths by Year in the UK", color="Color") +
	scale_x_continuous(breaks=1981:2013) +
	scale_color_discrete(name="Key",breaks=c("Diagnoses","Deaths", "MSM", "Hetro","AIDS"),labels=c("HIV Diagnoses","Deaths","Transmission Between Men","Heterosexual Transmission","AIDS Diagnoses")) +
	theme_minimal() +
	theme(legend.position="bottom",axis.text.x = element_text(angle=45,hjust=1),axis.line = element_line(size = 0.5, linetype = "solid",colour = "black")) +
	guides(col = guide_legend(nrow = 2))

ggsave(file="HIV.pdf", width=8, height=5)