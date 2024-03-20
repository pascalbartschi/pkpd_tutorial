# For this code to work ADNCA_Guidelines.csv needs to be in the same working directory

# This function add or replaces the label attribute of a given dataframe from a label_list/vector
add_or_replace_labels <- function(data, 
                                  label_list) {
  for (col_name in names(label_list)) {
    if (col_name %in% names(data)) {
      attr(data[[col_name]], "label") <- label_list[[col_name]]
    }
  }
  return(data)
}

read_labels <- function(path = "data"){
  
  labels <- lapply(list.files(path, pattern = "*.csv"), function(file) read.csv(file.path(path, file), na.strings = c("", "NA", "N/A")))
  
  columns_to_select <- c("Variable.Name", "Variable.Label", "VARIABLE", "VARIABLE_LABEL", "Label", "LABEL")
  
  lst <- lapply(labels, function(data) data %>% 
           filter(!any(is.na({{ columns_to_select }}))) %>% 
           select(any_of(columns_to_select)) %>% 
           pull(2, 1)) %>% unlist()
  
  return(lst)
}


write_labels2csv <- function(filename = "output/all_variables2labels.csv"){
  labels <- read_labels()
  
  # Enclose labels in double quotes
  labels_with_quotes <- sprintf('"%s"', labels)
  
  write.csv(data.frame(name = names(labels), 
                       labels = labels_with_quotes),
            file = filename, 
            row.names = FALSE)
}


search_label <- function(var){
  tryCatch({
    var <- toupper(var)
    labels <- read_labels()
    if (var %in% names(labels)) {
      print(labels[var])
    } else if (is.null(label)){
      warning("This columns exists but was never assigned a label.")
    } else {
      warning("This column name is not present in any of the provided data frames.\nDebugging: Check spelling or provide more data frames.")
    }
  },
  error = function(e) {
    warning("An error occurred:", conditionMessage(e))
  })
  
}

fill_tibble_labels <- function(tbble) {
  # read in labels and assign labels to columns names
  return(add_or_replace_labels(tbble, read_labels(path = "data")))
}










