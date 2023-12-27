#' Check to see if the current R session has an Easydata key setup
#'
#' @return TRUE if the key is already read in as Easydata_key for the current session. Otherwise returns error message.
#' @export
#'
#' @examples
#'
#' session_has_Easydata_key()
#'
session_has_Easydata_key <-
  function() {
    # Check if Easydata_key is already set
    return(exists("Easydata_key", envir = .GlobalEnv) && !is.null(Easydata_key))
  }
