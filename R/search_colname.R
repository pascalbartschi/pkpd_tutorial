# The function search colnames looks for the label of the given columns name

# extracts the label names of given df and column
extract_label_col <- function(df, colname) attr(df[[colname]], "label")

# extracts all labels of df
extract_all_labels_df <- function(df) setNames(lapply(names(df), function(colname) extract_label_col(df, colname)), 
                                               names(df))

# extract all the labels from a given dataframes with hierarchical list structure
labels_from_dfs <- function(...) setNames(lapply(list(...), extract_all_labels_df), names(dflist))

# does the same as labels from df but returns a flattened list
labels_from_dfs_flat <- function(...) list(unlist(lapply(list(...), extract_all_labels_df)))


# after providing dataframes to search user is prompted for a labelname
# this is probably useless however
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