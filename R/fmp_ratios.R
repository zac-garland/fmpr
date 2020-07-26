fmp_ratios <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("ratios/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
