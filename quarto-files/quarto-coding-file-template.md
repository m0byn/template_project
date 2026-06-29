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
- Set seed, source shared script, load libraries
- Load all input datasets
- Save a base-level `nrow()` snapshot to `.rds` (in `path$data$aux.X.task-name`)
- Immediately followed by a companion `*-read` chunk (`#| eval: true`) that loads the `.rds` for inline reporting

---

## Per-Step Pattern (repeated for each analytical step, as `# Step N - Title`)

Each step follows this strict four-part structure:

### A. Computation Chunk (`chunk-name`)
- `eval: false` (inherits global default)
- All computation: filter, join, mutate, summarise
- Save output statistics to `.rds` via `saveRDS(list(...), here(...))`
- If the step produces a display table or figure, build the object and persist it with `save_tables(<table-obj>, ...)` / `save_figures(<figure-obj>, ...)` — never hardcode a table
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

### D. Running Totals
- Cumulative accounting of matched/unmatched observations using inline `` `r` `` expressions
- Format: "In total we have `` `r ...` `` total X of which: `` `r ...` `` remain unmerged, `` `r ...` `` are [case], amounting to `` `r round(... * 100, 3)` ``% which leads to `` `r ...` `` remaining"

> Sub-analyses inside a step take their own header `## Step N-M - Title` and repeat parts A–D as needed.

---

## Final Section: Output / Linking Table (`# Output`)

- `bind_rows()` or equivalent consolidation
- Write final output to `.parquet`
- Quality/diagnostic checks saved to `.rds` (integrity, coverage, distributions, unmatched counts)
- Display tables and diagnostic figures built and written via `save_tables()` / `save_figures()` — never hardcoded
- Companion read chunk + prose with:
  - **Input**, **Processing steps**, **Quality checks** (subsectioned), **Output**
  - Summary table of the final object's variable descriptions (via `save_tables()`)
  - Summary table of match metadata combinations (via `save_tables()`)

---

## General Conventions

| Convention | Rule |
|---|---|
| Section headers | `# Step N - Title`; sub-steps `## Step N-M - Title`; setup/closing sections named (`Project`, `Task`, `Coding Preparation`, `Output`); no Quarto auto-numbering |
| Variable names | dot-separated (e.g., `pfif.link.hvis`) |
| Function names | underscore-separated |
| Assignment | `=` |
| Tables & figures | always produced and saved through `save_tables()` / `save_figures()`; never hardcoded |
| `.rds` naming | mirrors chunk name (e.g., `early-merge.rds`) |
| `.txt` objects | only used for inline `` `r` `` reporting; never in computation |
| Intermediates | always `rm()`'d after saving to `.rds` |
| Chunk pairs | every computation chunk has a companion `*-read` chunk |
| Numbers in prose | always via inline `` `r` ``, never hardcoded |
