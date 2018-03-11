# data 'USJudgeRatings' https://vincentarelbundock.github.io/Rdatasets/datasets.html
# Lawyers' Ratings of State Judges in the US Superior Court
# Format
#
# A data frame containing 43 observations on 12 numeric variables.
# [,1]    CONT    Number of contacts of lawyer with judge.
# [,2]    INTG    Judicial integrity.
# [,3]    DMNR    Demeanor.
# [,4]    DILG    Diligence.
# [,5]    CFMG    Case flow managing.
# [,6]    DECI    Prompt decisions.
# [,7]    PREP    Preparation for trial.
# [,8]    FAMI    Familiarity with law.
# [,9]    ORAL    Sound oral rulings.
# [,10]   WRIT    Sound written rulings.
# [,11]   PHYS    Physical ability.
# [,12]   RTEN    Worthy of retention.
# Source
#
# New Haven Register, 14 January, 1977 (from John Hartigan).

library(ggplot2)
library(lessR)
library(reshape2)

# Import data
web.data <- url('https://raw.github.com/vincentarelbundock/Rdatasets/master/csv/datasets/USJudgeRatings.csv')
lr  <- read.csv(web.data, header=T)

#### Cleaning the dataset ####

# Loop over names and remove first initials
a <- c()
for (i in 1:nrow(lr)) {
        a[i] <- apply(lr[1], 2, FUN=strsplit, split=",")[[1]][[i]][1]
    }

# Rename 33rd judge
a[33] <- paste("D ", a[33])

# Rename Judges column and remove first column
attributes(lr)$row.names <- a
lr <- lr[,-1]

# Add totals and averages for each of the rows
lr.x <- lr
lr$MEAN <-  addmargins(as.matrix(lr.x), 2, FUN=mean)[,13]
lr$MEAN <- round(lr$MEAN, digits = 1)
lr$TOTAL <- addmargins(as.matrix(lr.x), 2)[,13]

# Manipulating order
lr.b <- lr$TOTAL[order(lr$TOTAL)] # order bars
n.b <- attributes(lr)$row.names[order(lr$TOTAL)] # order bar names

#### Analysis ####

# generate correlations
cormatrix <- cor(lr.x[,-1])

# order correlations
cormatrix <- reord(cormatrix)

# create single set of correlations as a dataframe
diag(cormatrix) <- NA
cormatrix[lower.tri(cormatrix)] <- NA
cor.df <- as.data.frame(as.table(cormatrix))
names(cor.df) <- c("Obs 1", "Obs 2", "Correlation")
# head(cor.df[order(abs(cor.df$Correlation), decreasing=T),], n = 9) # diagnostics
cormat.melt <- melt(cormatrix, na.rm=T)


#### The chart code ####

ggplot(data = cormat.melt, aes(x=Var1, y=Var2, fill=value)) +
    geom_tile(color="white") +
    scale_fill_gradient2(low="blue", high="red",
                         mid="white", midpoint=.5, limit=c(0,1),
                         space="Lab", name="Pearson\nCorrelation") +
    theme_minimal()+coord_fixed() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    ggtitle("Judge Ratings by Rated Attributes")

