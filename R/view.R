#' View Jupyter Notebook (.ipynb) in the RStudio Viewer
#'
#' Render a Jupyter Notebook (`.ipynb`) to HTML using Jupyter **nbconvert**
#' and display it in the RStudio Viewer pane. The HTML is written to a
#' temporary file on each call. If you prefer the Jupyter Lab look-and-feel,
#' change the template to `"lab"`.
#'
#' @details
#' By default this function uses the **classic** Jupyter HTML template.
#' It requires a working `jupyter nbconvert` in your PATH. If you need
#' Quarto or Pandoc fallbacks, you can extend this function accordingly.
#'
#' @param path Character scalar; path to a `.ipynb` file.
#'
#' @return (Invisibly) the path to the generated HTML file.
#'
#' @examples
#' \dontrun{
#' # Basic usage
#' jview::view("path/to/notebook.ipynb")
#'
#' # The alias works the same way:
#' jview::view_ipynb("path/to/notebook.ipynb")
#' }
#'
#' @seealso \code{\link{view}}
#' @export
view <- function(path) {
  if (!nzchar(path) || !grepl("\\.ipynb$", path, ignore.case = TRUE)) {
    stop("Pass a .ipynb file path.")
  }
  out_dir  <- tempdir()
  out_name <- "ipynb_preview.html"
  out_html <- file.path(out_dir, out_name)

  template <- "classic"  # or "lab"

  status <- system2(
    "jupyter",
    c("nbconvert",
      "--to", "html",
      "--template", template,
      "--output", out_name,
      "--output-dir", out_dir,
      shQuote(path))
  )
  if (status != 0 || !file.exists(out_html)) {
    stop("nbconvert failed (check jupyter/nbconvert installed).")
  }

  viewer <- getOption("viewer")
  if (is.function(viewer)) viewer(out_html) else utils::browseURL(out_html)
  invisible(out_html)
}

#' @rdname view
#' @export
view <- view
