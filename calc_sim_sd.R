#Calculates the Sorensen-Dice similarity coefficient
calc_sim_sd <- function(string1, string2, size_substring) {
  string1 <- tolower(str_replace_all(string1, " ", ""))  # Remove spaces and convert to lowercase
  string2 <- tolower(str_replace_all(string2, " ", ""))
  
  substrings1 <- split_string(string1)  # Split strings into substrings
  substrings2 <- split_string(string2)
  
  nt <- 0  # Initialize the count of matching character bigrams
  
  # Count the number of character bigrams found in both strings
  for (i in 1:length(substrings1)) {
    substring_i <- substrings1[i]
    for (j in 1:length(substrings2)) {
      substring_j <- substrings2[j]
      if (substring_i == substring_j) {
        nt <- nt + 1
      }
    }
  }
  
  similarity_sd <- 2 * nt / (length(substrings1) + length(substrings2))
  return(similarity_sd)
}
