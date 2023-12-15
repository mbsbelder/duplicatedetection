#Calculates the percentage of matching model words from two sets
percentage_model_words <- function(set1, set2) {
  if (length(set1) == 0 | length(set2) == 0) {
    return(0)  # Return 0 if any set is empty
  }
  
  counter <- 0
  
  # Loop through set1 and set2 to find matching model words
  for (i in 1:length(set1)) {
    for (j in 1:length(set2)) {  # Corrected the loop variable range
      if (set1[i] == set2[j]) {
        counter <- counter + 1  # Increment counter for each matching model word found
      }
    }
  }
  
  # Calculate the percentage of matching model words
  percentage <- counter * 2 / (length(set1) + length(set2)) * 100
  print(percentage)
  return(percentage)
}
