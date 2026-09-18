# Quarto Coding File Structure Template

---

## Heading Convention

- Major analytical steps: `# Step N - Title` (e.g. `# Step 1 - Merge spells`)
- Sub-steps within a step: `## Step N-M - Title` (e.g. `## Step 1-1 - Resolve duplicates`)
- Setup and closing sections keep plain named headers: `Project`, `Task`, `Coding Preparation`, `Output`
- Never enable Quarto's automatic section numbering — the step number lives in the header **text**, so anchors and cross-references stay intact.

---

## YAML Header

- Title matches file name (e.g., `04_merge-data`)
- Author field included
- Default format: `commonmark` with `code-link`, `code-fold: hide`, `code-copy`
- `editor: source`
- Global execute options: `cache: false`, `eval: false`, `message: false`
- `toc: true`
- `number-sections` left off (default) — step numbers are written into the header text, not generated

---

## Section Structure

### `# Project`
One-liner bullet naming the project.

### `# Task`
- Brief bullet describing the file's purpose
- Sub-bullet: **Path to data** — read/write locations with placeholder paths (`XXX.parquet`)

### `# Coding Preparation` (`prep` chunk)
- `#| eval: true`, `#| warning: false`
- **Anchor `here()` first:** `here::i_am("code/r-scripts/shared.R")`. This resolves `here()` against the project root (the folder above `code`), which is what every `path$` entry in `shared.R` assumes. Without it `here()` falls back to the repository root and all paths silently resolve one level too deep.
- Then set seed and source the shared script: `source(here::here('code/r-scripts/shared.R'), encoding = "UTF-8")`
- Load any file-specific libraries afterwards (`shared.R` covers the common ones)
- Load all input datasets
- Save a base-level `nrow()` snapshot to `.rds` (in `path$data$auxNN`, matching the file number)
- Immediately followed by a companion `*-read` chunk (`#| eval: true`) that loads the `.rds` for inline reporting

---

## Per-Step Pattern (repeated for each analytical step, as `# Step N - Title`)

Each step follows this strict structure:

### A. Computation Chunk (`chunk-name`)
- `eval: false` (inherits global default)
- Wrap the body in `tic()` / `toc()` so the render log carries timings
- All computation: filter, join, mutate, summarise
- Save output statistics to `.rds` via `saveRDS(list(...), here(...))`
- If the step produces a figure, or a table that belongs in the paper, build the object and persist it with `save_figure(<figure-obj>, ...)` / `save_table(<table-obj>, ...)` — never hardcode a table
- `rm()` intermediates at the end

### B. Read Chunk (`chunk-name-read`)
- `#| eval: true`
- Single `readRDS()` call assigning to a `*.txt` named object (e.g., `early.txt`)

### C. Prose Documentation Block
Immediately after the read chunk, structured markdown:

- **Input:** bullet list of input objects
- **Processing steps:** numbered/bulleted description of transformations
- **Output:** name and description of output object(s)
- **Findings:** inline `` `r` `` expressions referencing `*.txt` objects for all reported numbers

### D. Display Chunk (`chunk-name-table`), where a step reports a table
- `#| eval: true`
- Renders the `*.txt` object in the document with `kable()`, e.g. `shp.txt %>% kable(col.names = c(...), format.args = list(big.mark = ','))`
- This is the in-document path; `save_table()` is for tables written to `output/tables` for the paper. A step may use either or both.

### E. Running Totals
- Cumulative accounting of matched/unmatched observations using inline `` `r` `` expressions
- Format: "In total we have `` `r ...` `` total X of which: `` `r ...` `` remain unmerged, `` `r ...` `` are [case], amounting to `` `r round(... * 100, 3)` ``% which leads to `` `r ...` `` remaining"

> Sub-analyses inside a step take their own header `## Step N-M - Title` and repeat parts A–E as needed.

---

## Final Section: Output / Linking Table (`# Output`)

- `bind_rows()` or equivalent consolidation
- Write final output to `.parquet`
- Quality/diagnostic checks saved to `.rds` (integrity, coverage, distributions, unmatched counts)
- Diagnostic figures and paper tables built and written via `save_figure()` / `save_table()`; in-document tables rendered with `kable()` — never hardcoded
- Companion read chunk + prose with:
  - **Input**, **Processing steps**, **Quality checks** (subsectioned), **Output**
  - Summary table of the final object's variable descriptions
  - Summary table of match metadata combinations

---

## General Conventions

| Convention | Rule |
|---|---|
| Section headers | `# Step N - Title`; sub-steps `## Step N-M - Title`; setup/closing sections named (`Project`, `Task`, `Coding Preparation`, `Output`); no Quarto auto-numbering |
| Variable names | dot-separated (e.g., `pfif.link.hvis`) |
| Function names | underscore-separated |
| Assignment | `=` |
| Tables & figures | built from a data object, never hardcoded; `kable()` for in-document display, `save_table()` / `save_figure()` for files written to `output/` |
| `.rds` naming | mirrors chunk name (e.g., `early-merge.rds`) |
| `.txt` objects | only used for inline `` `r` `` reporting; never in computation |
| Intermediates | always `rm()`'d after saving to `.rds` |
| Chunk pairs | every computation chunk has a companion `*-read` chunk |
| Numbers in prose | always via inline `` `r` ``, never hardcoded |
