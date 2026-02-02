###############################################################################################################################
# Title: qmd_rendering.R
# Creator: Manuel ZEROBIN
# Task: Rendering and saving of quarto files
###############################################################################################################################

#  ---------------------------------------Standard rendering of quarto files--------------------------------------------

# Rendering

render = function(base.path = 'K:/Projects', proj.name, qmd.name, qmd.rel.path = 'Quarto-Files') {
  # Validate inputs
  if (!dir.exists(base.path)) {
    stop("Base path does not exist: ", base.path)
  }
  
  # Construct file paths
  qmd.path = file.path(base.path, proj.name, qmd.rel.path, paste0(qmd.name, ".qmd"))
  output.dir = file.path(base.path, proj.name, qmd.rel.path, "Rendered", qmd.name)
  files.dir = file.path(base.path, proj.name, qmd.rel.path, paste0(qmd.name, "_files"))
  gitignore.path = file.path(base.path, proj.name, qmd.rel.path, ".gitignore")
  
  # Validate qmd file exists
  if (!file.exists(qmd.path)) {
    stop("Quarto file does not exist: ", qmd.path)
  }
  
  # Create output directory if it doesn't exist
  if (!dir.exists(output.dir)) {
    dir.create(output.dir, recursive = TRUE, showWarnings = FALSE)
  }
  
  # Render command with proper quoting for paths with spaces
  render.cmd = paste0("quarto render \"", qmd.path, "\" --output-dir \"", output.dir, "\"")
  
  # Execute render command with error checking
  result = system(render.cmd, intern = FALSE)
  if (result != 0) {
    stop("Quarto render failed for:  ", qmd.name)
  }
  
  # Clean up files (only if they exist)
  if (dir.exists(files.dir)) {
    unlink(files.dir, recursive = TRUE)
  }
  
  # Only remove gitignore if it was created during rendering
  if (file.exists(gitignore.path)) {
      unlink(gitignore.path)
  }
  
  cat("Successfully rendered:", qmd.name, "for project:", proj.name, "\n")
  return(invisible(TRUE))
}



# LoadData.qmd
render('K:/Projects', 'BL-Healthcare', 'LoadData')

# DataPreparation.qmd
render('K:/Projects', 'BL-Healthcare', 'DataPreparation')

# Visualisation.qmd
render('K:/Projects', 'BL-Healthcare', 'Visualisation')

# Analysis.qmd
render('K:/Projects', 'BL-Healthcare', 'Analysis')

# AI-Summary.qmd
render('K:/Projects', 'BL-Healthcare', 'AI-Summary')