# ------------------------
# COMP331 Final Project
# Data Mining Quality & Bias Analysis
# Author: Shubham Mali
# ------------------------

# Load dataset
adult <- read.csv("data/adult.data",
                  header = FALSE,
                  sep = ",",
                  strip.white = TRUE)

# Assign column names
names(adult) <- c(
  "age","workclass","fnlwgt","education","education_num",
  "marital_status","occupation","relationship","race","sex",
  "capital_gain","capital_loss","hours_per_week","native_country",
  "income"
)

# Convert "?" to missing
adult[adult == "?"] <- NA

# ------------------------
# Missing Value Analysis
# ------------------------
missing_counts <- sapply(adult, function(x) sum(is.na(x)))
missing_percent <- round(missing_counts / nrow(adult) * 100, 2)
missing_summary <- data.frame(
  Variable = names(missing_counts),
  Missing_Count = missing_counts,
  Missing_Percent = missing_percent
)

dir.create("results", showWarnings = FALSE)

write.csv(missing_summary, "results/missing_summary.csv", row.names = FALSE)

# ------------------------
# Class Distribution
# ------------------------
income_dist <- round(prop.table(table(adult$income)) * 100, 2)
write.csv(income_dist, "results/income_distribution.csv")

# ------------------------
# Income by Gender
# ------------------------
gender_income <- round(prop.table(table(adult$sex, adult$income), 1) * 100, 2)
write.csv(gender_income, "results/income_by_gender.csv")

# ------------------------
# Income by Race
# ------------------------
race_income <- round(prop.table(table(adult$race, adult$income), 1) * 100, 2)
write.csv(race_income, "results/income_by_race.csv")

# Print to console
print("Missing Value Summary:")
print(missing_summary)

print("Income Distribution:")
print(income_dist)

print("Income by Gender:")
print(gender_income)

print("Income by Race:")
print(race_income)
