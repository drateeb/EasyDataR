#' Obtain custom information on a series
#'
#' @param Series_ID - Enter the ID of the variable of interest
#'                    Input: Provide a string
#'
#' @param Information - Enter number 1 to 10 to retrieve information on the following:
#'
#' 1. Reference Dataset Name
#' 2. Series Short Name
#' 3. Series Name
#' 4. Series Description
#' 5. Data Frequency
#' 6. Unit
#' 7. Variable Type
#' 8. Available Since
#' 9. Available Upto
#' 10. Last Refresh Date
#'
#' Input: All the above have to be entered as integers
#'
#' Note: You need to have Easydata_key set before you can use this function
#'
#' @return
#' @export
#'
#' @examples
#'
#' They Easydata_key must be provided already by:
#'
#' Easydata_key<-"C20D3D24160CE5693F56AA9846ABB2C438D8B112"
#'
#' To obtain information on Available Since for Weighted-average Overnight Repo Rate, Enter:
#'
#' get_info_on_series("TS_GP_IR_REPOMR_D.ORR",8)
#'
get_info_on_series <-
  function(Series_ID,Information){
    print(jsonlite::fromJSON(paste0("http://easydata.sbp.org.pk/api/v1/series/",Series_ID,"/meta?api_key=",Easydata_key,""))[[2]][[Information]])
  }
