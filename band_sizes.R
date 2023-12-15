#Calculates band sizes based on a hash number
band_sizes <- function(hashnumber) {
  temp <- c(1:hashnumber)
  bandsizes <- 1
  
  for (i in 2:length(temp)) {
    if (hashnumber %% temp[i] == 0) {
      bandsizes <- c(bandsizes, temp[i])  # Append divisible numbers to band sizes
    }
  }
  
  return(bandsizes)
}
