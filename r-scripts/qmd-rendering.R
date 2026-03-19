###############################################################################################################################
# Title: qmd-rendering.R
# Creator: Manuel ZEROBIN
# Task: Rendering and saving of quarto files
###############################################################################################################################

#  ---------------------------------------Standard rendering of quarto files--------------------------------------------

# Rendering

render = function(qmd.name) {
  # Construct file paths
  qmd.path       = here::here("quarto-files", paste0(qmd.name, ".qmd"))
  output.dir     = here::here("rendered-files")
  files.dir      = here::here("quarto-files", paste0(qmd.name, "_files"))
  gitignore.path = here::here("quarto-files", ".gitignore")

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