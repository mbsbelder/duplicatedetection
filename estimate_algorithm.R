#Executes the algorithm based on given data
estimate_algorithm <- function(TVData_BS) {
  bandsizes <- band_sizes(hashnumber)
  writeLines(paste("bandsizes", bandsizes))
  
  allTVtitles <- get_tvtitles(TVData_BS)
  binary_matrix <- get_binary_vector(allTVtitles, BrandVec)
  signature_values <- min_hashing(binary_matrix, hashnumber)
  
  total_evaluation_BS <- matrix(data = NA, nrow = length(bandsizes), ncol = 5)
  
  for (b in 1:length(bandsizes)) {
    band <- bandsizes[b]
    writeLines(paste("amount of bands", band))
    
    if (b == length(bandsizes)) {
      potential_duplicates <- lshonerow(signature_values, band)
    } else {
      potential_duplicates <- lsh(signature_values, band)
    }
    
    confusion_matrix_lsh <- evaluation_matrix(potential_duplicates, TVData_BS)
    evaluation_lsh <- evaluation(confusion_matrix_lsh, TRUE, length(TVData_BS), band)
    
    total_evaluation_BS[b, 1:4] <- unlist(evaluation_lsh)
    
    msm_vector <- msm(TVData_BS, potential_duplicates, mu, gamma)
    duplicate_matrix <- duplicate_selection(msm_vector, epsilon)
    
    confusion_matrix_msm <- evaluation_matrix(duplicate_matrix, TVData_BS)
    evaluation_msm <- evaluation(confusion_matrix_msm, FALSE, length(TVData_BS), band)
    
    total_evaluation_BS[b, 5] <- evaluation_msm$F1
    
    colnames(total_evaluation_BS) <- c("PQ", "PC", "F1Star", 'FractionComp', "F1")
  }
  
  return(list('Evaluation' = total_evaluation_BS, 'mu' = mu, 'gamma' = gamma, 'epsilon' = epsilon))
}
