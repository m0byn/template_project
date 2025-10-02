# README

All relevant code related to programming is included.

For a more detailed project and task description see [Project.md](Project.md).

# Directory structure

- [Quarto-Files](Quarto-Files): includes all .qmd files.
- [Rendered](Quarto-Files/Rendered): includes all rendered .qmd files, standard is pdf, html, docx, commonmark.
- [R-Scripts](R-Scripts): includes all .R files, usually Functions.R and qmd_rendering.R.
- [Output](Output): includes all output, i.e. [plots](Output/Plots), [tables](Output/Tables), specifically saved to the respective folders.

# Data

- Original zipped data is located here: N:\ext_Projekte\PROJECTNAME\30_Daten\
- Data what is worked with is located here: '//int.wsr.at/Nabu/ohne_Backup/PROJECTNAME/
    - Note, format is parquet/arrow to speed up reading and writing the data.
	
# Files relevant to programming

All relevant work is done using quarto.

- [DataPreparation.qmd](Quarto-Files/DataPreparation.qmd): the script does all data preparation before one can run the analysis.
- [Analysis.qmd](Quarto-Files/Analysis.qmd): includes all code relevant for the analysis.