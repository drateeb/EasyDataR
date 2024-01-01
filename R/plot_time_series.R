#' plot_time_series
#'
#' @param time_series
#'
#' @return a graph of the time-series using ggplot2 library
#' @export
#'
#' @examples
#'
#' You need to pass time_series built through the function build_time_series to
#' this function and it will plot the time-series.
#'
#' plot_time_series(time_series)
#'
plot_time_series<-function(time_series) {
  #to_data_frame <- data.frame(Date = index(time_series) , Value = coredata(Value))
  to_data_frame <- zoo::fortify.zoo(time_series)
  # Plot using ggplot2

  ggplot2::ggplot(to_data_frame, ggplot2::aes(x = Index, y = Value)) +
    ggplot2::geom_line() +
    ggplot2::labs(title = "Time Series Plot", x = "Observation Date", y = "Observation Value")
}
