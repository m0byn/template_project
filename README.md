# [Paper / Project Number] – [Short Descriptive Title]

- For a detailed project and task description see [project.md](project.md).
- Essential git commands are summarized in [git-commands.md](git-commands.md).

## Files

All empirical work is done using Quarto. Source files are numbered and assigned to specific ranges by task. New files are created from the template at [`quarto-files/quarto-coding-file-template.md`](quarto-files/quarto-coding-file-template.md); rendered outputs are written to [`rendered-files/`](rendered-files).

**00–09:** core data preparation relevant for all subsequent tasks

- `[00_...](rendered-files/00_....md)`: [brief description of content]
- `[01_...](rendered-files/01_....md)`: [brief description of content]

**10–19:** [dataset or module A]‑specific preparation

- `[10_...](rendered-files/10_....md)`: [description]
- `[11_...](rendered-files/11_....md)`: [description]

**20–29:** [dataset or module B]‑specific preparation

- `[20_...](rendered-files/20_....md)`: [description]
- `[21_...](rendered-files/21_....md)`: [description]

**30–39:** construction of analysis datasets

- `[30_...](rendered-files/30_....md)`: [description]
- `[31_...](rendered-files/31_....md)`: [description]

**40–49:** main estimation and robustness checks

- `[40_...](rendered-files/40_....md)`: [main baseline specification]
- `[41_...](rendered-files/41_....md)`: [event‑study / heterogeneity]
- `[42_...](rendered-files/42_....md)`: [robustness / alternative samples]

**50–59:** tables, figures, and reporting

- `[50_...](rendered-files/50_....md)`: [tables for main text]
- `[51_...](rendered-files/51_....md)`: [figures for main text]
- `[52_...](rendered-files/52_....md)`: [appendix outputs]

(Extend ranges as required; keep numbering monotone in the typical pipeline order: preparation → construction → estimation → reporting.)

## Structure

```text
project
├── input/                  Input data and external resources
├── output/                 Generated outputs
│   ├── figures/            Final and intermediate figures
│   └── tables/             Final and intermediate tables
├── quarto-files/           Source .qmd files (not rendered)
├── r-scripts/              Shared .R code (packages, paths, functions)
│   ├── qmd-rendering.R     R script to render .qmd files to commonmark
│   └── shared.R            Packages, paths, helper functions
├── rendered-files/         Rendered .qmd outputs (commonmark)
├── supplementary-files/    Documentation and auxiliary files
│   └── [other docs].md
├── CLAUDE.md               Project instructions for AI assistants
├── git-commands.md         Essential git commands
├── LICENSE                 Project license
├── project.md              Detailed project and task description
└── README.md               This file
```

## Data

- Original raw data (if under restricted access) is stored on the secure project drive: `[path on institute server]`.
- Working copies and intermediate datasets are stored at: `[path on analysis server or cluster]`.
- All large intermediate datasets are stored in `.parquet` (or similar columnar) format for efficient reading and writing.
- Access to data is governed by the corresponding data-use agreements and institutional rules; raw data should never be pushed to the repository.