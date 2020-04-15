#' Get API Actions
#'
#' Get the names of all actions for a given AWS API.
#'
#' @param api The name of the API for which data should be gathered.
#'
#' @return A character vector of actions
#' @export
#'
#' @examples
#' get_actions("ec2")
get_actions <- function(api = c("ec2", "lambda")) {
  api <- match.arg(api)
  reference_url <- api_reference_urls[[api]]
  reference_html <- xml2::read_html(reference_url)
  top_menus <- rvest::html_nodes(reference_html, ".listitem a")

  return(
    rvest::html_text(top_menus)
  )
}