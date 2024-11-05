# Load required libraries
library(ggplot2)
library(forecast)
library(tseries)

# Parameters for simulated data generation
sampling_rate <- 10000   # samples per second
duration <- 0.02         # 20 milliseconds
time <- seq(0, duration, length.out = sampling_rate * duration + 1)

# Function to generate EMG signal with different conditioning states
generate_emg_signal <- function(condition = "baseline") {
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
  
  emg_signal <- stimulus_signal - m_wave * 0.30 + h_wave * h_wave_amplitude
  noise <- rnorm(length(emg_signal), mean = 0, sd = 0.1)
  return(emg_signal + noise)
}

# Generate data for baseline, down-conditioning, and up-conditioning
baseline_signal <- generate_emg_signal("baseline")
downconditioning_signal <- generate_emg_signal("downconditioning")
upconditioning_signal <- generate_emg_signal("upconditioning")

# Convert signals to time series
baseline_ts <- ts(baseline_signal, frequency = 500)
downconditioning_ts <- ts(downconditioning_signal, frequency = 500)
upconditioning_ts <- ts(upconditioning_signal, frequency = 500)

# Check stationarity with Augmented Dickey-Fuller Test
adf.test(baseline_ts)
adf.test(downconditioning_ts)
adf.test(upconditioning_ts)

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

# Decomposition Analysis for Baseline Prediction Series
decomp_baseline <- decompose(baseline_ts)
plot(decomp_baseline)

# RMS Fit and Linear Regression Fit
rms_fit <- sqrt(mean(baseline_ts^2))
linear_fit <- lm(baseline_ts ~ time)
summary(linear_fit)

# Plotting the H-Wave Peak
plot(baseline_ts, type = 'l', col = 'blue', main = "H-Reflex Baseline with Peak Line", ylab = "Amplitude (mV)")
abline(h = max(baseline_signal), col = "red", lty = 2)  # Horizontal line at peak amplitude

