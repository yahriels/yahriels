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
cat("\nGiven that the general characteristics of a normal distrubution are with mean=1 and std=1, then we expect anything to that is above the value of '2' and below the value of'0' to be an outlier.\n")


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
cat("\nIn general, the female pulse rates do follow a normal distribution to some extent, as evidenced by the histogram with the overlayed bell curve. As we can see, the higher frequencies are concentrated toward the middle of the spread (~55-90) and flatten out toward the edges. We do see some outliers and see the highest frequency towards the middle of the spread (~70-80), which does fit the general behavior of a normal distribution.\n")


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
  cat("\nThe result suggests that the population mean radiation is less than the FCC standard of 1.6 W/kg.\n")
} else {
  cat("The result does not conclusively suggest that the population mean radiation is less than the FCC standard of 1.6 W/kg.\n")
}



# Question 11
# Data given
n_placebo <- 43
mean_placebo <- 21.57
sd_placebo <- 3.87

n_treatment <- 33
mean_treatment <- 20.38
sd_treatment <- 3.91

# Perform a two-sample t-test
t_test_result <- t.test(
  x = c(rnorm(n_placebo, mean = mean_placebo, sd = sd_placebo)),
  y = c(rnorm(n_treatment, mean = mean_treatment, sd = sd_treatment)),
  var.equal = TRUE, # Assume equal variances
  alternative = "two.sided", # Two-tailed test
  conf.level = 0.05 # Significance level
)

# Output the result
t_test_result
if (t_test_result$p.value < 0.05) {
  cat("There is significant evidence to suggest that paroxetine has a different effect on bipolar depression compared to the placebo.\n")
} else {
  cat("There is not enough evidence to suggest that paroxetine is more effective than the placebo for treating bipolar depression.\n")
}





# Question 12
library(readxl)
Body_Data <- read_excel("Body Data.xlsx")
View(Body_Data)
female_BP <- Body_Data$DIASTOLIC[Body_Data$GENDER == 0]

# Perform a one-sample t-test to test the claim that the mean diastolic blood pressure is less than 90 mmHg
t_test_result <- t.test(female_BP, mu = 90, alternative = "less")

# Print the test results
print(t_test_result)

# Conclusion based on the p-value
if (t_test_result$p.value < 0.05) {
  cat("At the 0.05 significance level, we reject the null hypothesis.\n")
  cat("This suggests that the mean diastolic blood pressure for adult females is significantly less than 90 mmHg.\n")
} else {
  cat("At the 0.05 significance level, we fail to reject the null hypothesis.\n")
  cat("This suggests that we do not have enough evidence to claim that the mean diastolic blood pressure for adult females is less than 90 mmHg.\n")
}

# Interpretation regarding hypertension
if (t_test_result$conf.int[2] < 90) {
  cat("Based on the result, we can conclude that it is unlikely that any of the adult females in the sample have hypertension (diastolic BP > 90 mmHg).\n")
} else {
  cat("Based on the result, we cannot conclusively state that none of the adult females in the sample have hypertension.\n")
}


# Question 13
#Import LC Data
library(readxl)
LCData <- read_excel("LCData.xlsx")
View(LCData)

# View the data structure
str(LCData)
summary(LCData)

# a. (KEY VERSION)
SmokeStatus <- LCData$'Smoke'
LungC <- LCData$'LC'
ggplot(LCData, aes( x = SmokeStatus, y = LungC)) + geom_boxplot()

# a. Boxplot to examine the relationship between lung capacity and smoking status
boxplot(LC ~ Smoke, data = LCData, 
        main = "Lung Capacity by Smoking Status",
        xlab = "Smoking Status",
        ylab = "Lung Capacity (liters)",
        col = c("lightblue", "lightgreen"))

# b. State the hypotheses
cat("\n Null Hypothesis (Ho): There is no difference in mean lung capacity between smokers and nonsmokers (μ_smokers = μ_nonsmokers).\n")
cat("Alternative Hypothesis (Ha): There is a difference in mean lung capacity between smokers and nonsmokers (μ_smokers ≠ μ_nonsmokers).\n")

