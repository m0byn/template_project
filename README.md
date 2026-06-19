# project-name

- For a more detailed project and task description see [project.md](project.md).
- Essential git commands are found in [git-commands.md](git-commands.md).

## Files

All relevant work is done using Quarto. Files are numbered and assigned to specific ranges depending on the task. New files are created from the template at [`quarto-files/quarto-coding-file-template.md`](quarto-files/quarto-coding-file-template.md); rendered outputs are written to [`rendered-files/`](rendered-files).

**00-09:** basic data preparation relevant for all subsequent operations

- `00_data-prep`: prepares several tables and basic data to be used subsequently.
- `01_load-data`: converts data from various formats to `.parquet` for efficiency; this script is usually run only once at the beginning.

**10-19:** topic-specific data preparation

- `10_data-preparation`: does all data preparation before running the analysis.

**20-29:** analysis of X

- `20_analysis`: includes all code relevant for the analysis.

**30-39:** analysis of Y

- `30_analysis`: includes all code relevant for the analysis.

**40-49:** analysis of Z

- `40_analysis`: includes all code relevant for the analysis.

**50-59:** visualisation

- `50_visualisation`: descriptive visualisation of the available data.

## Structure

```
.
├── input/                  Input data and resources
├── output/                 Generated outputs
│   ├── figures/            Figures
│   └── tables/             Tables
├── quarto-files/           Source .qmd files (not rendered)
├── r-scripts/              Shared .R code (packages, paths, functions)
│   ├── qmd-rendering.R     Renders .qmd files to commonmark
│   └── shared.R            Packages, paths, helper functions
├── rendered-files/         Rendered .qmd outputs (commonmark)
├── supplementary-files/    Documentation and auxiliary files
│
├── CLAUDE.md               Project instructions for Claude
├── git-commands.md         Essential git commands
├── LICENSE
├── project.md              Detailed project and task description
└── README.md               This file
```

## Data

- Original zipped data is located here: `N:\ext_Projekte\PROJECTNAME\30_Daten\`
- Data that is worked with is located here: `//int.wsr.at/Nabu/ohne_Backup/PROJECTNAME/`
- Note: the format is `.parquet` to speed up reading and writing the data.

## Notes

- Empty directories are tracked with `.gitkeep` placeholders.
- Render `.qmd` files with [`r-scripts/qmd-rendering.R`](r-scripts/qmd-rendering.R); shared packages, paths, and helper functions live in [`r-scripts/shared.R`](r-scripts/shared.R).