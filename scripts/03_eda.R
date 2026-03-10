install.packages("corrplot")

library(readr)
library(dplyr)
library(ggplot2)
library(corrplot)
library(tidyr)

data <- read_csv("data/final_crypto_macro_dataset.csv")

head(data)
str(data)
summary(data)

#Bitcoin Price Trend
btc_plot <- ggplot(data, aes(x=date, y=BTC_price)) +
  geom_line(color="orange") +
  labs(
    title="Bitcoin Price Trend",
    x="Date",
    y="BTC Price (USD)"
  ) +
  theme_minimal()

btc_plot

ggsave("outputs/btc_price_trend.png", btc_plot)


#Ethereum Price Trend
eth_plot <- ggplot(data, aes(x=date, y=ETH_price)) +
  geom_line(color="blue") +
  labs(
    title="Ethereum Price Trend",
    x="Date",
    y="ETH Price (USD)"
  ) +
  theme_minimal()
eth_plot


ggsave("outputs/eth_price_trend.png", eth_plot)

#Solana Price Trend

sol_plot <- ggplot(data, aes(x=date, y=SOL_price)) +
  geom_line(color="purple") +
  labs(
    title="Solana Price Trend",
    x="Date",
    y="SOL Price (USD)"
  ) +
  theme_minimal()
sol_plot

ggsave("outputs/sol_price_trend.png", sol_plot)

#Inflation Trend
cpi_plot <- ggplot(data, aes(x=date, y=CPI)) +
  geom_line(color="red") +
  labs(
    title="Inflation (CPI) Trend",
    x="Date",
    y="CPI"
  ) +
  theme_minimal()
cpi_plot

ggsave("outputs/inflation_trend.png", cpi_plot)

#Crypto vs Inflation Visualization
inflation_crypto <- ggplot(data, aes(x=date)) +
  geom_line(aes(y=BTC_price, color="Bitcoin")) +
  geom_line(aes(y=ETH_price, color="Ethereum")) +
  geom_line(aes(y=SOL_price, color="Solana")) +
  labs(
    title="Crypto Prices Over Time",
    x="Date",
    y="Price"
  ) +
  theme_minimal()
inflation_crypto

ggsave("outputs/crypto_price_comparison.png", inflation_crypto)

#Correlation Analysis
numeric_data <- data %>%
  select(
    BTC_price,
    ETH_price,
    SOL_price,
    BTC_volume,
    ETH_volume,
    SOL_volume,
    CPI,
    Interest_rate
  )
cor_matrix <- cor(numeric_data, use="complete.obs")

corrplot(cor_matrix,
         method="color",
         type="upper",
         tl.col="black",
         tl.cex=0.8)

png("outputs/correlation_heatmap.png")

corrplot(cor_matrix,
         method="color",
         type="upper",
         tl.col="black")

dev.off()


#Crypto Volatility
data <- data %>%
  mutate(
    BTC_return = log(BTC_price / lag(BTC_price)),
    ETH_return = log(ETH_price / lag(ETH_price)),
    SOL_return = log(SOL_price / lag(SOL_price))
  )

volatility_plot <- ggplot(data, aes(x=date, y=BTC_return)) +
  geom_line(color="darkred") +
  labs(
    title="Bitcoin Volatility",
    x="Date",
    y="Log Returns"
  ) +
  theme_minimal()
volatility_plot

ggsave("outputs/btc_volatility.png", volatility_plot)

#Distribution of Returns
ggplot(data, aes(x=BTC_return)) +
  geom_histogram(bins=50, fill="orange") +
  labs(
    title="Distribution of Bitcoin Returns",
    x="Return",
    y="Frequency"
  ) +
  theme_minimal()

ggsave("outputs/distribution_of_bitcoin_returns.png")

install.packages("zoo")
library(zoo)
data$CPI <- as.numeric(data$CPI)

data$rolling_corr_btc <- zoo::rollapply(
  data[,c("BTC_price","CPI")],
  width = 30,
  FUN = function(x) cor(x[,1], x[,2], use="complete.obs"),
  by.column = FALSE,
  fill = NA,
  align = "right"
)

rolling_plot <- ggplot(data, aes(x=date, y=rolling_corr_btc)) +
  geom_line(color="darkgreen") +
  labs(
    title="Rolling Correlation Between Bitcoin Price and Inflation",
    x="Date",
    y="Correlation"
  ) +
  theme_minimal()

rolling_plot
ggsave("outputs/rolling_correlation_btc_inflation.png", rolling_plot)
