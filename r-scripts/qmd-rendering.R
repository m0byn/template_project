###############################################################################################################################
# Title: qmd-rendering.R
# Creator: Manuel ZEROBIN
# Task: Rendering and saving of quarto files
###############################################################################################################################

#  ---------------------------------------Standard rendering of quarto files--------------------------------------------

# Rendering

render = function(qmd.name) {
  # Locate the project root (the folder above `code`) by finding the directory
  # that contains code/r-scripts/shared.R. Works whether you open the project
  # folder or the code folder, and ignores stray .git markers.
  proj.root = rprojroot::find_root(rprojroot::has_file("code/r-scripts/shared.R"))
  base.dir  = file.path(proj.root, "code")

  # Construct file paths
  qmd.path       = file.path(base.dir, "quarto-files", paste0(qmd.name, ".qmd"))
  output.dir     = file.path(base.dir, "rendered-files")
  files.dir      = file.path(base.dir, "quarto-files", paste0(qmd.name, "_files"))
  gitignore.path = file.path(base.dir, "quarto-files", ".gitignore")

  # Validate qmd file exists
  if (!file.exists(qmd.path)) {
    stop("Quarto file does not exist: ", qmd.path)
  }

  # Render
  render.cmd = paste0("quarto render \"", qmd.path, "\" --output-dir \"", output.dir, "\"")
  result = system(render.cmd, intern = FALSE)
  if (result != 0) {
    stop("Quarto render failed for: ", qmd.name)
  }

  # Clean up
  if (dir.exists(files.dir)) unlink(files.dir, recursive = TRUE)
  if (file.exists(gitignore.path)) unlink(gitignore.path)

  cat("Successfully rendered:", qmd.name, "\n")
  return(invisible(TRUE))
}