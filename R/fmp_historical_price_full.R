fmp_historical_price_full <- function(ticker = "AAPL", timeseries = "5") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical-price-full/{ticker}?timeseries={timeseries}&apikey={apikey}"))

  fmp_data(fmp_url)
}
