#Local Sensitivity Hashing using multiple rows per band
lsh <- function(signature_matrix, b) {

  dim_SM <- dim(signature_matrix)
  r <- dim_SM[1] / b
  candidate_matrix <- matrix(data = 0, nrow = dim_SM[2], ncol = dim_SM[2])
  candidate_matrix[lower.tri(candidate_matrix)] <- NA 
  
  for (i in 1:b) {
    if (i == 1) {
      band_matrix <- signature_matrix[1:r, ]
    } else {
      band_matrix <- signature_matrix[((i - 1) * r + 1):(r * i), ]
    }
    
    for (j in 1:(dim_SM[2] - 1)) {
      col_fixed <- band_matrix[, j]
      
      for (k in (j + 1):dim_SM[2]) {
        if (identical(col_fixed, band_matrix[, k])) {
          candidate_matrix[j, k] <- 1  # Potential duplicate products j and k
        }
      }
    }
  }
  return(candidate_matrix)
}

#Local Sensitivity Hashing using one row per band
lshonerow <- function(signature_matrix, b) {
  
  dim_SM <- dim(signature_matrix)
  r <- 1
  candidate_matrix <- matrix(data = 0, nrow = dim_SM[2], ncol = dim_SM[2])
  candidate_matrix[lower.tri(candidate_matrix)] <- NA 
  
  for (i in 1:b) {
    band_matrix <- signature_matrix[i, ]
    
    for (j in 1:(dim_SM[2] - 1)) {
      col_fixed <- band_matrix[j]
      
      for (k in (j + 1):dim_SM[2]) {
        if (identical(col_fixed, band_matrix[k])) {
          candidate_matrix[j, k] <- 1  # Potential duplicate products j and k
        }
      }
    }
  }
  return(candidate_matrix)
}
