fmp_profile <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("profile/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
