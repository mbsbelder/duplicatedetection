#Calculates Jaro-Winkler similarity between two strings
calc_sim_jw <- function(string1, string2) {
  string1 <- tolower(gsub(" ", "", string1))  # Remove spaces and convert to lowercase
  string2 <- tolower(gsub(" ", "", string2))
  
  # Jaro similarity function
  jaro_similarity <- function(s1, s2) {
    m <- 0  # Initialize matching characters count
    t <- 0  # Initialize transposition count
    
    # Matching threshold calculation
    match_threshold <- max(nchar(s1), nchar(s2)) %/% 2 - 1
    
    # Loop through each character in s1
    for (i in 1:nchar(s1)) {
      start <- max(1, i - match_threshold)
      end <- min(i + match_threshold, nchar(s2))
      
      # Check for matching characters in s2
      for (j in start:end) {
        if (substr(s1, i, i) == substr(s2, j, j)) {
          m <- m + 1
          t <- t + 1
          break
        }
      }
    }
    
    # If no matches found, return 0
    if (m == 0) {
      return(0)
    }
    
    # Calculate Jaro similarity
    jaro_sim <- (m / nchar(s1) + m / nchar(s2) + (m - t) / m) / 3
    
    return(jaro_sim)
  }
  
  # Jaro similarity calculation
  jaro_sim <- jaro_similarity(string1, string2)
  
  # Define scaling factor (p)
  p <- 0.1
  
  # Calculate the Jaro-Winkler similarity
  similarity_jw <- jaro_sim + p * (common_prefix_length(string1, string2)) * (1 - jaro_sim)
  
  return(similarity_jw)
}
