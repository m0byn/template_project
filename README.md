# [Paper / Project Number] – [Short Descriptive Title]

- For a detailed project and task description see [project.md](project.md).
- Essential git commands are summarized in [git-commands.md](git-commands.md).

## Files

All empirical work is done using Quarto. Source files are numbered and assigned to specific ranges by task. New files are copied from [`quarto-files/quarto-coding-file-template.qmd`](quarto-files/quarto-coding-file-template.qmd); the conventions it follows are documented in [`quarto-files/quarto-coding-file-template.md`](quarto-files/quarto-coding-file-template.md). Rendered outputs are written to [`rendered-files/`](rendered-files); superseded versions live in [`quarto-files/archive/`](quarto-files/archive).

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

## Workflow

- Every `.qmd` opens its `prep` chunk with `here::i_am("code/r-scripts/shared.R")` and then sources [`r-scripts/shared.R`](r-scripts/shared.R). The anchor is required: it resolves `here()` against the *project* root (the folder above `code`), which is what every `path$` entry assumes. Without it `here()` falls back to this repository's root and all paths silently resolve one level too deep.
- [`shared.R`](r-scripts/shared.R) loads the common packages and defines `path$data$*` / `path$output$*` plus the shared helpers (`save_figure()`, `save_table()`, `%notin%`, ...). File-specific libraries are loaded in the `.qmd` itself.
- Per-step statistics are persisted as `.rds` in `data/auxiliary/<file-number>/` and read back in an `eval: true` companion chunk, so rendering never re-runs the heavy computation (chunks are `eval: false` by default).
- Figures are written to `output/figures` as `.png` plus a ready-to-include LaTeX snippet in `output/figures/tex`; paper tables go to `output/tables` as `.tex` (`tinytable`). In-document tables are rendered with `kable()` instead.
- Render with [`r-scripts/qmd-rendering.R`](r-scripts/qmd-rendering.R): `render('<file-name>')` renders a single `.qmd` to commonmark in `rendered-files/`; keep the call list at the bottom of the script in pipeline order.

## Structure

```text
[project]                   Project root (here() anchor)
├── code/                   This repository
├── data/                   Data (not in git, see below)
└── text/                   Paper, presentations, abstract (separate repository)

code
├── input/                  Input resources (small, checked in; large vintages git-ignored)
├── output/                 Generated outputs
│   ├── figures/            Figures (.png) + tex/ LaTeX snippets
│   └── tables/             Tables (.tex)
├── quarto-files/           Source .qmd files (not rendered)
│   ├── archive/            Superseded versions
│   ├── references/         .bib files
│   ├── quarto-coding-file-template.md    Structure conventions
│   └── quarto-coding-file-template.qmd   Skeleton to copy for a new file
├── r-scripts/              Shared .R code (packages, paths, functions)
│   ├── qmd-rendering.R     Renders .qmd files to commonmark
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

Data lives outside this repository, in `[project]/data/` (paths resolve through `path$data$*` in [`shared.R`](r-scripts/shared.R)):

```text
data
├── raw/                    Original deliveries, read-only
├── processed/              Analysis-ready outputs of the numbered files
└── auxiliary/<nn>/         Per-file .rds step statistics for inline reporting
```

- Original raw data (if under restricted access) is stored on the secure project drive: `[path on institute server]`.
- Working copies and intermediate datasets are stored at: `[path on analysis server or cluster]`.
- All large intermediate datasets are stored in `.parquet` (or similar columnar) format for efficient reading and writing.
- Access to data is governed by the corresponding data-use agreements and institutional rules; raw data should never be pushed to the repository.