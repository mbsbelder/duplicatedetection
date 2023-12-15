#Examines the dissimilarity matrix of msm for duplicate selections
duplicate_selection <- function(msm, epsilon) {
  n <- dim(msm)[2]
  duplicate_matrix <- matrix(data = 0, nrow = n, ncol = n)
  duplicate_matrix[lower.tri(duplicate_matrix)] <- NA 
  
  for (i in 1:n) {
    for (j in i:n) {
      if (msm[i, j] < epsilon) {
        duplicate_matrix[i, j] <- 1
      }
    }
  }
  
  return(duplicate_matrix)
}
