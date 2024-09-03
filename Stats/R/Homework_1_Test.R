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
# 5.1
## Given
mean <- 0
sd <- 1
## Z0.01 is the z-score separating the bottom 99% from the top 1%
Z0.01 <- qnorm(p=.01, mean, sd, lower.tail=F)
Z0.01
# 5.2
## Find the Z score for the bottom 2%
cutoff_low <- qnorm(p=0.02, mean, sd, lower.tail=T)
## Find the Z score for the top 2%
cutoff_high <- qnorm(p=0.98, mean, sd, lower.tail=T)
## Output the results
cutoff_low
cutoff_high


# Question 6
## 6.1 Probability of the bone density test score between -2.75 and 2.75
prob_1 <- pnorm(2.75, mean, sd, lower.tail=T) - pnorm(-2.75, mean, sd, lower.tail=T)
prob_1
##6.2Probability of the bone density test score between -2.0 and 2.0
prob_2 <- pnorm(2.0, mean, sd, lower.tail=T) - pnorm(-2.0, mean, sd, lower.tail=T)
prob_2


# Question 7



# Question 8
# Given probabilities
prob_1 <- 0.10
prob_2 <- 0.97
prob_3 <- 0.025

# Finding the Z critical values
z_0.10 <- round(qnorm(prob_1, mean = 0, sd = 1), 2)
z_0.97 <- round(qnorm(prob_2, mean = 0, sd = 1), 2)
z_0.025 <- round(qnorm(prob_3, mean = 0, sd = 1), 2)

# Display the results
z_0.10
z_0.97
z_0.025





# Question 9
library(readxl)
Body_Data <- read_excel("Body Data.xlsx")
View(Body_Data)
# Filter the data to include only females (0 = Female, 1 = Male)
females <- subset(Body_Data, GENDER == 0)

# Extract the pulse rates of females
female_pulse_rates <- females$PULSE

# Construct a histogram of females' pulse rates
hist(female_pulse_rates, 
     main = "Histogram of Females' Pulse Rates",
     xlab = "Pulse Rate (beats per minute)", 
     ylab = "Frequency", 
     col = "lightblue", 
     border = "black",
     breaks = 10)


# Add a normal distribution curve for comparison
x <- seq(min(female_pulse_rates), max(female_pulse_rates), length = 100)
y <- dnorm(x, mean = mean(female_pulse_rates), sd = sd(female_pulse_rates))
y <- y * diff(hist(female_pulse_rates, plot = FALSE)$mids[1:2]) * length(female_pulse_rates)
lines(x, y, col = "darkgreen", lwd = 2)

# Answer
### In general, the female pulse rates do follow a normal distribution to some extent, as evidenced by the histogram with the overlayed bell curve. As we can see, the higher frequencies are concentrated toward the middle of the spread (~55-90) and flatten out toward the edges. We do see some outliers and see the highest frequency towards the middle of the spread (~70-80), which does fit the general behavior of a normal distribution.


# Question 10
# Data: Measured radiation emissions (W/kg) from the selected cell phones
radiation_data <- c(0.38, 0.55, 1.54, 1.55, 0.50, 0.60, 0.92, 0.96, 1.00, 0.86, 1.46)

# Calculate the mean and standard deviation of the sample
mean_radiation <- mean(radiation_data)
sd_radiation <- sd(radiation_data)
n <- length(radiation_data)

# Calculate the 90% confidence interval
confidence_level <- 0.90
alpha <- 1 - confidence_level
t_value <- qt(1 - alpha/2, df = n - 1)

# Margin of error
margin_of_error <- t_value * (sd_radiation / sqrt(n))

# Confidence interval
lower_bound <- mean_radiation - margin_of_error
upper_bound <- mean_radiation + margin_of_error
confidence_interval <- c(lower_bound, upper_bound)

# Output the confidence interval
cat("90% Confidence Interval for the population mean:", confidence_interval, "\n")

# Compare with FCC standard of 1.6 W/kg
if (upper_bound < 1.6) {
  cat("The result suggests that the population mean radiation is less than the FCC standard of 1.6 W/kg.\n")
} else {
  cat("The result does not conclusively suggest that the population mean radiation is less than the FCC standard of 1.6 W/kg.\n")
}



# Question 11

# Question 12



# Question 13
#Import LC Data
library(readxl)
LC_Data <- read_excel("C:/Users/yahri/yahriels/Stats/R/LCData.xlsx")
View(LC_Data)
