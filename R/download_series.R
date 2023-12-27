#' Download data csv file from EasyData
#'
#' @param Series_ID - Enter the Series ID from the EasyData platform
#' @param Easydata_Key - Enter the "Easydata_key" already provided for the session
#' @param Start_date - Enter the start date for the intended series. If both start_date and end_date are not specified, the API will return only the most recent observation.
#' @param End_date - Enter the end date for the intended series. If both start_date and end_date are not specified, the API will return only the most recent observation.
#' @param File_type - Default is json, but csv is also available, whereby EasyData only provides a csv file
#'
#' @return A csv file containing information on Series, Time Periods and Values of a variable of interest.
#' @export
#'
#' @examples
#'
#' Setup the EasyData Key
#'
#' Easydata_key<-"C20D3D24160CE5693F56AA9846ABB2C438D8B112"
#'
#' Read in Weighted-average Overnight Repo Rate
#'
#' download_series("TS_GP_IR_REPOMR_D.ORR",Easydata_key, "2015-05-25" ,"2023-12-20", "csv")
#'
download_series <-
  function(Series_ID,Easydata_Key,Start_date = NULL,End_date = NULL,File_type = NULL) {
    series<-paste0("https://easydata.sbp.org.pk/api/v1/series/",Series_ID,"/data?api_key=",Easydata_key,"&start_date=",Start_date,"&end_date=",End_date,"&format=",File_type,"")
    series<-read.csv(series, stringsAsFactors =  F)
    return(series)
  }

