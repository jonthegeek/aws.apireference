test_that("get_expected_functions works", {
  sample_actions <- c(
    "AddLayerVersionPermission", "AddPermission", "CreateAlias",
    "CreateEventSourceMapping", "CreateFunction"
  )
  expected_expected_functions <- c(
    "add_layer_version_permission", "add_permission", "create_alias",
    "create_event_source_mapping", "create_function"
  )
  expected_functions <- get_expected_functions(sample_actions)
  expect_identical(expected_functions, expected_expected_functions)
})

test_that("check_package_functions works", {
  # I'm just putting in a set of "good enough" tests for now as I prove the
  # concept.
  lambda_report <- check_package_functions("lambda")
  expect_length(lambda_report$missing_functions, 44)
  expect_length(lambda_report$unmatched_functions, 15)
  expect_length(lambda_report$matched_functions, 5)
})