# Project Description and Tasks: [Project Title]

**Authors:** [Author 1], [Author 2], [Author 3]

**Design:** [Brief description of research design, e.g. staggered difference-in-differences, RDD, IV]

**Open questions:**

- [Outstanding conceptual or data-access issue 1]
- [Outstanding data linkage or cleaning task]
- [Other open items]

---

# Part I: [Main Outcome Block 1, e.g. Healthcare Utilization]

## To do

- [Key data construction task 1]
- [Key merging step with controls]
- [Any robustness/alternative specification preparation]

## Task Overview

[1–2 paragraphs: clear, non-technical description of what is being estimated, the unit of observation, and the main question addressed in this part.]

## Data Structure

### 1. Sample

- [Population definition: age, geography, period]
- [Treatment and control sample definition]
- [Treatment definition: ITT / TOT, timing, unit]

### 2. Outcome Variables

- [Outcome 1: short description]
- [Outcome 2: short description]
- [Outcome 3: short description]

### 3. Controls

- [Fixed effects used]
- [Key individual-level controls]
- [Key contextual or area-level controls]

## Estimation Methods

### Research Design

[Short description of the core identification strategy and chosen estimator; mention if staggered timing, event-study, etc.]

### Data Preparation

- [Step 1: definition of treatment indicators]
- [Step 2: construction of baseline variables]
- [Step 3: merges of contextual data]

### Identification Strategy

**Main specification: [Design name]**

\[Y_{it} = \alpha_i + f(\text{treatment timing}) + X_{it}'\gamma + \mu_t + \varepsilon_{it}\]

- [Interpretation of pre-treatment terms / parallel trends tests]
- [Interpretation of post-treatment terms / dynamic effects]

**Complementary specifications**

- [Alternative design 1, e.g. discontinuity, alternative control group]
- [Alternative design 2, if any]

**Heterogeneity analysis:**

- [Heterogeneity dimension 1]
- [Heterogeneity dimension 2]

**Mechanisms (reported separately, not as controls):**

- [Mechanism outcome 1]
- [Mechanism outcome 2]

---

# Part II: [Main Outcome Block 2, e.g. Long-Term Care Outcomes]

## To do

- [Panel construction or aggregation tasks]
- [Individual‑level analysis dataset tasks]
- [Merging treatment timing and controls]

## Task Overview

[1–2 paragraphs: description of what Part II estimates, unit of observation, and relation to Part I.]

## Data Structure

### 1. Sample

- [Description of sample for aggregated analysis]
- [Description of sample for individual-level/survival analysis]

### 2. Outcome Variables

- [Outcome 1: counts, flows, durations, etc.]
- [Outcome 2]
- [Outcome 3]

### 3. Controls

- [Fixed effects used]
- [Key covariates at individual level]
- [Key covariates at area level]

## Estimation Methods

### Research Design

[Short description of each complementary design, e.g. staggered DiD on inflows, survival models for trajectories.]

### Data Preparation

- [Collapse / aggregation steps]
- [Merge of treatment timing]
- [Construction of timing/exposure variables]

### Identification Strategy

**Design A: [Name]**

\[Y_{mt} = \alpha_m + f(t - T_m) + \mu_t + \varepsilon_{mt}\]

[Text to indicate interpretation of coefficients and role of fixed effects.]

**Design B: [Name]**

\[h(t \mid X) = h_0(t) \cdot \exp(\beta \cdot \text{Treatment}_{mt} + \lambda_m + \mu_t + X_i'\gamma)\]

[Text to indicate which duration outcomes and competing risks are modelled.]

**Expected patterns per hypothesis:**

- [Hypothesis 1 and expected sign / shape]
- [Hypothesis 2]
- [Hypothesis 3]

---

# Part III: Linked / Extended Analyses

## Task Overview

[Conceptual description of what becomes possible once additional linkages or data sources are available.]

## Planned Analyses

### 1. [Planned analysis 1]

[Short description of population, outcome, and question.]

### 2. [Planned analysis 2]

[Short description.]

### 3. [Planned analysis 3]

[Short description.]

[Add subsections for mortality, unmet need, substitution, etc., as relevant to the project.]