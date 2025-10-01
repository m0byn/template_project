###############################################################################################################################
# Title: qmd_rendering.R
# Creator: Manuel ZEROBIN
# Task: Rendering and saving of quarto files
###############################################################################################################################

#  ---------------------------------------Standard rendering of quarto files--------------------------------------------
# All rendering
system("quarto render K:/Projects/PROJECTNAME/Quarto-Files/FILENAME.qmd --output-dir K:/Projects/PROJECTNAME/Quarto-Files/Rendered/FILENAME/all"); unlink("K:/Projects/PROJECTNAME/Quarto-Files/FILENAME_files", recursive = TRUE)

#  ---------------------------------------Gitea rendering of quarto files----------------------------------------------
wifo.base::wbQuartoKnitAndTOC(file.path('/Quarto_files/Test.qmd'))

#  ---------------------------------------Separate rendering of quarto files--------------------------------------------
# HTML rendering
system("quarto render K:/Projects/OeNB-PuG/Quarto_files/MergeData.qmd --to html --output-dir K:/Projects/OeNB-PuG/Quarto_files/Rendered/MergeData/html"); unlink("K:/Projects/OeNB-PuG/Quarto_files/MergeData_files", recursive = TRUE)
# PDF rendering
system("quarto render K:/Projects/OeNB-PuG/Quarto_files/MergeData.qmd --to pdf --output-dir K:/Projects/OeNB-PuG/Quarto_files/Rendered/MergeData/pdf"); unlink("K:/Projects/OeNB-PuG/Quarto_files/MergeData_files", recursive = TRUE)
# Word rendering
system("quarto render K:/Projects/OeNB-PuG/Quarto_files/MergeData.qmd --to docx --output-dir K:/Projects/OeNB-PuG/Quarto_files/Rendered/MergeData/docx"); unlink("K:/Projects/OeNB-PuG/Quarto_files/MergeData_files", recursive = TRUE)
# Commonmark rendering
system("quarto render K:/Projects/OeNB-PuG/Quarto_files/MergeData.qmd --to commonmark --output-dir K:/Projects/OeNB-PuG/Quarto_files/Rendered/MergeData/commonmark"); unlink("K:/Projects/OeNB-PuG/Quarto_files/MergeData_files", recursive = TRUE)
