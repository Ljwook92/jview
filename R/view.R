#' View Jupyter Notebook (.ipynb) in the RStudio Viewer
#'
#' Render a Jupyter Notebook (`.ipynb`) to HTML using Jupyter **nbconvert**
#' and display it in the RStudio Viewer pane. The HTML is written to a
#' temporary file on each call. If you prefer the Jupyter Lab look-and-feel,
#' change the template to `"lab"`.
#'
#' @details
#' By default, this function uses the **classic** Jupyter HTML template.
#' It requires a working `jupyter nbconvert` in your system PATH.
#' If you need Quarto or Pandoc fallbacks, you can extend this function accordingly.
#'
#' @param path Character scalar. Path to a `.ipynb` file.
#' @param template Character scalar. Template style for HTML rendering.
#'   Either `"classic"` (default) or `"lab"`.
#'
#' @return (invisible) Path to the rendered HTML file.
#'
#' @examples
#' ex <- system.file("examples", "example.ipynb", package = "jview")
#' if (nzchar(ex) && file.exists(ex)) {
#'   view(ex)                    # default: classic
#'   view(ex, template = "lab") # lab template
#' }
#'
#' @author
#' Jung-In Seo \cr
#' Jeong Wook Lee \email{gunzion12@gmail.com}
#'
#' @export
view <- function(path, template = "classic") {
  # Check valid extension
  if (!nzchar(path) || !grepl("\\.ipynb$", path, ignore.case = TRUE)) {
    stop("Invalid input: please provide a valid path to a '.ipynb' file.")
  }

  # Check file exists
  if (!file.exists(path)) {
    stop(paste("File does not exist at the specified path:\n", path, "\nPlease check the file path and try again."))
  }

  # Validate template
  if (!template %in% c("classic", "lab")) {
    stop("Invalid template. Please use 'classic' or 'lab'.")
  }

  out_dir  <- tempdir()
  out_name <- "ipynb_preview.html"
  out_html <- file.path(out_dir, out_name)

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
    stop("nbconvert failed. Please ensure that Jupyter and nbconvert are installed, and the input file is valid.")
  }

  viewer <- getOption("viewer")
  if (is.function(viewer)) viewer(out_html) else utils::browseURL(out_html)
  invisible(out_html)
}
