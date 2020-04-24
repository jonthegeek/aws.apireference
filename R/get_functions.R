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

#' Check a Package for Missing Functions
#'
#' Check an aws.* package for missing functions and unmatched functions.
#'
#' @param api The api to check.
#'
#' @return A list with components \code{missing_functions} (functions that
#'   should be present based on the actions in the API reference),
#'   \code{unmatched_functions} (functions that are exported by the package but
#'   not matched in the API reference), and \code{matched_functions} (functions
#'   that are just right).
#' @export
#'
#' @examples
#' \dontrun{
#' # Requires aws.lambda package installed.
#' check_package_functions("lambda")
#' }
check_package_functions <- function(api = c("ec2", "lambda")) {
  api <- match.arg(api)

  # Confirm that they have the required package installed. Ideally this error
  # message could be a little more informative, but this will do for now.
  target_package <- paste0("aws.", api)
  requireNamespace(target_package)

  actions <- get_actions(api)
  expected_functions <- get_expected_functions(actions)
  actual_functions <- getNamespaceExports(target_package)
  return(
    list(
      missing_functions = setdiff(expected_functions, actual_functions),
      unmatched_functions = setdiff(actual_functions, expected_functions),
      matched_functions = intersect(actual_functions, expected_functions)
    )
  )
}
