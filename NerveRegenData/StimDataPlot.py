import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime
from tabulate import tabulate
from pandas.plotting import table as pd_table

# Set Seaborn style
sns.set(style="whitegrid")

# ------------------ Stimulation Data ------------------
stimulation_data = {
    "REG-2": [
        ("3/25/2025", 7.4), ("3/26/2025", 4), ("3/27/2025", 4.4), ("3/28/2025", 4.4),
        ("3/31/2025", 4.6), ("4/1/2025", 5), ("4/2/2025", 5), ("4/3/2025", 6.8),
        ("4/7/2025", 8.2), ("4/8/2025", 4.4), ("4/9/2025", 4.4), ("4/10/2025", 8),
        ("4/11/2025", 13), ("4/14/2025", 14.4), ("4/15/2025", 12.4), ("4/16/2025", 25),
        ("4/18/2025", 15.8)
    ],
    "REG-3": [
        ("3/25/2025", 7.4), ("3/26/2025", 4), ("3/27/2025", 4.4), ("3/28/2025", 4.4),
        ("3/31/2025", 4.6), ("4/1/2025", 5), ("4/2/2025", 5), ("4/3/2025", 6.8),
        ("4/7/2025", 8.2), ("4/8/2025", 4.4), ("4/9/2025", 4.4), ("4/10/2025", 8),
        ("4/11/2025", 3.4), ("4/14/2025", 8.2), ("4/16/2025", 7.8), ("4/18/2025", 7.6)
    ],
    "REG-4": [
        ("3/31/2025", 5.2), ("4/1/2025", 4.4), ("4/2/2025", 4.2), ("4/3/2025", 5.2),
        ("4/7/2025", 8.2), ("4/8/2025", 4.4), ("4/9/2025", 4.4), ("4/10/2025", 10.8),
        ("4/11/2025", 8.2), ("4/14/2025", 5.2), ("4/16/2025", 4.4), ("4/17/2025", 3.2),
        ("4/18/2025", 5.4)
    ],
    "REG-6": [
        ("4/8/2025", 6.8), ("4/9/2025", 6), ("4/10/2025", 4.4), ("4/11/2025", 1.3),
        ("4/14/2025", 1.2), ("4/16/2025", 6), ("4/17/2025", 6.2), ("4/18/2025", 6.2)
    ],
    "REG-7": [
        ("4/9/2025", 6), ("4/10/2025", 4.4), ("4/11/2025", 3.2), ("4/14/2025", 4.8),
        ("4/16/2025", 4.4), ("4/17/2025", 1.4), ("4/18/2025", 6.6)
    ],
    "REG-8": [
        ("4/9/2025", 6), ("4/10/2025", 3.8), ("4/11/2025", 4), ("4/14/2025", 2.2),
        ("4/16/2025", 1.2), ("4/17/2025", 4.2), ("4/18/2025", 15.8)
    ],
    "REG-9": [
        ("4/14/2025", 1.2), ("4/16/2025", 1.2), ("4/17/2025", 4.2), ("4/18/2025", 4.2)
    ],
    "REG-12": [("4/18/2025", 7.4)],
    "REG-14": [("4/18/2025", 5.4)],
}

# Convert to DataFrame
all_data = []
for rat, stim in stimulation_data.items():
    for date_str, voltage in stim:
        all_data.append({
            "Rat": rat,
            "Date": pd.to_datetime(date_str),
            "Voltage": voltage
        })
df = pd.DataFrame(all_data)

# ------------------ Plot: Stimulation Over Time ------------------
plt.figure(figsize=(12, 6))
sns.lineplot(data=df, x="Date", y="Voltage", hue="Rat", palette="tab10")
plt.title("Stimulation Voltage Over Time")
plt.ylabel("Peak-to-Peak Voltage (V)")
plt.xlabel("Date")
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
plt.tight_layout()
plt.show()

# ------------------ Plot: Normalized Day ------------------
df["StartDate"] = df.groupby("Rat")["Date"].transform("min")
df["Day"] = (df["Date"] - df["StartDate"]).dt.days + 1

plt.figure(figsize=(12, 6))
sns.lineplot(data=df, x="Day", y="Voltage", hue="Rat", marker="o", palette="tab10")
plt.title("Stimulation Voltage vs Normalized Day (Day 1 = First Stim for Each Rat)")
plt.ylabel("Peak-to-Peak Voltage (V)")
plt.xlabel("Day in Protocol")
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
plt.tight_layout()
plt.show()

# ------------------ Table: Participation Duration ------------------
# Print table using tabulate
participation_days = df.groupby("Rat")["Date"].nunique().reset_index()
participation_days.columns = ["Subject", "Days with Data"]



print("\nDays of Participation Per Subject:\n")
table_text = tabulate(participation_days, headers='keys', tablefmt='grid')
print(table_text)

fig, ax = plt.subplots(figsize=(10, len(participation_days)*0.6 + 1))
ax.axis('off')
tbl = pd_table(ax, participation_days, loc='center', cellLoc='center')
tbl.auto_set_font_size(False)
tbl.set_fontsize(10)
tbl.scale(1.2, 1.5)
plt.tight_layout()
plt.show()

# ------------------ Behavioral Performance Data ------------------
behavioral_data = {
    "SEQ-3": [597, 516, 446, 682, 534],
    "SEQ-4": [522, 630, 582, 375, 535],
    "SEQ-5": [526, 632, 520, 582, 595],
    "SEQ-6": [668, 494, 621, 624, 616],
    "REG-1": [504, 554, 494, 557, 557],
    "REG-2": [557, 417, 457, 575, 509],
    "REG-3": [489, 583, 676, 619, 621],
    "REG-4": [547, 361, 637, 529, 610],
    "REG-5": [449, 522, 517, 633, 692],
    "REG-6": [575, 672, 595, 735, 571],
    "REG-7": [467, 727, 415, 495, 690],
    "REG-8": [588, 515, 642, 644, 624],
    "REG-9": [562, 442, 574, 605, 630],
    "REG-10": [603, 615, 711, 692, 723],
    "REG-11": [719, 696, 638, 556, 691],
    "REG-12": [580, 636, 703, 694, 482]
}

# Convert behavioral data to long-format DataFrame
behavioral_long = []
for rat, scores in behavioral_data.items():
    for trial, value in enumerate(scores, 1):
        behavioral_long.append({
            "Rat": rat,
            "Trial": trial,
            "Score": value
        })
df_behavior = pd.DataFrame(behavioral_long)

# ------------------ Plot: Behavioral Performance Boxplot ------------------
plt.figure(figsize=(14, 6))
sns.boxplot(data=df_behavior, x="Rat", y="Score", palette="Set3")
sns.stripplot(data=df_behavior, x="Rat", y="Score", color="black", size=4, jitter=0.15)
plt.title("Behavioral Performance Across Subjects - Grip Strength Baseline")
plt.ylabel("Performance Score in Grams Force (5 Trials)")
plt.xlabel("Subject")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
