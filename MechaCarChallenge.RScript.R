# Program Name: MechaCarChallenge
# Program Author: C Croghan
# dependency: tidyverse, dplyr
# Input: Resources/MechaCar_mpg.csv, Resources/Suspension_Coil.csv
# output: Tables and Plots

# Part 1:Linear Regression to Predict MPG
# load depend
library(dplyr)

# load csv file 

MechaCar_mpg <-read.csv("Resources/MechaCar_mpg.csv")


## Multiple Linear regression predicting mpg.
## vehicle_length	vehicle_weight	spoiler_angle	ground_clearance	AWD
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))

# Part 2 Create Visualizations for the Trip Analysis

coils <-read.csv("Resources/Suspension_Coil.csv")
head(coils)

total_summary <- summarize(coils,mean = mean(PSI), median= median(PSI), var = var(PSI), sd =sd(PSI))

print(total_summary)

lot_summary <- coils %>% group_by(Manufacturing_Lot) %>%  summarize(mean = mean(PSI), median= median(PSI), var = var(PSI), sd =sd(PSI))

print(lot_summary)

# Part 3: T-Tests on Suspension Coils

lots <- list("Lot1", "Lot2", "Lot3")

for (l in lots) {
  lot <- coils[coils$Manufacturing_Lot == l,]
  print(l)
  print(t.test(lot$PSI,mu=1500))
}

## End of File
