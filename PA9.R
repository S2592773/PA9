# PA9
# Andrew Zachman
# 2026.11.08
# mtcars dataset, model of fuel efficiency, mpg/weight.

# Load dataset
data("mtcars")

# Plot the data
plot(mtcars$wt, mtcars$mpg,
     main = "Vehicle Fuel Efficiency vs. Weight",
     xlab = "Weight(thousands of lbs)",
     ylab = "Miles Per Gallon(MPG)",
     pch = 19,
     col = "blue")

# Linear regression model
model <- lm(mpg ~ wt, data = mtcars)

# Fitted regression line
abline(model,
       col = "red",
       lwd = 2)
# Interpret the slope
summary_stats <- summary(model)
print(summary_stats)

confidence_intervals <-confint(model)
print(confidence_intervals)

# Estimated slop : -5.34
# A decrease of 5.34 mpg for every additional 1000 lbs vehicle weight

# Predict MPG for given vehicle weight
new_data <- data.frame(wt = 6)
mpg_prediction <- predict(model,
                          newdata = new_data,
                          interval = "prediction",
                          level = 0.95)

# Print the prediction
cat("Prediction for a 6,000 lbs Vehichl")
print(mpg_prediction)

# Weight of 6,000 lbs (wt = 6) within range of mtcars dataset and 
# ranges between 1.5 and 5.4.
# It is within the observed range and can be confident 
# in the accuracy of this prediction.
