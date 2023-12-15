#Constructs the TP, NP, FP, FN values
evaluation_matrix <- function(neighbor_matrix, list_of_prods) {
  TP <- 0; FP <- 0; TN <- 0; FN <- 0
  n_prods <- length(list_of_prods)
  
  # Calculate adjusted dissimilarity matrix 
  for (i in 1:n_prods) {
    for (j in 1:n_prods) {
      if (j > i && neighbor_matrix[i, j] == 1) {
        if (list_of_prods[[i]]$modelID == list_of_prods[[j]]$modelID) {
          TP <- TP + 1
        } else {
          FP <- FP + 1
        }
      } else if (j > i) {
        if (list_of_prods[[i]]$modelID == list_of_prods[[j]]$modelID) {
          FN <- FN + 1
        } else {
          TN <- TN + 1
        }
      }
    }
    FP <- 0.1 * FP  # Adjust FP value
  }
  
  return(list('TP' = TP, 'FP' = FP, 'TN' = TN, 'FN' = FN))
}
