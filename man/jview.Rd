\name{view}
\alias{jview}
\title{Simple Jupyter Notebook Viewer Addin for RStudio}

\usage{
view(path, template = "classic")
}

\arguments{
  \item{path}{Character string. File path to a `.ipynb` notebook. Must end in `.ipynb`.}
  \item{template}{Character string. HTML template to use. Either \code{"classic"} (default) or \code{"lab"}.}
}

\description{
Provides an RStudio Addin to render and preview Jupyter Notebook (.ipynb) files
directly in the RStudio Viewer. Uses Jupyter nbconvert under the hood.
}

\examples{
# basic usage
library(jview)
view("your_notebook.ipynb")

# with template option
view("your_notebook.ipynb", template = "lab")
}

\author{
J.W. Lee \email{gunzion12@gmail.com} \cr
J. Seo (Contributor)
}
