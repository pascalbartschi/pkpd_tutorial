rm(list = ls())

suppressPackageStartupMessages({
  library(tidyverse)
  library(ggplot2)
})

invisible(lapply(list.files(path = "R", pattern = "*.R", full.names = TRUE), source))
