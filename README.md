## jview
I created this package because I wanted a simple way to preview .ipynb files directly inside RStudio. The package uses Jupyter nbconvert under the hood, so you can conveniently render and view Jupyter Notebook files in the RStudio Viewer without leaving your R session.

## Installation

You can install the development version of **jview** directly from GitHub:

```r
# install.packages("devtools")  # if not already installed
devtools::install_github("Ljwook92/jview")
```

## Usage
After installation, you can call the viewer function directly:
```r
library(jview)

# View a Jupyter Notebook (.ipynb) file in the RStudio Viewer
jview::view_ipynb("path/to/your_notebook.ipynb")
```
This will render the notebook into HTML and display it inside the RStudio Viewer pane.
	•	If Quarto is available, it will be used for rendering.
	•	If not, the function will fall back to Jupyter nbconvert (so make sure Jupyter is installed and available in your PATH).

## RStudio Addin

After installing the package, you can also launch the viewer via the RStudio Addins menu:
	1.	Open RStudio.
	2.	Go to the menu: Addins → Browse Addins → ipynbviewer.
	3.	Select your .ipynb file and it will open in the Viewer pane.

 ## Example
```r
# Example with a sample notebook
jview::view_ipynb("your_ipynb_path_here.ipynb")
```

## Requirements
	•	R (>= 4.0)
	•	Quarto (recommended), or alternatively Jupyter with nbconvert installed
	•	RStudio (to use the Addin integration)
![/example.png](/example.png)

