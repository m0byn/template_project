###############################################################################################################################
# Title: qmd_rendering.R
# Creator: Manuel ZEROBIN
# Task: Rendering and saving of quarto files
###############################################################################################################################

#  ---------------------------------------Standard rendering of quarto files--------------------------------------------

# Rendering

render = function(base.path, proj.name, qmd.name) {
  # Construct file paths
  qmd.path = file.path(base.path, proj.name, "Quarto-Files", paste0(qmd.name, ".qmd"))
  output.dir = file.path(base.path, proj.name, "Quarto-Files/Rendered", qmd.name)
  files.dir = file.path(base.path, proj.name, "Quarto-Files", paste0(qmd.name, "_files"))
  gitignore.path = file.path(base.path, proj.name, "Quarto-Files", ".gitignore")
  
  # Render command
  render.cmd = paste0("quarto render ", qmd.path, " --output-dir ", output.dir)
  
  # Execute commands
  system(render.cmd)
  unlink(files.dir, recursive = TRUE)
  unlink(gitignore.path)
  
  cat("Rendered:", qmd.name, "for project:", proj.name, "\n")
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