library(shiny)

fluidPage(
  tags$head(
    tags$style(
      HTML(
        "
                body {
          overflow: hidden;
        }
        .ticker {
          display: flex;
        }
        .ticker__list {
          display: flex;
          margin-top: 20px;
          animation: ticker 30s infinite linear;
        }
        .ticker:hover .ticker__list {
          animation-play-state: paused;
        }
        .ticker__item {
          margin-right: 20px;
        }
        @-moz-keyframes ticker {
          100% {
            transform: translateX(-100%);
          }
        }
        @-webkit-keyframes ticker {
          100% {
            transform: translateX(-100%);
          }
        }
        @-o-keyframes ticker {
          100% {
            transform: translateX(-100%);
          }
        }
        @keyframes ticker {
          100% {
            transform: translateX(-100%);
          }
        }


        "
      )
    )
  ),
  # end head
  HTML(
    '
<div class="ticker">
  <div class="ticker__list">
    <div class="ticker__item"><img src="https://img.clock.co.uk/250x100?text=Item 1&amp;color=f3e5f5"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/300x100?text=Item 2&amp;color=ede7f6"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/200x100?text=Item 3&amp;color=ffcdd2"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/100x100?text=Item 4&amp;color=f8bbd0"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/350x100?text=Item 5&amp;color=e8eaf6"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/100x100?text=Item 6&amp;color=e3f2fd"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/250x100?text=Item 7&amp;color=e1f5fe"/></div>
    <div class="ticker__item"><img src="https://img.clock.co.uk/150x100?text=Item 8&amp;color=e0f7fa"/></div>
  </div>
</div>'
  ),
  tags$script(
    HTML(
      "
      var ticker = document.querySelector('.ticker')
        , list = document.querySelector('.ticker__list')
        , clone = list.cloneNode(true)

      ticker.append(clone)

      "
    )
  )

) %>%
  htmltools::html_print()
