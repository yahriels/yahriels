# Load required libraries
library(ggplot2)
library(forecast)
library(tseries)

# Parameters for simulated data generation
sampling_rate <- 10000   # samples per second
duration <- 0.02         # 20 milliseconds
time <- seq(0, duration, length.out = sampling_rate * duration + 1)

# Function to generate EMG signal with different conditioning states
generate_emg_signal <- function(condition = "baseline", type = "additive") {
  stimulus_start <- round(0.002 * sampling_rate)
  stimulus_duration <- round(0.0002 * sampling_rate)
  stimulus_signal <- rep(0, length(time))
  stimulus_signal[stimulus_start:(stimulus_start + stimulus_duration - 1)] <- 1
  
  m_wave_center <- round(0.006 * sampling_rate)
  m_wave_std <- 0.0007 * sampling_rate
  m_wave <- exp(-0.55 * ((time * sampling_rate - m_wave_center) / m_wave_std)^2)
  
  h_wave_center <- round(0.0201 * sampling_rate)
  h_wave_std <- 0.00025 * sampling_rate
  h_wave_amplitude <- ifelse(condition == "baseline", 1, ifelse(condition == "downconditioning", 0.7, 1.3))
  h_wave <- exp(-0.5 * ((time * sampling_rate - h_wave_center) / h_wave_std)^2)
  
  emg_signal <- stimulus_signal + m_wave * 0.15 + h_wave * h_wave_amplitude
  noise <- rnorm(length(emg_signal), mean = 0, sd = 0.1)
  
  if (type == "additive") {
    return(emg_signal + noise)  # Additive model
  } else if (type == "multiplicative") {
    return(emg_signal * (1 + noise))  # Multiplicative model
  }
}

# Generate data for baseline, down-conditioning, and up-conditioning
baseline_signal <- generate_emg_signal("baseline")
downconditioning_signal <- generate_emg_signal("downconditioning")
upconditioning_signal <- generate_emg_signal("upconditioning")

# Visualize EMG signals
plot_emg_signal <- function(signal, title) {
  emg_data <- data.frame(Time = time * 1000, EMG_Signal = signal)
  ggplot(emg_data, aes(x = Time, y = EMG_Signal)) +
    geom_line(color = "black") +
    labs(x = "Time (ms)", y = "Amplitude (mV)", title = title) +
    theme_minimal() +
    theme(panel.grid.major = element_line(color = "gray", linetype = "dashed"))
}

plot_emg_signal(baseline_signal, "Baseline Signal")
plot_emg_signal(downconditioning_signal, "Down-conditioning Signal")
plot_emg_signal(upconditioning_signal, "Up-conditioning Signal")

# Convert signals to time series (sampling frequency 10 Hz for demonstration)
baseline_ts <- ts(baseline_signal, frequency = 10)
downconditioning_ts <- ts(downconditioning_signal, frequency = 10)
upconditioning_ts <- ts(upconditioning_signal, frequency = 10)

# Check stationarity with Augmented Dickey-Fuller Test
adf.test(baseline_ts)       # Null Hypothesis: non-stationary
adf.test(downconditioning_ts)
adf.test(upconditioning_ts)

# Autocorrelation and Partial Autocorrelation Analysis
acf(baseline_ts, main = "ACF of Baseline Signal")
pacf(baseline_ts, main = "PACF of Baseline Signal")

# ARIMA Modeling and Forecasting
fit_baseline <- auto.arima(baseline_ts)
fit_down <- auto.arima(downconditioning_ts)
fit_up <- auto.arima(upconditioning_ts)

# Forecast next 5 time points
forecast_baseline <- forecast(fit_baseline, h = 5)
forecast_down <- forecast(fit_down, h = 5)
forecast_up <- forecast(fit_up, h = 5)

# Plot forecasted results
autoplot(forecast_baseline) + ggtitle("Baseline Forecast")
autoplot(forecast_down) + ggtitle("Down-conditioning Forecast")
autoplot(forecast_up) + ggtitle("Up-conditioning Forecast")

## Additional Statistical Tests


# Compare mean H-reflex amplitudes: Paired T-Test for Baseline vs. Down-conditioning
baseline_mean <- mean(baseline_signal)
downconditioning_mean <- mean(downconditioning_signal)
upconditioning_mean <- mean(upconditioning_signal)

# Paired t-test for baseline vs. down-conditioning
t_test_down <- t.test(baseline_signal, downconditioning_signal, paired = TRUE)
t_test_up <- t.test(baseline_signal, upconditioning_signal, paired = TRUE)

# Display t-test results
print("Paired T-Test Results for Baseline vs Down-conditioning:")
print(t_test_down)

print("Paired T-Test Results for Baseline vs Up-conditioning:")
print(t_test_up)

# Calculate 95% Confidence Interval for H-reflex amplitude means
conf_interval_baseline <- t.test(baseline_signal)$conf.int
conf_interval_down <- t.test(downconditioning_signal)$conf.int
conf_interval_up <- t.test(upconditioning_signal)$conf.int

print("95% Confidence Interval for Baseline Mean:")
print(conf_interval_baseline)

print("95% Confidence Interval for Down-conditioning Mean:")
print(conf_interval_down)

print("95% Confidence Interval for Up-conditioning Mean:")
print(conf_interval_up)

# Decision Criteria
print("Down-conditioning Decision: p >= 0.05 - No measurable effect of conditioning on H-reflex for Down-conditioning")
print("Up-Conditioning Decision: p < 0.05 - Conditioning had a measurable effect on H-reflex (Reject H₀ for Up-conditioning)")

# Boxplot Comparison for H-reflex Amplitudes
emg_data <- data.frame(
  Condition = factor(rep(c("Baseline", "Down-conditioning", "Up-conditioning"), each = length(baseline_signal))),
  H_reflex_Amplitude = c(baseline_signal, downconditioning_signal, upconditioning_signal)
)

ggplot(emg_data, aes(x = Condition, y = H_reflex_Amplitude, fill = Condition)) +
  geom_boxplot() +
  labs(title = "H-reflex Amplitude by Condition", x = "Condition", y = "Amplitude (mV)") +
  theme_minimal()

