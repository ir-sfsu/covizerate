#' Create a covizerate visualization
#'
#' @param data a table of data
#' @param title chart title
#'
#' @import htmlwidgets
#'
#' @export
covizerate <- function(data, title = NULL) {

  stopifnot(inherits(data, "data.frame"))
  stopifnot(all(c("year", "continuation", "graduation") %in% names(data)))

  x = list(
    data = data,
    title = title
  )

  htmlwidgets::createWidget(
    name = 'covizerate',
    x
  )
}

#' Various options for the covizerate widget
#'
#' @param covizerate An object of class 'covizerate'
#' @param vline_stroke Stroke color of the vertical line
#' @param grad_fill Fill color of the grad potion
#'
#' @return
#' @export
cvz_options <- function(covizerate, vline_stroke = "red", grad_fill = "#E8BF6A") {
  covizerate$x$vline_stroke <- vline_stroke
  covizerate$x$grad_fill <- grad_fill
  return(covizerate)
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
