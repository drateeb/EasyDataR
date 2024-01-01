#' build_time_series
#'
#' @param series
#'
#' @return A time series saved in object time_series for further use
#' @export
#'
#' @examples
#'
#' First, this command can download time-series of any frequency from Easydata of
#' the SBP. You just need to provide the object you saved using the download_series
#' function. Note: It is important to make sure that the series you have downloaded
#' does not have missing rows.
#'
#' Considering Weighted-average overnight repo rate downloaded as WAORR.
#'
#' This function can be used as:
#'
#' build_time_series(WAORR)
#'
#' The output will be a series called "time-series" to be used in subsequent analysis.
#'
build_time_series <- function(series) {
  series$Date <- lubridate::ymd(series$Observation.Date)  # Convert to Date type if not already

  # Sort the dataset by the 'Date' column
  sorted_date_data <- series[order(series$Date), ]

  # Create time-series object
  series <- xts::xts(sorted_date_data$Observation.Value, order.by = sorted_date_data$Date)

  # Set column names
  colnames(series) <- c("Value")
  assign("time_series", series, envir = .GlobalEnv)
  # Return the time series directly
  return(series)

}
