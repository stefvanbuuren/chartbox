#' Save growth chart as pdf
#'
#' Produce a pdf of the growth chart
#' @param chart A \code{grob} or \code{gTree} object
#' @param height Height of pdf device (in inches)
#' @param width  Width of pdf device (in inches)
#' @return A grid object
#' @examples
#' \dontrun{
#' z <- load_chart("NJAA")
#' pdf_chart(z)
#' }
#' @export
pdf_chart <- function(chart, height = 29.7/2.54, width = 21/2.54) {

  if (!inherits(chart, "grob")) stop("Not a grob.")
  chartcode <- chart$name

  # set the palette
  parsed <- parse_chartcode(chartcode)
  palette(chartbox::palettes[parsed$population, ])

  filename <- file.path(paste(chartcode, "pdf", sep = "."))
  pdf(filename, height = height, width = width)
  grid::grid.draw(chart)
  dev.off()

  cat("\nFile written to ", filename)
  invisible(chart)
}