# Assumptions check
cat("1. Normality: Check if lung capacities are approximately normally distributed for each group. (can use histograms or Shapiro-Wilk test)\n")
cat("2. Equal variances: Check if the variances of lung capacities are equal for smokers and nonsmokers. (can use F-test)\n")

# b. KEY VERSION
nonSm <- LCData$'LC'[LCData$'Smoke' == c("no")]
Smokers <- LCData$'LC'[LCData$'Smoke' == c("yes")]

# Normality check using Shapiro-Wilk test
shapiro.test(LCData$LC[LCData$Smoke == "yes"])
shapiro.test(LCData$LC[LCData$Smoke == "no"])

# Variance check using Bartlett's test
bartlett.test(LC ~ Smoke, data = LCData)

# c. Decide on a test type and significance level
# Given the research question, a two-sided test is appropriate.
# Set significance level (alpha)
alpha <- 0.05

# d. Perform t-test assuming equal variances
t_test_result <- t.test(LC ~ Smoke, data = LCData, var.equal = TRUE)
t_test_result

# d. KEY VERSION
t.test(nonSm, Smokers, mu = 0, alt= "two.sided", var.eq = T, conf = 0.95, paired=F)

# e. Interpret the R output and identify key statistics
test_statistic <- t_test_result$statistic
df <- t_test_result$parameter
p_value <- t_test_result$p.value
CI <- t_test_result$conf.int
means <- t_test_result$estimate

# Print out the key statistics
cat("Test Statistic (t):", test_statistic, "\n")
cat("Degrees of Freedom (df):", df, "\n")
cat("P-value:", p_value, "\n")
cat("95% Confidence Interval:", CI, "\n")
cat("Means for Smokers and Nonsmokers:", means, "\n")

# f. Interpret the CI and use it to conclude
# If the 95% CI does not include 0, we reject the null hypothesis (Ho).
if(CI[1] > 0 | CI[2] < 0) {
  cat("Reject Ho: There is a significant difference in lung capacity between smokers and nonsmokers.\n")
} else {
  cat("Fail to Reject Ho: There is no significant difference in lung capacity between smokers and nonsmokers.\n")
}

# g. Manually calculate the mean difference’s 95% CI
n1 <- length(LCData$LC[LCData$Smoke == "yes"])
n2 <- length(LCData$LC[LCData$Smoke == "no"])
mean_diff <- means[1] - means[2]
pooled_sd <- sqrt(((n1-1)*var(LCData$LC[LCData$Smoke == "yes"]) + 
                     (n2-1)*var(LCData$LC[LCData$Smoke == "no"])) / (n1 + n2 - 2))
se_diff <- pooled_sd * sqrt(1/n1 + 1/n2)
manual_CI <- mean_diff + c(-1, 1) * qt(1 - alpha/2, df) * se_diff

cat("Manually Calculated 95% Confidence Interval for Mean Difference:", manual_CI, "\n")

# g KEY VERSION
mean.diff <- mean(nonSm)-mean(Smokers)
df <- length(nonSm)-1
tcrit <- qt(0.025, df, lower.tail = F)
SEM <- sqrt(sd(nonSm)^2/182 + sd(Smokers)^2/18)
ME <- tcrit*SEM
upper <- mean.diff+ME
lower <- mean.diff-ME

# h. Manually calculate the t-statistic and p-value
manual_t_statistic <- mean_diff / se_diff
manual_p_value <- 2 * pt(-abs(manual_t_statistic), df)

# h KEY VERSION
ttest.stat <- (mean.diff-0)/SEM
pvalue <- 2*pt(-0.4057, df=18, lower.tail=F)

cat("Manually Calculated t-Statistic:", manual_t_statistic, "\n")
cat("Manually Calculated P-value:", manual_p_value, "\n")

# Conclusion based on manual calculations
if(manual_p_value < alpha) {
  cat("Reject Ho based on manual calculation: There is a significant difference in lung capacity between smokers and nonsmokers.\n")
} else {
  cat("Fail to Reject Ho based on manual calculation: There is no significant difference in lung capacity between smokers and nonsmokers.\n")
}

