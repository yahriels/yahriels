import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os

# === Load the data ===
# Change filename below to match your data file (either .csv or .xlsx)
filename = "BehaviorGripStrengthData.xlsx"



# Auto-detect file type
if filename.endswith(".xlsx"):
    df = pd.read_excel(filename)
elif filename.endswith(".csv"):
    df = pd.read_csv(filename)
else:
    raise ValueError("File must be .csv or .xlsx")

# === Extract the relevant columns ===
weeks = df["Week"].values
vns_means = df["vns_means"].values
vns_stds = df["vns_stds"].values
rehab_means = df["rehab_means"].values
rehab_stds = df["rehab_stds"].values

# === Filter out zero mean values (assumed to be "no data") ===
vns_mask = vns_means != 0
rehab_mask = rehab_means != 0

# === Plot ===
plt.figure(figsize=(7, 4), dpi=120)

plt.errorbar(
    weeks[vns_mask], vns_means[vns_mask], yerr=vns_stds[vns_mask],
    fmt='-o', color='red', ecolor='lightcoral', capsize=3,
    label='VNS+Rehab (n=9)'
)

plt.errorbar(
    weeks[rehab_mask], rehab_means[rehab_mask], yerr=rehab_stds[rehab_mask],
    fmt='-o', color='blue', ecolor='lightskyblue', capsize=3,
    label='Rehab (n=8)'
)

plt.axvspan(14, 22, color='yellow', alpha=0.3)
plt.text(18, 620, 'n.s.', ha='center', va='bottom', fontsize=10)

plt.xlabel('Weeks After Nerve Injury')
plt.ylabel('Grip Strength')
plt.title('Example Grip Strength')
plt.xlim([-5, 32])
plt.legend(loc='lower right')
plt.tight_layout()
plt.show()