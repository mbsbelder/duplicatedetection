#Multi-component Similarity Method
msm <- function(product_data, candidate_matrix, mu, gamma) {
  n <- length(product_data)
  dissimilarity <- matrix(data = 0, nrow = n, ncol = n)
  dissimilarity[lower.tri(dissimilarity)] <- NA 
  
  for (i in 1:(n - 1)) {
    for (j in i:n) {
      prod_i <- product_data[[i]]
      prod_j <- product_data[[j]]
      
      # Check if same shop, different brand, or not a candidate
      if (same_shop(prod_i, prod_j) || candidate_matrix[i, j] == 0 || different_brand_comparison(prod_i, prod_j)) {
        dissimilarity[i, j] <- Inf
      } else {
        sim <- 0
        average_similarity <- 0
        m <- 0 # Number of matches
        w <- 0 # Weight of matches
        non_matching_keysf_i <- prod_i[["features_map"]] 
        non_matching_keysf_j <- prod_j[["features_map"]]
        non_matching_keys_i <- non_matching_keysf_i
        non_matching_keys_j <- non_matching_keysf_j
        
        # Apply key-value pairs
        for (q in 1:length(non_matching_keysf_i)) {
          for (r in 1:length(non_matching_keysf_j)) {
            keySim <- calc_sim_jw(names(non_matching_keysf_i)[q], names(non_matching_keysf_j)[r])
            if (keySim > gamma) {
              valueSim <- calc_sim_jw(non_matching_keysf_i[[q]], non_matching_keysf_j[[r]])
              weight <- keySim
              sim <- sim + weight * valueSim
              m <- m + 1
              w <- w + weight
              non_matching_keys_i <- non_matching_keys_i[-q]
              non_matching_keys_j <- non_matching_keys_j[-r]
            }
          }
        }
        
        if (w > 0) {
          average_similarity <- sim / w
        }
        
        # Apply percentage_model_words
        if (length(non_matching_keys_i == 0) | length(non_matching_keys_j == 0)) {
          mwPerc <- 0
        } else {
          mwPerc <- percentage_model_words(extract_modelwords(non_matching_keys_i), extract_modelwords(non_matching_keys_j))
        }
        
        # Calculate the new weight
        theta1 <- (1 - mu) * m / min(length(non_matching_keysf_i), length(non_matching_keysf_j))
        theta2 <- 1 - mu - theta1
        hSim <- theta1 * average_similarity + theta2 * mwPerc
        dissimilarity[i, j] <- 1 - hSim
      }
    }
  }
  return(dissimilarity)
}
