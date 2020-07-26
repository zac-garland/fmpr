fmp_cash_flow_statement <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("cash-flow-statement/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}



