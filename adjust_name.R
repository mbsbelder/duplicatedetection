#Ensures brand names are comparable
adjust_name <- function(brand) {
  # Convert brand name to lowercase for consistency
  brand <- tolower(brand)
  
  # Adjust specific brand names for comparability
  if (brand == "lg electronics") {
    brand <- "lg"
  } else if (brand == "sceptre inc") {
    brand <- "sceptre"
  } else if (brand == "jvc tv") {
    brand <- "jvc"
  }
  
  return(brand)
}
