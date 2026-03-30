install.packages("forecast")
install.packages("Metrics")

library(readr)
library(dplyr)
library(ggplot2)
library(forecast)
library(Metrics)

data <- read_csv("data/final_crypto_macro_dataset.csv")

head(data)
str(data)

#Multiple Linear Regression

btc_model <- lm(BTC_price ~ CPI + Interest_rate, data = data)

summary(btc_model)

#Predictions
data$btc_predicted <- predict(btc_model, data)


#Model Evaluation (RMSE)
btc_rmse <- rmse(data$BTC_price, data$btc_predicted)

print(btc_rmse)

prediction_plot <- ggplot(data, aes(x = date)) +
  geom_line(aes(y = BTC_price, color = "Actual")) +
  geom_line(aes(y = btc_predicted, color = "Predicted")) +
  labs(
    title = "Bitcoin Price: Actual vs Predicted",
    x = "Date",
    y = "Price"
  ) +
  theme_minimal()

print(prediction_plot)

ggsave("outputs/btc_prediction_vs_actual.png", prediction_plot)

#Time Series Forecasting (ARIMA)
btc_ts <- ts(data$BTC_price)
arima_model <- auto.arima(btc_ts)

summary(arima_model)

btc_forecast <- forecast(arima_model, h = 30)

plot(btc_forecast)

png("outputs/btc_forecast.png")

plot(btc_forecast)

dev.off()