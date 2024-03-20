rm(list = ls())

suppressPackageStartupMessages({
  library(tidyverse)
})

invisible(lapply(list.files(path = "R", pattern = "*.R", full.names = TRUE), source))
