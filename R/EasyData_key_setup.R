#' Entering in your EasyData API key for the current session
#'
#' @param API_KEY - Provide your EasyData API key here
#'
#' @return API key entered
#' @export
#'
#' @examples
# Read in your EasyData API key in an object called API_KEY
#'
#'API_KEY <- "C11D3D29161CE5693F55AA9846ABB2C438D8B112"
#'
# Supply API_KEY to the function
#'
#'EasyData_key_setup(API_KEY)
#'
# Access the stored EasyData API key in object Easydata_key
#'print(Easydata_key)
#'
EasyData_key_setup <- function(API_KEY) {
  # Check if the input is a string
  if (!is.character(API_KEY)) {
    stop("The function only accepts API key as a string.")
  }

  # Check if the API key has exactly 40 characters
  if (nchar(API_KEY) == 40) {
    Easydata_key <<- API_KEY  # Store API key in the global environment
    return("API key verified for the current R session")
  } else if (nchar(API_KEY) < 40) {
    return("The API key entered has less than 40 characters. Check your EasyData Key again.")
  } else {
    return("The API key entered has more than 40 characters. Check again EasyData Key again.")
  }
}
