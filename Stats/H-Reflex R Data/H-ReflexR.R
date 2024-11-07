# Load required libraries
library(ggplot2)
library(forecast)
library(tseries)

# Generate time series of EMG signal data
sampling_rate <- 10000   # samples per second
duration <- 0.02         # 20 milliseconds
time <- seq(0, duration, length.out = sampling_rate * duration + 1)

# Define function to generate EMG signal based on conditioning state
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
  
  emg_signal <- stimulus_signal * (m_wave * 0.30) * ( h_wave * h_wave_amplitude) - m_wave * .30 + h_wave * h_wave_amplitude 
  noise <- rnorm(length(emg_signal), mean = 0, sd = 0.1)
  return(emg_signal + noise)
}

# Generate signals
baseline_signal <- generate_emg_signal("baseline")
downconditioning_signal <- generate_emg_signal("downconditioning")
upconditioning_signal <- generate_emg_signal("upconditioning")

# Convert signals to time series objects
baseline_ts <- ts(baseline_signal, frequency = 10)

# Decomposition of additive time series
additive_decomp_baseline <- decompose(baseline_ts, type = "additive")
plot(additive_decomp_baseline)
title("Additive Decomposition of Baseline Signal")

# Decomposition of multiplicative time series
multiplicative_decomp_baseline <- decompose(baseline_ts, type = "multiplicative")
plot(multiplicative_decomp_baseline)
title("Multiplicative Decomposition of Baseline Signal")

