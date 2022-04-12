# Import Libraries
library(ggplot2)
library(dplyr)
library(tidyverse)
library(kableExtra)

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


# COIL DATA STATISTICAL ANALYSIS
# Divide Manufacturing Lots into 3 specific lots:
lot1 <- coil_data %>% filter(Manufacturing_Lot=='Lot1')
lot1
lot2 <- coil_data %>% filter(Manufacturing_Lot=='Lot2')
lot2
lot3 <- coil_data %>% filter(Manufacturing_Lot=='Lot3')
lot3
lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = format(var(PSI),digits=2), SD = format(sd(PSI),digits=2), .groups = 'keep')
lot_summary
# create a summary dataframe
full_summary <- coil_data %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = format(var(PSI),digits=2), SD = format(sd(PSI),digits=2))
full_summary
full_summary2 <- cbind(Manufacturing_Lot = 'Total', full_summary)
full_summary2

total_summary <- rbind(lot_summary, full_summary2)
total_summary


# T-tests on suspension coils

test_total <- t.test(coil_data$PSI, mu=1500)
test_total$estimate

test1 <- t.test(subset(coil_data,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
test2 <- t.test(subset(coil_data,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
test3 <- t.test(subset(coil_data,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)

# Create a merged dataframe showing stats AND t-tests in one easy reference:
total_summary2 <- cbind(total_summary, "t-value" = format(c(test1$statistic, test2$statistic, test3$statistic, test_total$statistic),digits=2),
                        "df-value" = c(test1$parameter, test2$parameter, test3$parameter, test_total$parameter),
                        "p-value" =format(c(test1$p.value, test2$p.value, test3$p.value, test_total$p.value),digits=2))
total_summary2
                                                                  
total_summary2 %>%
  kbl(caption = "<b>MechaCar Statistical Analysis</b>") %>%
  kable_styling(bootstrap_options = "striped")%>%
  row_spec(0, bold = T, angle = 0) %>%
  column_spec(1, bold = T, border_right = T) %>%
  kable_classic(full_width = T, html_font = "Cambria",bootstrap_options = "striped")


