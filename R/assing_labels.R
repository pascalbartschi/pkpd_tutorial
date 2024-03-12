# For this code to work ADNCA_Guidelines.csv needs to be in the same working directory

# This function add or replaces the label attribute of a given dataframe from a label_list/vector
add_or_replace_labels <- function(data, label_list) {
  for (col_name in names(label_list)) {
    if (col_name %in% names(data)) {
      attr(data[[col_name]], "label") <- label_list[[col_name]]
    }
  }
  return(data)
}

fill_labels <- function(tbble) {
  # read in labels
  label_list <- read.csv("R/ADNCA_Guideline.csv") %>% 
    select(Variable.Name, Variable.Label) %>%
    rename_with(
      ~ sub("^Variable\\.", "", .x),
      starts_with("Variable.")
    )  %>% 
    pull(Label, Name)
  
  # assign labels to columns names
  return(tbble_with_labels)
}








