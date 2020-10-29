#' Create a covizerate visualization
#'
#' @param data a table of data.
#'
#' @import htmlwidgets
#'
#' @export
covizerate <- function(data) {

  x = list(
    data = data
  )

  htmlwidgets::createWidget(
    name = 'covizerate',
    x
  )
}

#' Shiny bindings for covizerate
#'
#' Output and render functions for using covizerate within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a covizerate
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name covizerate-shiny
#'
#' @export
covizerateOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'covizerate', width, height, package = 'covizerate')
}

#' @rdname covizerate-shiny
#' @export
renderCovizerate <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, covizerateOutput, env, quoted = TRUE)
}
