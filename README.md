# EasyDataR
EasyDataR is a unofficial R package to read in data from EasyData platform of the State Bank of Pakistan

# Details about EasyData of the State Bank of Pakistan
EasyData platform of the State Bank of Pakistan is the largest repository of Macroeconomic time-series. It has more than 2 million observations covering more than 11,000 time-series related to economy of Pakistan. 

# About the package
This package is intended to identify a session with EasyData API key, obtain information about a particular series of interest, and download a series of interest to R for further analysis. Although, I could have added reading in the series as time-series object in R and conduct basic analysis such as:

1. Plotting the time-series
2. Unit-Root tests
3. Seasonality tests
4. Cointegration tests and Cointegrated vector autoregressive model
5. Autoregressive and Vector Autoregressive models
6. Forecasting using Machine Learning and Dynamic Factor models (Rolling and Fixed Window Forecast)
7. In and Out-of-Sample Forecasts

But this package is not intended to conduct these analysis but I am programming another one, which will be able to perform all of these operations. Stay Tuned!

# How to install and use
The following provides detailed guide on how to install the EasyDataR package through Github and use functions within the EasyDataR

library(devtools)

devtools::install_github(("drateeb/EasyDataR"))

library(EasyDataR)

# Verifying EasyData API Key
EasyData_key_setup("C10D3D29160CE5693F56AA9846ABB2C423D8B123") <- type in/paste your EasyData API Key! 

# Finding if the EasyData API Key has been verified

session_has_Easydata_key()

# Getting the entered key for further use

get_Easydata_key()

# using the API key to get information on Weighted-average Overnight Repo Rate

get_info_on_series("TS_GP_IR_REPOMR_D.ORR",8)

# get data of the Weighted-average Overnight Repo Rate

WAORR<- download_series("TS_GP_IR_REPOMR_D.ORR",Easydata_key, "2015-05-25" ,"2023-12-20", "csv")

# taking a look at the head of the data

head(WAORR)

# Tranforming WAORR data to a usable time-series

build_time_series(WAORR)

# Plotting the time-series saved through build_time_series in object called "time_series"

plot_time_series(time_series)
