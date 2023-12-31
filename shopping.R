library(dplyr)
library(arules)
library(arulesViz)

# Reading data
data <- read.csv("Assignment-1_Data.csv", header=TRUE, sep=";")
names(data) <- c("BillNum", "Itemname", "Quantity", "Date", "Price", "CustomerID", "Country")

# Since 93% of the transactions take place in the UK, I will focus on this country.
data = data[data$Country == "United Kingdom",]

# Some transactions have been canceled, so the number is less than one.
data = data[data$Quantity >= 1,]

# Selecting only the necessary columns for analysis.
data <- data[,names(data) %in% c("BillNum", "Itemname")]

# Selecting only those items that occurred more than 200 times.
group <- data %>% group_by(Itemname) %>% 
  summarise(total_count=n(),
            .groups = 'drop')

group2 <- group[group$total_count > 200,]
data <- data[data$Itemname %in% group2$Itemname,]
data$Itemname <- gsub(" ", "_", data$Itemname)

# Save the prepared data to csv as "read.transactions" accepts this format as input.
write.csv(data, file='prepared_data.csv', row.names=FALSE)


# Transactions analysis using apriori algorithm.
transactions <- read.transactions("prepared_data.csv", format="single", header=TRUE, cols=c(1, 2))
str(transactions)

rules <- apriori(transactions, parameter = list(supp = 0.01, conf = 0.5))
inspect(rules[0:100])

# Selection 50 rules with highest confidence.
subrules <- head(rules, n = 50, by = "confidence")

# Plotting selected rules as graph.
plot(subrules, method = "graph",  engine = "htmlwidget")

# Support vs Confidence plot.
plot(rules, shading="order", control=list(main = "Support vs Confidence", 
                                          col=rainbow(10)), jitter=0)


