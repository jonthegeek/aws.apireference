test_that("get_actions works", {
  # These tests are fragile and will fail if the reference changes. For now I'm
  # fine with that.

  ec2_actions <- get_actions("ec2")
  expect_length(ec2_actions, 403)
  expect_equal(ec2_actions[[1]], "AcceptReservedInstancesExchangeQuote")
  expect_equal(ec2_actions[[403]], "WithdrawByoipCidr")

  lambda_actions <- get_actions("lambda")
  expect_length(lambda_actions, 49)
  expect_equal(lambda_actions[[1]], "AddLayerVersionPermission")
  expect_equal(lambda_actions[[49]], "UpdateFunctionEventInvokeConfig")
})
