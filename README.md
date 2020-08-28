fmpr
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

The goal of fmpr is to provide a lightweight R interface to the
Financial Modeling Prep API

##### Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
#### install.packages("devtools")
devtools::install_github("zac-garland/fmpr")
```

``` r
library(fmpr)
```

#### set api key

``` r
fmp_api_key("demo")
```

#### Balance Sheet

``` r
fmp_balance_sheet(ticker = "AAPL", period = "quarter")  
```

#### Cash Flow Statement

``` r
fmp_cash_flow_statement(ticker = "AAPL", period = "quarter")  
```

#### Company Profile

``` r
fmp_company_profile(ticker = "AAPL")  
```

#### Discounted Cash Flow

``` r
fmp_historical_discounted_cash_flow(ticker = "AAPL")  
```

#### Enterprise Value

``` r
fmp_enterprise_value(ticker = "AAPL", period = "quarter")  
```

#### Financial Growth

``` r
fmp_financial_growth(ticker = "AAPL", period = "quarter")  
```

#### Historical Discounted Cash Flow

``` r
fmp_historical_discounted_cash_flow(ticker = "AAPL", period = "quarter")  
```

#### Historical Earning Calendar

``` r
fmp_historical_earning_calendar(ticker = "AAPL")  
```

#### Historical Price

``` r
fmp_historical_price(ticker = "AAPL",start_date = as.Date("2019-01-01"))  
```

#### Income Statement

``` r
fmp_income_statement(ticker = "AAPL", period = "quarter")  
```

#### Intraday

``` r
fmp_intraday(ticker = "AAPL", freq = "1min")  
```

#### Key Metrics

``` r
fmp_key_metrics(ticker = "AAPL", period = "quarter")  
```

#### Quote

``` r
fmp_quote(ticker = "AAPL")  
```

#### Rating

``` r
fmp_rating(ticker = "AAPL")  
```

#### Ratios

``` r
fmp_ratios(ticker = "AAPL", period = "quarter")  
```

#### Stock Dividend

``` r
fmp_stock_dividend(ticker = "AAPL")  
```

#### Stock Split

``` r
fmp_stock_split(ticker = "AAPL")  
```
