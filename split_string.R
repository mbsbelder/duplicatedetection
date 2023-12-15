#Splits the string into substrings in a loop
split_string <- function(string) {
  substrings <- vector()  # Initialize an empty vector to store substrings
  
  # Iterate through the string to split it into substrings of length 2
  for (i in 1:(nchar(string) - 1)) {
    substrings <- c(substrings, substr(string, i, i + 1))  # Extract and append substrings
  }
  
  return(substrings)
}
