# Load necessary libraries
library(ggplot2)
library(forecast)
library(tseries)

# Set parameters for sampling
sampling_rate <- 10000  # samples per second
duration <- 0.02  # 20 milliseconds
time <- seq(0, duration, length.out = sampling_rate * duration + 1)  # time vector

# Function to generate EMG signal data
generate_emg_signal <- function(condition = "baseline") {
  # Stimulation spike
  stimulus_start <- round(0.002 * sampling_rate)
  stimulus_duration <- round(0.0002 * sampling_rate)
  stimulus_signal <- rep(0, length(time))
  stimulus_signal[stimulus_start:(stimulus_start + stimulus_duration - 1)] <- 1
  
  # M-Wave parameters
  m_wave_center <- round(0.006 * sampling_rate)
  m_wave_std <- 0.0007 * sampling_rate
  m_wave <- exp(-0.55 * ((seq(0, duration, length.out = length(time)) * sampling_rate - m_wave_center) / m_wave_std)^2)
  m_wave <- m_wave - exp(-0.55 * ((seq(0, duration, length.out = length(time)) * sampling_rate - m_wave_center - 0.001 * sampling_rate) / m_wave_std)^2)
  
  # H-Reflex parameters
  h_wave_center <- round(0.0201 * sampling_rate)
  h_wave_std <- 0.00025 * sampling_rate
  
  if (condition == "baseline") {
    h_wave_amplitude <- 1.0
  } else if (condition == "downconditioning") {
    h_wave_amplitude <- 0.7
  } else if (condition == "upconditioning") {
    h_wave_amplitude <- 1.3
  } else if (condition == "predict") {
    h_wave_amplitude <- 0.88
  } else {
    stop("Invalid condition")
  }
  
  h_wave <- exp(-0.5 * ((seq(0, duration, length.out = length(time)) * sampling_rate - h_wave_center) / h_wave_std)^2)
  h_wave <- h_wave - exp(-0.5 * ((seq(0, duration, length.out = length(time)) * sampling_rate - h_wave_center - 0.001 * sampling_rate) / h_wave_std)^2)
  
  # Combine signals
  emg_signal <- stimulus_signal - m_wave * 0.30 + h_wave * h_wave_amplitude
  
  # Add noise
  set.seed(123)
  noise <- rnorm(length(emg_signal), mean = 0, sd = 0.1)
  emg_signal_noisy <- emg_signal + noise
  
  return(emg_signal_noisy)
}

# Generate EMG signals
baseline_signal <- generate_emg_signal("baseline")
downconditioning_signal <- generate_emg_signal("downconditioning")
upconditioning_signal <- generate_emg_signal("upconditioning")
predict_signal <- generate_emg_signal("predict")

# Plot EMG signals
plot_emg_signal <- function(signal, title) {
  emg_data <- data.frame(Time = seq(0, duration, length.out = length(signal)) * 1000, EMG_Signal = signal)
  ggplot(emg_data, aes(x = Time, y = EMG_Signal)) +
    geom_line(color = "black") +
    labs(x = "Time (ms)", y = "Amplitude (mV)", title = title) +
    theme_minimal() +
    theme(panel.grid.major = element_line(color = "gray", linetype = "dashed"))
}

# Visualize the signals
plot_emg_signal(baseline_signal, "Simulated EMG Signal - Baseline")
plot_emg_signal(downconditioning_signal, "Simulated EMG Signal - Down-conditioning")
plot_emg_signal(upconditioning_signal, "Simulated EMG Signal - Up-conditioning")
plot_emg_signal(predict_signal, "Simulated EMG Signal - Prediction")

# Set parameters for prediction
predict_sampling_rate <- 10000  # samples per second
predict_duration <- 0.0201  # 20.1 milliseconds
predict_time <- seq(0, predict_duration, length.out = predict_sampling_rate * predict_duration + 1)  # time vector

# Function to generate predict EMG signal data
generate_predict_emg_signal <- function(condition = "predict") {
  # Stimulation spike
  stimulus_start <- round(0.002 * predict_sampling_rate)
  stimulus_duration <- round(0.0002 * predict_sampling_rate)
  stimulus_signal <- rep(0, length(predict_time))
  stimulus_signal[stimulus_start:(stimulus_start + stimulus_duration - 1)] <- 1
  
  # M-Wave parameters
  m_wave_center <- round(0.006 * predict_sampling_rate)
  m_wave_std <- 0.0007 * predict_sampling_rate
  m_wave <- exp(-0.55 * ((predict_time * predict_sampling_rate - m_wave_center) / m_wave_std)^2)
  m_wave <- m_wave - exp(-0.55 * ((predict_time * predict_sampling_rate - m_wave_center - 0.001 * predict_sampling_rate) / m_wave_std)^2)
  
  # H-Reflex parameters
  h_wave_center <- round(0.0201 * predict_sampling_rate)
  h_wave_std <- 0.00015 * predict_sampling_rate
  
  if (condition == "predict") {
    h_wave_amplitude <- 0.88
  } else if (condition == "downconditioning") {
    h_wave_amplitude <- 0.7
  } else if (condition == "upconditioning") {
    h_wave_amplitude <- 1.3
  } else {
    stop("Invalid condition")
  }
  
  h_wave <- exp(-0.5 * ((predict_time * predict_sampling_rate - h_wave_center) / h_wave_std)^2)
  h_wave <- h_wave - exp(-0.5 * ((predict_time * predict_sampling_rate - h_wave_center - 0.001 * predict_sampling_rate) / h_wave_std)^2)
  
  # Combine signals
  emg_predict_signal <- stimulus_signal - m_wave * 0.30 + h_wave * h_wave_amplitude
  
  # Add noise
  set.seed(123)
  noise <- rnorm(length(emg_predict_signal), mean = 0, sd = 0.1)
  emg_predict_signal_noisy <- emg_predict_signal + noise
  
  return(emg_predict_signal_noisy)
}

# Generate EMG signals for prediction
predict_signal <- generate_predict_emg_signal("predict")

# Visualize the predicted signal
plot_emg_signal(predict_signal, "Simulated EMG Signal - Predict")

# ARIMA Forecasting for Down-conditioning Signal
fit <- auto.arima(downconditioning_signal)  # Change to the correct signal
forecasted <- forecast(fit, h = 50)  # Forecast next 50 time points

# Plot ARIMA Forecast
autoplot(forecasted) + ggtitle("ARIMA Forecast for Predict Signal")

# ADF Test for Stationarity
adf_test <- adf.test(downconditioning_signal)  # Change to the correct signal
print(adf_test)

# Autocorrelation Analysis
acf(downconditioning_signal, main="ACF for Predict Signal")  # Change to the correct signal
pacf(downconditioning_signal, main="PACF for Predict Signal")  # Change to the correct signal

# Conclusion on the H-Reflex analysis and predictions
summary(fit)
