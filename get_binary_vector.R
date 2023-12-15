#Generates a matrix of binary vectors for each product
get_binary_vector <- function(TVtitles, brand_vector) {
  # Initialize a dictionary to store unique words from titles and brand vector
  dictionary <- vector()
  
  # Collect unique words from titles of all product descriptions
  for (i in 1:length(TVtitles)) {
    titlereg <- gregexpr("[a-zA-Z0-9](([0-9]+[^0-9, ]+)|([^0-9, ]+[0-9]+))[a-zA-Z0-9] ]*", TVtitles[i])
    if (attr(titlereg[[1]], 'match.length')[1] == -1) {
      next
    }
    titlewords <- regmatches(TVtitles[i], titlereg)
    for (j in 1:length(titlewords[[1]])) {
      Word <- titlewords[[1]][j]
      if (!any(dictionary == Word)) {
        dictionary <- c(dictionary, Word)
      }
    }
  }
  
  # Add brand vector to the dictionary
  dictionary <- c(dictionary, brand_vector)
  
  # Create a matrix to store binary vectors for each product
  binary_vector_complete <- matrix(data = 0, nrow = length(dictionary), ncol = length(TVtitles))
  
  # Generate binary vectors for each product
  for (i in 1:length(TVtitles)) {
    prodTitle <- TVtitles[[i]]
    for (j in 1:length(dictionary)) {
      if (grepl(dictionary[j], prodTitle)) {
        binary_vector_complete[j, i] <- 1
      } 
    }
  }
  
  return(binary_vector_complete)
}
