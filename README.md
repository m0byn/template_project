# README

All relevant code related to programming is included.

- For a more detailed project and task description see [project.md](project.md).
- Essential git commands are found in [git-commands.md](git-commands.md).

# Directory structure

- [quarto-files/](quarto-files) — source `.qmd` files (not rendered)
- [rendered-files/](rendered-files) — rendered `.qmd` outputs (commonmark)
- [r-scripts/](r-scripts) — shared `.R` code (packages, paths, functions)
- [input/](input) — input data and resources
- [output/](output) — generated outputs  
  - [plots/](output/plots) — figures  
  - [tables/](output/tables) — tables  
- [supplementary-files/](supplementary-files) — documentation and auxiliary files
	
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