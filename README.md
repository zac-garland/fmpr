fmpr
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

The goal of fmpr is to provide a lightweight R interface to the
Financial Modeling Prep API

### Installation

You can install the development version from
[GitHub](https://github.com/zac-garland/fmpr) with:

``` r
## install.packages("devtools")
devtools::install_github("zac-garland/fmpr")
```

``` r
library(fmpr)
```

## set api key

``` r
fmp_api_key("demo")
```

## company meta data

``` r
fmp_company_profile(ticker = "AAPL")

fmp_historical_earning_calendar(ticker = "AAPL")

fmp_rating(ticker = "AAPL")
```

## financial statements

``` r
fmp_balance_sheet(ticker = "AAPL", period = "quarter")

fmp_cash_flow_statement(ticker = "AAPL", period = "quarter")

fmp_income_statement(ticker = "AAPL", period = "quarter")
```

## financial metrics

``` r
fmp_discounted_cash_flow(ticker = "AAPL")

fmp_enterprise_value(ticker = "AAPL", period = "quarter")

fmp_financial_growth(ticker = "AAPL", period = "quarter")

fmp_historical_discounted_cash_flow(ticker = "AAPL", period = "quarter")

fmp_key_metrics(ticker = "AAPL", period = "quarter")

fmp_ratios(ticker = "AAPL", period = "quarter")
```

## stock prices

``` r
fmp_intraday(ticker = "AAPL", freq = "1min")

fmp_historical_price(ticker = "AAPL")

fmp_quote(ticker = "AAPL")

fmp_quote_short(ticker = "AAPL")

fmp_stock_dividend(ticker = "AAPL")

fmp_stock_split(ticker = "AAPL")
```
