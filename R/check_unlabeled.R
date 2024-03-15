# Checks which columns are missing the attribute label

check_unlabeled <- function(tbble){
  # do
  return(unlabeled)
}

tbble <- new1
unlabeled <- c()
for (name in colnames(tbble)){
  if (is.null(attr(tbble[[name]], "label"))){
    unlabeled <- c(unlabeled, name)
  } 
}

print(unlabeled)
