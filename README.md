# README

All relevant code related to programming is included.

- For a more detailed project and task description see [Project.md](Project.md).
- Essential git commands are located in [Git.md](Supplementary-Files/Git.md).


# Directory structure

- [Quarto-Files](Quarto-Files): includes all **not** rendered `.qmd` files.
- [Rendered](Quarto-Files/Rendered): includes all **rendered** `.qmd` files, standard is `commonmark`. If, in any case one of the formats `.docx`, `.pdf`, or `.html` is needed, it can be generated too.
- [R-Scripts](R-Scripts): includes all `.R` files in separate folders corresponding to `Quarto-Files`. The folder [Shared](R-Scripts/Shared) includes all `.R` files which other files need to access, e.g. loading packages and useful functions. 
- [Input](Input): includes all input necessary to run the .qmd files.
- [Output](Output): includes all output, i.e. [plots](Output/Plots), [tables](Output/Tables), specifically saved to the respective folders.
- [Supplementary-Files](Supplementary-Files): includes all relevant documentation and other files.

# Data

- Original zipped data is located here: `N:\ext_Projekte\PROJECTNAME\30_Daten\`
- Data what is worked with is located here: `//int.wsr.at/Nabu/ohne_Backup/PROJECTNAME/`
    - Note, format is `.parquet` or `.arrow` to speed up reading and writing the data.
	
# Files:

All relevant work is done using quarto.

- [LoadData](Quarto-Files/Rendered/LoadData/LoadData.md): converts data from various formats to .arrow or .parquet for efficiency, this script is usually run only once at the beginning.
- [DataPreparation](Quarto-Files/Rendered/DataPreparation/DataPreparation.md): the script does all data preparation before one can run the analysis.
- [Visualisation](Quarto-Files/Rendered/Visualisation/Visualisation.md): the script does the descriptive visualisation of the available data.
- [Analysis](Quarto-Files/Rendered/Analysis/Analysis.md): includes all code relevant for the analysis.
