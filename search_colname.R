# The function search colnames looks for the label of the given columns name

# extracts the label names of given df and column
extract_label_col <- function(df, colname) attr(df[[colname]], "label")

# extracts all labels of df
extract_all_labels_df <- function(df) setNames(lapply(names(df), function(colname) extract_label_col(df, colname)), 
                                               names(df))

# extracts all labels from a df list, list at highest level with have df names
labels_from_dflist <- function(dflist) setNames(lapply(dflist, extract_all_labels_df), names(dflist))

# serach a label in a list of variable number of dfs

search_colname <- function(...){
  colname <- toupper(readline("Enter the colname: "))
  tryCatch({
    labels <- unlist(lapply(list(...), extract_all_labels_df))
    if (colname %in% names(labels)) {
      print(labels[colname])
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