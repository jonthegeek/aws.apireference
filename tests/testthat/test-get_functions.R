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
