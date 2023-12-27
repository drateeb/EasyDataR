#' Retrieve Easydata API Key if already entered
#'
#' @return The Easydata_key for the session if setup already; otherwise returns error message
#' @export
#'
#' @examples
#'
#' get_Easydata_key()
#'
get_Easydata_key <-
  function() {
    # Check if easy_key is already set
    if (exists("Easydata_key", envir = .GlobalEnv) && !is.null(Easydata_key)) {
      return(Easydata_key)
    } else {
      return("No key is set for the current session.")
    }
  }
