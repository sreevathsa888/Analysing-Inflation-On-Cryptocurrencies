install.packages("lubridate")

library(readr)
library(dplyr)
library(lubridate)

btc <- read_csv("data/btc-usd-max.csv")
eth <- read_csv("data/eth-usd-max.csv")
sol <- read_csv("data/sol-usd-max.csv")

cpi <- read_csv("data/cpi_data.csv")
interest <- read_csv("data/interest_rate.csv")

btc$date <- as.Date(btc$snapped_at)
eth$date <- as.Date(eth$snapped_at)
sol$date <- as.Date(sol$snapped_at)

btc <- btc %>%
  select(date, price, market_cap, total_volume)

eth <- eth %>%
  select(date, price, market_cap, total_volume)

sol <- sol %>%
  select(date, price, market_cap, total_volume)


colnames(btc) <- c("date","BTC_price","BTC_marketcap","BTC_volume")

colnames(eth) <- c("date","ETH_price","ETH_marketcap","ETH_volume")

colnames(sol) <- c("date","SOL_price","SOL_marketcap","SOL_volume")

colnames(cpi)

cpi$date <- as.Date(cpi$observation_date)

cpi <- cpi %>%
  select(date, CPIAUCSL)

colnames(cpi) <- c("date","CPI")

interest$date <- as.Date(interest$observation_date)

interest <- interest %>%
  select(date, FEDFUNDS)

colnames(interest) <- c("date","Interest_rate")


head(cpi)
head(interest)

final_data <- crypto_data %>%
  left_join(cpi, by="date") %>%
  left_join(interest, by="date")

crypto_data <- btc %>%
  inner_join(eth, by="date") %>%
  inner_join(sol, by="date")

dim(crypto_data)
head(crypto_data)

final_data <- crypto_data %>%
  left_join(cpi, by="date") %>%
  left_join(interest, by="date")

install.packages("tidyr")

library(readr)
library(dplyr)
library(lubridate)
library(tidyr)

final_data <- final_data %>%
  fill(CPI, Interest_rate, .direction = "down")

head(final_data)
dim(final_data)
summary(final_data)

write.csv(final_data,
          "data/final_crypto_macro_dataset.csv",
          row.names = FALSE)