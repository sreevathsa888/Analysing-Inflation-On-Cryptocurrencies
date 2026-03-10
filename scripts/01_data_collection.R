
install.packages(c("httr","jsonlite","dplyr","tidyverse"))

library(httr)
library(jsonlite)
library(dplyr)
library(tidyverse)

getwd()


library(readr)
library(dplyr)



btc <- read_csv("data/btc-usd-max.csv")
eth <- read_csv("data/eth-usd-max.csv")
sol <- read_csv("data/sol-usd-max.csv")



cpi <- read_csv("data/cpi_data.csv")
interest_rate <- read_csv("data/interest_rate.csv")



print("Bitcoin dataset preview")
head(btc)

print("Ethereum dataset preview")
head(eth)

print("Solana dataset preview")
head(sol)

print("CPI dataset preview")
head(cpi)

print("Interest rate dataset preview")
head(interest_rate)



print("Structure of datasets")

str(btc)
str(eth)
str(sol)
str(cpi)
str(interest_rate)


print("Dataset dimensions")

dim(btc)
dim(eth)
dim(sol)
dim(cpi)
dim(interest_rate)

print("Data collection completed successfully")




