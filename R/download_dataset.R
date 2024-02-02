
#' Download Dataset
#'
#' @param series_ids - A vector containing series_keys for variables of interest
#' @param start_date - Enter the start date for the intended series. If both start_date and end_date are not specified, the API will return only the most recent observation.
#' @param end_date - Enter the end date for the intended series. If both start_date and end_date are not specified, the API will return only the most recent observation.
#' @param file_type - Default is json, but csv is also available, whereby EasyData only provides a csv file
#'
#' @return
#' @export
#'
#' @examples
#
#' ### Suppose you want to download 4 variables in a dataset starting 2016-01-01
#'
#' This function assumes that the user has already verified the Easydata API
#' key and it is present in object "Easydata_key". It also assumes that the
#' researcher's variables are at the same frequency, that is, daily, weekly,
#' monthly, quarterly or annually.
#'
#' series_ids <- c("TS_GP_BOP_WR_M.WR0340","TS_GP_ER_FAERPKR_M.E00220","TS_GP_BOP_BPM6SUM_M.P00030", "TS_GP_BOP_BPM6SUM_M.P00070")
#'
#' start_date <- "2016-01-01"
#'
#' end_date <- "2023-12-31"
#'
#' download_dataset(series_ids,"2016-01-01","2023-12-31", "csv")
download_dataset <- function(series_ids, start_date, end_date, file_type = "csv") {
  series_data <- list()

  # Download series data
  for (i in seq_along(series_ids)) {
    series_id <- series_ids[i]
    series_url <- paste0("https://easydata.sbp.org.pk/api/v1/series/", series_id, "/data?api_key=",Easydata_key,"&start_date=", start_date, "&end_date=", end_date, "&format=", file_type)

    tryCatch({
      series_data[[i]] <- read.csv(series_url, stringsAsFactors = FALSE)
    }, error = function(e) {
      cat("Error downloading data for Series ID:", series_id, "\n")
      series_data[[i]] <- NULL
    })
  }

  # Check if any series data was downloaded
  if (length(series_data) > 0) {
    # Combine the data frames into one
    combined_data <- do.call(rbind, series_data)

    # Extract Observation Date and Observation Value columns
    data_frame <- data.frame(
      Observation_Date = as.Date(combined_data$Observation.Date),
      Observation_Value = as.numeric(combined_data$Observation.Value)
    )

    # Create a data frame with unique dates from all series
    unique_dates <- sort(unique(data_frame$Observation_Date))
    combined_xts <- xts::xts(matrix(NA, nrow = length(unique_dates), ncol = length(series_data)),
                             order.by = unique_dates)

    # Fill the xts object with data from each series
    for (i in seq_along(series_data)) {
      obs_values <- as.numeric(series_data[[i]]$Observation.Value)
      obs_dates <- as.Date(series_data[[i]]$Observation.Date)
      combined_xts[, i] <- obs_values[match(unique_dates, obs_dates)]
    }

    colnames(combined_xts) <- series_ids

    return(combined_xts)
  } else {
    return(NULL)
  }
}


