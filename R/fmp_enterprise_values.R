fmp_enterprise_values <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("enterprise-values/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
