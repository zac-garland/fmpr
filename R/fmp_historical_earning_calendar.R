fmp_historical_earning_calendar <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical/earning_calendar/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
