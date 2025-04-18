print('Hello World')

#|    | Groups   | Week 0                             | Week 1                             | Week 4                         | Week 5   | Week 6              | Week 7   | Week 8            |																		
#+====+==========+====================================+====================================+================================+==========+=====================+==========+===================+																		
#|  0 | VNS      | SEQ-3 (excluded), SEQ-4 (excluded) |                                    | REG-1 (excluded), REG-2, REG-3 | REG-4    | REG-6, REG-7, REG-8 | REG-9    | REG-12, REG-14    |																		
#+----+----------+------------------------------------+------------------------------------+--------------------------------+----------+---------------------+----------+-------------------+																		
#|  1 | Sham     |                                    | SEQ-5, SEQ-6                       |                                |          | REG-5               | REG-10   | REG-11 (excluded) |																		



from datetime import datetime
import pandas as pd
from tabulate import tabulate
import matplotlib.pyplot as plt
from pandas.plotting import table as pd_table

# Define raw data
data = [
    {"Name": "SEQ-3, SEQ-4", "Group": 1, "Surgery Date": "2/27/2025", "Notes": "Both Excluded"},
    {"Name": "SEQ-5", "Group": 0, "Surgery Date": "3/3/2025", "Notes": ""},
    {"Name": "SEQ-6", "Group": 0, "Surgery Date": "3/3/2025", "Notes": ""},
    {"Name": "REG-1", "Group": 1, "Surgery Date": "3/24/2025", "Notes": "Excluded"},
    {"Name": "REG-2", "Group": 1, "Surgery Date": "3/24/2025", "Notes": ""},
    {"Name": "REG-3", "Group": 1, "Surgery Date": "3/25/2025", "Notes": ""},
    {"Name": "REG-4", "Group": 1, "Surgery Date": "3/31/2025", "Notes": ""},
    {"Name": "REG-5", "Group": 0, "Surgery Date": "4/8/2025", "Notes": ""},
    {"Name": "REG-6", "Group": 1, "Surgery Date": "4/8/2025", "Notes": ""},
    {"Name": "REG-7", "Group": 1, "Surgery Date": "4/9/2025", "Notes": ""},
    {"Name": "REG-8", "Group": 1, "Surgery Date": "4/9/2025", "Notes": ""},
    {"Name": "REG-9", "Group": 1, "Surgery Date": "4/14/2025", "Notes": ""},
    {"Name": "REG-10", "Group": 0, "Surgery Date": "4/14/2025", "Notes": ""},
    {"Name": "REG-11", "Group": 0, "Surgery Date": "4/17/2025", "Notes": "Excluded"},
    {"Name": "REG-12", "Group": 1, "Surgery Date": "4/17/2025", "Notes": ""},
    {"Name": "REG-14", "Group": 1, "Surgery Date": "4/17/2025", "Notes": ""},
]

# Convert to DataFrame
df = pd.DataFrame(data)
df["Surgery Date"] = pd.to_datetime(df["Surgery Date"])
start_date = datetime.strptime("2/24/2025", "%m/%d/%Y")

# Assign weeks, with 2/27/2025 as Week 0
df["Week"] = ((df["Surgery Date"] - start_date).dt.days // 7)

# Annotate excluded animals
df["Name Annotated"] = df.apply(
    lambda row: f'{row["Name"]} (Both Excluded)' if row["Notes"] == "Both Excluded" 
    else (f'{row["Name"]} (Excluded)' if row["Notes"] == "Excluded" else row["Name"]), 
    axis=1
)


# Define the maximum week range to include all data
max_week = df["Week"].max()
weeks = [w for w in range(0, max_week + 1) if w not in [2, 3]]  # Skip Week 2 and Week 3

# Create the structured table
grouped_data = {"Groups": ["VNS", "Sham"]}
for week in weeks:
    vns = df[(df["Group"] == 1) & (df["Week"] == week)]["Name Annotated"].tolist()
    sham = df[(df["Group"] == 0) & (df["Week"] == week)]["Name Annotated"].tolist()
    grouped_data[f"Week {week}"] = [", ".join(vns), ", ".join(sham)]

# Build and print tabulated table
df_table_1 = pd.DataFrame(grouped_data)
table_text = tabulate(df_table_1, headers='keys', tablefmt='grid')
print(table_text)

# Create and save matplotlib version of the table
fig, ax = plt.subplots(figsize=(max(12, len(grouped_data)*2), 3))
ax.axis('off')
tbl = pd_table(ax, df_table_1, loc='center', cellLoc='center')
tbl.auto_set_font_size(False)
tbl.set_fontsize(10)
tbl.scale(1.2, 2)

# Save as image for viewing/downloading
# plt.savefig("animal_weekly_timeline_table_excluding_weeks_2_3.png", bbox_inches='tight')
plt.show()
