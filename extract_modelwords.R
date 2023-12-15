#Extracts all model words from the values of attributes from a product
extract_modelwords <- function(non_matching_keys) {
  model_words <- vector()  # Initialize an empty vector to store model words
  
  for (i in 1:length(non_matching_keys)) {
    reg_result <- gregexpr("(^\\d+(\\.\\d+)?[a-zA-Z\"]+$|ˆ\\d+(\\.\\d+)?$)", non_matching_keys[i])
    
    # Check if there's a match for the regular expression
    if (attr(reg_result[[1]], 'match.length') == -1) {
      next  # Skip to the next iteration if no match is found
    }
    
    wordlist <- regmatches(non_matching_keys[i], reg_result)
    
    # Iterate through extracted words
    for (j in 1:length(wordlist[[1]])) {
      Word <- wordlist[[1]][j]
      
      # Add unique model words to the list
      if (!any(model_words == Word)) {
        model_words <- c(model_words, Word)
      }
    }
  }
  
  return(model_words)  # Return the list of extracted model words
}
