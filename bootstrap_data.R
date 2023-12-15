#Generates bootstrap data for training and testing
bootstrap_data <- function(TVData) {
  # Randomly select items for training and testing
  list_of_prods_train <- unique(sample(TVData, length(TVData), replace = TRUE))
  list_of_prods_test <- setdiff(TVData, list_of_prods_train)
  
  return(list('TVData_BS_Train' = list_of_prods_train, 'TVData_BS_Test' = list_of_prods_test))
}
