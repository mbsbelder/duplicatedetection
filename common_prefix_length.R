#Calculates the length of the common prefix between two strings
common_prefix_length <- function(s1, s2) {
  prefix <- 0  # Initialize the common prefix length
  
  # Loop through characters in both strings
  for (i in 1:min(nchar(s1), nchar(s2))) {
    # Check if characters match
    if (substr(s1, i, i) == substr(s2, i, i)) {
      prefix <- prefix + 1  # Increment prefix length if characters match
    } else {
      break  # Exit loop if characters don't match
    }
  }
  
  return(prefix)  # Return the length of the common prefix
}
