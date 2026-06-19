###############################################################################################################################
# Title: shared.R
# Creator: Manuel ZEROBIN
# Project: OeNB-PuG
# Quarto-File: -
# Task: shared file for all other .R scripts
###############################################################################################################################

#  --------------------------------------- Set seed

set.seed(123456789)

#  --------------------------------------- Load packages

library(here)
library(tidyverse)
library(arrow)
library(kableExtra)
library(data.table)

# --------------------------------------- Environment flags

known.hosts = c(
  "dc-mzerobin",                              # NASH server
  "LTN-184",                      # local machine
  "FRIEDMAN", "AUMANN", "KAHNEMAN", "DUFLO"  # remote desktops
)

if (!any(grepl(paste(known.hosts, collapse = "|"), Sys.info()[["nodename"]]))) {
  stop(paste0("Unknown host: '", Sys.info()[["nodename"]], "'. Add it to the setup file."))
}

# --------------------------------------- Set paths

path = list(
  data = list(
    base      = here("data"),
    raw       = here("data/raw"),
    processed = here("data/processed"),
    aux00     = here("data/auxiliary/00"),
    aux10     = here("data/auxiliary/10"),
    aux11     = here("data/auxiliary/11"),
    aux12     = here("data/auxiliary/12"),
    aux30     = here("data/auxiliary/30"),
    aux31     = here("data/auxiliary/31"),
    aux32     = here("data/auxiliary/32"),
    aux33     = here("data/auxiliary/33")
  ),
  output = list(
    plots  = here("output/plots"),
    tables = here("output/tables")
  )
)

#  --------------------------------------- Functions

get_ind = function(id, 
                   type = c("app", "trans", "hvis", "vsnr"),
                   tables = c("app", "trans", "hvis", "link.app", "link.hvis")) {
  type   = match.arg(type)
  tables = match.arg(tables, several.ok = TRUE)
  
  # Check which datasets are loaded
  all.datasets = c(
    app       = "pfif.app",
    trans     = "pfif.trans",
    hvis      = "pfif.hvis",
    link.app  = "pfif.link.app",
    link.hvis = "pfif.link.hvis"
  )
  
  loaded = sapply(all.datasets, exists)
  
  requested.not.loaded = tables[!loaded[tables]]
  if(length(requested.not.loaded) > 0) {
    warning(paste0("Requested tables not loaded: ", paste(requested.not.loaded, collapse = ", ")))
    tables = tables[loaded[tables]]
  }
  
  # Get VSNR based on ID type
  vsnr = if(type == "vsnr") {
    id
  } else if(type == "app" && "app" %in% tables) {
    pfif.app %>% filter(ID.app == id) %>% pull(VSNR) %>% unique()
  } else if(type == "trans" && "trans" %in% tables) {
    pfif.trans %>% filter(ID.trans == id) %>% pull(VSNR) %>% unique()
  } else if(type == "hvis" && "hvis" %in% tables) {
    pfif.hvis %>% filter(ID.hvis == id) %>% pull(VSNR) %>% unique()
  } else {
    stop("Required table for ID lookup is not loaded.")
  }
  
  if(length(vsnr) == 0) stop(paste0("No ", toupper(type), " found with ID: ", id))
  if(length(vsnr) > 1)  warning(paste0("Multiple VSNRs found: ", paste(vsnr, collapse = ", ")))
  
  # Retrieve data for loaded & requested tables
  result = list(input.id = id, input.type = type, vsnr = vsnr)
  
  if("app"       %in% tables) result$all.applications = pfif.app      %>% filter(VSNR %in% vsnr)
  if("trans"     %in% tables) result$all.transactions = pfif.trans     %>% filter(VSNR %in% vsnr)
  if("hvis"      %in% tables) result$all.hvis         = pfif.hvis      %>% filter(VSNR %in% vsnr)
  if("link.app"  %in% tables) result$all.links.app    = pfif.link.app  %>% filter(VSNR %in% vsnr)
  if("link.hvis" %in% tables) result$all.links.hvis   = pfif.link.hvis %>% filter(VSNR %in% vsnr)
  
  # Print all rows for loaded tables
  if("app"       %in% tables) { cat("=== Applications ===\n");  print(result$all.applications, n = Inf) }
  if("trans"     %in% tables) { cat("=== Transactions ===\n");  print(result$all.transactions, n = Inf) }
  if("hvis"      %in% tables) { cat("=== Hvis ===\n");          print(result$all.hvis,         n = Inf) }
  if("link.app"  %in% tables) { cat("=== Links (App) ===\n");   print(result$all.links.app,    n = Inf) }
  if("link.hvis" %in% tables) { cat("=== Links (Hvis) ===\n");  print(result$all.links.hvis,   n = Inf) }
  
  invisible(result)
}

#  ---------------------------------------

`%notin%` = function(val, table) {
  !(val %in% table)
}

allNA = function(val) {
  all(is.na(val))
}

NewObjects = function(expr, envir = .GlobalEnv) {
  before = ls(envir = envir)
  force(expr)
  after = ls(envir = envir)
  new_objs = setdiff(after, before)
  if (length(new_objs)) {
    message("New: ", paste(new_objs, collapse = ", "))
  } else {
    message("No new objects.")
  }
  invisible(new_objs)
}

#  ---------------------------------------

equal_df = function(dt1, dt2) {
  result = all.equal(dt1, dt2, check.attributes = FALSE)
  if (isTRUE(result)) { return(TRUE) } else { return(FALSE) }
}

#  ---------------------------------------

RoundDT = function(dt, digits) {
  dt[, (names(dt)) := lapply(.SD, function(x) if (is.numeric(x)) round(x, digits) else x)]
}
