# README

All relevant code related to programming is included.

# Directory structure:

- /Quarto-Files: includes all .qmd files.
- /Quarto-Files/Rendered: includes all rendered .qmd files, standard is pdf, html, docx, commonmark.
- /R-Scripts: includes all .R files, usually Functions.R and qmd_rendering.R.
- /Output: includes all output (plots, tables) specifically saved to the respective folders.

# Data:

- Original zipped data is located here: N:\ext_Projekte\PROJECTNAME\30_Daten\
- Data what is worked with is located here: '//int.wsr.at/Nabu/ohne_Backup/PROJECTNAME/WorkingData/
    - Note, format is parquet/arrow to speed up reading and writing the data.
	
# Files:

All relevant work is done using quarto.

- DataPreparation.qmd: the script does all data preparation before one can run the analysis.
- Analysis.qmd: includes all code relevant for the analysis.