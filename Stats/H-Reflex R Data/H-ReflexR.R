# Load required libraries
library(ggplot2)
library(forecast)
library(tseries)

# Generate time series of EMG signal data
sampling_rate <- 10000   # samples per second
duration <- 0.02         # 20 milliseconds
time <- seq(0, duration, length.out = sampling_rate * duration + 1)

# Define function to generate EMG signal based on conditioning state
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


# Generate additive and multiplicative signals
additive_signal <- generate_emg_signal("baseline", "additive")
multiplicative_signal <- generate_emg_signal("baseline", "multiplicative")

# Convert signals to time series objects
additive_ts <- ts(additive_signal, frequency = 10)
multiplicative_ts <- ts(multiplicative_signal, frequency = 10)

# Decomposition of additive time series
decomp_additive <- decompose(additive_ts, type = "additive")
plot(decomp_additive)


# Decomposition of multiplicative time series
decomp_multiplicative <- decompose(multiplicative_ts, type = "multiplicative")
plot(decomp_multiplicative)


# Plot the time series
plot_emg_signal <- function(signal, title) {
  emg_data <- data.frame(Time = time * 1000, EMG_Signal = signal)
  ggplot(emg_data, aes(x = Time, y = EMG_Signal)) +
    geom_line(color = "black") +
    labs(x = "Time (ms)", y = "Amplitude (mV)", title = title) +
    theme_minimal() +
    theme(panel.grid.major = element_line(color = "gray", linetype = "dashed"))
}

# Display each decomposition
plot_emg_signal(additive_signal, "Additive Signal")
plot_emg_signal(multiplicative_signal, "Multiplicative Signal")

