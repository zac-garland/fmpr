index <- tidyquant::tq_index("DOW")

px_data <- index %>%
  nest(-symbol) %>%
  mutate(
    px_data = map(symbol, ~ {
      tidyquant::tq_get(.x, from = (Sys.Date() - 365))
    })
  )



this_content <- px_data %>%
  split(.$symbol) %>%
  map(~ {
    .x <- .x %>% unnest()
    trend_line <- .x %>%
      pull(adjusted) %>%
      reactrend::reactrend(
        gradient = c("#00c6ff", "#F0F", "#FF0"),
        height = "400px",
        smooth = TRUE,
        draw = TRUE
      )

    this_return <- .x %>%
      filter(date == min(date, na.rm = TRUE) | date == max(date, na.rm = TRUE)) %>%
      slice(1, nrow(.)) %>%
      arrange(date) %>%
      summarize(return = ((adjusted / lag(adjusted)) - 1) %>% tail(1)) %>%
      pull()

    # message(unique(.x$company), this_return)
    this_color <- ifelse(this_return > 0, "#FF0", "#00c6ff")


    this_sign <- glue::glue("{scales::percent(this_return,accuracy = 0.1)}")

    div(
      class = "ticker__item", style = "margin-right:20px;min-width:300px;",
      fluidRow(
        column(12,
          style = "margin-bottom:3rem;margin-top:1.1rem;",
          div(
            class = "ticker__item", style = "max-width:100% !important;margin:0 !important;",
            span(
              unique(.x$symbol),
              span(this_sign, style = glue::glue("color:{this_color};padding:15px;")),
              style="font-size:1.5rem;"
            ),
            div(glue::glue("{unique(.x$company)} | {unique(.x$sector)}"),style = "margin:1rem 0px;font-size:0.8rem;")
          )
        )
      ),
      fluidRow(
        column(12, trend_line)
      )
    )
  })

this_content %>%
  div(class = "ticker__list") %>%
  div(class = "ticker") %>%
  div(class = "ticker-container") %>%
  fluidPage(
    class = "w3-theme-d5",
    tags$head(
      HTML('<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"><link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-dark-grey.css">'),
      tags$style(HTML(".ticker-container{overflow:hidden}.ticker{display:flex}.ticker__list{display:flex;margin-top:20px;animation:ticker 300s infinite linear}.ticker:hover .ticker__list{animation-play-state:paused}.ticker__item{background: transparent;box-shadow: 6px 6px 14px 0 rgba(0, 0, 0, 0.5),-8px -8px 18px 0 rgba(100, 100, 100, 0.89);border-radius: 40px;padding: 4px 30px 20px;}@-moz-keyframes ticker{100%{transform:translateX(-100%)}}@-webkit-keyframes ticker{100%{transform:translateX(-100%)}}@-o-keyframes ticker{100%{transform:translateX(-100%)}}@keyframes ticker{100%{transform:translateX(-100%)}}")),
      tags$script(HTML('var ticker=document.querySelector(".ticker"),list=document.querySelector(".ticker__list"),clone=list.cloneNode(true);ticker.append(clone);'))
    ), .,
    tags$script(HTML("var body = document.body;body.classList.add('w3-theme-d5')"))
  ) %>%
  htmltools::html_print()
