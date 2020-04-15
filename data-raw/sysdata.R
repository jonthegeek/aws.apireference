base_reference_url <- "https://docs.aws.amazon.com/"

api_reference_url_parts <- c(
  ec2 = "AWSEC2/latest/APIReference/API_Operations.html",
  lambda = "lambda/latest/dg/API_Operations.html"
)

api_reference_urls <- paste0(base_reference_url, api_reference_url_parts)
names(api_reference_urls) <- names(api_reference_url_parts)

usethis::use_data(api_reference_urls, overwrite = TRUE, internal = TRUE)
rm(
  base_reference_url,
  api_reference_url_parts,
  api_reference_urls
)
