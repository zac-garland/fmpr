#' historical growth metrics
#' @param ticker a stock ticker
#' @param period reporting period, quarter or annual
#' @seealso https://financialmodelingprep.com/developer/docs/
#' @export
#' @examples
#' fmp_financial_growth(ticker = "AAPL", period = "quarter")

fmp_financial_growth <- function(ticker = "AAPL", period = "quarter") {
  apikey <- fmp_api_key()

  fmp_url <- fmp_url_builder(glue::glue("financial-growth/{ticker}?period={period}&apikey={apikey}"))

  fmp_data(fmp_url)
}
