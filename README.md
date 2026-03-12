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

All relevant work is done using quarto. The files are numbered and assigned to specific ranges depending on the task.

**00-09:** basic data preparation relevant for all subsequent operations

- [00_data-prep](rendered-files/00_data-prep.md): prepares several tables and basic data to be used subsequently.
- [01_load-data](rendered-files/01_load-data.md): converts data from various formats to `.parquet` for efficiency, this script is usually run only once at the beginning.

**10-19:** topic specific data preparation

- [10_data-preparation](rendered-files/10_data-preparation.md): the script does all data preparation before one can run the analysis.

**20-29:** analysis of X

- [20_analysis](rendered-files/20_analysis.md): includes all code relevant for the analysis.

**30-39:** analysis of Y

- [30_analysis](rendered-files/30_analysis.md): prepares several tables and basic data to be used subsequently.

**40-49:** analysis of Z

- [40_analysis](rendered-files/40_analysis.md): prepares several tables and basic data to be used subsequently.

**50-59:** visualisation of bla

- [50_visualisation](rendered-files/50_visualisation.md): the script does the descriptive visualisation of the available data.

# Data

- Original zipped data is located here: `N:\ext_Projekte\PROJECTNAME\30_Daten\`
- Data what is worked with is located here: `//int.wsr.at/Nabu/ohne_Backup/PROJECTNAME/`
- Note, format is `.parquet` to speed up reading and writing the data.