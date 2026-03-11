# README

All relevant code related to programming is included.

- For a more detailed project and task description see [project.md](project.md).
- Essential git commands are found in [git-commands.md](git-commands.md).


# Directory structure

- [quarto-files](quarto-files): includes all **not** rendered `.qmd` files.
- [rendered-files](rendered-files): includes all **rendered** `.qmd` files, standard is `commonmark`. If, in any case one of the formats `.docx`, `.pdf`, or `.html` is needed, it can be generated too.
- [r-scripts](r-scripts): includes all `.R` files usually shared with the `.qmd` files, e.g. loading packages and useful functions. 
- [input](input): includes all input necessary to run the `.qmd` files.
- [output](output): includes all output, i.e. [plots](output/plots), [tables](output/tables), specifically saved to the respective folders.
- [supplementary-files](supplementary-files): includes all relevant documentation and other files.
	
# Files:

All relevant work is done using quarto. The files are numbered.

- [01_load-data](rendered-files/01_load-data.md): converts data from various formats to `.parquet` for efficiency, this script is usually run only once at the beginning.
- [02_data-preparation](rendered-files/02_data-preparation.md): the script does all data preparation before one can run the analysis.
- [03_analysis](rendered-files/03_analysis.md): includes all code relevant for the analysis.
- [04_visualisation](rendered-files/visualisation.md): the script does the descriptive visualisation of the available data.

# Data

- Original zipped data is located here: `N:\ext_Projekte\PROJECTNAME\30_Daten\`
- Data what is worked with is located here: `//int.wsr.at/Nabu/ohne_Backup/PROJECTNAME/`
- Note, format is `.parquet` to speed up reading and writing the data.