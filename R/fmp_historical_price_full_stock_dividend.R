fmp_historical_price_full_stock_dividend <- function(ticker = "AAPL") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("historical-price-full/stock_dividend/{ticker}?apikey={apikey}"))

  fmp_data(fmp_url)
}
