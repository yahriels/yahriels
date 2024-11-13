# Load necessary libraries
library(ggplot2)
library(dplyr)
library(pwr)
library(lme4)
library(car)

# Set seed for reproducibility
set.seed(42)

# Simulate sample data
n_per_group <- 15  # Number of participants per group
groups <- c("HROC_only", "VNS_only", "HROC_VNS", "SCI_only")
data <- data.frame(
  ID = 1:(n_per_group * length(groups)),
  Group = rep(groups, each = n_per_group),
  Pre_H_Reflex = rnorm(n_per_group * length(groups), mean = 0.8, sd = 0.1),
  Post_H_Reflex = c(
    rnorm(n_per_group, mean = 0.85, sd = 0.12),
    rnorm(n_per_group, mean = 0.88, sd = 0.12),
    rnorm(n_per_group, mean = 1.0, sd = 0.12),
    rnorm(n_per_group, mean = 0.78, sd = 0.12)
  )
)

# View summary statistics
print(summary(data))

# Visualize pre- and post-intervention data by group
plot <- ggplot(data, aes(x = Group, y = Post_H_Reflex, fill = Group)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Post H-Reflex Amplitudes Across Treatment Groups",
       y = "H-Reflex Amplitude (mV)")
print(plot)

# Perform paired t-tests within each group
results_t_tests <- data %>%
  group_by(Group) %>%
  summarise(
    t_test_result = list(t.test(Post_H_Reflex, Pre_H_Reflex, paired = TRUE)),
    p_value = t_test_result[[1]]$p.value
  )
print(results_t_tests)

# Run one-way ANOVA to compare means between groups
anova_result <- aov(Post_H_Reflex ~ Group, data = data)
print(summary(anova_result))
# Df Sum Sq Mean Sq F value   Pr(>F)    
# Group        3 0.4699 0.15662   12.65 2.01e-06 ***
#   Residuals   56 0.6932 0.01238      

# Assumption checks for ANOVA

# Shapiro-Wilk test for normality
shapiro_results <- by(data$Post_H_Reflex, data$Group, function(x) shapiro.test(x))
print(shapiro_results) # p-value > 0.05, Normal Distribution
# Shapiro-Wilk normality test
# data:  x
# W = 0.94627, p-value = 0.4677

# QQ plot for residuals
qqnorm(residuals(anova_result))
qqline(residuals(anova_result), col = "red")

# Residuals vs fitted values plot
plot(anova_result, which = 1)

# Homogeneity of variances using Levene's Test
levene_test_result <- leveneTest(Post_H_Reflex ~ Group, data = data)
print(levene_test_result)

# H0: Population variances are equal (p-value = 0.1481)
# Fail to reject null hypothesis that variances are equal


# Check independence (assumed met due to random sampling)

# If assumptions are met, proceed to Tukey's post-hoc test

# Tukey's HSD test for post-hoc comparisons
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
# Tukey multiple comparisons of means
# 95% family-wise confidence level
# Fit: aov(formula = Post_H_Reflex ~ Group, data = data)

# $Group
# diff         lwr          upr     p adj
# HROC_VNS-HROC_only  0.13534113  0.02777135  0.242910917 0.0081231
# SCI_only-HROC_only -0.11401673 -0.22158651 -0.006446947 0.0337584
# VNS_only-HROC_only  0.02163056 -0.08593922  0.129200342 0.9508037
# SCI_only-HROC_VNS  -0.24935786 -0.35692765 -0.141788082 0.0000005
# VNS_only-HROC_VNS  -0.11371057 -0.22128036 -0.006140793 0.0344087
# VNS_only-SCI_only   0.13564729  0.02807751  0.243217071 0.0079485

# Conduct power analysis
effect_size <- cohen.ES(test = "f", size = "medium")
power_analysis <- pwr.anova.test(k = length(groups), f = effect_size$effect.size, sig.level = 0.05, power = 0.8)
print(power_analysis)

# Write an explanation of results
cat("\nExplanation of Results:\n")
cat("The ANOVA results indicate whether there is a statistically significant difference in H-reflex amplitude across the four groups.\n")
cat("If the p-value from the ANOVA is less than 0.05, we reject the null hypothesis, which states there is no difference between groups.\n")
cat("The post-hoc Tukey test will specify which groups have significant differences in H-reflex amplitude.\n")
