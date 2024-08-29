# Clean Environment
rm(list = ls(all=TRUE))
graphics.off()
shell("cls")

# Install Packages and Libraries
#install.packages("datasets")
#install.packages("ggplot2")
#install.packages("MASS")
#install.packages("dplyr")
library(datasets) 
library(ggplot2)
library(MASS)
library(dplyr)


# Question 1
birthweight <- c(3600,1700,4000,3900,3100,3800,2200,3000)
summary(birthweight)
sd(birthweight)
hist(birthweight)

# Question 2
Ar_rice <- c(6.1, 5.4, 6.9, 4.9, 6.6, 6.3, 6.7, 8.2, 7.8, 1.5, 5.4, 7.3)
hist(Ar_rice, 
     main = "Measured amount of arsenic in brown rice", 
     # xlab = ""
     ylab = "Amount (ug/serving)",
     breaks = 2)

# Question 3
father <- c(73.0, 75.5, 75.0, 75.0, 75.0, 74.0, 74.0, 73.0, 73.0, 78.5)
son <- c(74.0, 73.5, 71.0, 70.5, 72.0, 76.5, 74.0, 71.0, 72.0, 73.2)
summary(father)
sd(father)
var(father)
str(father)
summary(son)
sd(son)
var(son)
str(son)
plot(father,son)
cor(father,son)

# Question 4
mydata <- iris
head(mydata)
str(mydata)

ggplot(mydata, aes(x=Sepal.Width, y=Sepal.Length, col=Species))+
  geom_point()+
  ggtitle("Sepal width vs. Sepal length")


# Question 5
pnorm(q=.01, mean=0, sd=1, lower.tail=F) 


#Import Body Data
library(readxl)
Body_Data <- read_excel("C:/Users/yahri/yahriels/Stats/R/Body Data.xlsx")
View(Body_Data)

#Import LC Data
library(readxl)
LC_Data <- read_excel("C:/Users/yahri/yahriels/Stats/R/LCData.xlsx")
View(LC_Data)
