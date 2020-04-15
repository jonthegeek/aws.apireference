#' Get Expected Function Names
#'
#' Convert action names (CamelCase) to function names (snake_case).
#'
#' @param actions A character vector of action names in CamelCase, as returned
#'   by \code{\link{get_actions}}.
#'
#' @return A character vector of the same length as \code{actions}.
#' @export
#'
#' @examples
#' get_expected_functions(
#'   c("This", "ThatOne", "AnotherActionName")
#' )
get_expected_functions <- function(actions) {
  return(
    tolower(gsub("^_", "", gsub("([A-Z])", "_\\1", actions)))
  )
}