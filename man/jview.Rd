\name{view}
\alias{jview}
\title{Simple Jupyter Notebook Viewer Addin for RStudio}
\usage{

# Load library
library(jview)

# Run
view("path/to/your_notebook.ipynb")

}

\description{
Provides an RStudio Addin to render and preview Jupyter Notebook (.ipynb) files
directly in the RStudio Viewer. Uses Quarto when available, and falls back to Jupyter nbconvert
for environments without Quarto installed.
}
\examples{
library(jview)
view("your_ipynb_path_here.ipynb")

}

\author{
 J. Seo & J.W Lee \email{gunzion12@gmail.com}
}
