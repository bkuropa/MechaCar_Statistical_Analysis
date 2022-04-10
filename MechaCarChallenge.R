# Import Libraries
library(ggplot2)
library(dplyr)
library(tidyverse)

# Import necessary csv files
car_data <- read.csv("Resources/MechaCar_mpg.csv")
head(car_data)

coil_data <- read.csv("Resources/Suspension_Coil.csv")
head(coil_data)

# Overall Multi-linear regression model
lmModel <- lm(formula = mpg ~ ., data = car_data)
summary(lmModel)
# No ground_clearance
lmModel2 <- lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD, data = car_data)
summary(lmModel2)
# No vehicle_length
lmModel3 <- lm(formula = mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD, data = car_data)
summary(lmModel3)
