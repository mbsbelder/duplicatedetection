#Applies minhashing to create signature matrix
min_hashing <- function(binary_matrix, hashnumber, prime_number) {
  
  # Save dimension binary matrix
  dim_BM <- dim(binary_matrix)
  
  # Generate hash function coefficients
  hashcoefficients <- matrix(data = NA, nrow = 2, ncol = hashnumber)
  for (i in 1:hashnumber) {
    a <- as.integer(runif(1, min = 1, max = prime_number))
    b <- as.integer(runif(1, min = 0, max = prime_number))
    hashcoefficients[, i] <- c(a, b)
  }
  
  # Create an initial signature matrix with 'Inf'
  signature_matrix <- matrix(data = Inf, nrow = hashnumber, ncol = dim_BM[2])
  
  # Apply hash functions and populate signature matrix
  for (r in 1:dim_BM[1]) {
    hashfunctionresult <- rep(NA, hashnumber)
    
    # Compute hash function results
    for (h in 1:hashnumber) {
      hashfunctionresult[h] <- hash(hashcoefficients[1, h], hashcoefficients[2, h], r, prime_number)
    }
    
    # Update signature matrix based on binary matrix
    for (c in 1:dim_BM[2]) {
      if (binary_matrix[r, c] == 1) {
        for (h in 1:hashnumber) {
          if (hashfunctionresult[h] < signature_matrix[h, c]) {
            signature_matrix[h, c] <- hashfunctionresult[h]
          }
        }
      }
    }
  }
  
  return(signature_matrix)
}
